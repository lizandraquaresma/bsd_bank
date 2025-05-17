import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provide_it/provide_it.dart';

import '../../account/views/transaction_view.dart';
import '../view_models/user_view_model.dart';
import 'home_page.dart';

class UserShell extends StatefulWidget {
  const UserShell({super.key, required this.child});
  final Widget child;

  @override
  State<UserShell> createState() => _UserShellState();
}

class _UserShellState extends State<UserShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserViewModel>().user;
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        actions: [
          InkWell(
            onTap: () {
              if (kDebugMode) {
                print('profile');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user.name),
                  CircleAvatar(
                    radius: 24,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.all(
          texts.bodySmall?.copyWith(
            color: colors.primary,
          ),
        ),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            HomePage.go(context);
          }
          if (index == 1) {
            TransactionView.go(context);
          }
          if (index == 2) {
            // WalletPage.go(context);
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
