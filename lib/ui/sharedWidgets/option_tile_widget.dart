import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/constants/theme.dart';
import 'package:flutter_assignment_filter/core/models/filter_data_model.dart';

class OptionTileWidget extends StatelessWidget {
  bool isSelected;
  Taxonomies option;
  Function(Taxonomies) onClick;
  String title;
  OptionTileWidget({
    required this.isSelected,
    required this.onClick,
    required this.option,
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick(option);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(width: 1.5,
                        color: isSelected ? CustomTheme.primaryColor : Colors.grey[600]!
                    )
                ),
                child:  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:  isSelected ? CustomTheme.primaryColor : Colors.white,
                    ),
                )
            ),
            SizedBox(width: 10),
            Expanded(child: Container(color: CustomTheme.backgroundWhite,child: Text(title,
            style: CustomTheme.textStyleTitle1,)))
          ],
        ),
      ),
    );
  }
}
