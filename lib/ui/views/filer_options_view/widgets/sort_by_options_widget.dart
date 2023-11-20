import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/constants/theme.dart';
import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';
import 'package:flutter_assignment_filter/ui/sharedWidgets/option_tile_widget.dart';

class SortByOptionsWidget extends StatelessWidget {
  final FilterDataModel sortByOptions;
  final Taxonomies selectedSortByOption;
  final Function(Taxonomies) onSelectingOption;
  const SortByOptionsWidget({
    required this.sortByOptions,
    required this.selectedSortByOption,
    required this.onSelectingOption,
    Key? key
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(normalBorderRadiusSize),
        color: CustomTheme.backgroundWhite
      ),
      padding: normalWidgetPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sortByOptions.name!, style: CustomTheme.textStyleHeading2,),
          SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              itemCount: sortByOptions.taxonomies!.length,
              itemBuilder: (context, index){
                return OptionTileWidget(
                  key: UniqueKey(),
                  title: sortByOptions.taxonomies![index].name!,
                  isSelected: selectedSortByOption.slug == sortByOptions.taxonomies![index].slug,
                  onClick: (Taxonomies val) {
                    onSelectingOption(val);
                  },
                  option: sortByOptions.taxonomies![index]);
              }),
        ],
      ),
    );
  }
}
