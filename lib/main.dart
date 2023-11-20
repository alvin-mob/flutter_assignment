import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/core/viewmodel/filter_options_viewmodel.dart';
import 'package:flutter_assignment_filter/ui/views/filer_options_view/filter_options_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlutterAssignmentFilterApp());
}

class FlutterAssignmentFilterApp extends StatelessWidget {
  const FlutterAssignmentFilterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterOptionsViewModel>(create: (context)=>FilterOptionsViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Assignment Filter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FilterOptionsView(),
      ),
    );
  }
}


