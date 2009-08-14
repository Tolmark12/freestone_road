package 
{

import flash.display.Sprite;
import app.AppFacade;

public class SteppingStones extends Sprite
{
	public function SteppingStones():void
	{
		var myFacade:AppFacade = AppFacade.getInstance( 'app_facade' );
		myFacade.startup( this );
	}

}

}