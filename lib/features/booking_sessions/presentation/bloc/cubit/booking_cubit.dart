import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/failure_messages.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/book_session_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/delete_session_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/get_all_sessions_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/get_instructor_data_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/constants/dropdown_type.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetInstructorsDataUseCase getInstructorsDataUseCase;
  final BookSessionUseCase bookSessionUseCase;
  final GetAllSessionsUseCase getAllSessionsUseCase;
  final DeleteSessionUseCase deleteSessionUseCase;

  BookingCubit({
    required this.getInstructorsDataUseCase,
    required this.bookSessionUseCase,
    required this.getAllSessionsUseCase,
    required this.deleteSessionUseCase,
  }) : super(BookingInitialState());

  static BookingCubit get(context) => BlocProvider.of(context);

  late String instructor;
  late String day;
  late String time;

  int firstIndex = 0;
  int secondIndex = 0;

  late InstructorEntity instructorData;
  late List<SessionsEntity> sessionsData;

  bool isLoading = false;

  void showLoadingScreen() {
    isLoading = true;
    emit(BookSessionLoadingState(isLoading: isLoading));
  }

  void hideLoadingScreen() {
    isLoading = false;
    emit(BookSessionLoadingState(isLoading: isLoading));
  }

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
      emit(const ChangeFirstIndexState(index: 0));
    } else if (instructor == 'Instructor 1') {
      firstIndex = 1;
      emit(const ChangeFirstIndexState(index: 1));
    } else if (instructor == 'Instructor 2') {
      firstIndex = 2;
      emit(const ChangeFirstIndexState(index: 2));
    } else if (instructor == 'Instructor 3') {
      firstIndex = 3;
      emit(const ChangeFirstIndexState(index: 3));
    }
  }

  void changeSecondIndex() {
    if (instructor == 'Instructor 3' && day == 'Saturday') {
      secondIndex = 1;
      emit(const ChangeSecondIndexState(index: 1));
    } else {
      secondIndex = 0;
      emit(const ChangeSecondIndexState(index: 0));
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

  void getInstructorData() {
    final data = getInstructorsDataUseCase.call();
    ///////
    instructor = data.instructors[0].name;
    day = data.instructors[0].availableDays[0];
    time = data.instructors[0].availableTimeRanges[0].time[0];
    firstIndex = 0;
    secondIndex = 0;
    ////////
    instructorData = data;
    emit(GetInstructorDataSuccessState(instructorData: data));
  }

  /// bookSession////////////
  Future<void> bookSession(SessionsEntity sessionsEntity) async {
    final failureOrBookSession = await bookSessionUseCase.call(sessionsEntity);
    failureOrBookSession.fold((failure) {
      emit(BookSessionErrorState(error: _mapFailureToMessage(failure)));
    }, (res) {
      emit(BookSessionSuccessState(res: res));
    });
  }

  ///getAllSessions////
  Future<void> getAllSessions() async {
    emit(GetDataLoadingState());
    final data = await getAllSessionsUseCase.call();
    ///////
    sessionsData = data;
    emit(GetAllSessionSuccessState(res: data));
  }

  /// delete Session////////////
  Future<void> deleteSession(int id) async {
    final failureOrDeleteSession = await deleteSessionUseCase.call(id);
    failureOrDeleteSession.fold((failure) {
      emit(DeleteSessionErrorState(error: _mapFailureToMessage(failure)));
    }, (res) {
      emit(DeleteSessionSuccessState());
    });
  }

  //////////////////////////////
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case WrongDataFailure:
        return FailureMessages.wrongDataFailureMessage;
      case InfoAlreadyExistsFailure:
        return FailureMessages.infoAlreadyExistsMessage;
      case UnExpectedFailure:
        return FailureMessages.unExpectedFailureMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
