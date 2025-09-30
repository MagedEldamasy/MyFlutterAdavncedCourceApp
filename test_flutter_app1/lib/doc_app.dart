import 'package:flutter/material.dart';
import 'package:test_flutter_app1/core/routing/app_router.dart';
import 'package:test_flutter_app1/core/routing/routes.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "flutter doc app",
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoutes,
          home: child, // ✅ attach ScreenUtil child here
        );
      },
      // ✅ this child ensures ScreenUtil is ready before any screen builds
      child: const SizedBox.shrink(),
    );
  }
}

// class DocApp extends StatelessWidget {
//   AppRouter appRouter;
//   DocApp({super.key, required this.appRouter});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           title: "flutter doc app",
//           theme: ThemeData(
//             primaryColor: ColorsManager.mainBlue,
//             scaffoldBackgroundColor: Colors.white,
//           ),
//           debugShowCheckedModeBanner: false,
//           initialRoute: Routes.onBoardingScreen,
//           onGenerateRoute: appRouter.generateRoutes,
//         );
//       },
//     );
//   }
// }
