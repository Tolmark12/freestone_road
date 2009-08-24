package app.view.components.events
{
import flash.events.Event;

public class QuoteEvent extends Event
{
	// Events
	public static const QUOTE_CLICKED:String = "quote_clicked";
	
	// Data
	public var index:uint;
	
	public function QuoteEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
	}

}
}