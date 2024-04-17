import 'package:encode_decode/common/widgets/buttons/button_with_leading.dart';
import 'package:encode_decode/features/barcode/logic/barcode_cubit.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratedQrScreen extends StatefulWidget {
  const GeneratedQrScreen({super.key});

  @override
  State<GeneratedQrScreen> createState() => _GeneratedQrScreenState();
}

class _GeneratedQrScreenState extends State<GeneratedQrScreen> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Barcode")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: RepaintBoundary(
                  key: context.read<BarcodeCubit>().qrKey,
                  child: QrImageView(
                    data: context.read<BarcodeCubit>().textController.text,
                    version: QrVersions.auto,
                    size: 230,
                    gapless: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CButtonWithLeading(
                  onTap: () {
                    context
                        .read<BarcodeCubit>()
                        .exportImage(context, ExportType.download);
                  },
                  title: "Save",
                  icon: Icons.file_download_rounded,
                  width: 120,
                ),
                CButtonWithLeading(
                  onTap: () {
                    context
                        .read<BarcodeCubit>()
                        .exportImage(context, ExportType.share);
                  },
                  title: "Share",
                  icon: Icons.share,
                  width: 120,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
