import 'package:flutter/material.dart';
import 'package:news_app/core/presentaion/home/widget/theme_switch.dart';
import 'package:news_app/core/utilse/app_colors.dart';

class DrawerWidget extends StatelessWidget {
 final VoidCallback onDrawerIitemClick;
  const DrawerWidget({super.key, required this.onDrawerIitemClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: AppColors.white,
            child: const Center(
              child: Text(
                "News App",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              onTap: () {
              onDrawerIitemClick();
              },
              leading: const Icon(
                Icons.home_outlined,
                size: 24,
                color: AppColors.white,
              ),
              title: const Text(
                "Go To Home",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white, 
                )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: AppColors.white.withOpacity(0.1),
            ),
          ),
          
          const SizedBox(height: 16),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.white,
              thickness: 1,
            ),
          ),
          
          const SizedBox(height: 16),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.color_lens_outlined,
                  size: 24,
                  color: AppColors.white,   
                ),
                SizedBox(width: 16),
                Text(
                  "Theme",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,  
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ThemeSwitch(),
                ),
              ),
            ],
          ),
          
          const Spacer(),
          
        
        ],
      ),
    );
  }
}