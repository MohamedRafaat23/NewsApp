import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_configprovider.dart';
import 'package:news_app/core/utilse/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var appConfigprovider = Provider.of<AppConfigprovider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.black,
        border: Border.all(color: AppColors.white, width: 2),
      ),
      child: DropdownButton<ThemeMode>(
        value: appConfigprovider.themeMode,
        items: [
          DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark", style: TextStyle(fontSize: 20),)),
          DropdownMenuItem(value: ThemeMode.light, child: Text("Light", style: TextStyle(fontSize: 20),)),
        ],
        onChanged: (ThemeMode? newTheme) {
          if (newTheme != null) {
            appConfigprovider.changeTheme(newTheme);
          }
        },
        dropdownColor: Colors.black,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
