import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';

class Utils{

  static const String neighbourHoodSlug = 'location';
  static bool isNeighbourHood(FilterDataModel data){
    return data.slug == neighbourHoodSlug;
  }

  // static int getSelectedFilterOptionsNumber(Map<String, Taxonomies> selectedOptions, String optionSlug){
  //   if(selectedOptions.containsKey(optionSlug))
  //     return selectedOptions[optionSlug].
  //   return 1;
  // }
}