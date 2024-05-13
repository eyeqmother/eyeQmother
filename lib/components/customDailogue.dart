import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialogue extends StatelessWidget {
  CustomDialogue({required this.body, required this.heading});
  final String heading;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(0xff4056FA),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              heading,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat"
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              body,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat"
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                  
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white, // Set background color to transparent
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Color(0xff4056FA),// Set text color to white
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context, false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent, // Set background color to transparent
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
