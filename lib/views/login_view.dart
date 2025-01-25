import 'package:daily_tip/views/activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/login_vm.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const routeName = "/LoginScreen";


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: "Enter username"),
                  ),
                  const SizedBox(height: 16),
                  const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: "Enter password"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  const Text("Select Role", style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: viewModel.selectedRole,
                    hint: const Text("Choose a role"),
                    items: viewModel.roles
                        .map((role) => DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    ))
                        .toList(),
                    onChanged: (role) => viewModel.selectRole(role!),
                  ),
                  if (viewModel.errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(viewModel.errorMessage, style: const TextStyle(color: Colors.red)),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ActivitiesView()),
                      );
                    },

                    // viewModel.isLoading
                    //     ? null
                    //     : () {
                    //   final username = usernameController.text.trim();
                    //   final password = passwordController.text.trim();
                    //   viewModel.login(username, password);
                    // },
                    child: viewModel.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Login"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
