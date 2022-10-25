import 'package:codigo2_people/cards_model_dart.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {


  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<CarsAssets> menu = [
    CarsAssets(
      name: "Menu 1",
      images:
          "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      days: "Lun - Mier _ Vier",
      price: "S/.5",
    ),
    CarsAssets(
      name: "Menu 2",
      images:
          "https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      days: "Mar - Jue _ Sab",
      price: "S/.6",
    ),
    CarsAssets(
      name: "Menu 3",
      images:
          "https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      days: "Mar - Jue _ Sab",
      price: "S/.7",
    ),
    CarsAssets(
      name: "Menu 4",
      images:
          "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      days: "Lun - Mier _Vier",
      price: "S/.8",
    ),
    CarsAssets(
      name: "Menu 5",
      images:
          "https://images.pexels.com/photos/2983099/pexels-photo-2983099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      days: "Mar - Jue - Sab",
      price: "S/.9",
    ),
  ];

  String filterMenu = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SetState Cards Assets App",

        ),
        backgroundColor: Color(0xffEEA339),

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Column(
            children: [
              Text(
                "Selecciona tu mejor eleccion",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              ...List.generate(
                menu.length,
                (index) => Card(
                  shadowColor: Colors.black.withOpacity(0.10),
                  elevation: 12,
                  child: InkWell(
                    onTap: (){
                      filterMenu = menu[index].name;
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: filterMenu == menu[index].name ? Color(0xffFFD965) : Colors.white60,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white60,
                            blurRadius: 40,
                            offset: const Offset(12, 18),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(menu[index].images),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menu[index].name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(menu[index].days),
                              SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                menu[index].price,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // leading: CircleAvatar(
                  //   radius: 22,
                  //   backgroundColor: Colors.black12,
                  //   backgroundImage: NetworkImage(menu[index].images),
                  // ),
                  // title: Text(menu[index].name),
                  // subtitle: Text(menu[index].days),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
