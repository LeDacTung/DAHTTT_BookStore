
import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';



class StepperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'CupertinoStepper for Flutter',
      debugShowCheckedModeBanner: false,
      home: StepperPage(),
    );
  }
}

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoStepper for Flutter'),
      ),
      child: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return _buildStepper(StepperType.vertical, size);
              case Orientation.landscape:
                return _buildStepper(StepperType.horizontal, size);
              default:
                throw UnimplementedError(orientation.toString());
            }
          },
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type, Size size) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 2;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        widget1(size: size),
        widget2(size),
        widget1(size: size)
      ],
    );
  }

  Step widget1({
    required Size size
}){
    return Step(
        title: Text('Subtitle'),
        content: LimitedBox(
          maxWidth: size.width,
          maxHeight: size.width,
          child: Container(
            color: Colors.blue,
          ),
        ),
    );
  }

  Step widget2(Size size){
    return Step(
      title: Text('Subtitle'),
      content: LimitedBox(
        maxWidth: size.width,
        maxHeight: size.width,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}