import 'package:flutter/material.dart';
import 'package:mentalapp/components/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentalapp/components/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var name = "User";
    var email = "Not Found";
    if (user != null) {
      name = user.displayName.toString();
      email = user.email.toString();
    }

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          // padding: EdgeInsets.only(top:100),

          children: <Widget>[
            AppBar(
              backgroundColor: const Color.fromARGB(218, 64, 63, 63),
              title: const Text("Go To Home Page"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
                },
              ),
            ),
            buildHeader(
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Container(
                  color: const Color.fromARGB(238, 246, 247, 247),
                ),
              )),
            ),
            Container(
              // padding: padding,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Dashboard',
                    icon: Icons.dashboard,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Check Your Progress',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Support',
                    icon: Icons.support,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Help',
                    icon: Icons.help,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout_rounded,
                    onClicked: () async {
                      try {
                        _signOut();
                      } catch (e) {
                        print('Logout failed: $e');
                        // Handle logout failure, if necessary
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          color: const Color.fromARGB(218, 64, 63, 63),
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black87;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); 
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      clearSession();
      runApp(const MaterialApp(
        home: LoginPage(),
      ));
    } catch (e) {
      print('Logout failed: $e');
      // Handle logout failure, if necessary
    }
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Container(
            color: Colors.green,
          ),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Container(
            color: Colors.green,
          ),
        ));
        break;
      case 5:
        _signOut();
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Container(
            color: Colors.green,
          ),
        ));
    }
  }
}
