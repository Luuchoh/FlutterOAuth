import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Common/TransitionApp.dart';
import 'package:flutter_oauth/Common/Validate.dart';
import 'package:flutter_oauth/Model/Count.dart';
import 'package:flutter_oauth/Model/User.dart';

class HomePage extends StatefulWidget {

  User user;
  Count count;

  HomePage(this.user, this.count);

  @override
  State<StatefulWidget> createState() => HomePageState(user, count);

}
  class HomePageState extends State<HomePage> {

  User user;
  Count count;

  HomePageState(this.user, this.count);


  @override
  void initState() {
    User().getUserServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cake Shop"
        ),
        actions: [
          IconButton(
            onPressed: () => closeSession(context),
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

  closeSession(BuildContext context) async{
    if(await Validate.deleteUserAndCount(count, user)) {
      TransitionApp.goMain(context);
    }
  }

}