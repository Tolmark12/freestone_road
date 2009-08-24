package app.view.components
{

import flash.display.Sprite;
import app.model.vo.StoneVo;
import flash.text.*

public class Stones extends Sprite
{
	private static const _PADDING			= 35;
	
	private var _stonesHolder:Sprite 		= new Sprite();
	private var _currentItem:Stone;
	
	private var _title:Title_swc			= new Title_swc();
	private var _attribute:Attribute_swc 	= new Attribute_swc();
	
	public function Stones():void
	{
		_stonesHolder.x = 100;
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
		
		_title.y = _stonesHolder.y - _PADDING*2;
		_title.txt.width = _stonesHolder.width + _PADDING;
		
		_attribute.y = _stonesHolder.y + _stonesHolder.height;
	}
	
	public function activateItem ( $stoneVo:StoneVo ):void
	{
		if( _currentItem != null )
			_currentItem.deactivate();
			
		_currentItem = _stonesHolder.getChildAt( $stoneVo.index ) as Stone;
		_currentItem.activate();
		
		_title.txt.text = $stoneVo.title;
		_attribute.txt.text = $stoneVo.attribute;
		
		_title.x = _stonesHolder.x + (_stonesHolder.width - _title.width)/2;
		_attribute.x = (_stonesHolder.x + _stonesHolder.width) - _attribute.width;
	}

}

}