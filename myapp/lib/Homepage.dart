import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:myapp/Data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  func(){
    debugPrint("done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Text("The FRANCES TUSTIN\nMemorial Trust")),
        ),
        actions: [
          IconButton(onPressed: func, icon: Icon(Icons.menu))
        ], 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(109, 157, 197, 1)
              ),
              height: 90,
              width: double.infinity,
              child: Center(child: Text(" FRANCIS TUSTIN CONFERENCE, \n MUMBAI - SEPTEMBER 2024", style: TextStyle(fontSize: 24,color: Colors.white),)),
            ),
          ),
          Text( "DETAILS OF HOTELS FOR \nACCOMODATION (AS ON \n05/09/2023)", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 400,width: 400,child: ListView.builder(itemCount:hotels.length ,itemBuilder: (context,index){
            return _containerBuilder(hotels[index]);
          }))
        ],
      ),
    );
  }
}

Widget _containerBuilder(Hotel hotel) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.all(12), 
    height: 400,
    width: 500,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(hotel.imagepath, fit: BoxFit.contain, height: 90),
        const SizedBox(height: 8),
        Text(
          hotel.title,
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(
          hotel.distance,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: (){
            debugPrint("Booked Sucessfully");
          },
          child: const Text("Book", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ],
    ),
  );
}
