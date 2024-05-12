import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class homereport2 extends StatefulWidget {
  const homereport2({Key? key}) : super(key: key);

  @override
  State<homereport2> createState() => _homereport2State();
}

class _homereport2State extends State<homereport2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic> data = [];
  int num = 0;

  @override
  void initState() {
    super.initState();
    _initializeData(); // Call _initializeData1 to fetch data from Firebase
  }

  // Future<void> _initializeData1() async {
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     // User is signed in
  //     String uid = user.uid;
  //     print('User ID: $uid');

  //     DatabaseReference ref = FirebaseDatabase.instance.ref(user.uid);

  //     // Read the updated data
  //     DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
  //     if (snapshot.value != null && snapshot.value is Map) {
  //       Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>;
  //       if (values != null) {
  //         // Handle the data as needed

  //         print('Quiznum: ${values["Quiznum"]}');

  //         //print('Correct: ${values["Quiz1"]["Quiztype"]["correct"]}');
  //         print('Incorrect: ${values["Quiz1"]["Quiztype"]["incorrect"]}');

  //         setState(() {
  //           num = int.parse(values["Quiznum"]);
  //           data = values["Quiz1"]["Quiztype"]["correct"];
  //         });
  //       } else {
  //         print("Snapshot value is null");
  //       }
  //     } else {
  //       print("Snapshot value is null or not in the expected format");
  //     }
  //   } else {
  //     // No user is signed in
  //     print('No user signed in');
  //   }
  // }

  Map<dynamic, dynamic>? values;

  Future<void> _initializeData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in
      String uid = user.uid;
      print('User ID: $uid');

      DatabaseReference ref = FirebaseDatabase.instance.ref(user.uid);

      // Read the updated data
      DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
      if (snapshot.value != null && snapshot.value is Map) {
        // values = snapshot.value as Map<dynamic, dynamic>;
        values = snapshot.value as Map<dynamic, dynamic>;
        if (values != null) {
          // Handle the data as needed

          print('Quiznum: ${values!["Quiznum"]}');
          print('Correct: ${values!["Quiz1"]["Colorblindness"]["correct"]}');
          print(
              'Incorrect: ${values!["Quiz1"]["Colorblindness"]["incorrect"]}');
        } else {
          print("Snapshot value is null");
        }
      } else {
        print("Snapshot value is null or not in the expected format");
      }
    } else {
      // No user is signed in
      print('No user signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Generated code for this Stack Widget...
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                      child: Text(
                        'Reports',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                child: Text(
                  'Select Test',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 22,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          'Item $index: hello'), // Displaying index alongside 'hello'
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
