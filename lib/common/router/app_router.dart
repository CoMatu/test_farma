import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_farma/src/auth/presentation/pages/login_page.dart';
import 'package:test_farma/src/auth/presentation/pages/splash_page.dart';
import 'package:test_farma/src/contacts/presentation/pages/contacts_page.dart';
import 'package:test_farma/src/contacts/presentation/pages/not_found_page.dart';
import 'package:test_farma/src/favorites/presentation/pages/favorites_page.dart';
import 'package:test_farma/src/landing/page/landing_page.dart';

enum AppPages {
  splash('/splash'),
  contacts('/contacts'),
  favorites('/favorites'),
  login('/login'),
  notFound('/notFound');

  final String path;
  const AppPages(this.path);
}

/// top-level pages
BeamerDelegate routerDelegate = BeamerDelegate(
  initialPath: AppPages.splash.path,
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (context, state, data) => const LandingPage(),
    },
  ),
);

class SplashLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(AppPages.splash),
        title: 'Loading...',
        name: AppPages.splash.name,
        type: BeamPageType.noTransition,
        child: const SplashPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [AppPages.splash.path];
}

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(AppPages.login),
        title: 'Логин',
        name: AppPages.login.name,
        type: BeamPageType.noTransition,
        child: const LoginPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [AppPages.login.path];
}

class ContactsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(AppPages.contacts),
        title: 'Контакты',
        name: AppPages.contacts.name,
        type: BeamPageType.noTransition,
        child: const ContactsPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [AppPages.contacts.path];
}

class FavoritesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(AppPages.favorites),
        title: 'Избранное',
        type: BeamPageType.noTransition,
        name: AppPages.favorites.name,
        child: const FavoritesPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [AppPages.favorites.path];
}

class NotFoundLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(AppPages.notFound),
        title: '404 - Not Found',
        name: AppPages.notFound.name,
        type: BeamPageType.noTransition,
        child: const NotFoundPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [AppPages.notFound.path];
}
