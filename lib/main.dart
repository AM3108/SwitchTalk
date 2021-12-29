import 'package:flutter/material.dart';
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
                  child: CustomSwitchTalk(assetName: 'assets/team-communication.svg',alignRight: true,primaryText: 'Text Labels',status: activeStatus, disabled: false, onChanged: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(secondaryText: "Secondary Text",primaryText: 'Text Labels',status: activeStatus, disabled: false, onChanged: (val){
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
                  child: CustomSwitchTalk(primaryText: 'Text Labels',status: activeStatus, disabled: true, onChanged: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(alignRight: true, status: activeStatus, disabled: true, onChanged: (val){
                    setState(() {
                      activeStatus = val;
                    });
                  },),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(primaryText: 'Text Labels',status: deActiveStatus, disabled: false, onChanged: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(alignRight: true,secondaryText: "Secondary Text",status: deActiveStatus, disabled: false, onChanged: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }, primaryText: 'Text Labels',),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSwitchTalk(primaryText: 'Text Labels',status: deActiveStatus, disabled: true, onChanged: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }),
                ),
                Expanded(
                  child: CustomSwitchTalk(status: deActiveStatus, disabled: true, onChanged: (val){
                    setState(() {
                      deActiveStatus = val;
                    });
                  }, primaryText: 'Text Labels',),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}



