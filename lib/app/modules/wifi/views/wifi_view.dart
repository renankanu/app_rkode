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
          Padding(
            padding: const EdgeInsets.only(top: 12),
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
                BaseTextField(
                  labelText: 'Nome da rede (SSID)',
                ),
                SizedBox(height: 20),
                BaseTextField(
                  labelText: 'Senha',
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: BaseColor.martinique,
                      width: 1.5,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
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
                          }),
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
