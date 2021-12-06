import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/core/data/remote/auth_manager.dart';
import 'package:userbook/presentation/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthenticationManager _authManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                _authManager.logOut();
                Get.offAllNamed(AppRoutes.login);

              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: const Center(
        child: Text('HOME VIEW'),
      ),
    );
  }
}