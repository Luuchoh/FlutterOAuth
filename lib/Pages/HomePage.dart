import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Liucho'
              ),
              accountEmail: Text(
                  'Liucho@example.com'
              ),
              decoration: BoxDecoration(
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