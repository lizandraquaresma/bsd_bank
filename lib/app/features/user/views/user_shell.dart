import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../account/views/statement_view.dart';
import 'home_view.dart';
import 'wallet_view.dart';

class UserShell extends StatefulWidget {
  const UserShell({super.key, required this.child});
  final Widget child;

  @override
  State<UserShell> createState() => _UserShellState();
}

class _UserShellState extends State<UserShell> {
  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final selectedIndex = GoRouterState.of(context).currentIndex;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.all(
          texts.bodySmall?.copyWith(
            color: colors.primary,
          ),
        ),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          if (index == 0) {
            HomeView.go(context);
          }
          if (index == 1) {
            StatementView.go(context);
          }
          if (index == 2) {
            WalletView.go(context);
          }
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: colors.primary),
            label: 'Início',
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_outlined, color: colors.primary),
            label: 'Transações',
          ),
          NavigationDestination(
            icon: const Icon(Icons.wallet_rounded),
            selectedIcon: Icon(Icons.wallet_rounded, color: colors.primary),
            label: 'Carteira',
          ),
        ],
      ),
    );
  }
}

extension on GoRouterState {
  int get currentIndex {
    if (uri.path.startsWith('/home')) {
      return 0;
    }
    if (uri.path.startsWith('/statement')) {
      return 1;
    }
    if (uri.path.startsWith('/wallet')) {
      return 2;
    }
    if (uri.path.startsWith('/profile')) {
      return 0;
    }

    return 0;
  }
}
