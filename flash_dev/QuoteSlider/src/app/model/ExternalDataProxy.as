package app.model
{
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;
import app.model.vo.*;
import app.AppFacade;
import flash.display.Stage;
import delorum.loading.DataLoader;
import flash.events.*;
import com.adobe.serialization.json.JSON;

public class ExternalDataProxy extends Proxy implements IProxy
{
	public static const NAME:String = "external_data_proxy";
	
	private var _configVo:ConfigVo;
	
	// Constructor
	public function ExternalDataProxy( ):void
	{ 
		super( NAME );
	};
	
	// _____________________________ API
	
	public function getConfigData ( $stage:Stage ):void
	{
		var configData:String = ( $stage.loaderInfo.parameters.configData != null )? $stage.loaderInfo.parameters.configData : 'content/json/Config.json' ;
		var dataLoader:DataLoader = new DataLoader( configData );
		dataLoader.addEventListener( Event.COMPLETE, _onConfigLoaded, false,0,true );
		dataLoader.loadItem();
	}
	
	public function loadQuoteSSData (  ):void
	{   
		var dataLoader:DataLoader = new DataLoader( _configVo.services.getQuoteSSData );
		dataLoader.addEventListener( Event.COMPLETE, _onQuoteSSDataLoaded, false,0,true );
		dataLoader.loadItem();
	}
	
	// _____________________________ Event Handlers
	
	private function _onConfigLoaded ( e:Event ):void {
		_configVo = new ConfigVo( JSON.decode( e.target.data ) );
		sendNotification( AppFacade.CONFIG_DATA_LOADED_AND_PARSED, _configVo );
	}
	
	private function _onQuoteSSDataLoaded ( e:Event ):void{
		sendNotification( AppFacade.QUOTESS_DATA_LOADED, JSON.decode(e.target.data) );
	}
}
}