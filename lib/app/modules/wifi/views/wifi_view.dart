import 'dart:developer';

import 'package:app_rkode/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BaseAppBar(
            title: 'Wifi',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                BaseTextField(
                  labelText: 'Nome da rede (SSID)',
                ),
                BaseTextField(
                  labelText: 'Senha',
                ),
                DropdownButton<String>(
                    hint: Text(
                      "Selecione o cliente",
                      style: TextStyle(
                        color: BaseColor.goldSand,
                      ),
                    ),
                    underline: SizedBox(),
                    iconEnabledColor: BaseColor.goldSand,
                    items: ['teste', 'teste2']
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                        .toList(),
                    onChanged: (name) {
                      log(name!);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
