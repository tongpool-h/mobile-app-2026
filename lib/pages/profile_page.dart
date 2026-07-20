import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
// import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile title
              const SizedBox(height: 20),
              Center(
                  child: Text('Profile Page', style: AppTextStyles.heading2)),

              // Profile picture
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 53,
                      foregroundColor: AppColors.border,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/smith.jpg',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: CircleAvatar(
                        foregroundColor: AppColors.textLight,
                        backgroundColor: AppColors.accent,
                        radius: 15,
                        child: IconButton(
                            onPressed: () {
                              // print('Edit Profile');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const EditProfilePage(),
                              //   ),
                              // );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 15,
                              color: AppColors.darkSurface,
                            )),
                      ),
                    ),
                  ],
                ),
              ),

              // Full Name
              const SizedBox(height: 20),
              Center(child: Text('John Smith', style: AppTextStyles.heading3)),
              // Email
              const SizedBox(height: 10),
              Center(
                  child: Text('john.smith@example.com',
                      style: AppTextStyles.bodyMedium)),

              // Account Settings
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Account Settings', style: AppTextStyles.heading2),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  // alignment: Alignment.centerLeft,
                  // color: AppColors.surface,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.surface,
                    border: Border(
                      bottom: BorderSide(color: AppColors.border, width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        hoverColor: AppColors.accent.withOpacity(
                            0.1), // Change background color on hover
                        leading:
                            const Icon(Icons.lock, color: AppColors.primary),
                        title: Text('Change Password',
                            style: AppTextStyles.bodyMedium),
                        subtitle: Text('Update your account password',
                            style: AppTextStyles.bodySmall),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        // mouseCursor: SystemMouseCursors.click, // Change cursor to pointer on hover
                        // hoverColor: AppColors.accent, // Change background color on hover
                        onTap: () {
                          // Navigate to Change Password page
                        },
                      ),
                      Divider(
                          color: AppColors.divider.withOpacity(0.5),
                          thickness: 1),
                      ListTile(
                        hoverColor: AppColors.accent.withOpacity(
                            0.1), // Change background color on hover
                        leading: const Icon(Icons.notifications,
                            color: AppColors.primary),
                        title: Text('Notification Settings',
                            style: AppTextStyles.bodyMedium),
                        subtitle: Text('Manage your notification preferences',
                            style: AppTextStyles.bodySmall),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate to Notification Settings page
                        },
                      ),
                      Divider(
                          color: AppColors.divider.withOpacity(0.5),
                          thickness: 1),
                      ListTile(
                        hoverColor: AppColors.accent.withOpacity(
                            0.1), // Change background color on hover
                        leading: const Icon(Icons.privacy_tip,
                            color: AppColors.primary),
                        title: Text('Privacy Settings',
                            style: AppTextStyles.bodyMedium),
                        subtitle: Text('Manage your privacy preferences',
                            style: AppTextStyles.bodySmall),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate to Privacy Settings page
                        },
                      ),
                      //  Divider(color: AppColors.divider.withOpacity(0.5), thickness: 1),
                    ],
                  ),
                ),
              ),

              // Preference
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Preferences', style: AppTextStyles.heading2),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  // alignment: Alignment.centerLeft,
                  // color: AppColors.surface,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.surface,
                    border: Border(
                      bottom: BorderSide(color: AppColors.border, width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        hoverColor: AppColors.accent.withOpacity(
                            0.1), // Change background color on hover
                        leading:
                            const Icon(Icons.info, color: AppColors.primary),
                        title:
                            Text('About Us', style: AppTextStyles.bodyMedium),
                        subtitle: Text('Learn more about our company',
                            style: AppTextStyles.bodySmall),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate to About Us page
                        },
                      ),
                      Divider(
                          color: AppColors.divider.withOpacity(0.5),
                          thickness: 1),
                      ListTile(
                        hoverColor: AppColors.accent.withOpacity(
                            0.1), // Change background color on hover
                        leading:
                            const Icon(Icons.brush, color: AppColors.primary),
                        title: Text('Theme Settings',
                            style: AppTextStyles.bodyMedium),
                        subtitle: Text('Manage your theme preferences',
                            style: AppTextStyles.bodySmall),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate to Theme Settings page
                        },
                      ),
                      Divider(
                          color: AppColors.divider.withOpacity(0.5),
                          thickness: 1),
                      ItemMenuSetting(
                        icon: Icons.calendar_today,
                        title: 'Appointment Settings',
                        subtitle: 'Manage your appointment preferences',
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: () {},
                      ),
                      //  Divider(color: AppColors.divider.withOpacity(0.5), thickness: 1),
                    ],
                  ),
                ),
              ),

              // Support
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Support', style: AppTextStyles.heading2),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  width: double.infinity,
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  // alignment: Alignment.centerLeft,
                  // color: AppColors.surface,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.surface,
                    border: Border(
                      bottom: BorderSide(color: AppColors.border, width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemMenuSetting(
                        icon: Icons.help,
                        title: 'Help Center',
                        subtitle: 'Find answers to common questions',
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: () {
                          print('Help Center');
                        },
                      ),
                      Divider(
                          color: AppColors.divider.withOpacity(0.5),
                          thickness: 1),
                      ItemMenuSetting(
                        icon: Icons.phone,
                        title: 'Contact Us',
                        subtitle: 'Reach out to our support team',
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: () {
                          print('Contact');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemMenuSetting extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const ItemMenuSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor:
          AppColors.border.withOpacity(0.3), // Change background color on hover
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: AppTextStyles.bodyMedium),
      subtitle: Text(subtitle, style: AppTextStyles.bodySmall),
      trailing: Icon(trailingIcon, size: 16),
      onTap: onTap,
    );
  }
}
