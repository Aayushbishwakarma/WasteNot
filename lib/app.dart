import 'package:authentication/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:authentication/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: WNAppTheme.lightTheme,
      darkTheme: WNAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      ///show Loader or circular progress indicator
      home: const Scaffold(backgroundColor: WNColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white),),)
    );
  }
}
