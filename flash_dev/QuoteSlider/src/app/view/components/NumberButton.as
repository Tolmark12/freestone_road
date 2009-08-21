package app.view.components
{

import flash.display.Sprite;
import flash.events.*;

public class NumberButton extends Sprite
{
	private var _index:Number;
	private var _isActive:Boolean = false;
	
	public function NumberButton( $index:Number ):void {
		_index = $index;
		_build();
	}
	
	// _____________________________ API
	
	public function activate (  ):void
	{
		_onMouseOver(null);
		_isActive = true;
	}
	
	public function deactivate (  ):void
	{
		_isActive = false;
		_onMouseOut(null);
	}
	
	// _____________________________ Build
	
	private function _build (  ):void
	{
		var numberTxt:NumberTxt_swc 	= new NumberTxt_swc();
		numberTxt.titleTxt.text 		= String( _index );
		this.addChild( numberTxt );
	}
	
	// _____________________________ Events
	
	private function _onMouseOver ( e:Event ):void {
		if( _isActive )
			this.alpha = 1;
	}
	
	private function _onMouseOut ( e:Event ):void {
		if( _isActive )
			this.alpha = 0.7;
	}
	
}

}