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
	}
}

}