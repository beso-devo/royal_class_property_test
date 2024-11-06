import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/features/main_page/domain/usecases/get_beneficiaries_usecase.dart';
import '../../../../core/domain/usecases/get_user_info_usecase.dart';
import 'main_page_event.dart';
import 'main_page_state.dart';

@Injectable()
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final GetBeneficiariesUseCase getBeneficiariesUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  MainPageBloc(
    this.getBeneficiariesUseCase,
    this.getUserInfoUseCase,
  ) : super(MainPageState.initial());

  onPageChanged(int index) {
    add(PageChanged(index));
  }

  @override
  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    if (event is PageChanged) {
      yield state.rebuild((p) => p..currentPageIndex = event.index);
    }
  }
}
