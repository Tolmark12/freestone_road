package app.model
{
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;
import app.model.vo.*;
import app.AppFacade;
import delorum.utils.Sequence;


public class StoneProxy extends Proxy implements IProxy
{
	public static const NAME:String = "stone_proxy";
	
	private var _sequence:Sequence;
	
	// Constructor
	public function StoneProxy( ):void { super( NAME ); };
	
	// _____________________________ API
	
	public function init ( $json:Object ):void
	{
		var stones:Array = new Array();
		var len:uint = $json.stones.length;
		for ( var i:uint=0; i<len; i++ ) 
		{
			var stoneVo:StoneVo 	= new StoneVo( $json.stones[i] );
			stoneVo.index			= i;
			stones.push( stoneVo );
		}

		_sequence = new Sequence( stones );
		
		sendNotification( AppFacade.STONES_PARSED, stones );
		sendNotification( AppFacade.ACTIVATE_STONE, _sequence.currentItem );
	}
	
	public function activateStoneByIndex ( $index:Number ):void
	{
		if( _sequence.changeItemByIndex( $index ) )
			sendNotification( AppFacade.ACTIVATE_STONE, _sequence.currentItem );
	}
	
}
}