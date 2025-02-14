import 'package:factory_task/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final AuthenticationController authController =
      Get.put(AuthenticationController());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.blue),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
                const Text(
                  'LOGO',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
                Icon(Icons.notifications, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 30),
            _buildInputField(
              controller: fullNameController,
              label: "Full name",
              keyboardType: TextInputType.name,
            ),
            _buildInputField(
              controller: emailController,
              label: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            _buildInputField(
              controller: passwordController,
              label: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: 200),
            Obx(() => ElevatedButton(
                  onPressed: authController.isLoading.value
                      ? null
                      : () {
                          authController.register(
                            fullNameController.text,
                            emailController.text,
                            passwordController.text,
                          );
                          Navigator.pushNamed(context, '/svs_type');
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Register",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You already have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    " Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
