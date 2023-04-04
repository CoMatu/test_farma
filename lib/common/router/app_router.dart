import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_farma/src/contacts/presentation/pages/contacts_page.dart';
import 'package:test_farma/src/contacts/presentation/pages/not_found_page.dart';
import 'package:test_farma/src/favorites/presentation/pages/favorites_page.dart';
import 'package:test_farma/src/landing/page/landing_page.dart';

/// top-level pages
BeamerDelegate routerDelegate = BeamerDelegate(
  initialPath: '/contacts',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (context, state, data) => const LandingPage(),
    },
  ),
);

/// Nested pages
final BeamerDelegate nestedRouterDelegate = BeamerDelegate(
  locationBuilder: (routeInformation, _) {
    if (routeInformation.location!.contains('contacts')) {
      return ContactsLocation();
    } else if (routeInformation.location!.contains('favorites')) {
      return FavoritesLocation();
    }
    return NotFoundLocation();
  },
);

class ContactsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(
        key: ValueKey('contacts'),
        title: 'Контакты',
        type: BeamPageType.noTransition,
        child: ContactsPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/contacts'];
}

class FavoritesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(
        key: ValueKey('favorites'),
        title: 'Избранное',
        type: BeamPageType.noTransition,
        child: FavoritesPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/favorites'];
}

class NotFoundLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(
        key: ValueKey('notFound'),
        title: '404 - Not Found',
        type: BeamPageType.noTransition,
        child: NotFoundPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/notFound'];
}
