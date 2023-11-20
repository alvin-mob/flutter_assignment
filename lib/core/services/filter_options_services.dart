import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';

class FilterOptionServices{



 Future<List<FilterDataModel>> loadData() async{
    final String jsonString = await rootBundle.loadString('assets/data/filterData.json');
    var jsonData = jsonDecode(jsonString);
    List<FilterDataModel> data = <FilterDataModel>[];
    if(jsonData != null){
      jsonData['data'].forEach((v){
        data.add(FilterDataModel.fromJson(v));
      });
    }
    return data;
  }
}