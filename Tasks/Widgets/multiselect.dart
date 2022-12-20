import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class multiselect extends StatefulWidget {
  const multiselect({Key? key}) : super(key: key);

  @override
  State<multiselect> createState() => multiselectState();
}

class multiselectState extends State<multiselect>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: MultiSelectContainer(
          itemsDecoration:
          MultiSelectDecorations(
            selectedDecoration: ShapeDecoration(
              color: Colors.blue,
              shape:
              ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            decoration: ShapeDecoration(
              color: Color.fromRGBO(47, 44, 47, 0.1450980392156863),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),

          animations: MultiSelectAnimations(
            decorationAimationDuration: Duration(milliseconds: 800),
            decorationAnimationCurve: standardEasing.flipped,

          ),
          // highlightColor: Colors.brown,
          singleSelectedItem: true,

          items: [
            MultiSelectCard(value: category.assignment, label: category.assignment.name),
            MultiSelectCard(value :category.chore, label: category.chore.name),
            MultiSelectCard(value :category.groceries, label: category.groceries.name),
            MultiSelectCard(value :category.meeting, label: category.meeting.name),
            MultiSelectCard(value :category.music, label: category.music.name),
            MultiSelectCard(value :category.sport, label: category.sport.name),
            MultiSelectCard(value :category.other, label: category.other.name, selected: true)
            // selected: true
          ],
          onChange: (allSelectedItems, selectedItem) {
            selected= selectedItem;
          }
      ),
    );

  }
}

