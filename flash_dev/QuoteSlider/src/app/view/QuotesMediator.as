package app.view
{
import org.puremvc.as3.multicore.interfaces.*;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;
import app.AppFacade;
import app.model.vo.*;
import app.view.components.*;
import flash.events.*;
import app.view.components.events.*;
import flash.display.Sprite;
import app.view.components.Quote

public class QuotesMediator extends Mediator implements IMediator
{	
	public static const NAME:String = "qutoes_mediator";
	
	private var _quote:Quote		 = new Quote();
	
	public function QuotesMediator( $stage:Sprite ):void
	{
		super( NAME );
		
		$stage.addChild(_quote);
   	}
	
	// PureMVC: List notifications
	override public function listNotificationInterests():Array
	{
		return [ AppFacade.QUOTES_PARSED,
		 		 AppFacade.ACTIVATE_QUOTE ];
	}
	
	// PureMVC: Handle notifications
	override public function handleNotification( note:INotification ):void
	{
		switch ( note.getName() )
		{
			case AppFacade.QUOTES_PARSED :
				_quote.build( note.getBody() as Array);
			break;
			case AppFacade.ACTIVATE_QUOTE :
				_quote.changeQuote( note.getBody() as QuoteVo);
			break;
		}
	}
	
	// _____________________________ Events
	
	private function _onQuoteClick ( e:QuoteEvent ):void
	{
		trace("ouch!");
		sendNotification( AppFacade.QUOTE_CLICKED, e.index );
	}
	
}
}