import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/constants/theme.dart';

import '../../../../core/models/filter_data_model.dart';

class SelectedFilterOptionsWidget extends StatelessWidget {
  final Map<String, Taxonomies> selectedOptions;
  final Function(Taxonomies) onClick;
  const SelectedFilterOptionsWidget({
    required this.selectedOptions,
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: selectedOptions.keys.map((e) => GestureDetector(
          onTap: ()=> onClick(selectedOptions[e]!),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),

              child: Text("X  ${selectedOptions[e]!.name}",
              style: CustomTheme.textStyleTitle2,)),
        )).toList() ,
      ),
    );
  }
}
