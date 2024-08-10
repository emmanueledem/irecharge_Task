import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/common/colors.dart';
import 'package:mobile_assessment/common/navigators/route_name.dart';
import 'package:mobile_assessment/common/navigators/router.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit.dart';

class MobileAssessmentApp extends StatefulWidget {
  final bool isDebug;
  const MobileAssessmentApp({Key? key, this.isDebug = true}) : super(key: key);

  @override
  State<MobileAssessmentApp> createState() => _MobileAssessmentAppState();
}

class _MobileAssessmentAppState extends State<MobileAssessmentApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: widget.isDebug,
          onGenerateRoute: generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
              color: AppColors.white,
            ),
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.primaryColor,
            ),
            useMaterial3: true,
          ),
          initialRoute: RouteName.splash,
        );
      }),
    );
  }
}
