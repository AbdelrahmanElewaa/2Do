import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class multiselectobj extends StatefulWidget {
  const multiselectobj({Key? key}) : super(key: key);

  @override
  State<multiselectobj> createState() => multiselectobjState();
}

class multiselectobjState extends State<multiselectobj> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiSelectContainer(
          itemsDecoration: MultiSelectDecorations(
            selectedDecoration: ShapeDecoration(
              color: Colors.blue,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            decoration: ShapeDecoration(
              color: Theme.of(context).secondaryHeaderColor,
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
            MultiSelectCard(
                value: category.assignment,
                label: category.assignment.name,
                selected: category.assignment == selected ? true : false),
            MultiSelectCard(
                value: category.chore,
                label: category.chore.name,
                selected: category.chore == selected ? true : false),
            MultiSelectCard(
                value: category.groceries,
                label: category.groceries.name,
                selected: category.groceries == selected ? true : false),
            MultiSelectCard(
                value: category.meeting,
                label: category.meeting.name,
                selected: category.meeting == selected ? true : false),
            MultiSelectCard(
                value: category.music,
                label: category.music.name,
                selected: category.music == selected ? true : false),
            MultiSelectCard(
                value: category.sport,
                label: category.sport.name,
                selected: category.sport == selected ? true : false),
            MultiSelectCard(
                value: category.other,
                label: category.other.name,
                selected: category.other == selected ? true : false)
            // selected: true
          ],
          onChange: (allSelectedItems, selectedItem) {
            selected = selectedItem;
          }),
    );
  }
}
