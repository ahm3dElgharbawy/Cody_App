import 'package:encode_decode/common/widgets/bars/primary_appbar.dart';
import 'package:encode_decode/features/barcode/screens/barcode/barcode.dart';
import 'package:encode_decode/features/base_converter/screens/converter/converter.dart';
import 'package:encode_decode/features/codec/screens/cody/cody.dart';
import 'package:encode_decode/features/encryptor/encryptor.dart';
import 'package:encode_decode/features/password_generator/screens/password_generator_view.dart';
import 'package:encode_decode/utils/constants/colors.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDark(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CPrimaryAppBar(), // containing the tabs titles also
        drawer: Drawer(
          backgroundColor: dark ? CColors.dark : CColors.light,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(CSizes.drawerRadius),
              bottomRight: Radius.circular(CSizes.drawerRadius),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                CustomDrawerButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordGeneratorScreen(),
                      ),
                    );
                  },
                  title: "Password generator",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(children: [
          CodyScreen(),
          BaseConverterScreen(),
          EncryptorScreen(),
          BarCodeScreen()
        ]),
      ),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton(
      {super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        title: Text(title),
        onTap: onTap,
        splashColor: CHelperFunctions.isDark(context)
            ? const Color(0xFF5F7582)
            : Colors.grey[300],
        shape: const StadiumBorder(),
        leading: const Icon(Icons.arrow_right_rounded),
      ),
    );
  }
}
