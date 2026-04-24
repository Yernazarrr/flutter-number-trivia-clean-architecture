import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'di/di.dart';
import 'features/presentation/bloc/number_bloc.dart';

import 'features/presentation/pages/number_trivia_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<NumberBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Numbers App',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeMode,
            home: const NumberTriviaPage(),
          );
        },
      ),
    );
  }
}
