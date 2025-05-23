import 'package:flutter/material.dart';
import 'package:formx/formx.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var isObscured = true;
  void toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('password'),
      validator: Validator().required().minLength(6, 'Mínimo de 6 caracteres'),
      obscureText: isObscured,
      decoration: InputDecoration(
        labelText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(
            isObscured
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
          onPressed: toggleObscureText,
        ),
      ),
    );
  }
}
