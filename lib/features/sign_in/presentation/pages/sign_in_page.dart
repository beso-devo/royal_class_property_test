import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_class_flutter_test/core/util/generate_screen.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with FlushBarMixin {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _bloc = getIt<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, SignInState state) {
        if (state.userSignedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, GeneralScreens.MAIN_PAGE, (route) => false);
        }
        if (state.errorSignIn) {
          exceptionFlushBar(
              title: "Error!",
              context: context,
              message: "The account is not exists!",
              duration: const Duration(milliseconds: 1750),
              onChangeStatus: (status) {},
              onHidden: () {
                _bloc.onClear();
              });
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, SignInState state) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: AppBar(
                    backgroundColor: const Color(0xffF8F7F7),
                    elevation: 0.0,
                  )),
              body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  bool isPortrait =
                      orientation.toString() == 'Orientation.portrait';
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: headerLogin(),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  formLogin(state),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  // createAnAccount()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              headerLogin(),
                              const SizedBox(
                                height: 50.0,
                              ),
                              formLogin(state),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ));
        },
      ),
    );
  }

  Widget headerLogin() {
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
  }

  Widget formLogin(SignInState state) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Email",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onChangedUserName,
            controller: emailController,
            showError: state.errorUserNameValidation,
            errorText: "Invalid input!",
            prefixIcon: const Icon(
              Icons.email,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Password",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onChangedPassword,
            controller: passwordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isSecureText,
            suffixIcon: GestureDetector(
              onTap: _bloc.onObscureChanged,
              child: Icon(
                state.isSecureText
                    ? Icons.remove_red_eye
                    : Icons.panorama_fish_eye,
                color: DARK_OFF_FONT,
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            color: WHITE,
            child: SubmitButtonWidget(
              color: MAIN1,
              title: "Submit",
              onTap: _bloc.onSignInSubmit,
              isLoading: state.isSigningIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget createAnAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You don’t have an account?" + " ",
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 16.0),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: MAIN1, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
