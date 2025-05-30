// GoRouter 인스턴스 생성
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kokanko/feature/chat/screen/chat_screen.dart';
import 'package:kokanko/feature/home/screen/home_screen.dart';
import 'package:kokanko/feature/onborading/screen/onboarding_screen.dart';
import 'package:kokanko/feature/profile/screen/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: <RouteBase>[
    GoRoute(
      path: '/', // 기본 경로 (홈 화면)
      builder: (BuildContext context, GoRouterState state) {
        return OnboardingScreen(); // 홈 화면 위젯
      },
    ),
    GoRoute(
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child, // 홈 화면 위젯
            );
          },
        );
      },
      path: '/home', // 기본 경로 (홈 화면)
      // builder: (BuildContext context, GoRouterState state) {
      //   return HomeScreen(); // 홈 화면 위젯
      // },
    ),
    GoRoute(
      path: '/chat', // 경로 파라미터 사용 예시 (:id)
      builder: (BuildContext context, GoRouterState state) {
        return ChatScreen(); // 상세 화면 위젯
      },
    ),
    GoRoute(
      path: '/profile', // 설정 화면 경로
      builder: (BuildContext context, GoRouterState state) {
        return ProfileScreen(); // 설정 화면 위젯
      },
    ),
  ],
);

// Riverpod 사용 예시 (app_router.dart 또는 별도 provider 파일)
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   // ref를 통해 다른 Provider 상태 접근 가능
//   // 예: final isLoggedIn = ref.watch(authProvider);
//
//   return GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/',
//         builder: (context, state) => HomeScreen(),
//       ),
//       // ... 다른 라우트들
//     ],
//     // redirect 로직에 ref를 사용해서 상태 기반 리다이렉션 구현
//     // redirect: (context, state) {
//     //   if (!ref.read(authProvider)) {
//     //     return '/login';
//     //   }
//     //   return null;
//     // },
//   );
// });

// main.dart에서는 이렇게 사용
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_application_1/router/app_router.dart'; // provider 파일 import

// void main() {
//   runApp(ProviderScope(child: MyApp())); // ProviderScope로 감싸주기
// }

// class MyApp extends ConsumerWidget { // ConsumerWidget 사용
//   @override
//   Widget build(BuildContext context, WidgetRef ref) { // WidgetRef 받기
//     final router = ref.watch(routerProvider); // provider에서 router 가져오기
//     return MaterialApp.router(
//       routerConfig: router, // 연결!
//       // ...
//     );
//   }
// }
