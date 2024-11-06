import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/domain/usecases/save_user_info_usecase.dart';
import 'package:royal_class_flutter_test/features/sign_up/domain/usecases/continue_as_guest_usecase.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  final ContinueAsGuestUseCase continueAsGuestUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  final InputValidators inputValidators;

  SignUpBloc(
      {required this.signUpUseCase,
      required this.saveUserInfoUseCase,
      required this.continueAsGuestUseCase,
      required this.inputValidators})
      : super(SignUpState.initial());

  onEmailChanged(String val) {
    add(EmailChanging(val));
  }

  onPasswordChanged(String val) {
    add(PasswordChanging(val));
  }

  onConfirmPasswordChanged(String val) {
    add(ConfirmPasswordChanging(val));
  }

  onPhoneNumberChanged(String val) {
    add(PhoneNumberChanging(val));
  }

  onPasswordObscureChanged() {
    add(PasswordObscureChanging(!state.isPasswordObscured));
  }

  onConfirmPasswordObscureChanged() {
    add(ConfirmPasswordObscureChanging(!state.isConfirmPasswordObscured));
  }

  onSignUpSubmit() {
    add(SigningUp());
  }

  onContinueAsGuest() {
    add(ContinueAsGuest());
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is EmailChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.email = event.val
          ..errorEmailValidation = false,
      );
    } else if (event is PasswordChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.password = event.val
          ..errorPasswordValidation = false,
      );
    } else if (event is ConfirmPasswordChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.confirmPassword = event.val
          ..errorConfirmPasswordValidation = false,
      );
    } else if (event is PhoneNumberChanging) {
      yield state.rebuild(
        (b) => b
          ..signUpParams!.phoneNumber = event.val
          ..errorPhoneNumberValidation = false,
      );
    } else if (event is SigningUp) {
      yield* mapToSigningUpUser(event);
    } else if (event is PasswordObscureChanging) {
      yield state.rebuild((b) => b..isPasswordObscured = event.isSecure);
    } else if (event is ConfirmPasswordObscureChanging) {
      yield state.rebuild((b) => b..isConfirmPasswordObscured = event.isSecure);
    } else if (event is ContinueAsGuest) {
      yield* continueAsGuest();
    }
  }

  Stream<SignUpState> continueAsGuest() async* {
    /// If we need to make the validation on the parameters.
    ///
    /// We make validation depending on the `inputValidators` object
    /// so we can use it anywhere in the project and make the validation as
    /// generic (once we modified it in one place then it'll be modified in all
    /// places...
    yield state.rebuild(
      (b) => b
        ..isSigningUp = true
        ..errorInSigningUp = false
        ..userSignedUp = false,
    );
    final result = await continueAsGuestUseCase(
        ContinueAsGuestParams("phone number should be replaced here.."));
    yield* result.fold(
      (l) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = true
            ..userSignedUp = false,
        );
      },
      (r) async* {
        final result = await saveUserInfoUseCase(r);
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = false
            ..userSignedUp = true,
        );
      },
    );
  }

  Stream<SignUpState> mapToSigningUpUser(SigningUp event) async* {
    /// If we need to make the validation on the parameters.
    ///
    /// We make validation depending on the `inputValidators` object
    /// so we can use it anywhere in the project and make the validation as
    /// generic (once we modified it in one place then it'll be modified in all
    /// places...

    print("sss = ${state.signUpParams.toString()}");
    if (state.signUpParams.email.isEmpty ||
        !inputValidators.validateEmailInput(state.signUpParams.email)) {
      yield state.rebuild(
        (b) => b..errorEmailValidation = true,
      );
    } else if (state.signUpParams.password.isEmpty ||
        inputValidators.validatePasswordInput(state.signUpParams.password)) {
      yield state.rebuild(
        (b) => b..errorPasswordValidation = true,
      );
    } else if (state.signUpParams.password !=
        state.signUpParams.confirmPassword) {
      yield state.rebuild((b) => b..errorConfirmPasswordValidation);
    } else if (state.signUpParams.phoneNumber.isEmpty ||
        state.signUpParams.phoneNumber.trim().length < 10) {
      yield state.rebuild(
        (b) => b..errorPhoneNumberValidation = true,
      );
    } else {
      yield* signUp(event);
    }
    // yield* signUp(event);
  }

  Stream<SignUpState> signUp(SigningUp event) async* {
    yield state.rebuild(
      (b) => b
        ..isSigningUp = true
        ..errorInSigningUp = false
        ..userSignedUp = false,
    );
    final result = await signUpUseCase(state.signUpParams);
    yield* result.fold(
      (l) async* {
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = true
            ..userSignedUp = false,
        );
      },
      (r) async* {
        final result = await saveUserInfoUseCase(r);
        yield state.rebuild(
          (b) => b
            ..isSigningUp = false
            ..errorInSigningUp = false
            ..userSignedUp = true,
        );
      },
    );
  }
}
