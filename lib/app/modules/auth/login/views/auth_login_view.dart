import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_login_controller.dart';
import 'package:fastrent/app/data/utils/app_text_style.dart';
import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/routes/app_pages.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  AuthLoginView({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    controller.session_check();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    IconData(0xe092,
                        fontFamily: 'MaterialIcons', matchTextDirection: true),
                    color: Rcolors.primary,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.PAGES_DASHBOARD);
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100, bottom: 50),
              child: Center(
                child: Text(
                  "FastRent",
                  style: AppTextStyles.logo,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    errorText: null,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    errorText: null,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17.0, top: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {},
                  child: const Text(
                    'LUPA PASSWORD ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins',
                      color: Rcolors.onSecondary,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 30, bottom: 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Rcolors.primaryVariant,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () async {
                    isLoading.value = true;
                    Future<void> future1 =
                        Future.delayed(const Duration(seconds: 3), () {
                      controller.login("username", "password");
                    });
                    // set the loading state to true

                    await Future.wait([future1]);

                    isLoading.value = false;
                  },
                  child: Obx(
                    () => isLoading.value
                        ? const CircularProgressIndicator(
                            strokeWidth: 1.5,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))
                        : const Text(
                            'Login',
                            style: AppTextStyles.button,
                          ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      style: AppTextStyles.subtitle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.AUTH_REGISTER);
                      },
                      child: const Text(
                        'Daftar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Rcolors.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
