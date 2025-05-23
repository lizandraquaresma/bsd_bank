import 'package:flutter/material.dart';
import 'package:formx/formx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../models/login_dto.dart';
import '../views/forgot_password_page.dart';
import '../views/register_page.dart';
import 'login_button.dart';
import 'password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    const key = 'login_form';

    final cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp('[0-9]')},
    );

    return Form(
      key: const Key(key),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem-vindo de volta!',
            style: texts.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            key: const Key('cpf').options(
              keepMask: false,
            ),
            validator: Validator().required().cpf(),
            keyboardType: TextInputType.number,
            inputFormatters: [cpfMask],
            decoration: const InputDecoration(
              labelText: 'CPF',
              suffixIcon: Icon(Icons.person),
            ),
          ),
          const PasswordField(),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => ForgotPasswordPage.go(context),
              child: const Text('Recuperar senha'),
            ),
          ),
          LoginButton(
            getDto: () {
              final map = context.submit(key: key);

              return LoginDto.fromMap(map);
            },
          ),
          TextButton(
            onPressed: () => RegisterPage.go(context),
            child: const Text('Cadastrar-se'),
          ),
        ],
      ),
    );
  }
}
