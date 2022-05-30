import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String imgaeUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordabiility affordabiility;

  const MealItem(
      {required this.imgaeUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordabiility});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  String get affordabiilityText {
    switch (affordabiility) {
      case Affordabiility.Affordable:
        return 'Affordable';
        break;
      case Affordabiility.Pricey:
        return 'Pricey';
        break;
      case Affordabiility.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  void SelectMeal() {}

  @override
  Widget build(BuildContext context) {
    //inwell you cann click on this conatinaer
    return InkWell(
      onTap: SelectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                //make image in borderrudis we make this picture inside the clip
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imgaeUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 200,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$complexityText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabiilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
