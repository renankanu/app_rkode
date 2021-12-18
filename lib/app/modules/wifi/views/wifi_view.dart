import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../shared/shared.dart';
import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  const WifiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.azalea,
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
            child: BaseContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 32,
                ),
                child: Form(
                  key: controller.formKey,
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
                              color: BaseColor.bunting,
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
                                      color: BaseColor.bunting,
                                    ),
                                  ),
                                  underline: const SizedBox.shrink(),
                                  iconEnabledColor: BaseColor.bunting,
                                  items: controller.wifiSecurityList
                                      .map<DropdownMenuItem<String>>(
                                        (wifiSecurity) =>
                                            DropdownMenuItem<String>(
                                          value: wifiSecurity,
                                          child: Text(
                                            wifiSecurity,
                                            style: const TextStyle(
                                              color: BaseColor.bunting,
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
                          backgroundColor: BaseColor.bunting,
                        ),
                      ],
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
