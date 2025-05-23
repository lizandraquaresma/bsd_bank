import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:go_router/go_router.dart';
import 'package:provide_it/provide_it.dart';

import '../../../shared/widgets/profile_app_bar.dart';
import '../../wallet/view_models/wallet_view_model.dart';
import '../../wallet/widgets/card_widget.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});
  static const name = 'wallet';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WalletViewModel>();
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    final itemCountAfter = viewModel.cards.length > 2 ? 2 : 0;

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Erro ao carregar cartões',
                        style: texts.titleMedium?.copyWith(
                          color: colors.error,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: viewModel.getCards,
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                )
              : viewModel.cards.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhum cartão encontrado',
                        style: texts.titleMedium?.copyWith(
                          color: colors.onSurface.withAlpha(7),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 220,
                          child: CustomCarousel(
                            itemCountBefore: 0,
                            itemCountAfter: itemCountAfter,
                            scrollDirection: Axis.horizontal,
                            loop: true,
                            reverse: true,
                            depthOrder: DepthOrder.reverse,
                            alignment: Alignment.bottomCenter,
                            children:
                                List.generate(viewModel.cards.length, (index) {
                              final card = viewModel.cards[index];
                              
                              return AspectRatio(
                                aspectRatio: 3 / 2,
                                child: CardWidget(
                                  card: card,
                                  onBlock: () => viewModel.blockCard(card.id),
                                  onUnblock: () =>
                                      viewModel.unblockCard(card.id),
                                ),
                              );
                            }),
                            effectsBuilder: (_, scrollRatio, child) {
                              // Efeito de empilhamento vertical
                              final verticalOffset = scrollRatio * 20;
                              final scale = 1.0 - (scrollRatio.abs() * 0.05);

                              return Transform.translate(
                                offset: Offset(0, verticalOffset),
                                child: Transform.scale(
                                  scale: scale,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
    );
  }
}
