import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 下部タブ(ホーム/釣行/タックル/設定)を常時表示する、アプリ全体のシェル。
/// 各タブの配下にプッシュされる詳細・登録画面でもこのボトムナビは表示され続ける。
class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    (Icons.home_outlined, 'ホーム'),
    (Icons.menu_book_outlined, '釣行'),
    (Icons.checkroom_outlined, 'タックル'),
    (Icons.settings_outlined, '設定'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: _destinations
            .map((d) => NavigationDestination(icon: Icon(d.$1), label: d.$2))
            .toList(),
      ),
    );
  }
}
