// import 'package:flutter/material.dart';

// class TinderCard extends StatelessWidget {
//   final String image;
//   final double rotation;
//   final double opacity;
//   final double scaleFactor;

//   const TinderCard({
//     Key? key,
//     required this.image,
//     this.rotation = 0.0,
//     this.opacity = 1.0,
//     this.scaleFactor = 1.0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.identity()
//         ..setEntry(3, 2, 0.001)
//         ..rotateY(rotation)
//         ..scale(scaleFactor),
//       child: Opacity(
//         opacity: opacity,
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.network(
//               image,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TinderClone extends StatefulWidget {
//   final List<String> images = [
//     'https://source.unsplash.com/1600x900/?nature,water',
//     'https://source.unsplash.com/1600x900/?nature,tree',
//     'https://source.unsplash.com/1600x900/?beach,sunset',
//     'https://source.unsplash.com/1600x900/?city,building',
//     'https://source.unsplash.com/1600x900/?food',
//     'https://source.unsplash.com/1600x900/?dog'
//   ];

//   TinderClone({super.key});

//   @override
//   _TinderCloneState createState() => _TinderCloneState();
// }

// class _TinderCloneState extends State<TinderClone> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           const Padding(padding: EdgeInsets.only(top: 100)),
//           SizedBox(
//             height: MediaQuery.of(context).size.height - 200,
//             child: Stack(
//               children: [
//                 for (int i = currentIndex + 1; i < widget.images.length; i++)
//                   TinderCard(
//                     image: widget.images[i],
//                     rotation: (i - currentIndex) * -1,
//                     opacity: 1,
//                     scaleFactor: 1,
//                   ),
//                 if (currentIndex < widget.images.length)
//                   GestureDetector(
//                     onHorizontalDragEnd: (details) {
//                       if (details.velocity.pixelsPerSecond.dx < 0) {
//                         // Swipe Left
//                         if (currentIndex < widget.images.length - 1) {
//                           setState(() {
//                             currentIndex++;
//                           });
//                         }
//                       } else if (details.velocity.pixelsPerSecond.dx > 0) {
//                         // Swipe Right
//                         if (currentIndex > 0) {
//                           setState(() {
//                             currentIndex--;
//                           });
//                         }
//                       }
//                     },
//                     child: TinderCard(
//                       image: widget.images[currentIndex],
//                       rotation: 0.0,
//                       opacity: 1.0,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
