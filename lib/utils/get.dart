import 'package:abzar/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


bool isAndroid = GetPlatform.isAndroid;
bool isIos = GetPlatform.isIOS;
bool isMacOs = GetPlatform.isMacOS;
bool isWindows = GetPlatform.isWindows;
bool isLinux = GetPlatform.isLinux;
bool isFuchsia = GetPlatform.isFuchsia;
bool isMobile = GetPlatform.isMobile;
bool isWeb = GetPlatform.isWeb;
bool isDesktop = GetPlatform.isDesktop;
bool isLandScape = Get.context!.isLandscape;
bool isPortrait = Get.context!.isPortrait;
bool isTablet = Get.context!.isTablet;
bool isPhone = Get.context!.isPhone;
BuildContext context = Get.context!;
double screenHeight = Get.height;
double screenWidth = Get.width;
ThemeData theme = Get.context!.theme;
TextTheme textTheme = Get.context!.textTheme;
Locale? currentLocale = Get.locale;
bool isDebugMode = kDebugMode;

void updateLocale(final Locale locale) => Get.updateLocale(locale);

Future<String> get appName async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}

Future<String> get appPackageName async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

Future<String> get appVersion async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> get appBuildNumber async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

Future<void> push(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final bool preventDuplicates = true,
  final int milliSecondDelay = 1,
}) async {
  final Widget _page = await Future.microtask(() => page);
  delay(
    milliSecondDelay,
    () => Get.to(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
      preventDuplicates: preventDuplicates,
    ),
  );
}

Future<void> dialog(
  final Widget page, {
  final bool dialog = false,
  final VoidCallback? onDismiss,
}) async {
  final Widget _page = await Future.microtask(() => page);

  Get.dialog(_page, useSafeArea: true).then(
    (final _) => onDismiss != null ? onDismiss() : null,
  );
}

Future<void> offAll(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final int milliSecondDelay = 1,
}) async {
  final Widget _page = await Future.microtask(() => page);
  delay(
    milliSecondDelay,
    () => Get.offAll(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
    ),
  );
}

void off(final Widget page) => Get.off(page);

void back() => Get.back();

Future<void> showEasyLoading() => EasyLoading.show();

Future<void> dismissEasyLoading() => EasyLoading.dismiss();

Future<void> showEasyError() => EasyLoading.showError("");

bool isEasyLoadingShow() => EasyLoading.isShow;
