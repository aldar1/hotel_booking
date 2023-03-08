import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/data.dart';
import 'package:hotel_booking/screens/data_home.dart';
import 'package:hotel_booking/screens/menu_screen.dart';

void main() => runApp(const MyApp());

enum MenuSelection {
  menu1,
  menu2,
  menu3,
  menu4,
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Data> object = DataHome.getData;

  MenuSelection? selectedOne;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hotel Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF8FCFF)),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: const Image(
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://cdn.shopify.com/s/files/1/0714/1079/products/merrell-twins-merch-merrell-twins-gamer-girl-yellow-shirt-shirt-28291175612525_1000x1000.jpg?v=1627999468',
                        )
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Text(
                  'Where Would\nLike o Go?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3C4657)
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for place',
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 35,
                            color: Color(0xFF3C4657),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2.4,
                              color: Color(0XFF3C4657)
                            ),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.4,
                              color: Color(0XFF3C4657)
                            ),
                          )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF3C4657)
                      ),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.filter_alt,
                        size: 35,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedOne = MenuSelection.menu1;
                        });
                      },
                      child: MenuScreen(
                        text: 'Hotel',
                        color: selectedOne == MenuSelection.menu1 
                            ? const Color(0xFF3C4657)
                            :const Color(0xFFF0F1F3),
                        textColor: selectedOne == MenuSelection.menu1 
                            ? Colors.white
                            :Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedOne = MenuSelection.menu2;
                        });
                      },
                      child: MenuScreen(
                        text: 'Apartament',
                        color: selectedOne == MenuSelection.menu2 
                            ? const Color(0xFF3C4657)
                            :const Color(0xFFF0F1F3),
                        textColor: selectedOne == MenuSelection.menu2
                            ? Colors.white
                            :Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedOne = MenuSelection.menu3;
                        });
                      },
                      child: MenuScreen(
                        text: 'Motel',
                        color: selectedOne == MenuSelection.menu3
                            ? const Color(0xFF3C4657)
                            :const Color(0xFFF0F1F3),
                        textColor: selectedOne == MenuSelection.menu3 
                            ? Colors.white
                            :Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedOne = MenuSelection.menu4;
                        });
                      },
                      child: MenuScreen(
                        text: 'Hostal',
                        color: selectedOne == MenuSelection.menu4
                            ? const Color(0xFF3C4657)
                            :const Color(0xFFF0F1F3),
                        textColor: selectedOne == MenuSelection.menu4
                            ? Colors.white
                            :Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 12),
                height: 250,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: object.length,
                  itemBuilder: (context,index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(DataHome.getData[index].imageUrl),
                          fit: BoxFit.cover
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: (){}, 
                              icon: const Icon(Icons.favorite_border,size: 40,)
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DataHome.getData[index].name, style: const  TextStyle(fontSize: 22, color: Colors.white),),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,size: 30,color: Colors.white,),
                                    Text(
                                      DataHome.getData[index].location,
                                      style: const TextStyle(fontSize: 22,color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  'Popular Hotels',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF3C4657),
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

