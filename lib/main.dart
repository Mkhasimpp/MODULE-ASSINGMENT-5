import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) {
        final base = theme.useRoboto
            ? GoogleFonts.robotoTextTheme()
            : GoogleFonts.poppinsTextTheme();

        final sizedTheme = base.copyWith(
          bodyLarge:
          base.bodyLarge?.copyWith(fontSize: theme.baseFontSize),
          bodyMedium:
          base.bodyMedium?.copyWith(fontSize: theme.baseFontSize),
          bodySmall:
          base.bodySmall?.copyWith(fontSize: theme.baseFontSize),
          titleLarge:
          base.titleLarge?.copyWith(fontSize: theme.baseFontSize + 6),
          titleMedium:
          base.titleMedium?.copyWith(fontSize: theme.baseFontSize + 4),
          titleSmall:
          base.titleSmall?.copyWith(fontSize: theme.baseFontSize + 2),
        );

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,

          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            textTheme: sizedTheme,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            textTheme: sizedTheme,
          ),

          home: HomeScreen(),
        );
      },
    );
  }
}
