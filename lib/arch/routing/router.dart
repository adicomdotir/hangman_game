import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/arch/routing/routes.dart';
import 'package:hangman_game/arch/ui/users/view_models/users_viewmodel.dart';
import 'package:hangman_game/arch/ui/users/widgets/users_screen.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';

GoRouter router(
  AuthRepository authRepository,
) =>
    GoRouter(
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: [
        // GoRoute(
        //   path: Routes.login,
        //   builder: (context, state) {
        //     return LoginScreen(
        //       viewModel: LoginViewModel(
        //         authRepository: context.read(),
        //       ),
        //     );
        //   },
        // ),
        GoRoute(
          path: Routes.users,
          builder: (context, state) {
            final viewModel = UsersViewModel(
              usersRepository: context.read(),
            );
            return UsersScreen(viewModel: viewModel);
          },
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            final viewModel = HomeViewModel();
            return HomeScreen(viewModel: viewModel);
          },
          // routes: const [
          // GoRoute(
          //   path: Routes.searchRelative,
          //   builder: (context, state) {
          //     final viewModel = SearchFormViewModel(
          //       continentRepository: context.read(),
          //       itineraryConfigRepository: context.read(),
          //     );
          //     return SearchFormScreen(viewModel: viewModel);
          //   },
          // ),
          // GoRoute(
          //   path: Routes.resultsRelative,
          //   builder: (context, state) {
          //     final viewModel = ResultsViewModel(
          //       destinationRepository: context.read(),
          //       itineraryConfigRepository: context.read(),
          //     );
          //     return ResultsScreen(
          //       viewModel: viewModel,
          //     );
          //   },
          // ),
          // GoRoute(
          //   path: Routes.activitiesRelative,
          //   builder: (context, state) {
          //     final viewModel = ActivitiesViewModel(
          //       activityRepository: context.read(),
          //       itineraryConfigRepository: context.read(),
          //     );
          //     return ActivitiesScreen(
          //       viewModel: viewModel,
          //     );
          //   },
          // ),
          // GoRoute(
          //   path: Routes.bookingRelative,
          //   builder: (context, state) {
          //     final viewModel = BookingViewModel(
          //       itineraryConfigRepository: context.read(),
          //       createBookingUseCase: context.read(),
          //       shareBookingUseCase: context.read(),
          //       bookingRepository: context.read(),
          //     );

          //     // When opening the booking screen directly
          //     // create a new booking from the stored ItineraryConfig.
          //     viewModel.createBooking.execute();

          //     return BookingScreen(
          //       viewModel: viewModel,
          //     );
          //   },
          //   routes: [
          //     GoRoute(
          //       path: ':id',
          //       builder: (context, state) {
          //         final id = int.parse(state.pathParameters['id']!);
          //         final viewModel = BookingViewModel(
          //           itineraryConfigRepository: context.read(),
          //           createBookingUseCase: context.read(),
          //           shareBookingUseCase: context.read(),
          //           bookingRepository: context.read(),
          //         );

          //         // When opening the booking screen with an existing id
          //         // load and display that booking.
          //         viewModel.loadBooking.execute(id);

          //         return BookingScreen(
          //           viewModel: viewModel,
          //         );
          //       },
          //     ),
          //   ],
          // ),
          // ],
        ),
      ],
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  print('888888888888888888888');
  final bool loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final bool loggingIn = state.matchedLocation == Routes.login;
  print(loggingIn);
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}