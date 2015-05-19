# rc4hx
 Alleged RC4 implementation for haXe language

Install using haxelib:
```sh
haxelib install rc4
```

Example usage: command-line encrypt/decrypt 
```haxe
import rc4.RC4;
import sys.io.File;
import haxe.io.Bytes;

class RC4Crypt {
	public static function main() {
		var input = File.read( Sys.args()[0] );
		var rc4 = new RC4( Bytes.ofString( Sys.args()[1] ));
		var outputPath = (( Sys.args().length > 2 ) ? Sys.args()[2] : (Sys.args()[0] + ".dat"));
		var output = File.write( outputPath );
		output.write(rc4.crypt( input.readAll()));	
		input.close();
		output.close();
		trace( 'Write output to ${outputPath}');
	}
}
```

Save as "RC4Crypt.hx". Compile for cpp:
```sh
haxe -main RC4Crypt.hx -lib rc4 -cpp bin
```

Crypting:
```sh
./bin/RC4Crypt <input file path> <key> [output file path]
```
