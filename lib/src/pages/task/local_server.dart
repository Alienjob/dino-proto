import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart';

Future<HttpServer> createServer() async {
  // Serve files from the 'assets' directory
  // Get the temporary directory
  final Directory tempDir = await getTemporaryDirectory();
  final String tempPath = tempDir.path;
  const String assetsPath = 'assets/html';

  // Copy asset to the temporary directory
  await copyAssetFile(assetsPath, tempPath, 'index.html');
  await copyAssetFile(assetsPath, tempPath, 'script.js');
  await copyAssetFile(assetsPath, tempPath, 'style.css');

  await makeDirectory(tempPath, 'images');

  await copyAssetFile(assetsPath, tempPath, 'images/img-1.png');
  await copyAssetFile(assetsPath, tempPath, 'images/img-2.png');
  await copyAssetFile(assetsPath, tempPath, 'images/img-3.png');
  await copyAssetFile(assetsPath, tempPath, 'images/img-4.png');
  await copyAssetFile(assetsPath, tempPath, 'images/img-5.png');
  await copyAssetFile(assetsPath, tempPath, 'images/img-6.png');
  await copyAssetFile(assetsPath, tempPath, 'images/que_icon.svg');

  // Serve files from the temporary directory
  final handler = createStaticHandler(tempPath, defaultDocument: 'index.html');
  final cascade = Cascade().add(handler);

  // Start the server
  final server = await shelf_io.serve(cascade.handler, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
  return server;
}

// Copy asset file to the temporary directory
Future<void> copyAssetFile(
    String assetPath, String tempPath, String fileName) async {
  final ByteData data = await rootBundle.load('$assetPath/$fileName');
  final List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  final File tempFile = File('$tempPath/$fileName');
  await tempFile.writeAsBytes(bytes);
}

// Make directory in the temporary directory
Future<void> makeDirectory(String tempPath, String dirName) async {
  final Directory tempDir = Directory('$tempPath/$dirName');
  if (!tempDir.existsSync()) {
    tempDir.createSync();
  }
}
