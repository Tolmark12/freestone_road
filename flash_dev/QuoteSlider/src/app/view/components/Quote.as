package app.view.components
{

import flash.display.Sprite;
import app.model.vo.QuoteVo;

public class Quote extends Sprite
{
	private var _bg:QuoteBackground_swc = new QuoteBackground_swc();
	private var _buttonsHolder:Sprite	= new Sprite();
	private var _logos:Sprite			= new Sprite();
	private var _currentBtn:NumberButton;
	
	public function Quote():void
	{
		this.addChild(_bg);
		this.addChild(_buttonsHolder);
		this.addChild(_logos);
	}
	
	// _____________________________ API
	
	/** 
	*	Create the Quote component
	*	@param		an array of quote VOs
	*/
	public function build ( $quotesList:Array ):void
	{
		var len:uint = $quotesList.length;
		for ( var i:uint=0; i<len; i++ ) 
		{
			var quoteVo:QuoteVo 			= $quotesList[i];
			var numberButton:NumberButton 	= new NumberButton( i );
			numberButton.x 					= i * 20;
			numberButton.deactivate();
			_buttonsHolder.addChild( numberButton );
		}
	}
	
	/** 
	*	Change the quote 
	*/
	public function changeQuote ( $quoteVo:QuoteVo ):void
	{
		
		// Activate the buttton
		if( _currentBtn != null )
			_currentBtn.deactivate();
			
		_currentBtn = _buttonsHolder.getChildAt($quoteVo.index) as NumberButton;
		_currentBtn.activate();
	}

}

}