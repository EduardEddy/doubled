import 'package:double_d_test/src/helpers/validate_empty.dart';
import 'package:double_d_test/src/providers/address/address_provider.dart';
import 'package:double_d_test/src/widgets/custom_appbar.dart';
import 'package:double_d_test/src/widgets/custom_button.dart';
import 'package:double_d_test/src/widgets/custom_drawer.dart';
import 'package:double_d_test/src/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterAddressScreen extends StatelessWidget {
  const RegisterAddressScreen({super.key});
  static const String name = 'register_address';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Double V'),
      drawer: CustomDrawer.drawer(context, 'address'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: _FormAddress(),
      ),
    );
  }
}

class _FormAddress extends StatelessWidget {
  const _FormAddress();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final addressProvider = Provider.of<AddressProvider>(context);
    return Form(
      key: addressProvider.formKey,
      child: ListView(
        children: [
          SizedBox(
            height: size.width * .45,
            child: SvgPicture.asset('assets/images/address.svg'),
          ),
          CustomInput(
            hintText: 'Agrega la dirección...',
            validate: (String? text) => ValidateEmpty.emptyInput(text),
            maxLines: 5,
            controller: addressProvider.address,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                label: 'Guardar',
                icon: Icons.save_alt_outlined,
                action: addressProvider.submit,
              )
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: addressProvider.addresses.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(addressProvider.addresses[index])),
                  Expanded(
                    child: FilledButton(
                      onPressed: index == addressProvider.principal
                          ? null
                          : () => addressProvider.handleUpdatePrincipal(index),
                      child: const Text('Marcar principal'),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
