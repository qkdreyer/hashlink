package dx;

@:enum abstract MapType(Int) {
	var Read = 1;
	var Write = 2;
	var ReadWrite = 3;
	var WriteDiscard = 4;
	var WriteNoOverwrite = 5;
}

class ResourceBox {
	public var left : Int;
	public var top : Int;
	public var front : Int;
	public var right : Int;
	public var bottom : Int;
	public var back : Int;
	public function new() {
	}
	public function reset() {
		left = top = front = right = bottom = back = 0;
	}
}

abstract Resource(hl.Abstract<"dx_resource">) {

	@:hlNative("directx", "map")
	public function map( subResource : Int, type : MapType, waitGpu : Bool ) : hl.Bytes {
		return null;
	}

	public inline function updateSubresource( subResource : Int, box : Null<ResourceBox>, data : hl.Bytes, srcRowPitch : Int, srcDepthPitch : Int ) : Void {
		dxUpdateSubresource(subResource, box, data, srcRowPitch, srcDepthPitch);
	}

	@:hlNative("directx", "update_subresource")
	function dxUpdateSubresource( subResource : Int, box : Dynamic, data : hl.Bytes, srcRowPitch : Int, srcDepthPitch : Int ) : Void {
	}


	@:hlNative("directx", "unmap")
	public function unmap( subResource : Int ) : Void {
	}

	@:hlNative("directx", "release_resource")
	public function release() {
	}

}