package app.view.components
{

import flash.display.Sprite;
import app.model.vo.StoneVo;
import flash.text.*

public class Stones extends Sprite
{
	private static const _PADDING			= 35;
	public static var STAGE_WIDTH:Number 	= 300;
	
	private var _stonesHolder:Sprite 		= new Sprite();
	private var _currentItem:Stone;
	
	private var _title:Title_swc			= new Title_swc();
	private var _attribute:Attribute_swc 	= new Attribute_swc();
	
	public function Stones():void
	{
		//_stonesHolder.x = 100;
		_stonesHolder.y = 100;
		
		_title.txt.autoSize 	= TextFieldAutoSize.LEFT;
		_attribute.txt.autoSize = TextFieldAutoSize.LEFT;
		
		this.addChild(_title);
		this.addChild(_stonesHolder)
		this.addChild(_attribute);
	}
	
	// _____________________________ API
	
	public function build ( $stones:Array ):void
	{
		STAGE_WIDTH = this.stage.stageWidth;
		var len:uint = $stones.length;
		var stoneVo:StoneVo;
		var stone:Stone;
		
		for ( var i:uint = 0; i<$stones.length; i++ ) 
		{
			stoneVo 	= $stones[i];
			stone 		= new Stone();
			stone.index	= i;
			stone.build(stoneVo, i);
			stone.deactivate();
			_stonesHolder.addChild( stone );
		}
		
		_title.txt.width = this.stage.stageWidth;;
		_stonesHolder.x = STAGE_WIDTH/2 - _stonesHolder.width/2;
		_attribute.y = _stonesHolder.y + _stonesHolder.height - 20;
	}
	
	public function activateItem ( $stoneVo:StoneVo ):void
	{
		if( _currentItem != null )
			_currentItem.deactivate();
			
		_currentItem = _stonesHolder.getChildAt( $stoneVo.index ) as Stone;
		_currentItem.activate();
		
		_setText($stoneVo.title);
		_attribute.txt.text = $stoneVo.attribute;
		
		//_title.x = _stonesHolder.x + (_stonesHolder.width - _title.width)/2;
		_attribute.x = _stonesHolder.x +$stoneVo.x - _attribute.width/2;
		if( _attribute.x < 0 )
			_attribute.x = 0;
		if( _attribute.x + _attribute.width > STAGE_WIDTH )
			_attribute.x = STAGE_WIDTH - _attribute.width;
			
	}
	
	private function _setText ( $text:String ):void
	{
		var style:StyleSheet = new StyleSheet();
		var blue:Object = new Object();
		blue.color = "#68a2c5";
		style.setStyle("blue", blue);
		_title.txt.styleSheet = style;
		_title.txt.htmlText= $text;
	}

}

}