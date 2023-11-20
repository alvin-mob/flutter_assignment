import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment_filter/constants/enums.dart';
import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';
import 'package:flutter_assignment_filter/core/services/filter_options_services.dart';
import 'package:flutter_assignment_filter/utils/utils.dart';

class FilterOptionsViewModel with ChangeNotifier{

  final FilterOptionServices _services = FilterOptionServices();
   List<FilterDataModel>_filterData = [];
   ViewState _viewState = ViewState.LOADING;
   get viewState => _viewState;

   List<FilterDataModel> _filterOptions = [];
   late FilterDataModel _sortByOptions;
   late Taxonomies _selectedSortByOption;
   Map<String,Taxonomies> _selectedFilterOptions = {};
   Map<String, List<String>> _filterOptionsMap = {};

   FilterDataModel get sortByOptions => _sortByOptions;
   List<FilterDataModel> get filterOptions => _filterOptions;
   Taxonomies get selectedSortByOption => _selectedSortByOption;
   Map<String,Taxonomies> get selectedFilterOptions => _selectedFilterOptions;

   _updateViewState(value){
     _viewState = value;
     notifyListeners();
   }
  loadData()async{
     _updateViewState(ViewState.LOADING);
     _filterData = await _services.loadData();
     _setInitialData();
     _updateViewState(ViewState.COMPLETE);
  }


  _setInitialData(){
    _filterData.forEach((data) {
      if(data.slug == "sort"){
        _sortByOptions = data;
      }else{
        _filterOptions.add(data);
        _updateFilterOptionsMap(data);
      }
    });
    updateSelectedSortByOption(_sortByOptions.taxonomies![0]);
  }

  _updateFilterOptionsMap(FilterDataModel data){
       if(Utils.isNeighbourHood(data)){
         _filterOptionsMap.putIfAbsent(data.slug!, () => data.taxonomies![0].locations!.map((e) => e.slug.toString()).toList());
       }else {
         _filterOptionsMap.putIfAbsent(data.slug!, () => data.taxonomies!.map((e) => e.slug.toString()).toList());
       }
  }

  updateSelectedSortByOption(Taxonomies data){
       _selectedSortByOption = data;
       notifyListeners();
  }

  updateSelectedFilterOption(Taxonomies data){
     if(_selectedFilterOptions.keys.contains(data.slug)){
       _selectedFilterOptions.remove(data.slug);
     }else{
       _selectedFilterOptions.putIfAbsent(data.slug!, () => data);
     }
     notifyListeners();
  }


  int getSelectedFilterOptionsBasedOnCategory(String optionSlug){
     List<String> taxonomies = _filterOptionsMap[optionSlug]!;
     int count = 0;
    _selectedFilterOptions.keys.forEach((element) {
      if(taxonomies.contains(element)){
        count++;
      }
    });
     return count;
  }


}