import 'package:ARshop_App/utils/consts.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class show_arview extends StatefulWidget {
  const show_arview({super.key});

  @override
  State<show_arview> createState() => _show_arviewState();
}

class _show_arviewState extends State<show_arview> {
  late ArCoreController arCoreController;

  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }

  void controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;
    addModel(hit);
  }

  Future addModel(ArCoreHitTestResult hit) async {
    final modelPath = 'asset/3Dmodels/sofa/sofa2/sofa2_ver2.glb';
    final node = ArCoreReferenceNode(
      name: "model",
      objectUrl: modelPath,
      position: hit.pose.translation,
      rotation: hit.rotation,
    );
    await arCoreController.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
