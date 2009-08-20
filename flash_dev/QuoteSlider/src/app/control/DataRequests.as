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
	override public function execute( $notification:INotification ):void
	{
		// Proxies
		var externalDataProxy:ExternalDataProxy = facade.retrieveProxy( ExternalDataProxy.NAME ) as ExternalDataProxy;
		var quoteSSProxy:QuoteSSProxy			= facade.retrieveProxy( QuoteSSProxy.NAME ) as QuoteSSProxy;
		
		// Proxy Commands
		switch ( $notification.getName() )
		{
			case AppFacade.CONFIG_DATA_LOADED_AND_PARSED :
				//trace($notification.getName());
				externalDataProxy.loadQuoteSSData();
			break;
			case AppFacade.QUOTESS_DATA_LOADED :
				//trace($notification.getName());
				trace($notification.getBody());
				quoteSSProxy.init( $notification.getBody() as Object );
			break;
		}
	}
}
}