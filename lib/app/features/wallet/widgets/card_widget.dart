import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart' as credit_card;

import '../models/card_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.card,
    required this.onBlock,
    required this.onUnblock,
  });

  final CardModel card;
  final VoidCallback onBlock;
  final VoidCallback onUnblock;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return credit_card.CreditCardWidget(
      cardNumber: card.number,
      expiryDate: card.expirationDate,
      cardHolderName: card.holderName,
      cvvCode: card.cvv,
      bankName: 'BSD Bank',
      textStyle: texts.bodyMedium?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w500,
      ),
      labelValidThru: 'Validade',
      
      showBackView: false,
      isHolderNameVisible: true,
      cardBgColor: colors.surfaceContainer,
      enableFloatingCard: true,
      onCreditCardWidgetChange: (_) {},
      cardType: _getCardType(card.number),
      glassmorphismConfig: credit_card.Glassmorphism(
        blurX: 10.0,
        blurY: 10.0,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.grey.withAlpha(20),
            Colors.white.withAlpha(20),
          ],
          stops: const <double>[
            0.3,
            0,
          ],
        ),
      ),
    );
  }

  credit_card.CardType _getCardType(String number) {
    if (number.startsWith('4')) {
      return credit_card.CardType.visa;
    } else if (number.startsWith('5')) {
      return credit_card.CardType.mastercard;
    } else if (number.startsWith('3')) {
      return credit_card.CardType.otherBrand;
    } else {
      return credit_card.CardType.otherBrand;
    }
  }
}
