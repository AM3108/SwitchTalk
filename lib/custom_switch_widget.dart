import 'package:flutter/material.dart';
import 'flutter_switch.dart';

class CustomSwitchTalk extends StatelessWidget {
  const CustomSwitchTalk({Key? key, required this.value, required this.disabled,
    required this.onChanged, required this.text}) : super(key: key);
  final bool value;
  final bool disabled;
  final ValueChanged<bool> onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    String semantics;
    if(disabled == true)
      {
        semantics = '$text Switch is Disabled';
      }else if(value == true)
        {
          semantics = '$text Switch is ON';
        }
    else {
      semantics = '$text Switch is OFF';
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [

          Semantics(
            label: semantics,
            child: FlutterSwitch(
              width: 60.0,
              height: 35.0,
              toggleSize: 30.0,
              value: value,
              activeColor: Colors.green,
              borderRadius: 30.0,
              padding: 4.0,
              disabled: disabled,
              showOnOff: false,
              onToggle: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(
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
