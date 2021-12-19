import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../shared/shared.dart';
import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  const WifiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: BaseAppBar(
              title: 'Wifi',
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              child: Obx(
                () => Visibility(
                  visible: controller.dataQrCode.isEmpty,
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          ),
                          const SizedBox(height: 12),
                          const BaseLabel(
                            labelText: 'Tipo de Rede',
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: BaseColor.boulder,
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
                                        color: BaseColor.boulder,
                                      ),
                                    ),
                                    underline: const SizedBox.shrink(),
                                    iconEnabledColor: BaseColor.boulder,
                                    items: controller.wifiSecurityList
                                        .map<DropdownMenuItem<String>>(
                                          (wifiSecurity) =>
                                              DropdownMenuItem<String>(
                                            value: wifiSecurity,
                                            child: Text(
                                              wifiSecurity,
                                              style: const TextStyle(
                                                color: BaseColor.boulder,
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
                            backgroundColor: BaseColor.fern,
                          ),
                        ],
                      ),
                    ),
                  ),
                  replacement: Column(
                    children: [
                      QrImage(
                        data: controller.dataQrCode,
                        version: QrVersions.auto,
                        size: 280,
                        gapless: true,
                      ),
                      const Spacer(),
                      BaseButton(
                        label: 'Compartilhar',
                        isUseSameColor: true,
                        onPressed: () {},
                        width: Get.width / 2,
                      ),
                      BaseButton(
                        backgroundColor: BaseColor.fern,
                        isUseSameColor: true,
                        label: 'Baixar',
                        onPressed: () {},
                      )
                    ],
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
