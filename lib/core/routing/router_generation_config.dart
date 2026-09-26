import 'package:go_router/go_router.dart';
import 'package:cinmabooking/features/booking_screen/data/repositories/local_seat_repository.dart';
import 'package:cinmabooking/features/booking_screen/presentation/screen/booking_screen.dart';

import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.bookingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.bookingScreen,
        builder: (context, state) =>
            BookingScreenHost(repository: LocalSeatRepository()),
      ),
    ],
  );
}
