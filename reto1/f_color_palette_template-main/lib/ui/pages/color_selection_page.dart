import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ColorPalette(
                  baseColor: "222831",
                  baseColor2: "193E46",
                  baseColor3: "00ADB5",
                  baseColor4: "EEEEEE",
                  callback: showColor),
              ColorPalette(
                  baseColor: "358831",
                  baseColor2: "555555",
                  baseColor3: "25ADB5",
                  baseColor4: "FFFFFF",
                  callback: showColor),
              ColorPalette(
                  baseColor: "222831",
                  baseColor2: "193E46",
                  baseColor3: "00ADB5",
                  baseColor4: "EEEEEE",
                  callback: showColor),
            ],
          ),
        )));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}