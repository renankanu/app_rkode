import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/shared.dart';
import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  const WifiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(top: 12),
              child: BaseAppBar(
                title: 'Wifi',
                onRepeatAction: controller.dataQrCode.isNotEmpty
                    ? () {
                        controller.clearAction();
                      }
                    : null,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Obx(
                () => Visibility(
                  visible: controller.dataQrCode.isEmpty,
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: AnimationConfiguration.toStaggeredList(
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 100,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            const BaseLabel(
                              labelText: 'Nome da rede (SSID)',
                            ),
                            BaseTextField(
                              controller.nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe o nome da rede';
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            const BaseLabel(
                              labelText: 'Senha',
                            ),
                            BaseTextField(
                              controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 12),
                            const BaseLabel(
                              labelText: 'Tipo de Rede',
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: BaseColor.mirage,
                                ),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: controller.wifiSecurity,
                                      hint: const Text(
                                        'Aberta',
                                        style: TextStyle(
                                          color: BaseColor.mirage,
                                        ),
                                      ),
                                      underline: const SizedBox.shrink(),
                                      iconEnabledColor: BaseColor.mirage,
                                      items: controller.wifiSecurityList
                                          .map<DropdownMenuItem<String>>(
                                            (wifiSecurity) =>
                                                DropdownMenuItem<String>(
                                              value: wifiSecurity,
                                              child: Text(
                                                wifiSecurity,
                                                style: const TextStyle(
                                                  color: BaseColor.mirage,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (wifiSecurity) {
                                        controller.wifiSecurity = wifiSecurity!;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 42),
                            BaseButton(
                              label: 'Gerar QrCode',
                              onPressed: () => controller.generateQrCode(),
                              labelColor: Colors.white,
                              backgroundColor: BaseColor.fern,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  replacement: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 800),
                        childAnimationBuilder: (widget) => ScaleAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Text(
                            'Nome da rede(SSID): ${controller.nameController.text}',
                          ),
                          const Text('Senha: *******'),
                          Text('Tipo de rede: ${controller.wifiSecurity}'),
                          SizedBox(height: Get.height * 0.03),
                          Center(
                            child: Screenshot(
                              controller: controller.screenshotController,
                              child: QrImage(
                                data: controller.dataQrCode,
                                version: QrVersions.auto,
                                size: 280,
                                gapless: true,
                                backgroundColor: BaseColor.mercury,
                                padding: const EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.1),
                          BaseButton(
                            label: 'Compartilhar',
                            icon: Icons.share,
                            hasBorderSameColor: true,
                            onPressed: () => controller.shareQrCode(),
                          ),
                          BaseButton(
                            label: 'Baixar',
                            icon: Icons.download,
                            backgroundColor: BaseColor.fern,
                            hasBorderSameColor: true,
                            onPressed: () => controller.downloadQrCode(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
