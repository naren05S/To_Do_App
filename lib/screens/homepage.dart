import 'package:flutter/material.dart';
import 'package:what_todo/database_helper.dart';
import 'package:what_todo/screens/taskpage.dart';
import 'package:what_todo/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  // final CategoriesScroller categoriesScroller = CategoriesScroller();
  // ScrollController controller = ScrollController();
  //
  // bool closeTopContainer = false;
  // double topContainer = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //
  //     // double value = controller.offset/10;
  //
  //     setState(() {
  //       // topContainer = value;
  //       closeTopContainer = controller.offset > 1.5;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          // color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 32.0,
                          bottom: 32.0,
                        ),
                        child: IconButton(
                            icon: Icon(Icons.today_outlined, color: Colors.black)),
                      ),
                      Text(
                        "THINGS TO DO",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // AnimatedContainer(
                  //     duration: const Duration(milliseconds: 700),
                  //     width: MediaQuery.of(context).size.width ,
                  //     alignment: Alignment.topCenter,
                  //     height: closeTopContainer?0:MediaQuery.of(context).size.height*0.2,
                  //     child: FittedBox(
                  //         fit: BoxFit.fitWidth,child: categoriesScroller)),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            // controller: controller,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              if(snapshot.data.length==0){
                                return Center(
                                  child:Image.asset('assets/delete_icon.png'),
                                );
                              }else{
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Taskpage(
                                          task: snapshot.data[index],
                                        ),
                                      ),
                                    ).then(
                                          (value) {
                                        setState(() {});
                                      },
                                    );
                                  },
                                  child: TaskCardWidget(
                                    title: snapshot.data[index].title,
                                    desc: snapshot.data[index].description,
                                    id: snapshot.data[index].id,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                                task: null,
                              )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.yellow],
                          begin: Alignment(0.1, -2.0),
                          end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();
//
//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 150,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight,
//               decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Most\nFavorites",
//                       style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "20 Items",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: 150,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight,
//               decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Newest",
//                         style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "20 Items",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: 150,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight,
//               decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Super\nSaving",
//                       style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "20 Items",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }