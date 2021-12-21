import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switch_talk/custom_switch_widget.dart';
void main() {
  runApp(const MaterialApp(
    home: SwitchTalk()
  ));
}

class SwitchTalk extends StatefulWidget {
  const SwitchTalk({Key? key}) : super(key: key);

  @override
  _SwitchTalkState createState() => _SwitchTalkState();
}

class _SwitchTalkState extends State<SwitchTalk> {
  bool activeStatus = true;
  bool deActiveStatus = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FlutterSwitch Demo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(text: 'Text Labels',value: activeStatus, disabled: false, onToggle: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(text: 'Text Labels',value: activeStatus, disabled: false, onToggle: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(text: 'Text Labels',value: activeStatus, disabled: true, onToggle: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(value: activeStatus, disabled: true, onToggle: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }, text: 'Text Labels',),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(text: 'Text Labels',value: deActiveStatus, disabled: false, onToggle: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(value: deActiveStatus, disabled: false, onToggle: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }, text: 'Text Labels',),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(text: 'Text Labels',value: deActiveStatus, disabled: true, onToggle: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(value: deActiveStatus, disabled: true, onToggle: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }, text: 'Text Labels',),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}



