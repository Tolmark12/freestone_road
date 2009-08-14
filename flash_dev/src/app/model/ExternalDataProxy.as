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
	public function ExternalDataProxy( ):void { super( NAME ); };
	
	// _____________________________ API
	
	public function getConfigData ( $stage:Stage ):void
	{
		var configData:String = ( $stage.loaderInfo.parameters.configData != null )? $stage.loaderInfo.parameters.configData : 'content/json/Config.json' ;
		var ldr:DataLoader = new DataLoader( configData );
		ldr.addEventListener( Event.COMPLETE, _onConfigLoad, false,0,true );
		ldr.loadItem();
	}
	
	public function loadStonesData (  ):void
	{   
		var ldr:DataLoader = new DataLoader( _configVo.services.getStonesData );
		ldr.addEventListener( Event.COMPLETE, _onStonesDataLoad, false,0,true );
		ldr.loadItem();
	}
	
	// _____________________________ Event Handlers
	
	// This is redundant and more complicated than is needed 
	// for this project, but it's good practice for more
	// complicated project
	private function _onConfigLoad ( e:Event ):void {
		_configVo = new ConfigVo( JSON.decode( e.target.data ) );
		sendNotification( AppFacade.CONFIG_DATA_LOADED_AND_PARSED, _configVo );
	}
	
	private function _onStonesDataLoad ( e:Event ):void{
		sendNotification( AppFacade.STONES_DATA_LOADED, JSON.decode(e.target.data) );
	}
	
}
}