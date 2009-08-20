package app.control
{
import org.puremvc.as3.multicore.interfaces.*;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
import app.view.*;
import app.model.*;
import app.model.vo.*;
import app.AppFacade;

public class DataRequests extends SimpleCommand implements ICommand
{

	override public function execute( note:INotification ):void
	{
		var externalDataProxy:ExternalDataProxy = facade.retrieveProxy( ExternalDataProxy.NAME ) as ExternalDataProxy;
		var stoneProxy:StoneProxy = facade.retrieveProxy( StoneProxy.NAME ) as StoneProxy;
		
		switch ( note.getName() )
		{
			case AppFacade.CONFIG_DATA_LOADED_AND_PARSED :
				externalDataProxy.loadStonesData();
			break;
			case AppFacade.STONES_DATA_LOADED :
				stoneProxy.init( note.getBody() as Object )
			break;
		}
	}
}
}