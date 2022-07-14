import 'package:flutter/material.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/region/presentation/region_picker_controller.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

class RegionPicker extends StatefulWidget {
  const RegionPicker({Key? key, this.selected}) : super(key: key);

  final Region? selected;

  @override
  _RegionPickerState createState() => _RegionPickerState();
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
      appBar: AppBar(title: const Text("Available regions")),
      body: Scrollbar(
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Search...',
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
                  return InkWell(
                    onTap: () => Navigator.of(context).pop(region),
                    child: _RegionListTile(
                      region: region,
                      isSelected: widget.selected == region,
                    ),
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
    required Region region,
    this.isSelected = false,
  })  : _region = region,
        super(key: key);

  final Region _region;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      visualDensity: VisualDensity.standard,
      selected: isSelected,
      selectedColor: Colors.white,
      selectedTileColor: theme.colorScheme.primary,
      title: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              _region.flag ?? '',
            ),
          ),
          Text(_region.name),
          const Spacer(),
          Text(
            '+${_region.prefix}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}