import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinder/authenticationScreen/chat_screen.dart';
import 'package:tinder/authenticationScreen/explore_screen.dart';
import 'package:tinder/authenticationScreen/login_screen.dart';
import 'package:tinder/authenticationScreen/main_page.dart';
import 'package:tinder/authenticationScreen/profile_screen.dart';
import 'package:tinder/data/account_json.dart';
import 'package:tinder/authenticationScreen/colors.dart';

class TinderGold extends StatefulWidget {
  @override
  _TinderGoldState createState() => _TinderGoldState();
}

class _TinderGoldState extends State<TinderGold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    final double containerWidth = 350.0; // Set your desired width

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Your other widgets can go here

          // Padding with Row for the logo and bell icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/text_logo.png',
                  width: 100,
                ),
                const Icon(
                  CupertinoIcons.bell_fill,
                  color: Color(0xFF7E858F),
                ),
              ],
            ),
          ),

          // Expanded widget for buying Tinder Gold
          Expanded(
            child: Container(
              width: containerWidth,
              color: Colors.yellow, // Set your desired background color
              child: Center(
                child: Text(
                  'Buy Tinder Gold for More Features!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Your other widgets can go here
        ],
      ),
    );
  }

  // Widget getBody() {
  //   var size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [
  //       ClipPath(
  //         clipper: OvalBottomBorderClipper(),
  //         child: Container(
  //           width: size.width,
  //           height: size.height * 0.6,
  //           decoration: BoxDecoration(color: white, boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey,
  //               spreadRadius: 10,
  //               blurRadius: 10,
  //             ),
  //           ]),
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child:
  //                           Container(), // This container takes the left space
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {
  //                         // Add your logic for the person SVG tap
  //                       },
  //                       child: SvgPicture.asset(
  //                         'images/person.svg',
  //                         width: 16,
  //                       ),
  //                     ),
  //                     SizedBox(
  //                         width:
  //                             20), // Add spacing between person and tinder icons
  //                     Expanded(
  //                       child:
  //                           Container(), // This container takes the remaining space
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {
  //                         // Add your logic for the tinder Image tap
  //                       },
  //                       child: Image.asset(
  //                         'images/tinder_logo2.png', // Replace with the actual path to your tinder Image file
  //                         width: 24,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 20),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Column(
  //                       children: [
  //                         Container(
  //                           width: 60,
  //                           height: 60,
  //                           decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               color: white,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                   color: grey.withOpacity(0.1),
  //                                   spreadRadius: 10,
  //                                   blurRadius: 15,
  //                                 ),
  //                               ]),
  //                           child: Icon(
  //                             Icons.settings,
  //                             size: 35,
  //                             color: grey.withOpacity(0.5),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: 10,
  //                         ),
  //                         Text(
  //                           "SETTINGS",
  //                           style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w600,
  //                               color: grey.withOpacity(0.8)),
  //                         )
  //                       ],
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 20),
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             width: 85,
  //                             height: 85,
  //                             child: Stack(
  //                               children: [
  //                                 Container(
  //                                   width: 80,
  //                                   height: 80,
  //                                   decoration: BoxDecoration(
  //                                       shape: BoxShape.circle,
  //                                       gradient: LinearGradient(
  //                                         colors: [primary_one, primary_two],
  //                                       ),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: grey.withOpacity(0.1),
  //                                           spreadRadius: 10,
  //                                           blurRadius: 15,
  //                                         ),
  //                                       ]),
  //                                   child: Icon(
  //                                     Icons.camera_alt,
  //                                     size: 45,
  //                                     color: white,
  //                                   ),
  //                                 ),
  //                                 Positioned(
  //                                   bottom: 8,
  //                                   right: 0,
  //                                   child: Container(
  //                                     width: 25,
  //                                     height: 25,
  //                                     decoration: BoxDecoration(
  //                                         shape: BoxShape.circle,
  //                                         color: white,
  //                                         boxShadow: [
  //                                           BoxShadow(
  //                                             color: grey.withOpacity(0.1),
  //                                             spreadRadius: 10,
  //                                             blurRadius: 15,
  //                                           ),
  //                                         ]),
  //                                     child: Center(
  //                                       child: Icon(Icons.add, color: primary),
  //                                     ),
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "ADD MEDIA",
  //                             style: TextStyle(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w600,
  //                                 color: grey.withOpacity(0.8)),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     Column(
  //                       children: [
  //                         Container(
  //                           width: 60,
  //                           height: 60,
  //                           decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               color: white,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                   color: grey.withOpacity(0.1),
  //                                   spreadRadius: 10,
  //                                   blurRadius: 15,
  //                                 ),
  //                               ]),
  //                           child: Icon(
  //                             Icons.edit,
  //                             size: 35,
  //                             color: grey.withOpacity(0.5),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: 10,
  //                         ),
  //                         Text(
  //                           "EDIT INFO",
  //                           style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w600,
  //                               color: grey.withOpacity(0.8)),
  //                         )
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     SvgPicture.asset(
  //                       'assets/star.svg',
  //                       width: 30,
  //                       height: 30,
  //                       color: primary,
  //                     ),
  //                     SvgPicture.asset(
  //                       'assets/flash.svg',
  //                       width: 30,
  //                       height: 30,
  //                       color: primary,
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 20),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Column(
  //             children: [
  //               SvgPicture.asset(
  //                 'images/star.svg',
  //                 width: 30,
  //                 height: 30,
  //                 color: primary,
  //               ),
  //               SizedBox(height: 5),
  //               Text(
  //                 'Super Like',
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w600,
  //                   color: grey.withOpacity(0.8),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Column(
  //             children: [
  //               SvgPicture.asset(
  //                 'images/flash.svg',
  //                 width: 30,
  //                 height: 30,
  //                 color: primary,
  //               ),
  //               SizedBox(height: 5),
  //               Text(
  //                 'Boost',
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w600,
  //                   color: grey.withOpacity(0.8),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 40),
  //       GestureDetector(
  //         onTap: () {
  //           // Add your logic for the Tinder Gold button tap
  //         },
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //           decoration: BoxDecoration(
  //             color: Colors.grey.withOpacity(0.8),
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           child: Text(
  //             ' MY TINDER GOLD',
  //             style: TextStyle(
  //               color: Colors.yellow,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 10),
  //       GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //           decoration: BoxDecoration(
  //             color: Colors.red, // Use your desired color
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           child: Text(
  //             'LOGOUT',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget getBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Image.asset(
              'images/logo.png',
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExploreScreen()),
              );
            },
            child: SvgPicture.asset(
              'images/search.svg',
              width: 22,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: SvgPicture.asset(
              'images/star.svg',
              width: 24,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: SvgPicture.asset(
              'images/chat.svg',
              width: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Add your logic for the person SVG tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
                child: SvgPicture.asset(
                  'images/person.svg',
                  width: 16,
                ),
              ),
              SizedBox(
                  width: 20), // Add spacing between person and tinder icons
              GestureDetector(
                onTap: () {
                  // Add your logic for the tinder SVG tap
                },
                child: SvgPicture.asset(
                  'path/to/tinder.svg', // Replace with the actual path to your tinder SVG file
                  width: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
