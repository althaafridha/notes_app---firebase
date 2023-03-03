import 'package:get/get.dart';
import 'package:note_app_firebase/core.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePageView(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailPageView(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const EditPageView(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddPageView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashPageView(),
    ),
  ];
}