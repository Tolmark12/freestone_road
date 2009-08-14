package app.view.components
{

import flash.display.Sprite;
import app.model.vo.StoneVo;

public class Stones extends Sprite
{
	private var _stonesHolder:Sprite = new Sprite();
	
	private var _currentItem:Stone;
	
	public function Stones():void
	{
		_stonesHolder.x = 100;
		_stonesHolder.y = 100;
		this.addChild(_stonesHolder)
	}
	
	// _____________________________ API
	
	public function build ( $stones:Array ):void
	{
		var len:uint = $stones.length;
		var stoneVo:StoneVo;
		var stone:Stone;
		
		for ( var i:uint=0; i<$stones.length; i++ ) 
		{
			stoneVo 	= $stones[i];
			stone 		= new Stone();
			stone.index	= i;
			stone.build(stoneVo);
			stone.deactivate();
			_stonesHolder.addChild( stone );
		}
	}
	
	public function activateItem ( $stoneVo:StoneVo ):void
	{
		if( _currentItem != null )
			_currentItem.deactivate();
			
		_currentItem = _stonesHolder.getChildAt( $stoneVo.index ) as Stone;
		_currentItem.activate();
	}

}

}