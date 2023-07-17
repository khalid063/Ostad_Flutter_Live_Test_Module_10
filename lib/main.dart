import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mediaquery',
      home: HomeScreen(),
    );
  }

}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenUI();
  }
}

class HomeScreenUI extends State<HomeScreen>{

  /// Items List of Json array  (1st work make a Json list)
  var MyItems = [
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",},
    {"img":"https://www.jugantor.com/assets/news_photos/2023/07/17/image-697089-1689612825.jpg",}
  ];


  Widget potrait(){							///*** method of  "OrientationBuilder"
    return Center(
      child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              subtitle: Container(
                child: Card(
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  // color: Color.fromRGBO(7, 236, 176, 1),
                  // shadowColor: Colors.deepOrange,
                  // elevation: 50,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Center(child:
                      Image.network(
                        '${MyItems[index]['img']}',
                        width: 150,
                        height: 150,
                        errorBuilder: (_, __, ___,){
                          return Icon(
                            Icons.image,
                            size: 32,
                          );
                        },
                      )
                    ),
                  ),
                ),
              )

              // Image.network(
              //   '${MyItems[index]['img']}',
              //   width: 150,
              //   height: 150,
              //   errorBuilder: (_, __, ___,){
              //     return Icon(
              //       Icons.image,
              //       size: 32,
              //     );
              //   },
              // )

             );
          }, separatorBuilder: (BuildContext context, int index) {
           return Divider(color: Colors.white70, height: 10,);
      },
      )
    );
  }

  Widget landScape(){							///*** method of  "OrientationBuilder"
    return Container(
      width: double.infinity,
      height: 300,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1.2,
          ),
          itemCount: MyItems.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                width: double.infinity,
                height: 200,
                child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill,),
              ),
            );
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsFeed'),
      ),
      body: OrientationBuilder(       ///*** use "OrientationBuilder"
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return potrait();
          }else{
            return landScape();
          }
        },
      ),
    );
  }
}