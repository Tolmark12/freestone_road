package app.view.components
{

import flash.display.Sprite;
import app.model.vo.StoneVo;
import flash.events.*;
import app.view.components.events.StoneEvent;

public class Stone extends Sprite
{
	public var index:Number;
	public var isActive:Boolean;
	
	public function Stone(  ):void
	{
		this.buttonMode = true;
		this.addEventListener( MouseEvent.CLICK, _onClick, false,0,true );
		this.addEventListener( MouseEvent.MOUSE_OVER, _onMouseOver, false,0,true );
		this.addEventListener( MouseEvent.MOUSE_OUT, _onMouseOut, false,0,true );
	}
	
	// _____________________________ API
	
	public function build ( $stoneVo:StoneVo ):void
	{		
		this.graphics.beginFill( 0x999999, 0.5 );
		this.graphics.drawCircle( 0, 0, 15 );
		this.graphics.endFill();
		this.x = $stoneVo.x * 3;
		this.y = $stoneVo.y;
		var stoneGraphic:StoneGraphic_swc = new StoneGraphic_swc();
		stoneGraphic.gotoAndStop( Math.round( Math.random() * stoneGraphic.totalFrames ) );
		this.addChild(stoneGraphic);
	}
	
	public function activate (  ):void
	{
		_onMouseOver(null);
		isActive = true;
	}
	
	public function deactivate (  ):void
	{
		isActive = false;
		_onMouseOut(null);
	}
	
	// _____________________________ Events
	
	private function _onClick ( e:Event ):void {
		var stoneEvent = new StoneEvent( StoneEvent.STONE_CLICK, true );
		stoneEvent.index = this.index;
		dispatchEvent( stoneEvent );
	}
	
	private function _onMouseOver ( e:Event ):void {
		if( !isActive )
			this.alpha = 1;
	}
	
	private function _onMouseOut ( e:Event ):void
	{
		if( !isActive )
			this.alpha = 0.7;
	}
	

}

}