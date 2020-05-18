import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method
import 'package:convert/convert.dart';

void main() {
  // Digest on a single input
  var bytes = utf8.encode("foobar"); // data being hashed

  var digest = sha1.convert(bytes);

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");

  // Digest on chunked input
  var firstChunk = utf8.encode("foo");
  var secondChunk = utf8.encode("bar");

  var output = new AccumulatorSink<Digest>();
  var input = sha1.startChunkedConversion(output);
  input.add(firstChunk);
  input.add(secondChunk); // call `add` for every chunk of input data
  input.close();
  var digest1 = output.events.single;

  print("Digest as bytes: ${digest1.bytes}");
  print("Digest as hex string: $digest1");

  // HMAC
  var key = utf8.encode('p@ssw0rd');
  var bytes1 = utf8.encode("foobar");

  var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
  var digest2 = hmacSha256.convert(bytes1);

  print("HMAC digest as bytes: ${digest2.bytes}");
  print("HMAC digest as hex string: $digest2");
}
