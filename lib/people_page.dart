import 'package:codigo2_people/item_person_widget.dart';
import 'package:codigo2_people/user_model.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List<Map<String, dynamic>> people = [
    {
      "id": 1,
      "name": "José Carlos Montes",
      "phone": "987232222",
    },
    {
      "id": 2,
      "name": "Fiorella Marquez",
      "phone": "555333222",
    },
    {
      "id": 3,
      "name": "Luis Arias",
      "phone": "123222444",
    },
  ];

  List<UserModel> people2 = [
    UserModel(
      id: 1,
      name: "Daniel Lopez",
      phone: "232323",
      role: "Admin",
    ),
    UserModel(
      id: 2,
      name: "Elvis Barrionuevo",
      phone: "6565656",
      role: "User",
    ),
  ];

  String fullName = "";
  String phone = "";
  String role = "Admin";

  String filterText = "Todos";

  List<UserModel> people2Aux = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    people2Aux = people2;
  }


  void filterData(){

    //filterText = Admin

    // List<UserModel> aux = [];
    // people2.forEach((element) {
    //   if(element.role == filterText){
    //     aux.add(element);
    //   }
    // });
    // people2.clear();
    // people2 = aux;

    people2 = people2Aux;

    if(filterText != "Todos"){
      people2 = people2.where((element) => element.role == filterText).toList();
    }

    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("People Page (${people2.length})"),
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registrar persona",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Nombre completo",
              ),
              onChanged: (String value) {
                fullName = value;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Teléfono",
              ),
              onChanged: (String value) {
                phone = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Rol:"),
            const SizedBox(
              height: 10.0,
            ),
            RadioListTile(
              title: Text("Admin"),
              value: "Admin",
              groupValue: role,
              onChanged: (String? value) {
                role = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: Text("User"),
              value: "User",
              groupValue: role,
              onChanged: (String? value) {
                role = value!;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  UserModel user = UserModel(
                    id: people2.length + 1,
                    name: fullName,
                    phone: phone,
                    role: role,
                  );

                  people2.add(user);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                child: const Text(
                  "Agregar",
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Listado de personas",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: (){
                      filterText = "Todos";
                      filterData();
                      setState(() {

                      });
                    },
                    child: Text(
                      "Todos",
                      style: TextStyle(
                        color: filterText == "Todos" ? Colors.black : Colors.black.withOpacity(0.5),
                        fontWeight: filterText == "Todos" ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: (){
                      filterText = "Admin";
                      filterData();
                      setState(() {

                      });
                    },
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        color: filterText == "Admin" ? Colors.black : Colors.black.withOpacity(0.5),
                        fontWeight: filterText == "Admin" ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: (){
                      filterText = "User";
                      filterData();
                      setState(() {

                      });
                    },
                    child: Text(
                      "User",
                      style: TextStyle(
                        color: filterText == "User" ? Colors.black : Colors.black.withOpacity(0.5),
                        fontWeight: filterText == "User" ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 12.0,
            ),

            people2.isNotEmpty
                ? Column(
              children: List.generate(
                people2.length,
                    (index) => ItemPersonWidget(
                  data: people2[index],
                  miFuncion: () {
                    people2.removeAt(index);
                    setState(() {});
                  },
                ),
              ),
            )
                : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    'assets/images/box.png',
                    height: 120.0,
                    color: Colors.black.withOpacity(0.75),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text("No hay registros"),
                ],
              ),
            ),
          ],
          // children:
          //     people2.map<Widget>((e) => ItemPersonWidget(data: e)).toList(),
        ),
      ),
    );
  }
}