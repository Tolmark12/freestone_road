package app.view.components.events
{
import flash.events.Event;

public class StoneEvent extends Event
{
	public static const STONE_CLICK:String = "stone_click";
	
	public var index:Number;
	
	public function StoneEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
	}
   
}
}