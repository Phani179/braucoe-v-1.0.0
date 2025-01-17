
import 'package:flutter/material.dart';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'package:braucoe/screens/ai_chat/ai_chat_page.dart';
import 'package:braucoe/utilities/custom_icons.dart';
import 'package:braucoe/screens/home_page/home_page.dart';
import 'package:braucoe/screens/map/map_page.dart';
import 'package:braucoe/providers/ai_chat_provider.dart';
import 'package:braucoe/providers/profile_image_notifier.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/bottom-nav-bar';

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (context.mounted) {
      Provider.of<AIChatProvider>(context, listen: false).initializeChat();
      final gemini = Gemini.instance;

      gemini
          .chat(
        Provider.of<AIChatProvider>(context, listen: false).chat,
        generationConfig: GenerationConfig(
          temperature: 1.0,
        ),
      )
          .then((value) {
        Provider.of<AIChatProvider>(context, listen: false)
            .addMessage(value!.content!);
      });
      Provider.of<ProfileImageNotifier>(context, listen: false).imageFile =
          null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Widget body = HomePage();

    if (_selectedIndex == 1) {
      body = const MapPage();
    }
    if (_selectedIndex == 2) {
      body = const AIChatPage();
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: SizedBox(
        height: height * 0.07,
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          activeColor: const Color(0xff00512D),
          // Colors.green.shade900,
          tabBackgroundColor: const Color(0xFF9DCCB7),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          gap: 8,
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              iconColor: Color(0xFF382E1E),
              iconSize: 25,
              text: 'Home',
              textStyle: TextStyle(
                fontFamily: "LibreFranklin-Medium",
                color: Color(0xFF00512D),
              ),
              textSize: 25,
            ),
            GButton(
              icon: CustomIcons.map,
              iconColor: Color(0xFF382E1E),
              iconSize: 20,
              text: 'Map',
              textStyle: TextStyle(
                fontFamily: "LibreFranklin-Medium",
                color: Color(0xFF00512D),
              ),
              textSize: 25,
            ),
            GButton(
              icon: CustomIcons.ai_chat,
              iconColor: Color(0xFF382E1E),
              iconSize: 25,
              text: 'AI Chat',
              textStyle: TextStyle(
                fontFamily: "LibreFranklin-Medium",
                color: Color(0xFF00512D),
              ),
              textSize: 25,
            ),
          ],
        ),
      ),
    );
  }
}
