package app.model.vo
{

public class StoneVo
{
	public var x:Number;
	public var y:Number;
	public var h1:String;
	public var sub:String;
	public var index:Number;
	
	public function StoneVo( $json:Object ):void
	{
		x	= $json.x;
		y	= $json.y;
		h1	= $json.h1;
		sub	= $json.sub;
	}

}

}