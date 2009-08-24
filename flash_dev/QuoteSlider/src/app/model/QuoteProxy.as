package app.model
{
	
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;
import app.model.vo.*;
import app.AppFacade;
import delorum.utils.Sequence;

public class QuoteProxy extends Proxy implements IProxy
{
	public static const NAME:String = "quotess_proxy";
	
	private var _sequence:Sequence;
	
	// Constructor
	public function QuoteProxy( ):void
	{ 
		super( NAME );
	}
	
	// _____________________________ API
	
	public function init ( $json:Object ):void
	{
		var quotes:Array = new Array();
		
		var len:uint = $json.quotes.length;
		for ( var i:uint=0; i<len; i++ ) 
		{
			var quoteVo:QuoteVo 	= new QuoteVo( $json.quotes[i] );
			quoteVo.index			= i;
			
			quotes.push( quoteVo );
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
	
	public function previous (  ):void
	{
		if( _sequence.prev() )
			sendNotification( AppFacade.ACTIVATE_QUOTE, _sequence.currentItem );
	}
	
	public function next (  ):void
	{
		if( _sequence.next() )
			sendNotification( AppFacade.ACTIVATE_QUOTE, _sequence.currentItem );
	}
	
}
}