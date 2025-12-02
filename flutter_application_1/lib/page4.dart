import 'package:flutter/material.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class mapWidget extends StatelessWidget {


@override
Widget build(BuildContext context) {
  return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         
        items: [
         
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Mail',
          ),
        ],
        onTap:  (i) {
              if(i==0)  {  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp1()),
        );  }
          if(i==1) {  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp2()),
        );  }
          if(i==2) {  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mapWidget()),
        );  }
         

        },
        ),
    
    body: FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
      initialZoom: 9.2,
    ),
    children: [
      TileLayer( // Bring your own tiles
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
        userAgentPackageName: 'com.example.app', // Add your app identifier
        // And many more recommended properties!
      ),
  
    ],
   ) );
}

}