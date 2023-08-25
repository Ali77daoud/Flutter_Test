import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/constants/dropdown_type.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/test_data.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitialState());

  static BookingCubit get(context) => BlocProvider.of(context);

  String instructor = instructorData.instructors[0].name;
  String day = instructorData.instructors[0].availableDays[0];
  String time = instructorData.instructors[0].availableTimeRanges[0].time[0];

  int firstIndex = 0;

  void chooseValueFromDropDown(DropDownType type, String value) {
    switch (type) {
      case DropDownType.instructor:
        instructor = value;
        emit(ChooseValueFromDropDownState(value: instructor, type: type));
        break;
      case DropDownType.day:
        day = value;
        emit(ChooseValueFromDropDownState(value: day, type: type));
        break;
      case DropDownType.time:
        time = value;
        emit(ChooseValueFromDropDownState(value: time, type: type));
        break;
    }
  }

  void changeFirstIndex() {
    if (instructor == '') {
      firstIndex = 0;
      emit(const ChangeIndexState(index: 0));
    } else if (instructor == 'Instructor 1') {
      firstIndex = 1;
      emit(const ChangeIndexState(index: 1));
    } else if (instructor == 'Instructor 2') {
      firstIndex = 2;
      emit(const ChangeIndexState(index: 2));
    } else if (instructor == 'Instructor 3') {
      firstIndex = 3;
      emit(const ChangeIndexState(index: 3));
    }
  }

  void resetDayValue() {
    day = instructorData.instructors[firstIndex].availableDays[0];

    emit(RestetDayValueState());
  }

  void resetTimeValue() {
    time =
        instructorData.instructors[firstIndex].availableTimeRanges[0].time[0];

    emit(RestetTimeValueState());
  }
  // final LoginUseCase loginUseCase;
  // final SignUpUseCase signUpUseCase;

  // AuthCubit({required this.loginUseCase, required this.signUpUseCase})
  //     : super(AuthInitialState());

  // static AuthCubit get(context) => BlocProvider.of(context);
  // bool isLoading = false;

  // void showLoadingScreen() {
  //   isLoading = true;
  //   emit(LoginLoadingState(isLoading: isLoading));
  // }

  // void hideLoadingScreen() {
  //   isLoading = false;
  //   emit(LoginLoadingState(isLoading: isLoading));
  // }

  // /// login
  // Future<void> login(UserEntity userEntity) async {
  //   final failureOrLogin = await loginUseCase.call(userEntity);
  //   failureOrLogin.fold((failure) {
  //     emit(LoginErrorState(error: _mapFailureToMessage(failure)));
  //   }, (login) {
  //     /////////////
  //     emit(LoginSuccessState(userEntity: login));
  //   });
  // }

  // /// signup
  // Future<void> signup(UserEntity userEntity) async {
  //   final failureOrSignup = await signUpUseCase.call(userEntity);
  //   failureOrSignup.fold((failure) {
  //     emit(SignUpErrorState(error: _mapFailureToMessage(failure)));
  //   }, (res) {
  //     emit(SignUpSuccessState(res: res));
  //   });
  // }

  // ////////////////////////////
  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case WrongDataFailure:
  //       return FailureMessages.wrongDataFailureMessage;
  //     case UnExpectedFailure:
  //       return FailureMessages.unExpectedFailureMessage;
  //     default:
  //       return " Unexpected error,Please try again later.";
  //   }
  // }
}
