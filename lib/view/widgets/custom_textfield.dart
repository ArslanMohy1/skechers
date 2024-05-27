import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String inputText;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final TextEditingController? textEditingController;
  final bool obsecure;
  final TextInputType? type;
  final ValueChanged<String>? onChanged;

  CustomTextfield({
    Key? key,
    required this.inputText,
    this.prefixIcon,
    this.postfixIcon,
    required this.obsecure,
    this.textEditingController,
    this.type,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obsecure;
  late IconData _postfixIcon;

  @override
  void initState() {
    super.initState();
    _obsecure = widget.obsecure;
    _postfixIcon = widget.obsecure ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_solid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff0B2948)),
      ),
      child: TextField(
        controller: widget.textEditingController,
        onChanged: widget.onChanged,
        keyboardType: widget.type,
        obscureText: _obsecure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon, color: Color(0xff0B2948)),
          suffixIcon: widget.postfixIcon != null
              ? IconButton(
            icon: Icon(_postfixIcon, color: Color(0xff0B2948)),
            onPressed: () {
              setState(() {
                _obsecure = !_obsecure;
                _postfixIcon = _obsecure ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_solid;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: widget.inputText,
          hintStyle: TextStyle(
            color: Color(0xff0B2948),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
