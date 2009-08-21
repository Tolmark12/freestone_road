package app.model.vo
{

public class QuoteVo
{
	public var question:String;
	public var quote:String;
	public var logoPath:String;
	public var author:String;
	public var index:Number;
	
	public function QuoteVo( $json:Object ):void
	{
		question 	= $json.question;
		quote 		= $json.quote;
		logoPath	= $json.logoPath;
		author		= $json.author;
	}
}

}