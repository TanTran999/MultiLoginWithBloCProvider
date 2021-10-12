import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? imgPath;
  final String label;
  final Function()? onPress;
  const LoginButton({
    this.onPress,
    this.imgPath,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Image(
              image: AssetImage(imgPath ?? "images/guest.png"),
              height: 30,
            ),
            Flexible(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: 0,
              child: Image(
                image: AssetImage(imgPath ?? "images/guest.png"),
                height: 30,
              ),
            ),
          ],
        ),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white30,
              spreadRadius: 2,
              offset: Offset.fromDirection(1, 3),
            )
          ],
        ),
      ),
    );
  }
}

class GuestButton extends LoginButton {
  final Function()? onPress;
  final String label;
  GuestButton({required this.label, this.onPress})
      : super(label: label, onPress: onPress);
}
