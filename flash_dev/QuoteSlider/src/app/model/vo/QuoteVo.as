package app.model.vo
{

public class QuoteVo
{
	public var question:String;
	public var quote:String;
	public var logoFrame:String;
	public var author:String;
	public var index:Number;
	
	public function QuoteVo( $json:Object ):void
	{
		question 	= $json.question;
		quote 		= $json.quote;
		logoFrame	= $json.logoFrame;
		author		= $json.author;
	}
}

}