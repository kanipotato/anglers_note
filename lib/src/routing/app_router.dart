import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/database/app_database.dart';
import '../core/widgets/app_scaffold.dart';
import '../features/fishing_log/presentation/catch_record_detail_screen.dart';
import '../features/fishing_log/presentation/catch_record_form_screen.dart';
import '../features/fishing_log/presentation/fishing_log_detail_screen.dart';
import '../features/fishing_log/presentation/fishing_log_form_screen.dart';
import '../features/fishing_log/presentation/fishing_log_list_screen.dart';
import '../features/fishing_log/presentation/home_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/tackle/presentation/tackle_form_screen.dart';
import '../features/tackle/presentation/tackle_list_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/logs',
            builder: (context, state) => const FishingLogListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => const FishingLogFormScreen(),
              ),
              GoRoute(
                path: ':id',
                builder: (context, state) =>
                    FishingLogDetailScreen(id: state.pathParameters['id']!),
                routes: [
                  GoRoute(
                    path: 'catches/new',
                    builder: (context, state) =>
                        CatchRecordFormScreen(fishingLogId: state.pathParameters['id']!),
                  ),
                  GoRoute(
                    path: 'catches/:catchId',
                    builder: (context, state) =>
                        CatchRecordDetailScreen(catchId: state.pathParameters['catchId']!),
                  ),
                ],
              ),
            ],
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/tackles',
            builder: (context, state) => const TackleListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => const TackleFormScreen(),
              ),
              GoRoute(
                path: ':id/edit',
                builder: (context, state) => TackleFormScreen(tackle: state.extra as Tackle?),
              ),
            ],
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
        ]),
      ],
    ),
  ],
);
