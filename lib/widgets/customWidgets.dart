import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:initial_test/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final bool showPassword;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.showPassword = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPassword,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.deepOrange[200],
          filled: true,
          hintText: hintText),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomMaterialButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey,
      padding: const EdgeInsets.all(15.0),
      color: Colors.black,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class CommonPadding extends StatelessWidget {
  final Widget? child;

  const CommonPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: child,
    );
  }
}

class LogoImage extends StatelessWidget {
  final double width;
  final double height;

  const LogoImage({Key? key, this.height = 200.0, this.width = 200.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      image: const AssetImage(ImagePath.logo),
      width: width,
      height: height,
    );
  }
}

class HeaderTextField extends StatelessWidget {
  final String text;
  const HeaderTextField({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final Color progressColor;
  const ProgressBar({Key? key, this.progressColor = Colors.deepOrange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.all(250.0),
      height: MediaQuery.of(context).size.height,
      color: Colors.white.withOpacity(0.5),
      child: Center(
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: CircularProgressIndicator(
            color: progressColor,
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TitleText(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      this.fontSize = 20.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ));
  }
}

class CustomTextField extends StatelessWidget {
  final String? hint;
  const CustomTextField({Key? key, this.hint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hint ?? "",
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.deepOrange)),
        ));
  }
}
