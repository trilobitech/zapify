import 'package:analytics/analytics.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/region.dart';
import '../domain/usecase/get_regions_by_term.dart';
import 'region_picker_state.dart';

class RegionPickerBloc extends StateActionBloc<RegionPickerState, RegionPickerAction> {
  RegionPickerBloc({required GetRegionsByTermUseCase getAvailableRegions, required IAnalytics analytics})
    : _getAvailableRegions = getAvailableRegions,
      _analytics = analytics,
      super(RegionPickerState(countries: List.generate(20, (_) => ShimmerCountry())));

  final GetRegionsByTermUseCase _getAvailableRegions;
  final IAnalytics _analytics;

  @override
  Future<void> load() async {
    final countries = await _getAvailableRegions();
    setState(RegionPickerState(countries: countries));
  }

  void fetchRegionsByTerm(String term) async {
    final countries = await _getAvailableRegions(term: term);
    setState(RegionPickerState(countries: countries));
  }

  void select(Country country) {
    _analytics.itemSelected(
      'region',
      properties: {'region_selected': country.name, 'region_prefix': country.prefix.toString()},
    );
    sendAction(RegionPickerAction.close(country));
  }

  void dismiss() {
    sendAction(RegionPickerAction.close());
  }
}
