import 'package:ahp/config.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(LoginController());
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: MyColor.mainCol,
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Obx(
              () => Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('assets/icons/ahp.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    Card(
                      color: Colors.grey[50],
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                            margin: const EdgeInsets.only(),
                            child: TextFormField(
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                controller.username.value = value;
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            margin: const EdgeInsets.only(),
                            child: TextFormField(
                              maxLength: 20,
                              obscureText: controller.isObscured.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.toggleObscureText();
                                  },
                                  icon: Icon(
                                    controller.isObscured.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.mainCol,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(64.0),
                              ),
                            ),
                            onPressed: () {
                              controller.login();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
