import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final Widget Screen;

  const BigCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.Screen,
  });

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  bool cardHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget.Screen));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            cardHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            cardHovered = false;
          });
        },
        child: Container(
          height: 150,
          width: 350,
          child: Card(
            // color: Colors.white,
            surfaceTintColor: cardHovered ? Colors.grey : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: cardHovered ? 8 : 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      flex: 70,
                      child: Text(widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ))),
                  Expanded(
                      flex: 30,
                      child: Image.asset(
                        widget.imagePath,
                        width: 60,
                        height: 60,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class BigCard extends StatelessWidget {
//   final String title;
//   final String imagePath;

//   const BigCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 350,
//       child: Card(
//         // color: Colors.white,
//         surfaceTintColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 70,
//                   child: Text(title,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 20,
//                       ))),
//               Expanded(
//                   flex: 30,
//                   child: Image.asset(
//                     imagePath,
//                     width: 60,
//                     height: 60,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MediumCard extends StatelessWidget {
  final String title;
  final int numValue;
  final String imagePath;

  const MediumCard(
      {super.key,
      required this.title,
      required this.numValue,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      child: Card(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 40,
                child: Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                flex: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      numValue.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
