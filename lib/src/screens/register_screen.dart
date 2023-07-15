import 'package:double_d_test/src/helpers/validate_empty.dart';
import 'package:double_d_test/src/providers/user/user_provider.dart';
import 'package:double_d_test/src/screens/user_screen.dart';
import 'package:double_d_test/src/widgets/custom_button.dart';
import 'package:double_d_test/src/widgets/custom_datepicker.dart';
import 'package:double_d_test/src/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: _BodyForm(),
      ),
    );
  }
}

class _BodyForm extends StatefulWidget {
  const _BodyForm();

  @override
  State<_BodyForm> createState() => _BodyFormState();
}

class _BodyFormState extends State<_BodyForm> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    return Center(
      child: Form(
        key: userProvider.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width * .45,
                child: SvgPicture.asset('assets/images/register.svg'),
              ),
              const SizedBox(height: 40),
              const Text(
                'Registra tus datos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CustomInput(
                hintText: 'Nombre',
                validate: (String? text) => ValidateEmpty.emptyInput(text),
                iconLeft: Icons.person,
                controller: userProvider.name,
              ),
              const SizedBox(height: 20),
              CustomInput(
                hintText: 'Apellido',
                validate: (String? text) => ValidateEmpty.emptyInput(text),
                iconLeft: Icons.person_4_sharp,
                controller: userProvider.lastName,
              ),
              SizedBox(
                height: 80,
                width: size.width * 1,
                child: CustomDatepicker(),
              ),
              CustomButton(
                label: 'Guardar',
                icon: Icons.save,
                action: () {
                  bool resp = userProvider.submit();
                  if (resp) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => UserScreen()),
                      (route) => false,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
