import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/constants/enums.dart';
import 'package:flutter_assignment_filter/constants/theme.dart';
import 'package:flutter_assignment_filter/core/viewmodel/filter_options_viewmodel.dart';
import 'package:flutter_assignment_filter/ui/sharedWidgets/primary_button.dart';
import 'package:flutter_assignment_filter/ui/views/filer_options_view/widgets/filter_options_widget.dart';
import 'package:flutter_assignment_filter/ui/views/filer_options_view/widgets/selectedFilterOptionsWidget.dart';
import 'package:flutter_assignment_filter/ui/views/filer_options_view/widgets/sort_by_options_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/models/filter_data_model.dart';

class FilterOptionsView extends StatefulWidget {
  const FilterOptionsView({Key? key}) : super(key: key);

  @override
  State<FilterOptionsView> createState() => _FilterOptionsViewState();
}

class _FilterOptionsViewState extends State<FilterOptionsView> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) =>
        Provider.of<FilterOptionsViewModel>(context,listen: false).loadData()
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: PrimaryButton(onPressed: (){}, title: "SHOW RESULTS"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text("Filter Options",style: CustomTheme.textStyleHeading1,),
        ),
      ),
      body:  Consumer<FilterOptionsViewModel>(
        builder: (context, provider, child) {
          if(provider.viewState == ViewState.LOADING){
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Container(
              padding: normalScreenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SelectedFilterOptionsWidget(
                      selectedOptions: provider.selectedFilterOptions,
                      onClick: (Taxonomies val) => provider.updateSelectedFilterOption(val),
                  ),
                  SizedBox(height: 10),
                  SortByOptionsWidget(
                    key: UniqueKey(),
                    sortByOptions: provider.sortByOptions,
                    selectedSortByOption: provider.selectedSortByOption,
                    onSelectingOption: (Taxonomies val ) => provider.updateSelectedSortByOption(val)),


                  Column(
                    children: provider.filterOptions.map((filterData) =>
                      FilterOptionsWidget(
                          filterOptions: filterData,
                          selectedFilterOptions: provider.selectedFilterOptions,
                          selectedOptionCount: provider.getSelectedFilterOptionsBasedOnCategory(filterData.slug!),
                          onSelectingOption: (selectedFilterOption){
                            provider.updateSelectedFilterOption(selectedFilterOption);
                          })
                    ).toList(),
                  ),

                  const SizedBox(height: 80,)

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
