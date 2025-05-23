import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide_it/provide_it.dart';

import '../../account/view_models/account_view_model.dart';

class SendPixDialog extends StatefulWidget {
  const SendPixDialog({super.key});
  static const name = 'sendPix';
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const SendPixDialog(),
    );
  }

  @override
  State<SendPixDialog> createState() => _SendPixDialogState();
}

class _SendPixDialogState extends State<SendPixDialog> {
  final _controller = TextEditingController(text: '0,00');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatCurrency(String value) {
    // Remove todos os caracteres não numéricos
    value = value.replaceAll(RegExp(r'[^\d]'), '');

    // Se estiver vazio, retorna 0,00
    if (value.isEmpty) return '0,00';

    // Converte para centavos
    final cents = int.parse(value);

    // Formata o valor
    final reais = cents ~/ 100;
    final centavos = cents % 100;

    return '${reais.toString().padLeft(1, '0')},${centavos.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final balance = context.watch<AccountViewModel>().balance;

    return Dialog.fullscreen(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qual o valor da transferência?',
                style: texts.titleLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Saldo da conta: ',
                      style: texts.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'R\$ ${balance.balance}',
                      style: texts.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Limite do cartão: ',
                      style: texts.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: r'R$543,00',
                      style: texts.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((_, newValue) {
                    final formatted = _formatCurrency(newValue.text);

                    return TextEditingValue(
                      text: formatted,
                      selection:
                          TextSelection.collapsed(offset: formatted.length),
                    );
                  }),
                ],
                key: const Key('amount'),
                style: texts.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  prefix: Text(r'R$ '),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
