// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  final String id;
  final String title;
  final Color color;

  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category_meal', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        padding: EdgeInsets.all(25),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
