import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provide_it/provide_it.dart';

import '../../auth/widgets/logout_button.dart';
import '../view_models/user_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const name = 'profile';
  static void go(BuildContext context) => context.pushNamed(name);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final user = context.watch<UserViewModel>().user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.inversePrimary,
        title: Text(
          'Meu perfil',
          style: texts.bodyMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.inversePrimary,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                      ),
                    ),
                    const Gap(16),
                    Text(user.name, style: texts.titleMedium),
                    Wrap(
                      spacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Banco: '),
                              TextSpan(
                                text: user.bankNumber.toString(),
                                style: texts.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(' | '),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Agência: '),
                              TextSpan(
                                text: user.agencyNumber.toString(),
                                style: texts.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Conta: '),
                              TextSpan(
                                text: user.accountNumber,
                                style: texts.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Dados Cadastrais', style: texts.titleMedium),
                    ),
                    ProfileInfoButton(
                      onPressed: () {},
                      icon: Icons.phone,
                      field: 'Telefone',
                      value: '(11) 99999-9999',
                    ),
                    ProfileInfoButton(
                      onPressed: () {},
                      icon: Icons.email,
                      field: 'Email',
                      value: 'teste@teste.com',
                    ),
                    ProfileInfoButton(
                      onPressed: () {},
                      icon: Icons.home,
                      field: 'Endereço',
                      value: 'Rua Teste, 123',
                    ),
                    Center(
                      child: Text('Ajuda', style: texts.titleMedium),
                    ),
                    ProfileInfoButton(
                      onPressed: () {},
                      icon: Icons.help,
                      field: 'Ajuda',
                      value: 'Fale conosco',
                    ),
                    const LogoutButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoButton extends StatelessWidget {
  const ProfileInfoButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.field,
    required this.value,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          children: [
            Icon(icon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  field,
                  style:
                      texts.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(value, style: texts.bodySmall),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
