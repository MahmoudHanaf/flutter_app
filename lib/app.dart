import 'package:flutter/material.dart';
import 'package:flutter_app/config/localization/app_localizations.dart';
import 'package:flutter_app/config/routes/app_routes.dart';
import 'package:flutter_app/presentation/cubit/authenticate_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/localization/app_localizations_setup.dart';
import 'depdency_injection.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Features State Management
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<AuthenticateCubit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: Routes.splach,
        locale: const Locale('ar'),
        supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }

          return supportedLocales.first;
        },
        // supportedLocales: AppLocalizationsSetup.supportedLocales,
        // localeResolutionCallback:
        //     AppLocalizationsSetup.localeResolutionCallback,
        // localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      ),
    );
  }
}
