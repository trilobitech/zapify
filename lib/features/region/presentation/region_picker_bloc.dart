import '../../../common/arch/bloc_controller.dart';
import '../domain/entity/region.dart';
import '../domain/usecase/get_regions_by_term.dart';
import 'region_picker_state.dart';

class RegionPickerBloc
    extends BlocController<RegionPickerEvent, RegionPickerState> {
  RegionPickerBloc({
    required this.getAvailableRegions,
  }) : super(RegionPickerState.initial());

  final GetRegionsByTermUseCase getAvailableRegions;

  @override
  Future<void> load() async {
    final countries = await getAvailableRegions();
    emit(RegionPickerState(countries));
  }

  Future<void> getRegionByTerm(String term) async {
    final countries = await getAvailableRegions(term: term);
    emit(RegionPickerState(countries));
  }

  void select(Country country) {
    event(RegionPickerEvent.close(country));
  }

  void dismiss() {
    event(RegionPickerEvent.close());
  }
}
