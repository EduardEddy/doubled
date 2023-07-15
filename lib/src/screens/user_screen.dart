import 'package:double_d_test/src/providers/address/address_provider.dart';
import 'package:double_d_test/src/providers/user/user_provider.dart';
import 'package:double_d_test/src/screens/register_address_screen.dart';
import 'package:double_d_test/src/widgets/custom_appbar.dart';
import 'package:double_d_test/src/widgets/custom_button.dart';
import 'package:double_d_test/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Double V'),
      drawer: CustomDrawer.drawer(context, 'user'),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: _ListData()),
      ),
    );
  }
}

class _ListData extends StatelessWidget {
  const _ListData();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    final addressProvider = Provider.of<AddressProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.width * .45,
          child: SvgPicture.asset('assets/images/hello.svg'),
        ),
        const SizedBox(height: 15),
        const Text(
          'Saludos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 25),
        _row(
          [
            _title(title: "Hola:", bold: true),
            _title(
              title: '${userProvider.user.name} ${userProvider.user.lastName}',
              bold: false,
            )
          ],
        ),
        const Divider(),
        _row(
          [
            _title(title: "Naciste el:", bold: true),
            Flexible(
              flex: 2,
              child: _title(
                title: userProvider.user.age.toString().split(' ')[0],
                bold: false,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        if (addressProvider.addresses.isEmpty) ...{
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                label: 'Agregar dirección',
                icon: Icons.abc,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => RegisterAddressScreen()),
                    (route) => false,
                  );
                },
              )
            ],
          ),
        } else ...{
          const Divider(),
          Row(
            children: [
              _title(title: 'Tu dirección principal es:', bold: true),
            ],
          ),
          _title(title: addressProvider.getPrincipalAddress(), bold: false)
        },
      ],
    );
  }

  Widget _title({required String title, required bool bold}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _row(List<Widget> childrens) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: childrens,
    );
  }
}
