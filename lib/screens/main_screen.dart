import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets2/bottom_navigation.dart';
import '../widgets2/consultation_banner.dart';
import '../widgets2/header.dart';
import '../widgets2/specialist_section.dart';
import '../widgets2/popular_doctors_section.dart';
import '../presentation/my_appoiments_screen/my_appoiments_screen.dart';
import '../presentation/chat_screen/chat_screen.dart';
import '../presentation/profille_screen/profille_screen.dart';
import 'main_screen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MainScreenController());
  }

  final List<Widget> _screens = [
    _HomeContent(),
    const MyAppoimentsScreen(), // Calendar/Appointments screen
    const ChatScreen(), // Messages screen
    const ProfilleScreen(), // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _screens[controller.currentIndex.value]),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigation(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
          ConsultationBanner(),
          SpecialistSection(),
          PopularDoctorsSection(),
        ],
      ),
    );
  }
}
