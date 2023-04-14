import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Model/Count.dart';
import 'package:flutter_oauth/Model/User.dart';

class HomePage extends StatelessWidget {

  User user;
  Count count;

  HomePage(this.user, this.count);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cake Shop"
        ),
        actions: [
          IconButton(
            onPressed: () => closeSession(),
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user!.name,
              ),
              accountEmail: Text(
                  user!.email
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
            'Bienvenidos al Imalaya'
        ),
      ),
    );
  }

  closeSession() {

  }

}