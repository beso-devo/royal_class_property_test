import 'package:flutter/material.dart';
import '../../../../core/util/colors.dart';

class HeaderSignUpWidget extends StatelessWidget {
  final bool withBackBtn;

  const HeaderSignUpWidget({super.key, this.withBackBtn = false});

  @override
  Widget build(BuildContext context) {
    return main(context);
  }

  Widget main(BuildContext context) {
    if (withBackBtn) {
      return Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'assets/images/waving-hand.png',
                    width: 30.0,
                  )
                ],
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: TEXT_FIELD_COLOR),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "I am happy to see you again. You can check your subscribe requests to your company after sign in.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Welcome to Royal Class",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              Image.asset(
                'assets/images/waving-hand.png',
                width: 30.0,
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Hello, I guess you are new around here. You can start using the application after sign up.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
            ),
          )
        ],
      );
    }
  }
}
