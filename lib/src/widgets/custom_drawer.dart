import 'package:double_d_test/src/providers/address/address_provider.dart';
import 'package:double_d_test/src/providers/user/user_provider.dart';
import 'package:double_d_test/src/screens/register_screen.dart';
import 'package:double_d_test/src/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../screens/register_address_screen.dart';

class CustomDrawer {
  static drawer(BuildContext context, String page) {
    final userProvider = Provider.of<UserProvider>(context);
    final addressProvider = Provider.of<AddressProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black26),
            child: Stack(
              children: [
                SizedBox(child: SvgPicture.asset('assets/images/bg.svg')),
                const Center(
                  child: Text(
                    'Double V Test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: _items(icon: Icons.person_2, text: 'Datos del usuario'),
            onTap: page == 'user'
                ? null
                : () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const UserScreen()),
                      (route) => false,
                    ),
          ),
          const Divider(),
          ListTile(
            title: _items(text: 'Dirección', icon: Icons.maps_home_work),
            onTap: page == 'address'
                ? null
                : () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (_) => const RegisterAddressScreen()),
                      (route) => false,
                    ),
          ),
          const Divider(),
          ListTile(
            title: _items(text: 'Salir', icon: Icons.logout),
            onTap: () {
              userProvider.clearData();
              addressProvider.clearAddresses();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget _items({required String text, required IconData icon}) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: Icon(icon),
        ),
        Text(text),
      ],
    );
  }
}
