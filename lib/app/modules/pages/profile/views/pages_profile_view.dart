import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fastrent/app/data/model/token_model.dart';
import '../controllers/pages_profile_controller.dart';

import 'package:fastrent/app/data/utils/app_text_style.dart';

class PagesProfileView extends GetView<PagesProfileController> {
  const PagesProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TokenModel token = TokenModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fastrent',
          style: AppTextStyles.topnavbar,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'PagesProfileView is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () async {
                  Get.toNamed(Routes.AUTH_LOGIN);
                },
                child: Text("Login")),
            TextButton(
                onPressed: () async {
                  token.logout();
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
