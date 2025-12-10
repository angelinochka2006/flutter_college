import 'package:flutter/material.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page4.dart';

class MainApp3 extends StatelessWidget {
  const MainApp3({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;

    return Scaffold(
      bottomNavigationBar: StatefulBuilder(
        builder: (context, setState) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
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
                icon: Icon(Icons.map),
                label: 'Map',
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
              
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp1()),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp2()),
                  );
                  break;
                case 2:
                  // Уже на карте, ничего не делаем
                  break;
              }
            },
          );
        },
      ),
      appBar: AppBar(
        title: const Text('My App - Mail'),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              // Однократный переход на карту
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapWidget()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://avatars.mds.yandex.net/i?id=204870453fe1b245ce676003a0dc0766_sr-5233839-images-thumbs&n=13'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(153, 255, 63, 159),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Hello World!',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'ВСЕМ ПРИВЕТ 3',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Однократный переход на карту
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapWidget()),
                );
              },
              child: Text('Перейти на карту'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}