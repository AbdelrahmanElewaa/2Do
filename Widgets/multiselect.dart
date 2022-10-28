import 'package:todo/Data/TasksData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class multiselect extends StatefulWidget {
  const multiselect({Key? key}) : super(key: key);

  @override
  State<multiselect> createState() => multiselectState();
}

class multiselectState extends State<multiselect>{
  category selected=category.other;


  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: MultiSelectContainer(
        // listViewSettings: ListViewSettings(
        //
        // scrollDirection: Axis.horizontal,
        //
        // ),
        // controller: selected,
          // maxSelectableCount: 1,
itemsDecoration:
MultiSelectDecorations(
  selectedDecoration: ShapeDecoration(
    color: Colors.amber,
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
        decorationAimationDuration: Duration(milliseconds: 600),
        // decorationAnimationCurve: Curves.easeInSine,

      ),
//       highlightColor: Colors.brown,

singleSelectedItem: true,

          items: [


            MultiSelectCard(value: category.assignment, label: category.assignment.name,),
            MultiSelectCard(value :category.chore, label: category.chore.name),
            MultiSelectCard(value :category.groceries, label: category.groceries.name),
            MultiSelectCard(value :category.meeting, label: category.meeting.name),
            MultiSelectCard(value :category.music, label: category.music.name),
            MultiSelectCard(value :category.sport, label: category.sport.name),
            MultiSelectCard(value :category.other, label: category.other.name, selected: true)
          ],
          // onMaximumSelected: (allSelectedItems, selectedItem) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text("The limit has been reached")));
          // },
          onChange: (allSelectedItems, selectedItem) {

               selected= selectedItem;
               print(selected.runtimeType);
          }
      ),
    );

  }
}

