
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth.dart';
import '../pages/chat_room_page.dart';
import '../pages/launcher_page.dart';
import '../pages/profile_page.dart';
import '../pages/user_list_page.dart';
import '../providers/user_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue.shade700,
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, ProfilePage.routeName),
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, UserListPage.routeName),
            leading: const Icon(Icons.group),
            title: const Text('User List'),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, ChatRoomPage.routeName),
            leading: const Icon(Icons.chat),
            title: const Text('Chat Room'),
          ),
          ListTile(
            onTap: () async {
              await Provider.of<UserProvider>(context, listen: false)
                  .updateProfile(AuthService.user!.uid, {'available' : false});
              AuthService.logOut()
                  .then((value) =>
                  Navigator.pushReplacementNamed(context, LauncherPage.routeName));
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
