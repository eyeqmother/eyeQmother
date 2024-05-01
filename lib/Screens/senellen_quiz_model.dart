// TODO Implement this library.
import '../flutter_flow/flutter_flow_model.dart';

import 'package:flutter/material.dart';

import 'SenelenQuiz.dart';

class SenellenQuizModel extends FlutterFlowModel<SenellenQuizWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
