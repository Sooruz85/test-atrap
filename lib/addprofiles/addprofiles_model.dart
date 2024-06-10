import '/flutter_flow/flutter_flow_util.dart';
import 'addprofiles_widget.dart' show AddprofilesWidget;
import 'package:flutter/material.dart';

class AddprofilesModel extends FlutterFlowModel<AddprofilesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for usernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldTextController;
  String? Function(BuildContext, String?)? usernameFieldTextControllerValidator;
  // State field(s) for BioField widget.
  FocusNode? bioFieldFocusNode;
  TextEditingController? bioFieldTextController;
  String? Function(BuildContext, String?)? bioFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFieldFocusNode?.dispose();
    usernameFieldTextController?.dispose();

    bioFieldFocusNode?.dispose();
    bioFieldTextController?.dispose();
  }
}
