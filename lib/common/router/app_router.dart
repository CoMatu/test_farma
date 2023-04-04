import 'package:beamer/beamer.dart';
import 'package:test_farma/src/contacts/presentation/pages/contact_detail_page.dart';
import 'package:test_farma/src/contacts/presentation/pages/contacts_page.dart';
import 'package:test_farma/src/contacts/presentation/pages/not_found_page.dart';
import 'package:test_farma/src/favorites/presentation/pages/favorites_page.dart';
import 'package:test_farma/src/landing/page/landing_page.dart';

class AppRouter {
  BeamerDelegate get routerDelegate => BeamerDelegate(
        locationBuilder: RoutesLocationBuilder(
          routes: {
            '*': (context, state, data) => const LandingPage(),
          },
        ),
      );
  BeamerDelegate get nestedRouterDelegate => BeamerDelegate(
        locationBuilder: RoutesLocationBuilder(
          routes: {
            '/contacts': (context, state, data) => const ContactsPage(),
            '/contacts/:contactId': (context, state, data) => ContactDetailPage(
                  contactId: state.pathParameters['contactId'] ?? '',
                ),
            '/favorites': (context, state, data) => const FavoritesPage(),
            '/notFound': (context, state, data) => const NotFoundPage(),
          },
        ),
      );
}
