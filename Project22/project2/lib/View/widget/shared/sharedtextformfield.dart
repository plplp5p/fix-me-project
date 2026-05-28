import 'package:flutter/material.dart';

class SharedTextFormField extends StatelessWidget {
  final Widget text;
  final IconData? icon;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? isNumber;
  const SharedTextFormField(
      {super.key,
      required this.text,
      this.icon,
      required this.mycontroller,
      this.validator,
      this.onChanged,
      this.isNumber});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
      validator: validator,
      controller: mycontroller,
      onChanged: onChanged,
      decoration: InputDecoration(
          
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          label: text, //Text("Name of the area"),
          prefixIcon: Icon(icon),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
    );
  }
}
