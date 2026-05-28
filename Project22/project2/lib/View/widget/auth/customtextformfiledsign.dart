import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomtTextFormFieldSign extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? obscure;
  const CustomtTextFormFieldSign({
    super.key,
    required this.hintText,
    required this.icon,
    this.onPressed,
    required this.validator,
    required this.controller, this.onChanged,  this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: obscure == null || obscure == false ? false : true ,
        onChanged: onChanged,
          keyboardType: TextInputType.text,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
            hintText: hintText,
            fillColor: Appcolors.lightWite,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Appcolors.lightWite)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Appcolors.lightWite)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Appcolors.lightWite)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Appcolors.lightWite)),
          )),
    );
  }
}


