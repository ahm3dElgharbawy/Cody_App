import 'package:encode_decode/common/widgets/buttons/icon_button.dart';
import 'package:encode_decode/features/codec/screens/cody/widgets/tools_bar.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:encode_decode/utils/constants/texts.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CTextFieldWithIcons extends StatelessWidget {
  const CTextFieldWithIcons({
    super.key,
    required this.controller,
    this.onChanged,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth:  MediaQuery.of(context).size.width,
        maxHeight: 200,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //?? tools like copy and delete and share and more...
          ToolsBar(actions: [
            // CIconButton(
            //   icon: Icons.done_all_rounded,
            //   onTap: () {},
            // ),
            CIconButton(
              icon: Icons.copy,
              onTap: () {
                CHelperFunctions.copyText(controller.text);
              },
            ),
            CIconButton(
              icon: Icons.content_paste,
              onTap: () async{
                controller.text += await CHelperFunctions.pasteText();
              },
            ),
            CIconButton(
              icon: Icons.share,
              onTap: () {
                if (controller.text.isNotEmpty) {
                  Share.share(controller.text);
                }
              },
            ),
            CIconButton(
              icon: Icons.close,
              onTap: () {
                controller.clear();
              },
            ),
          ]),
          const SizedBox(width: CSizes.spaceBtwItems / 2),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(CSizes.inputRadius),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                maxLines: null,
                minLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: CTexts.forEncode,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(CSizes.sm),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
