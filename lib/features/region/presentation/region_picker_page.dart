import 'package:flutter/material.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/ext/context.dart';
import 'package:zapfy/core/firebase.dart';
import 'package:zapfy/features/region/presentation/region_picker_controller.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

class RegionPicker extends StatefulWidget {
  const RegionPicker({Key? key, this.selected}) : super(key: key);

  final Region? selected;

  @override
  State<RegionPicker> createState() => _RegionPickerState();
}

class _RegionPickerState extends State<RegionPicker> {
  List<Region> _regions = [];
  final _ctrl = TextEditingController();
  late final RegionPickerController controller = inject();

  @override
  void initState() {
    initRegions();
    super.initState();
  }

  initRegions() async {
    _ctrl.addListener(() async {
      final regions = await controller.getRegionByTerm(_ctrl.text);
      setState(() => _regions = regions);
    });

    final regions = await controller.getAllRegions();
    setState(() => _regions = regions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.availableRegionsTitle),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: context.strings.availableRegionsSearch,
                border: const UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _ctrl.clear,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _regions.length,
                separatorBuilder: (_, i) => const Divider(height: 0),
                itemBuilder: (context, i) {
                  final region = _regions[i];
                  return _RegionListTile(
                    region: _regions[i],
                    onTap: (region) => Navigator.of(context).pop(region),
                    isSelected: widget.selected == region,
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

class _RegionListTile extends StatelessWidget {
  const _RegionListTile({
    Key? key,
    required this.region,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final Region region;
  final bool isSelected;
  final Function(Region) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      visualDensity: VisualDensity.standard,
      selected: isSelected,
      selectedColor: Colors.white,
      selectedTileColor: theme.colorScheme.primary,
      onTap: () {
        analytics.logButtonPressed('select_region', {
          'region_selected': region.name,
          'region_prefix': region.prefix.toString(),
        });
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
          Text(region.name),
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
