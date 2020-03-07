// import 'package:flutter/material.dart';
// class Profile2 extends StatefulWidget {
//   @override
//   _Profile2State createState() => _Profile2State();
// }

// class _Profile2State extends State<Profile2> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           height: 230.0,
//           color: Colors.lightBlueAccent,
//         ),
//         ListView.builder(
//           itemCount: 10,
//           itemBuilder: _mainListBuilder,
//         ),
//       ],
//     );
//   }

//   Widget _mainListBuilder(BuildContext context, int index) {
//     if (index == 0) return _buildHeader(context);
//     if (index == 1) return _buildSectionHeader(context);
//     if (index == 2) return _buildCollectionsRow();
//     if (index == 3)
//       return Container(
//           color: Colors.white,
//           padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
//           child: Text("Most liked posts",
//               style: Theme.of(context).textTheme.title));
//     return _buildListItem();
//   }

//   Widget _buildListItem() {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       child: ClipRRect(
//         child: Container(
//           color: Colors.green,
//           height: 100,
//           // child: Text('data'),
//         ),
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//     );
//   }

//   Container _buildSectionHeader(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Text(
//             "Collection",
//             style: Theme.of(context).textTheme.title,
//           ),
//           FlatButton(
//             onPressed: () {},
//             child: Text(
//               "Create new",
//               style: TextStyle(color: Colors.blue),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Container _buildCollectionsRow() {
//     return Container(
//       color: Colors.white,
//       height: 200.0,
//       padding: EdgeInsets.symmetric(horizontal: 10.0),
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: _user.collections.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//               margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//               width: 150.0,
//               height: 200.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0),
//                       child: SizedBox(
//                         height: 200,
//                         width: 200,
//                         child: Container(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(_user.collections[index].title,
//                       style: Theme.of(context)
//                           .textTheme
//                           .subhead
//                           .merge(TextStyle(color: Colors.grey.shade600)))
//                 ],
//               ));
//         },
//       ),
//     );
//   }

//   Container _buildHeader(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 30.0),
//       height: 260.0,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(
//                 top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
//             child: Material(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               elevation: 5.0,
//               color: Colors.white,
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 85.0,
//                   ),
//                   Text(
//                     _user.name,
//                     style: Theme.of(context).textTheme.title,
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(_user.bio),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Container(
//                     height: 40.0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Expanded(
//                           child: ListTile(
//                             title: Text(
//                               _user.posts.toString(),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text("Posts".toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 12.0)),
//                           ),
//                         ),
//                         Expanded(
//                           child: ListTile(
//                             title: Text(
//                               '${_user.followers.toString()}K',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text("Followers".toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 12.0)),
//                           ),
//                         ),
//                         Expanded(
//                           child: ListTile(
//                             title: Text(
//                               _user.following.toString(),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text("Following".toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 12.0)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Material(
//                 elevation: 5.0,
//                 shape: CircleBorder(),
//                 child: CircleAvatar(
//                   radius: 60.0,

//                   // backgroundImage: CachedNetworkImageProvider(avatars[0]),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
