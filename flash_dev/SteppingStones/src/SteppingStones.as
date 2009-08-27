package 
{

import flash.display.Sprite;
import app.AppFacade;
import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
public class SteppingStones extends Sprite
{
	public function SteppingStones():void
	{
		this.stage.scaleMode 	= StageScaleMode.NO_SCALE;
		this.stage.align 		= StageAlign.TOP_LEFT;
		
		var myFacade:AppFacade = AppFacade.getInstance( 'app_facade' );
		myFacade.startup( this );
	}

}

}