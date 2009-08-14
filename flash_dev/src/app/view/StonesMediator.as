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

public class StonesMediator extends Mediator implements IMediator
{	
	public static const NAME:String = "stones_mediator";
	
	private var _stones:Stones = new Stones();
	
	public function StonesMediator( $stage:Sprite ):void
	{
		super( NAME );
		$stage.addChild( _stones );
		_stones.addEventListener( StoneEvent.STONE_CLICK, _onStoneClick, false,0,true );
   	}
	
	// PureMVC: List notifications
	override public function listNotificationInterests():Array
	{
		return [ AppFacade.STONES_PARSED,
		 		 AppFacade.ACTIVATE_STONE ];
	}
	
	// PureMVC: Handle notifications
	override public function handleNotification( note:INotification ):void
	{
		switch ( note.getName() )
		{
			case AppFacade.STONES_PARSED:
				_stones.build( note.getBody() as Array );
			break;
			case AppFacade.ACTIVATE_STONE :
				_stones.activateItem( note.getBody() as StoneVo )
			break;
		}
	}
	
	// _____________________________ Events
	
	private function _onStoneClick ( e:StoneEvent ):void
	{
		sendNotification( AppFacade.STONE_CLICK, e.index );
	}
	
}
}