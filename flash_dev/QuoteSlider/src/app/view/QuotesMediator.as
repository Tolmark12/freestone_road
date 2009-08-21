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

public class QuotesMediator extends Mediator implements IMediator
{	
	public static const NAME:String = "qutoes_mediator";
	
	public function QuotesMediator( $stage:Sprite ):void
	{
		super( NAME );
		Quote;
		trace("Quotes Mediator");
   	}
	
	// PureMVC: List notifications
	override public function listNotificationInterests():Array
	{
		return [ AppFacade.QUOTES_PARSED,
		 		 AppFacade.ACTIVATE_QUOTES ];
	}
	
	// PureMVC: Handle notifications
	override public function handleNotification( note:INotification ):void
	{
		switch ( note.getName() )
		{
			case AppFacade.QUOTES_PARSED :
				trace(note.getName());
			break;
			case AppFacade.ACTIVATE_QUOTE :
				trace(note.getName());
			break;
		}
	}
	
	// _____________________________ Events
	
	private function _onQuoteClick ( e:StoneEvent ):void
	{
		sendNotification( AppFacade.QUOTE_CLICK, e.index );
	}
	
}
}