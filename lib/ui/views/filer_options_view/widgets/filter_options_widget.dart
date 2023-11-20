import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';
import 'package:flutter_assignment_filter/ui/sharedWidgets/option_tile_widget.dart';
import 'package:flutter_assignment_filter/utils/utils.dart';

import '../../../../constants/theme.dart';

class FilterOptionsWidget extends StatelessWidget {
  final FilterDataModel filterOptions;
  final Map<String, Taxonomies> selectedFilterOptions;
  final Function(Taxonomies) onSelectingOption;
  final int selectedOptionCount;
  const FilterOptionsWidget({
    required this.filterOptions,
    required this.selectedFilterOptions,
    required this.onSelectingOption,
    required this.selectedOptionCount,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(normalBorderRadiusSize),
          color: Colors.white
      ),
      padding: normalWidgetPadding,
      child:Theme(
          data: ThemeData(visualDensity: VisualDensity(vertical: -4),dividerColor: Colors.transparent),
          child: ListTileTheme(
              data: ListTileThemeData(
                dense: true,
              ),
              child:  Builder(
                builder: (context) {
                  if(Utils.isNeighbourHood(filterOptions)){
                    return ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text(filterOptions.name! +
                          (selectedOptionCount > 0 ? " ($selectedOptionCount)":"")
                          ,style :CustomTheme.textStyleHeading2),
                      children: filterOptions.taxonomies![0].locations!.map((data) {
                        return  OptionTileWidget(
                            isSelected: selectedFilterOptions.containsKey(data.slug),
                            onClick: (Taxonomies val)=> onSelectingOption(val),
                            option: Taxonomies.fromJson(data.toJson()),
                            title: "${data.name}");
                      }).toList(),
                    );
                  }
                  return ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(filterOptions.name! +
                           (selectedOptionCount > 0 ? " ($selectedOptionCount)":"")
                        ,style :CustomTheme.textStyleHeading2),
                    children: filterOptions.taxonomies!.map((data) {
                      return  OptionTileWidget(
                          isSelected: selectedFilterOptions.containsKey(data.slug),
                          onClick: (Taxonomies val)=> onSelectingOption(val),
                          option: data,
                          title: "${data.name}");
                    }).toList(),
                  );
                }
              )
          )),


      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     ListView.builder(
      //         shrinkWrap: true,
      //         physics: NeverScrollableScrollPhysics(),
      //         itemCount: filterOptions.taxonomies!.length,
      //         itemBuilder: (context, index){
      //           return Text('${filterOptions.taxonomies![index].name}');
      //           //   Container(
      //           //   margin: EdgeInsets.symmetric(vertical: 5.0),
      //           //   child: ExpansionTile(
      //           //       title: Text(filterOptions.name!),
      //           //   children: filterOptions.taxonomies!.map((data) {
      //           //   return ListTile(title: Text(data.name!));
      //           //   }).toList(),
      //           //   ),
      //           // );
      //         })
      //   ],
      // ),
    );
  }
}
