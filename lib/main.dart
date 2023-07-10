import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_reader/layout/adaptive.dart';
import 'package:flutter_reader/pages/backdrop.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'data/app_options.dart';
import 'themes/gallery_theme_data.dart';
import 'router/app_router.dart';

void main() async {
  await GetStorage.init();
  runApp(ReaderApp());
}

class ReaderApp extends StatelessWidget {
  ReaderApp({
    super.key,
    this.initialRoute,
    this.isTestMode = false,
  });

  final AppRouter _appRouter = AppRouter();
  final String? initialRoute;
  final bool isTestMode;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          final options = AppOptions.of(context);
          _appRouter.push(SplashRoute(
              child: Backdrop(
            isDesktop: isDisplayDesktop(context),
          )));
          return MaterialApp.router(
            restorationScopeId: 'rootApp',
            title: 'Flutter Reader',
            debugShowCheckedModeBanner: false,
            themeMode: options.themeMode,
            theme: GalleryThemeData.lightThemeData.copyWith(
              platform: options.platform,
            ),
            darkTheme: GalleryThemeData.darkThemeData.copyWith(
              platform: options.platform,
            ),
            localizationsDelegates: const [
              ...GalleryLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            supportedLocales: GalleryLocalizations.supportedLocales,
            locale: options.locale,
            localeListResolutionCallback: (locales, supportedLocales) {
              deviceLocale = locales?.first;
              return basicLocaleListResolution(locales, supportedLocales);
            },
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
