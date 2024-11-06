import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:royal_class_flutter_test/core/util/colors.dart';

class SubmitButtonWidget extends StatelessWidget {
  final Color color;
  final bool isLoading;
  final String title;
  final Function onTap;

  SubmitButtonWidget(
      {required this.color,
      required this.isLoading,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: isLoading
              ? SpinKitThreeBounce(
                  color: WHITE,
                  size: 17.0,
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
