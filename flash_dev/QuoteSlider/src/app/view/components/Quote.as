package app.view.components
{

import flash.display.Sprite;
import app.model.vo.QuoteVo;

public class Quote extends Sprite
{
	private static const _DEFAULT_WIDTH:Number = 600;
	
	// Buttons, Background, Logos
	private var _bg:QuoteBackground_swc = new QuoteBackground_swc();
	private var _logos:Sprite			= new Sprite();
	private var _buttonsHolder:Sprite	= new Sprite();
	private var _currentBtn:NumberButton;
	
	// Text
	private var _text:QuoteText_swc		= new QuoteText_swc();
	
	public function Quote():void
	{
		_bg.width = _DEFAULT_WIDTH;
		this.addChild(_bg);
		this.addChild(_text);
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
		// Text
		_text.titleTxt.autoSize = "left";
		
		// Buttons
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
		
		// Text Field
		_text.titleTxt.text = $quoteVo.quote;
	}
	
	// _____________________________ Helpers
	
	private function _resize ( $height:Number, $width:Number = _DEFAULT_WIDTH ):void
	{
		
	}

}

}