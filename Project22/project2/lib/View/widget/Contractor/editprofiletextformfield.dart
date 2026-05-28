import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class EditProfileTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const EditProfileTextFormField(
      {super.key,
      required this.controller,
      required this.text,
      this.icon,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(icon),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.black),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.black),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.black),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.black),
            borderRadius: BorderRadius.all(Radius.circular(40))),
      ),
    );
  }
}
