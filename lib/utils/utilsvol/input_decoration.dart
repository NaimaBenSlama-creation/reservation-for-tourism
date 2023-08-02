import 'package:flutter/material.dart';
import 'package:pfe/utils/utilsvol/size_config.dart';
import 'package:pfe/utils/utilsvol/styles.dart';


inputDecoration({String? text, IconData? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
      hintText: text,
      hintStyle: Styles.textStyle,
      focusColor: Styles.primaryColor,
      hoverColor: Styles.primaryColor,
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: Styles.primaryColor,),
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.only(top: getProportionateScreenHeight(15), left: prefixIcon == null ? getProportionateScreenWidth(15) : 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );
}