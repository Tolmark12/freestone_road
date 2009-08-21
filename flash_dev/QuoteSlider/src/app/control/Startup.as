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
	override public function execute( $notification:INotification ):void
	{
		// Root Stage
		var Root:Sprite = $notification.getBody() as Sprite;
		
		// Proxies
		var externalDataProxy:ExternalDataProxy = new ExternalDataProxy();
		var quoteSSProxy:QuoteSSProxy = new QuoteSSProxy();
		
		// Register proxies
		facade.registerProxy( externalDataProxy );
		facade.registerProxy( quoteSSProxy );
		
		// Register mediators
		
		// Start it up
		externalDataProxy.getConfigData( Root.stage );
	}
}
}