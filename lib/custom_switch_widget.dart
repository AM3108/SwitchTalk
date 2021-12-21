import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSwitchTalk extends StatelessWidget {
  const CustomSwitchTalk({Key? key, required this.value, required this.disabled,
    required this.onToggle, required this.text}) : super(key: key);
  final bool value;
  final bool disabled;
  final ValueChanged<bool> onToggle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [

          Semantics(
            label: text,
            child: FlutterSwitch(
              width: 60.0,
              height: 35.0,
              valueFontSize: 25.0,
              toggleSize: 30.0,
              value: value,
              activeColor: Colors.green,
              borderRadius: 30.0,
              padding: 4.0,
              disabled: disabled,
              showOnOff: false,
              onToggle: onToggle
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                color: disabled == true?Colors.grey:Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}
