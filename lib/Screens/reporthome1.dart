// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';

// class homereport2 extends StatefulWidget {
//   const homereport2({Key? key}) : super(key: key);

//   @override
//   State<homereport2> createState() => _homereport2State();
// }

// class _homereport2State extends State<homereport2> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   List<dynamic> data = [];
//   int num = 0;

//   @override
//   void initState() {
//     super.initState();
//     _initializeData(); // Call _initializeData1 to fetch data from Firebase
//   }

//   // Future<void> _initializeData1() async {
//   //   User? user = FirebaseAuth.instance.currentUser;

//   //   if (user != null) {
//   //     // User is signed in
//   //     String uid = user.uid;
//   //     print('User ID: $uid');

//   //     DatabaseReference ref = FirebaseDatabase.instance.ref(user.uid);

//   //     // Read the updated data
//   //     DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
//   //     if (snapshot.value != null && snapshot.value is Map) {
//   //       Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>;
//   //       if (values != null) {
//   //         // Handle the data as needed

//   //         print('Quiznum: ${values["Quiznum"]}');

//   //         //print('Correct: ${values["Quiz1"]["Quiztype"]["correct"]}');
//   //         print('Incorrect: ${values["Quiz1"]["Quiztype"]["incorrect"]}');

//   //         setState(() {
//   //           num = int.parse(values["Quiznum"]);
//   //           data = values["Quiz1"]["Quiztype"]["correct"];
//   //         });
//   //       } else {
//   //         print("Snapshot value is null");
//   //       }
//   //     } else {
//   //       print("Snapshot value is null or not in the expected format");
//   //     }
//   //   } else {
//   //     // No user is signed in
//   //     print('No user signed in');
//   //   }
//   // }

//   Map<dynamic, dynamic>? values;

//   Future<void> _initializeData() async {
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       // User is signed in
//       String uid = user.uid;
//       print('User ID: $uid');

//       DatabaseReference ref = FirebaseDatabase.instance.ref(user.uid);

//       // Read the updated data
//       DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
//       if (snapshot.value != null && snapshot.value is Map) {
//         // values = snapshot.value as Map<dynamic, dynamic>;
//         values = snapshot.value as Map<dynamic, dynamic>;
//         if (values != null) {
//           // Handle the data as needed

//           print('Quiznum: ${values!["Quiznum"]}');
//           print('Correct: ${values!["Quiz1"]["Colorblindness"]["correct"]}');
//           print(
//               'Incorrect: ${values!["Quiz1"]["Colorblindness"]["incorrect"]}');
//         } else {
//           print("Snapshot value is null");
//         }
//       } else {
//         print("Snapshot value is null or not in the expected format");
//       }
//     } else {
//       // No user is signed in
//       print('No user signed in');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               // Generated code for this Stack Widget...
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/images/Rectangle.png',
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.2,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const Align(
//                     alignment: AlignmentDirectional(0, 0),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
//                       child: Text(
//                         'Reports',
//                         style: TextStyle(
//                           fontFamily: 'Readex Pro',
//                           fontSize: 22,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
//                 child: Text(
//                   'Select Test',
//                   style: TextStyle(
//                     fontFamily: 'Readex Pro',
//                     fontSize: 22,
//                     letterSpacing: 0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 6,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(
//                           'Item $index: hello'), // Displaying index alongside 'hello'
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class homereport2 extends StatefulWidget {
//   const homereport2({Key? key}) : super(key: key);

//   @override
//   State<homereport2> createState() => _homereport2State();
// }

// class _homereport2State extends State<homereport2> {
//   Query dbRef = FirebaseDatabase.instance
//       .ref()
//       .child('NoGPVHzPTdUS3EswNjIc1SCmZXK2/Quiz1/Colorblindness');
//   DatabaseReference reference = FirebaseDatabase.instance
//       .ref()
//       .child('NoGPVHzPTdUS3EswNjIc1SCmZXK2/Quiz1/Colorblindness');

//   Widget listItem({required Map student}) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       height: 110,
//       color: Colors.amberAccent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             student['name'],
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             student['age'],
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             student['salary'],
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   //Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(studentKey: student['key'])));
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.edit,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 6,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   reference.child(student['key']).remove();
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.delete,
//                       color: Colors.red[700],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetching data'),
//         ),
//         body: Container(
//           height: double.infinity,
//           child: FirebaseAnimatedList(
//             query: dbRef,
//             itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                 Animation<double> animation, int index) {
//               Map student = snapshot.value as Map;
//               student['key'] = snapshot.key;

//               return listItem(student: student);
//             },
//           ),
//         ));
//   }
// }

import 'package:eyeqmother/Screens/report.dart';
import 'package:eyeqmother/components/page_transmission.dart';
import 'package:eyeqmother/resources/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class homereport2 extends StatefulWidget {
  const homereport2({Key? key}) : super(key: key);

  @override
  State<homereport2> createState() => _homereport2State();
}

class _homereport2State extends State<homereport2> {
  //   User? user = FirebaseAuth.instance.currentUser;
  // Query dbRef = FirebaseDatabase.instance.ref(user?.uid).child('SenellenQuiz');
  // DatabaseReference reference =
  //     FirebaseDatabase.instance.ref().child('SenellenQuiz');

  late DatabaseReference dbRef;
  DatabaseReference? reference;
  User? user;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user!.uid;
      dbRef = FirebaseDatabase.instance.ref(uid).child('SenellenQuiz');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map student = snapshot.value as Map;
            student['key'] = snapshot.key;

            return listItem(student: student, index1: index);
          }),
    ));
  }

  Widget listItem({required Map student, required index1}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              AppImages().Container_color,
            ).image,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              color: Color(0xFFE0E3E7),
              offset: Offset(
                0.0,
                1,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: const Color(0x4C4B39EF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF4B39EF),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppImages().AstigmatismImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Quiz ${index1 + 1}',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF10181B),
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFF4B39EF),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: GestureDetector(
                  onTap: () {
                    print(student['correct']);
                    print(student['incorrect']);
                    String data = student['correct'].toString();

                    List<String> dataList =
                        data.substring(1, data.length - 1).split(", ");

                    print(dataList);

                    String data1 = student['incorrect'].toString();

                    // Remove square brackets and split by comma
                    List<String> dataList1 =
                        data1.substring(1, data.length - 1).split(", ");

                    print(dataList1);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportWidget(
                                  data: dataList,
                                  data1: dataList1,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 20,
                    ),
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
