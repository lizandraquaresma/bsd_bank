import 'package:flutter/material.dart';
import 'package:formx/formx.dart';
import 'package:gap/gap.dart';

import '../models/register_dto.dart';
import '../views/login_page.dart';
import 'password_field.dart';
import 'register_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    const key = 'register_form';

    return Form(
      key: const Key(key),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Crie sua conta gratuita',
            style: texts.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            key: const Key('name'),
            validator: Validator().required(),
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextFormField(
            key: const Key('cpf'),
            validator: Validator().required().cpf(),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'CPF',
              suffixIcon: Icon(Icons.person),
            ),
          ),
          TextFormField(
            key: const Key('email'),
            validator: Validator().required().email(),
            decoration: const InputDecoration(
              labelText: 'E-mail',
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          const PasswordField(),
          const Gap(8),
          RegisterButton(
            getDto: () {
              final map = context.submit(key: key);

              return RegisterDto.fromMap(map);
            },
          ),
          TextButton(
            onPressed: () => LoginPage.go(context),
            child: const Text('Já tem uma conta? Faça login'),
          ),
        ],
      ),
    );
  }
}


