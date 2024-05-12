import 'package:eyeqmother/Screens/report.dart';
import 'package:eyeqmother/resources/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class reporthome3 extends StatefulWidget {
  const reporthome3({Key? key}) : super(key: key);

  @override
  State<reporthome3> createState() => _reporthome3State();
}

class _reporthome3State extends State<reporthome3> {
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
      dbRef = FirebaseDatabase.instance.ref(uid).child('colorbliendQuiz');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                      'ColorBliend Test Reports',
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map student = snapshot.value as Map;
                  student['key'] = snapshot.key;

                  return listItem(student: student, index1: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
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
                        AppImages().Color_bliendness,
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
                        'Test ${index1 + 1}',
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
                                  name1: 'ColorBliend Test Reports',
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
