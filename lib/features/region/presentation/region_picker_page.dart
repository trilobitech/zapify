import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../common/di/provider.dart';
import '../../../common/ext/context.dart';
import '../../../common/widgets/shimmer_view.dart';
import '../domain/entity/region.dart';
import 'region_picker_bloc.dart';
import 'region_picker_state.dart';

typedef _RegionPickerBlocMixin =
    StateActionMixin<RegionPickerBloc, RegionPickerState, RegionPickerAction>;

class RegionPicker extends StatelessWidget {
  const RegionPicker({super.key, this.selected});

  final RegionCode? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.strings.availableRegionsTitle)),
      body: DiProvider<RegionPickerBloc>(
        child: Column(
          children: [
            const _SearchView(),
            Expanded(child: _RegionList(selected: selected)),
          ],
        ),
      ),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  late final ctrl = TextEditingController();

  RegionPickerBloc get _bloc => context.read<RegionPickerBloc>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(searchTerm);
  }

  @override
  void dispose() {
    ctrl.removeListener(searchTerm);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Semantics(
        identifier: 'RegionSearchField',
        child: TextField(
          controller: ctrl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: context.strings.availableRegionsSearch,
            border: const UnderlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: ctrl.clear,
            ),
          ),
        ),
      ),
    );
  }

  void searchTerm() {
    _bloc.fetchRegionsByTerm(ctrl.text);
  }
}

class _RegionList extends StatelessWidget with _RegionPickerBlocMixin {
  const _RegionList({required this.selected});

  final RegionCode? selected;

  @override
  Widget buildState(BuildContext context, RegionPickerState state) {
    final countries = state.countries;
    return ListView.separated(
      itemCount: countries.length,
      separatorBuilder: (_, __) => const Divider(height: 0),
      itemBuilder: (context, i) {
        final region = countries[i];
        final tile = _RegionListTile(
          region: region,
          onTap: (country) => context.read<RegionPickerBloc>().select(country),
          isSelected: selected == region.code,
        );

        if (region is ShimmerCountry) return ShimmerView(child: tile);
        return tile;
      },
    );
  }

  @override
  void handleAction(
    BuildContext context,
    RegionPickerAction action,
  ) => switch (action) {
    CloseRegionPickerAction(:final region) => Navigator.of(context).pop(region),
  };
}

class _RegionListTile extends StatelessWidget {
  const _RegionListTile({
    required this.region,
    required this.onTap,
    this.isSelected = false,
  });

  final Country region;
  final bool isSelected;
  final Function(Country) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      visualDensity: VisualDensity.standard,
      selected: isSelected,
      selectedColor: Colors.white,
      selectedTileColor: theme.colorScheme.primary,
      onTap: () {
        onTap(region);
      },
      title: Semantics(
        identifier: '${region.code} +${region.prefix}',
        label: '${region.name} +${region.prefix}',
        button: true,
        child: ExcludeSemantics(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 50),
                child: Text(
                  region.flag ?? '',
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              Expanded(
                child: Text(region.name, overflow: TextOverflow.ellipsis),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '+${region.prefix}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
