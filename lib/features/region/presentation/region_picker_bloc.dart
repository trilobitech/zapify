import 'package:analytics/analytics.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/region.dart';
import '../domain/usecase/get_regions_by_term.dart';
import 'region_picker_state.dart';

class RegionPickerBloc
    extends StateActionBloc<RegionPickerState, RegionPickerAction> {
  RegionPickerBloc({
    required this.getAvailableRegions,
  }) : super(RegionPickerState.initial());

  final GetRegionsByTermUseCase getAvailableRegions;

  @override
  Future<void> load() async {
    final countries = await getAvailableRegions();
    setState(RegionPickerState(countries));
  }

  void fetchRegionsByTerm(String term) async {
    final countries = await getAvailableRegions(term: term);
    setState(RegionPickerState(countries));
  }

  void select(Country country) {
    analytics.itemSelected(
      'region',
      properties: {
        'region_selected': country.name,
        'region_prefix': country.prefix.toString(),
      },
    );
    sendAction(RegionPickerAction.close(country));
  }

  void dismiss() {
    sendAction(RegionPickerAction.close());
  }
}
