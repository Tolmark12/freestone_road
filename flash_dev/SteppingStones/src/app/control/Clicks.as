package app.control
{
import org.puremvc.as3.multicore.interfaces.*;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
import app.view.*;
import app.model.*;
import app.model.vo.*;
import app.AppFacade;

public class Clicks extends SimpleCommand implements ICommand
{

	override public function execute( note:INotification ):void
	{
		var stoneProxy:StoneProxy = facade.retrieveProxy( StoneProxy.NAME ) as StoneProxy;
		
		switch (note.getName() as String)
		{
			case AppFacade.STONE_CLICK :
				stoneProxy.activateStoneByIndex( note.getBody() as Number );
			break;
		}
	}
}
}