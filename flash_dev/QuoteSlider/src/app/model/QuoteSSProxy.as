package app.model
{
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;
import app.model.vo.*;
import app.AppFacade;
import delorum.utils.Sequence;


public class QuoteSSProxy extends Proxy implements IProxy
{
	public static const NAME:String = "quotess_proxy";
	
	private var _sequence:Sequence;
	
	// Constructor
	public function QuoteSSProxy( ):void
	{ 
		super( NAME );
	};
	
	// _____________________________ API
	
	public function init ( $json:Object ):void
	{
		var quotes:Array = new Array();
		
		var len:uint = $json.quotes.length;
		for ( var i:uint=0; i<len; i++ ) 
		{
			var quoteSSVo:QuoteSSVo 	= new QuoteSSVo( $json.quotes[i] );
			quoteSSVo.index				= i;
			
			quotes.push( quoteSSVo );
		}

		_sequence = new Sequence( quotes );
		
		sendNotification( AppFacade.QUOTES_PARSED, quotes );
		sendNotification( AppFacade.ACTIVATE_QUOTE, _sequence.currentItem );
	}
	
	public function activateQuoteByIndex ( $index:Number ):void
	{
		if( _sequence.changeItemByIndex( $index ) )
			sendNotification( AppFacade.ACTIVATE_QUOTE, _sequence.currentItem );
	}
	
}
}