package rc4;

import haxe.io.Bytes;

class RC4 {
	var perm = Bytes.alloc( 256 );
	var index1: Int = 0;
	var index2: Int = 0;

	public function new( key: Bytes ) {
		for ( i in 0...256 ) {
			perm.set( i, i );
		}
		
		var j: Int = 0;
		for ( i in 0...256 ) {				
			j = ( j + perm.get( i ) + key.get( i % key.length )) % 256; 
			swap( i, j );
		}
	}

	inline function swap( i: Int, j: Int ): Void {
		var temp = perm.get( i );
		perm.set( i, perm.get( j ));
		perm.set( j, temp );
	}

	public function crypt( input: Bytes ): Bytes {
		var output = Bytes.alloc( input.length );

		for ( i in 0...input.length ) {
			index1 = ( index1 + 1 ) % 256;
			index2 = ( index2 + perm.get( index1 )) % 256;
			swap( index1, index2 );
			var j = ( perm.get( index1 ) + perm.get( index2 )) % 256;
			output.set( i, input.get( i ) ^ perm.get( j ));
		}

		return output;
	}
}

