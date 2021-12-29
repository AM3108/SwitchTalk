import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSwitchTalk extends StatelessWidget {
  const CustomSwitchTalk({Key? key, required this.status, required this.disabled,
    required this.onChanged, this.primaryText, this.secondaryText, this.assetName,
    this.primaryTextFontSize, this.secondaryTextFontSize, this.alignRight}) : super(key: key);
  final bool status;
  final bool disabled;
  final ValueChanged<bool> onChanged;
  final String ? primaryText;
  final String ? secondaryText;
  final String ? assetName;
  final double? primaryTextFontSize;
  final double? secondaryTextFontSize;
  final bool ? alignRight;
  @override
  Widget build(BuildContext context) {
    String semantics;
    if(disabled == true)
      {
          semantics = primaryText != null ? '$primaryText Switch is Disabled' : 'Switch is Disabled';
      }else if(status == true)
        {
          semantics = primaryText != null ?'$primaryText Switch is ON' : 'Switch is ON' ;
        }
    else {
      semantics = primaryText != null ?'$primaryText Switch is OFF': 'Switch is OFF';
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                alignRight == null || alignRight != true?
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10,),
                      child: primaryText != null ? _getPrimaryText : Container(),),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: secondaryText != null ? _getSecondaryText : Container(),),
                  ],
                ): Container(),
                Semantics(
                  label: semantics,
                  child:
                  CupertinoSwitch(value: status,
                    activeColor: disabled ? Colors.green.withOpacity(0.5): CupertinoColors.systemGreen,
                    onChanged: disabled ? null : onChanged,
                  ),
                ),
                alignRight != null && alignRight == true?
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: primaryText != null ? _getPrimaryText : Container(),),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: secondaryText != null ? _getSecondaryText : Container(),),
                  ],
                ): Container(),
              ],
            ),
          ],

        ),
      ),
    );
  }

  get _getPrimaryText{
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: assetName != null ? SizedBox(
              height: 15.0,width: 15.0,
              child:  SvgPicture.asset(assetName!)) : Container(),
          ),
          TextSpan(
            text: primaryText,
            style: TextStyle(
                fontSize: primaryTextFontSize ?? 14.0,
                color: disabled == true?Colors.grey:Colors.black
            ),
          ),
        ],
      ),
    );
}

  get _getSecondaryText{
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        secondaryText!,
        style: TextStyle(
            fontSize: secondaryTextFontSize ?? 10,
            color: Colors.grey
        ),
      ),
    );
  }
}
