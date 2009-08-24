package app.view.components
{

import flash.display.Sprite;
import app.model.vo.QuoteVo;
import flash.text.TextFormat;

public class Quote extends Sprite
{
	private static const _DEFAULT_WIDTH:Number = 275;
	
	// Buttons, Background, Logos
	private var _bg:QuoteBackground_swc 	= new QuoteBackground_swc();
	private var _logos:Logos_swc			= new Logos_swc();
	private var _buttonsHolder:Sprite		= new Sprite();
	private var _currentBtn:NumberButton;
	
	// Text
	private var _text:QuoteText_swc			= new QuoteText_swc();
	private var _authorTxt:QuoteText_swc	= new QuoteText_swc();
	
	public function Quote():void
	{
		// init
		_bg.width = _DEFAULT_WIDTH;
		this.x = 10;
		this.y = 10;
		
		// Add children
		this.addChild(_bg);
		this.addChild(_text);
		this.addChild(_buttonsHolder);
		this.addChild(_logos);
		this.addChild(_authorTxt);
	}
	
	// _____________________________ API
	
	/** 
	*	Create the Quote component
	*	@param		an array of quote VOs
	*/
	public function build ( $quotesList:Array ):void
	{
		// Text
		_text.x = _text.y = 10;
		_authorTxt.x = 80;
		_text.titleTxt.autoSize 		= "left";
		_authorTxt.titleTxt.width		= 500;
		_authorTxt.titleTxt.autoSize 	= "left";
		
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
		
		var leftButton:ArrowButton = new ArrowButton(ArrowButton.LEFT);
		var rightButton:ArrowButton = new ArrowButton(ArrowButton.RIGHT);
		leftButton.x 	= -9;
		rightButton.x	= _buttonsHolder.width + 2;
		leftButton.y    = rightButton.y = 4;
		_buttonsHolder.addChild(leftButton);
		_buttonsHolder.addChild(rightButton);
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
		var formatShapShot:TextFormat  	= _text.titleTxt.getTextFormat();
		_text.titleTxt.text 			= $quoteVo.quote;
		_text.titleTxt.setTextFormat( formatShapShot );

		formatShapShot 				= _authorTxt.titleTxt.getTextFormat();
		formatShapShot.color 		= 0x77A1C6;
		formatShapShot.size 		= 17;
		_authorTxt.titleTxt.text	= $quoteVo.author;
		_authorTxt.titleTxt.setTextFormat( formatShapShot );
		
		// Logos
		_logos.gotoAndStop($quoteVo.logoFrame)
		
		_resize()
	}
	
	// _____________________________ Helpers
	
	private function _resize ():void
	{
		_text.titleTxt.width = _DEFAULT_WIDTH;
		_bg.resize(_text.x*2 + _text.width, _text.y*2 + _text.height+ 30, 0 );
		_buttonsHolder.y = _bg.height - 19;
		_buttonsHolder.x = _bg.width - _buttonsHolder.width + 12;
		_logos.y = _buttonsHolder.y + 35;
		_authorTxt.y = _logos.y + 10;
	}

}

}