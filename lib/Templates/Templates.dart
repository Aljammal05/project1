
import 'package:flutter/material.dart';

class LinearColorBottom extends StatefulWidget {
  LinearColorBottom(this.bottomtext);
  String bottomtext;
  @override
  _LinearColorBottomState createState() => _LinearColorBottomState();
}

class _LinearColorBottomState extends State<LinearColorBottom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xff99cc73)),
        height: 50,
        width:150,
        child: Center(
          child: Text(
            widget.bottomtext,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class BuildTextField extends StatefulWidget {
  BuildTextField(this.prefixIcon, this.text, this.showsuffixIcon, this.fun,
      {this.showText = true});

  IconData prefixIcon;
  String text;
  bool showsuffixIcon;
  Color color = Colors.grey;
  bool showText;
  Function fun;
  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 6,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: TextField(
          onChanged: (String val) {
            widget.fun(val);
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: !widget.showText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide(
                  color: Color(0x00ffff),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Color(0x00ffff), width: 3.0)),
            hintText: widget.text,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                widget.prefixIcon,
                size: 30,
                color: Colors.grey,
              ),
            ),
            suffixIcon: widget.showsuffixIcon
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Icon(
                  Icons.visibility,
                  color: widget.color,
                ),
                onTap: () {
                  setState(() {
                    if (widget.color == Colors.grey) {
                      widget.color = Colors.blue;
                      widget.showText = true;
                    } else {
                      widget.color = Colors.grey;
                      widget.showText = false;
                    }
                  });
                },
              ),
            )
                : Container(
              height: 0,
              width: 0,
            ),
          ),
        ));
  }
}

class FooterText extends StatelessWidget {
  FooterText(this.question, this.action);
  String question;
  String action;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          action,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff99cc73),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
