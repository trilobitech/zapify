import 'dart:async';

import 'package:bloc_plus/bloc_plus.dart';
import 'package:flutter/material.dart';

import '../../../common/di/inject.dart';
import '../../../common/ext/context.dart';
import '../domain/entity/region.dart';
import 'region_picker_bloc.dart';
import 'region_picker_state.dart';

class RegionPicker extends StatelessWidget
    with
        StateActionMixin<RegionPickerBloc, RegionPickerState,
            RegionPickerAction> {
  RegionPicker({super.key, this.selected});

  @override
  late final bloc = inject<RegionPickerBloc>();
  final RegionCode? selected;

  @override
  Widget buildState(
    BuildContext context,
    RegionPickerState state,
  ) =>
      state.when(
        (countries) => _SuccessView(countries: countries, selected: selected),
        initial: () => Container(),
      );

  @override
  FutureOr<void> handleAction(
    BuildContext context,
    RegionPickerAction action,
  ) =>
      action.when(close: (country) => Navigator.of(context).pop(country));
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({
    required this.countries,
    required this.selected,
  });

  final List<Country> countries;
  final RegionCode? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.availableRegionsTitle),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            const _SearchView(),
            Expanded(
              child: ListView.separated(
                itemCount: countries.length,
                separatorBuilder: (_, i) => const Divider(height: 0),
                itemBuilder: (context, i) {
                  final region = countries[i];
                  return _RegionListTile(
                    region: countries[i],
                    onTap: (country) =>
                        context.read<RegionPickerBloc>().select(country),
                    isSelected: selected == region.code,
                  );
                },
              ),
            ),
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
  late final bloc = context.read<RegionPickerBloc>();
  late final ctrl = TextEditingController();

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
    return TextField(
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
    );
  }

  void searchTerm() {
    bloc.getRegionByTerm(ctrl.text);
  }
}

class _RegionListTile extends StatelessWidget {
  const _RegionListTile({
    Key? key,
    required this.region,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

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
      title: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 50,
            ),
            child: Text(
              region.flag ?? '',
              style: const TextStyle(fontSize: 28),
            ),
          ),
          Text('${region.name} (${region.code})'),
          const Spacer(),
          Text(
            '+${region.prefix}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
