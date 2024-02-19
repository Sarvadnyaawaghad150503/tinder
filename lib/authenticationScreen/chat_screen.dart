// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:swipe_cards/profile_card.dart';
// import 'package:tinder/authenticationScreen/colors.dart';
// import 'package:tinder/authenticationScreen/explore_screen.dart';
// import 'package:tinder/authenticationScreen/main_page.dart';
// import 'package:tinder/authenticationScreen/personal_chat.dart';
// import 'package:tinder/authenticationScreen/profile_screen.dart';
// import 'package:tinder/data/chats_json.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tinder/models/UserModel.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       // body: getBody(),
//       body: _buildUserList(),
//       bottomNavigationBar: getBottomNavigationBar(),
//     );
//   }
//
//   Widget _buildUserList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('error');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('loading...');
//         }
//         return ListView(
//           children: snapshot.data!.docs
//               .map<Widget>((doc) => _buildUserListItem(doc))
//               .toList(),
//         );
//       },
//     );
//   }
//
//   Widget _buildUserListItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//
//     if (_auth.currentUser!.email != data['email']) {
//       return ListTile(
//         title: Text(data['email']),
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => PersonalChat(
//                         receiverUserEmail: data['email'],
//                         receiverUserID: data['uid'],
//                       )));
//         },
//       );
//     } else {
//       return Container();
//     }
//   }
//
//   // Widget getBody() {
//   //   var size = MediaQuery.of(context).size;
//   //   return ListView(
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.only(top: 20),
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //           children: [
//   //             Text(
//   //               "Messages",
//   //               style: TextStyle(
//   //                   fontSize: 18, fontWeight: FontWeight.bold, color: primary),
//   //             ),
//   //             Container(
//   //               height: 25,
//   //               width: 1,
//   //               decoration: BoxDecoration(color: black.withOpacity(0.15)),
//   //             ),
//   //             Text(
//   //               "Matches",
//   //               style: TextStyle(
//   //                   fontSize: 18,
//   //                   fontWeight: FontWeight.bold,
//   //                   color: black.withOpacity(0.5)),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       SizedBox(
//   //         height: 10,
//   //       ),
//   //       Divider(
//   //         thickness: 0.8,
//   //       ),
//   //       Padding(
//   //         padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
//   //         child: Container(
//   //           height: 38,
//   //           decoration: BoxDecoration(
//   //               color: grey.withOpacity(0.2),
//   //               borderRadius: BorderRadius.circular(5)),
//   //           child: TextField(
//   //             controller: searchController,
//   //             cursorColor: black.withOpacity(0.5),
//   //             decoration: InputDecoration(
//   //                 border: InputBorder.none,
//   //                 prefixIcon: Icon(
//   //                   Icons.search,
//   //                   color: black.withOpacity(0.5),
//   //                 ),
//   //                 hintText: "Search 0 Matches"),
//   //           ),
//   //         ),
//   //       ),
//   //       Divider(
//   //         thickness: 0.8,
//   //       ),
//   //       SizedBox(
//   //         height: 10,
//   //       ),
//   //       Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Padding(
//   //             padding: const EdgeInsets.only(left: 15),
//   //             child: Text(
//   //               "New Matches",
//   //               style: TextStyle(
//   //                   fontSize: 15, fontWeight: FontWeight.w500, color: primary),
//   //             ),
//   //           ),
//   //           SizedBox(
//   //             height: 20,
//   //           ),
//   //           SingleChildScrollView(
//   //             scrollDirection: Axis.horizontal,
//   //             child: Padding(
//   //               padding: const EdgeInsets.only(left: 15),
//   //               child: Row(
//   //                   children: List.generate(chats_json.length, (index) {
//   //                 return Padding(
//   //                   padding: const EdgeInsets.only(right: 20),
//   //                   child: Column(
//   //                     children: <Widget>[
//   //                       Container(
//   //                         width: 70,
//   //                         height: 70,
//   //                         child: Stack(
//   //                           children: <Widget>[
//   //                             chats_json[index]['story']
//   //                                 ? Container(
//   //                                     decoration: BoxDecoration(
//   //                                         shape: BoxShape.circle,
//   //                                         border: Border.all(
//   //                                             color: primary, width: 3)),
//   //                                     child: Padding(
//   //                                       padding: const EdgeInsets.all(3.0),
//   //                                       child: Container(
//   //                                         width: 70,
//   //                                         height: 70,
//   //                                         decoration: BoxDecoration(
//   //                                             shape: BoxShape.circle,
//   //                                             image: DecorationImage(
//   //                                                 image: AssetImage(
//   //                                                     chats_json[index]['img']),
//   //                                                 fit: BoxFit.cover)),
//   //                                       ),
//   //                                     ),
//   //                                   )
//   //                                 : Container(
//   //                                     width: 65,
//   //                                     height: 65,
//   //                                     decoration: BoxDecoration(
//   //                                         shape: BoxShape.circle,
//   //                                         image: DecorationImage(
//   //                                             image: AssetImage(
//   //                                                 chats_json[index]['img']),
//   //                                             fit: BoxFit.cover)),
//   //                                   ),
//   //                             chats_json[index]['online']
//   //                                 ? Positioned(
//   //                                     top: 48,
//   //                                     left: 52,
//   //                                     child: Container(
//   //                                       width: 20,
//   //                                       height: 20,
//   //                                       decoration: BoxDecoration(
//   //                                           color: green,
//   //                                           shape: BoxShape.circle,
//   //                                           border: Border.all(
//   //                                               color: white, width: 3)),
//   //                                     ),
//   //                                   )
//   //                                 : Container()
//   //                           ],
//   //                         ),
//   //                       ),
//   //                       SizedBox(
//   //                         height: 10,
//   //                       ),
//   //                       // StreamBuilder(
//   //                       //     stream: FirebaseFirestore.instance
//   //                       //         .collection("users")
//   //                       //         .where("email",
//   //                       //             isEqualTo: searchController.text)
//   //                       //         .snapshots(),
//   //                       //     builder: (context, snapshot) {
//   //                       //       if (snapshot.connectionState ==
//   //                       //           ConnectionState.active) {
//   //                       //         if (snapshot.hasData) {
//   //                       //           QuerySnapshot dataSnapshot =
//   //                       //               snapshot.data as QuerySnapshot;
//   //                       //
//   //                       //           Map<String, dynamic> usermap =
//   //                       //               dataSnapshot.docs[0].data()
//   //                       //                   as Map<String, dynamic>;
//   //                       //
//   //                       //           UserModel searchedUser =
//   //                       //               UserModel.fromMap(usermap);
//   //                       //
//   //                       //           return ListTile(
//   //                       //             title: Text(searchedUser.fullname!),
//   //                       //             subtitle: Text(searchedUser.email!),
//   //                       //           );
//   //                       //         } else if (snapshot.hasError) {
//   //                       //           return Text("An error occured");
//   //                       //         } else {
//   //                       //           return Text("No results Found");
//   //                       //         }
//   //                       //       } else {
//   //                       //         return CircularProgressIndicator();
//   //                       //       }
//   //                       //     }),
//   //                       SizedBox(
//   //                         width: 70,
//   //                         child: Align(
//   //                             child: Text(
//   //                           chats_json[index]['name'],
//   //                           overflow: TextOverflow.ellipsis,
//   //                         )),
//   //                       )
//   //                     ],
//   //                   ),
//   //                 );
//   //               })),
//   //             ),
//   //           ),
//   //           SizedBox(
//   //             height: 30,
//   //           ),
//   //           Padding(
//   //             padding: const EdgeInsets.only(left: 15),
//   //             child: Column(
//   //               children: List.generate(userMessages.length, (index) {
//   //                 return Padding(
//   //                   padding: const EdgeInsets.only(bottom: 20),
//   //                   child: Row(
//   //                     children: <Widget>[
//   //                       Container(
//   //                         width: 70,
//   //                         height: 70,
//   //                         child: Stack(
//   //                           children: <Widget>[
//   //                             userMessages[index]['story']
//   //                                 ? Container(
//   //                                     decoration: BoxDecoration(
//   //                                         shape: BoxShape.circle,
//   //                                         border: Border.all(
//   //                                             color: primary, width: 3)),
//   //                                     child: Padding(
//   //                                       padding: const EdgeInsets.all(3.0),
//   //                                       child: Container(
//   //                                         width: 70,
//   //                                         height: 70,
//   //                                         decoration: BoxDecoration(
//   //                                             shape: BoxShape.circle,
//   //                                             image: DecorationImage(
//   //                                                 image: AssetImage(
//   //                                                     userMessages[index]
//   //                                                         ['img']),
//   //                                                 fit: BoxFit.cover)),
//   //                                       ),
//   //                                     ),
//   //                                   )
//   //                                 : Container(
//   //                                     width: 65,
//   //                                     height: 65,
//   //                                     decoration: BoxDecoration(
//   //                                         shape: BoxShape.circle,
//   //                                         image: DecorationImage(
//   //                                             image: AssetImage(
//   //                                                 userMessages[index]['img']),
//   //                                             fit: BoxFit.cover)),
//   //                                   ),
//   //                             userMessages[index]['online']
//   //                                 ? Positioned(
//   //                                     top: 48,
//   //                                     left: 52,
//   //                                     child: Container(
//   //                                       width: 20,
//   //                                       height: 20,
//   //                                       decoration: BoxDecoration(
//   //                                           color: green,
//   //                                           shape: BoxShape.circle,
//   //                                           border: Border.all(
//   //                                               color: white, width: 3)),
//   //                                     ),
//   //                                   )
//   //                                 : Container()
//   //                           ],
//   //                         ),
//   //                       ),
//   //                       SizedBox(
//   //                         width: 20,
//   //                       ),
//   //                       Column(
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: <Widget>[
//   //                           Text(
//   //                             userMessages[index]['name'],
//   //                             style: TextStyle(
//   //                                 fontSize: 17, fontWeight: FontWeight.w500),
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           SizedBox(
//   //                             width: MediaQuery.of(context).size.width - 135,
//   //                             child: Text(
//   //                               userMessages[index]['message'] +
//   //                                   " - " +
//   //                                   userMessages[index]['created_at'],
//   //                               style: TextStyle(
//   //                                   fontSize: 15,
//   //                                   color: black.withOpacity(0.8)),
//   //                               overflow: TextOverflow.ellipsis,
//   //                             ),
//   //                           )
//   //                         ],
//   //                       )
//   //                     ],
//   //                   ),
//   //                 );
//   //               }),
//   //             ),
//   //           )
//   //         ],
//   //       )
//   //     ],
//   //   );
//   // }
//
//   Widget getBottomNavigationBar() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: white,
//         boxShadow: [
//           BoxShadow(
//             color: grey.withOpacity(0.1),
//             spreadRadius: 10,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainPage()),
//               );
//             },
//             child: Image.asset(
//               'images/logo.png',
//               height: 20,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ExploreScreen()),
//               );
//             },
//             child: SvgPicture.asset(
//               'images/search.svg',
//               width: 22,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ChatPage()),
//               );
//             },
//             child: SvgPicture.asset(
//               'images/star.svg',
//               width: 24,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ChatPage()),
//               );
//             },
//             child: SvgPicture.asset(
//               'images/chat.svg',
//               width: 24,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // Add your logic for the person SVG tap
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AccountPage()),
//                   );
//                 },
//                 child: SvgPicture.asset(
//                   'images/person.svg',
//                   width: 16,
//                 ),
//               ),
//               SizedBox(
//                   width: 20), // Add spacing between person and tinder icons
//               GestureDetector(
//                 onTap: () {
//                   // Add your logic for the tinder SVG tap
//                 },
//                 child: SvgPicture.asset(
//                   'images/tinder.svg', // Replace with the actual path to your tinder SVG file
//                   width: 24,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinder/authenticationScreen/colors.dart';
import 'package:tinder/authenticationScreen/explore_screen.dart';
import 'package:tinder/authenticationScreen/main_page.dart';
import 'package:tinder/authenticationScreen/personal_chat.dart';
import 'package:tinder/authenticationScreen/profile_screen.dart';
import 'package:tinder/authenticationScreen/tinder_gold.dart';
import 'package:tinder/data/chats_json.dart';
import 'package:tinder/models/UserModel.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Messages",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
                Container(
                  height: 25,
                  width: 1,
                  decoration: BoxDecoration(color: black.withOpacity(0.15)),
                ),
                Text(
                  "Matches",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: searchController,
                cursorColor: black.withOpacity(0.5),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: black.withOpacity(0.5),
                    ),
                    hintText: "Search 0 Matches"),
              ),
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('loading...');
              }
              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs
                    .map<Widget>((doc) => _buildUserListItem(doc))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['displayName']),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalChat(
                receiverUserEmail: data['displayName'],
                receiverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

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
                MaterialPageRoute(builder: (context) => TinderGold()),
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
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // Add your logic for the tinder SVG tap
                },
                child: SvgPicture.asset(
                  'images/tinder.svg',
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
