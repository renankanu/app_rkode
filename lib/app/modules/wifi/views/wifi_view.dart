import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 32,
            ),
            child: Column(
              children: [
                const BaseTextField(
                  labelText: 'Nome da rede (SSID)',
                ),
                const SizedBox(height: 20),
                const BaseTextField(
                  labelText: 'Senha',
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: BaseColor.bunting,
                      width: 1.5,
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
                                (wifiSecurity) => DropdownMenuItem<String>(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
