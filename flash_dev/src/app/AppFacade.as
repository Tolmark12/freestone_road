package app
{
import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.patterns.facade.Facade;
import org.puremvc.as3.multicore.patterns.observer.Notification;
import app.control.*;

public class AppFacade extends Facade implements IFacade
{
	public static const STARTUP:String 							= "startup";
	
	// Data
	public static const CONFIG_DATA_LOADED_AND_PARSED:String 	= "config_data_loaded_and_parsed";
	public static const STONES_DATA_LOADED:String 				= "stones_data_loaded";
	
	// State
	public static const STONES_PARSED:String					= "stones_parsed";
	public static const ACTIVATE_STONE:String 					= "activate_stone";
	
	// User events
	public static const STONE_CLICK:String 						= "stone_click";
	
	
	public function AppFacade( key:String ):void
	{
		super(key);	
	}

	/** Singleton factory method */
	public static function getInstance( key:String ) : AppFacade 
    {
        if ( instanceMap[ key ] == null ) instanceMap[ key ]  = new AppFacade( key );
        return instanceMap[ key ] as AppFacade;
    }
	
	public function startup(app:Object):void
	{
	 	sendNotification( STARTUP, app ); 
	}

	/** Register Controller commands */
	override protected function initializeController( ) : void 
	{
		super.initializeController();			
		registerCommand( STARTUP, Startup );
		registerCommand( CONFIG_DATA_LOADED_AND_PARSED, DataRequests );
		registerCommand( STONES_DATA_LOADED, DataRequests );
		registerCommand( STONE_CLICK, Clicks );

	}

}
}