package app.control
{
import org.puremvc.as3.multicore.interfaces.*;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
import app.view.*;
import app.model.*;
import app.model.vo.*;
import app.AppFacade;
import flash.display.Sprite;

public class Startup extends SimpleCommand implements ICommand
{

	override public function execute( note:INotification ):void
	{
		var stonesRoot:Sprite = note.getBody() as Sprite;
		
		// Proxies
		var externalDataProxy:ExternalDataProxy = new ExternalDataProxy();
		var stoneProxy:StoneProxy = new StoneProxy();
		
		var stonesMediator:StonesMediator = new StonesMediator( stonesRoot );
		
		// Register proxies and mediators
		facade.registerMediator( stonesMediator );
		facade.registerProxy( stoneProxy );
		facade.registerProxy( externalDataProxy );
		
		
		// Start the ball rolling
		externalDataProxy.getConfigData( stonesRoot.stage );
	}
}
}