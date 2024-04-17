import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:encode_decode/features/barcode/screens/generated_qr/generated_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';
import 'package:share_plus/share_plus.dart';

part 'barcode_state.dart';

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit() : super(BarcodeInitial());
  final TextEditingController textController = TextEditingController();
  bool dirExists = false;
  dynamic externalDir = '/storage/emulated/0/Download/Cody_qr';
  final GlobalKey qrKey = GlobalKey();

  // await Share.shareXFiles([XFile(file.path)]);

  void createBarcode(context) {
    if (textController.text.isNotEmpty) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const GeneratedQrScreen()));
    }
  }

  imageToCode(BuildContext context, ImageSource imageSource) async {
    final picker = ImagePicker();
    final XFile? image;
    image = await picker.pickImage(source: imageSource);
    if (image == null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No Image Selected"),
        backgroundColor: Colors.red,
      ));
    } else {
      String? result = await Scan.parse(image!.path);
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Reading data failure"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        textController.text = result;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Success reading data"),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Future<void> exportImage(BuildContext context, ExportType type) async {
    try {
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      //Check for duplicate file name to avoid Override
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();;
      // Check if Directory Path exists or not
      dirExists = await File(externalDir).exists();
      //if not then create the path
      if (!dirExists) {
        await Directory(externalDir).create(recursive: true);
        dirExists = true;
      }
      final file = await File('$externalDir/$fileName.png').create();

      if (type == ExportType.download) {
        await file.writeAsBytes(pngBytes);
        if (!context.mounted) return;
        const snackBar =
            SnackBar(content: Text('QR code saved to Download/Cody_qr'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        await file.writeAsBytes(pngBytes);
        Share.shareXFiles([XFile(file.path)]);
      }
    } catch (e) {
      if (!context.mounted) return;
      const snackBar = SnackBar(content: Text('Something went wrong!!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

enum ExportType { share, download }
