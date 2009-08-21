package 
{

import flash.display.Sprite;
import app.AppFacade;

public class QuoteSS extends Sprite
{
	public function QuoteSS():void
	{
		var myFacade:AppFacade = AppFacade.getInstance( 'app_facade' );
		myFacade.startup( this );
		
		// Temp
		var quote:QuoteBackground_swc = new QuoteBackground_swc();
		quote.x = 10;
		quote.y = 10;
		this.addChild( quote );
	}
}

}