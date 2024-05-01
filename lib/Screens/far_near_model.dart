// TODO Implement this library.

import 'package:quzzapp1/Screens/Far_near.dart';

import '../flutter_flow/flutter_flow_model.dart';
import 'package:flutter/material.dart';

class FarNearModel extends FlutterFlowModel<FarNearWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
