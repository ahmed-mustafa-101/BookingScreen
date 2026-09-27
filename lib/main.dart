import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'core/routing/router_generation_config.dart';
export 'features/booking_screen/presentation/cubit/booking_cubit.dart';
export 'features/booking_screen/presentation/cubit/booking_state.dart';
export 'features/booking_screen/domain/entities/seat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CinemaBookingApp());
}

class CinemaBookingApp extends StatelessWidget {
  const CinemaBookingApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: RouterGenerationConfig.goRouter,
    builder: (context, child) => ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, _) => child ?? const SizedBox.shrink(),
    ),
  );
}
