import 'package:absensi_siswa/util/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;

  const MyDrawer({super.key, required this.onProfileTap, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),
          MyListTile(
            icon: Icons.home,
            text: 'H O M E',
            ontap: () => Navigator.pop(context),
          ),

          MyListTile(
            icon: Icons.home,
            text: 'P R O F I L E',
            ontap: onProfileTap,
          ),

          MyListTile(
            icon: Icons.home,
            text: 'L O G O U T',
            ontap: onSignOut,
          ),
        ],
      ),
    );
  }
}
