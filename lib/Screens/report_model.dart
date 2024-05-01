import 'package:flutter/material.dart';

Widget buildMessageWidget(
    BuildContext context, Color backgroundColor, String text) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your answer B was incorrect ',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
              Text(
                'Correct answer P',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
