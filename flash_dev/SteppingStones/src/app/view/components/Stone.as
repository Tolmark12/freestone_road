package app.view.components
{

import flash.display.Sprite;
import app.model.vo.StoneVo;
import flash.events.*;
import app.view.components.events.StoneEvent;
import flash.geom.ColorTransform;

public class Stone extends Sprite
{
	public var index:Number;
	public var isActive:Boolean;
	
	private var _stoneGraphic:StoneGraphic_swc;
	private var _colorTransform:ColorTransform;
	
	public function Stone(  ):void
	{
		this.buttonMode = true;
		
		this.addEventListener( MouseEvent.CLICK, _onClick, false,0,true );
		this.addEventListener( MouseEvent.MOUSE_OVER, _onMouseOver, false,0,true );
		this.addEventListener( MouseEvent.MOUSE_OUT, _onMouseOut, false,0,true );
	}
	
	// _____________________________ API
	
	public function build ( $stoneVo:StoneVo, $i:Number ):void
	{			
		_stoneGraphic = new StoneGraphic_swc();
		_stoneGraphic.gotoAndStop( $i );
		this.x = $stoneVo.x;
		this.y = $stoneVo.y;
		this.addChild(_stoneGraphic);
		
		var w:Number = 48;
		this.graphics.beginFill(0xFF0000, 0);
		this.graphics.drawRect(-w/2,-w/2, w, w)
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
		/*
		var stoneEvent = new StoneEvent( StoneEvent.STONE_CLICK, true );
		stoneEvent.index = this.index;
		dispatchEvent( stoneEvent );
		*/
	}
	
	private function _onMouseOver ( e:Event ):void {
	
		var stoneEvent = new StoneEvent( StoneEvent.STONE_CLICK, true );
		stoneEvent.index = this.index;
		dispatchEvent( stoneEvent );
		
		if( !isActive )
		{
			_colorTransform = _stoneGraphic.transform.colorTransform;
			_colorTransform.color = 0x000000;
			_stoneGraphic.transform.colorTransform = _colorTransform;
		}
	}
	
	private function _onMouseOut ( e:Event ):void
	{
		if( !isActive )
		{
			_colorTransform = _stoneGraphic.transform.colorTransform;
			_colorTransform.color = 0x6598FF;
			_stoneGraphic.transform.colorTransform = _colorTransform;
		}
	}
	
}

}