package app.model.vo
{

public class StoneVo
{
	public var x:Number;
	public var y:Number;
	public var title:String;
	public var attribute:String;
	public var index:Number;
	
	public function StoneVo( $json:Object ):void
	{
		x			= $json.x;
		y			= $json.y;
		title		= $json.title;
		attribute	= $json.attribute;
	}

}

}