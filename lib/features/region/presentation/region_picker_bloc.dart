import '../../../common/arch/bloc_controller.dart';
import '../domain/entity/region.dart';
import '../domain/usecase/get_regions_by_term.dart';
import 'region_picker_state.dart';

class RegionPickerBloc
    extends BlocController<RegionPickerState, RegionPickerAction> {
  RegionPickerBloc({
    required this.getAvailableRegions,
  }) : super(RegionPickerState.initial());

  final GetRegionsByTermUseCase getAvailableRegions;

  @override
  Future<void> load() async {
    final countries = await getAvailableRegions();
    setState(RegionPickerState(countries));
  }

  Future<void> getRegionByTerm(String term) async {
    final countries = await getAvailableRegions(term: term);
    setState(RegionPickerState(countries));
  }

  void select(Country country) {
    sendAction(RegionPickerAction.close(country));
  }

  void dismiss() {
    sendAction(RegionPickerAction.close());
  }
}
