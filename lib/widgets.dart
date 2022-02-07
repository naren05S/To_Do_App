import 'package:flutter/material.dart';
import 'package:what_todo/database_helper.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;
  final int id;

  TaskCardWidget({this.title, this.desc,this.id});
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "(Unnamed Task)",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    desc ?? "No Description Added",
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(children: [
            GestureDetector(
              onTap: () async {
                if(id != 0) {
                  await _dbHelper.deleteTask(id);
                }
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image(
                  image: AssetImage(
                    "assets/images/delete_icon.png",
                  ),
                ),
              ),
            ),
          ],)
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  TodoWidget({this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: isDone ? null : Border.all(
                color: Color(0xFF86829D),
                width: 1.5
              )
            ),
            child: Image(
              image: AssetImage('assets/images/check_icon.png'),
            ),
          ),
          Flexible(
            child: Text(
              text ?? "(Unnamed Todo)",
              style: TextStyle(
                color: isDone ? Color(0xFF211551) : Color(0xFF86829D),
                fontSize: 16.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}