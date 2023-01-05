import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'domain/usecase/app_review.dart';
import 'domain/usecase/get_top_banner.dart';
import 'presentation/home_bloc.dart';
import 'presentation/home_controller.dart';

void homeModule() {
  registerFactory<HomeBloc>(
    () => HomeBloc(
      phoneFieldComponent: get(),
      savePhoneNumberHistory: get(),
    ),
  );

  registerFactory(
    () => HomeController(
      getTopBanner: get(),
      setLastAppReviewAtNow: get(),
    ),
  );

  registerFactory(
    () => GetTopBannerUseCase(
      canAskForReview: get(),
    ),
  );

  registerFactory(
    () => CanAskForReview(),
  );

  registerFactory(
    () => SetLastAppReviewAtNow(),
  );
}
