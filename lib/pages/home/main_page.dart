import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(
          'assets/Cart_Icon.png',
          width: 20,
        ),
      );
    }

    // Code yg ini ngikutin tutor
    // Widget customButtonNav() {
    //   return ClipRRect(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(20),
    //     ),
    //     child: BottomAppBar(
    //       shape: CircularNotchedRectangle(),
    //       notchMargin: 10,
    //       clipBehavior: Clip.antiAlias,
    //       child: BottomNavigationBar(
    //         backgroundColor: backgroundColor4,
    //         currentIndex: currentIndex,
    //         onTap: (value) {
    //           setState(() {
    //             currentIndex = value;
    //           });
    //         },
    //         type: BottomNavigationBarType.fixed,
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: Container(
    //               margin: EdgeInsets.only(
    //                 top: 10,
    //                 bottom: 1,
    //               ),
    //               child: Image.asset(
    //                 'assets/Home_icon.png',
    //                 width: 21,
    //                 color: currentIndex == 0 ? primaryColor : disableColor,
    //               ),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Container(
    //               margin: EdgeInsets.only(
    //                 top: 10,
    //                 bottom: 1,
    //               ),
    //               child: Image.asset(
    //                 'assets/Chat_Icon.png',
    //                 width: 20,
    //                 color: currentIndex == 1 ? primaryColor : disableColor,
    //               ),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Image.asset(
    //               'assets/wishlist_icon.png',
    //               width: 20,
    //               color: currentIndex == 2 ? primaryColor : disableColor,
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Image.asset(
    //               'assets/Profile_logo.png',
    //               width: 18,
    //               color: currentIndex == 3 ? primaryColor : disableColor,
    //             ),
    //             label: '',
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: backgroundColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Consumer<PageProvider>(
            builder: (context, pageProvider, _) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => pageProvider.currentIndex = 0,
                    icon: Image.asset(
                      'assets/Home_icon.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : disableColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => pageProvider.currentIndex = 1,
                    icon: Image.asset(
                      'assets/Chat_Icon.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : disableColor,
                    ),
                  ),
                  SizedBox(width: 60), // Space for FAB
                  IconButton(
                    onPressed: () => pageProvider.currentIndex = 2,
                    icon: Image.asset(
                      'assets/wishlist_icon.png',
                      width: 20,
                      color: pageProvider.currentIndex == 2
                          ? primaryColor
                          : disableColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => pageProvider.currentIndex = 3,
                    icon: Image.asset(
                      'assets/Profile_logo.png',
                      width: 18,
                      color: pageProvider.currentIndex == 3
                          ? primaryColor
                          : disableColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return WishlistPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
