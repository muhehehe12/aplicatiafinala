import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// App architecture
import 'app.dart';
import 'core/theme/theme_controller.dart';
import 'features/home/home_view_model.dart';
import 'features/chat/local_ai_gateway.dart';

Future<void> main() async {
  // 1. Flutter + plugin bindings
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Local database (offline-first)
  await Hive.initFlutter();
  await Hive.openBox('user_prefs');
  await Hive.openBox('ai_memory');

  // 3. Lock orientation (intro + focus UX)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // 4. System UI styling
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // 5. App start
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        Provider(
          create: (_) => LocalAiGateway(),
        ),
      ],
      child: const MonkWarriorApp(),
    ),
  );
}