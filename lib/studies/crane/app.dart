import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:flutter_reader/data/gallery_options.dart';
import 'package:flutter_reader/studies/crane/backdrop.dart';
import 'package:flutter_reader/studies/crane/eat_form.dart';
import 'package:flutter_reader/studies/crane/fly_form.dart';
import 'package:flutter_reader/studies/crane/routes.dart' as routes;
import 'package:flutter_reader/studies/crane/sleep_form.dart';
import 'package:flutter_reader/studies/crane/theme.dart';

class CraneApp extends StatelessWidget {
  const CraneApp({super.key});

  static const String defaultRoute = routes.defaultRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'crane_app',
      title: 'Crane',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GalleryLocalizations.localizationsDelegates,
      supportedLocales: GalleryLocalizations.supportedLocales,
      locale: GalleryOptions.of(context).locale,
      initialRoute: CraneApp.defaultRoute,
      routes: {
        CraneApp.defaultRoute: (context) => const _Home(),
      },
      theme: craneTheme.copyWith(
        platform: GalleryOptions.of(context).platform,
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const ApplyTextOptions(
      child: Backdrop(
        frontLayer: SizedBox(),
        backLayerItems: [
          FlyForm(),
          SleepForm(),
          EatForm(),
        ],
        frontTitle: Text('CRANE'),
        backTitle: Text('MENU'),
      ),
    );
  }
}
