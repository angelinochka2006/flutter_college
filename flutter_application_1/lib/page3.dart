
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';


class MainApp3 extends StatelessWidget {
  const MainApp3({super.key});

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
          MaterialPageRoute(builder: (context) => MainApp3()),
        );  }
         

        },
        ),
      appBar: AppBar(
        title: const Text('My App'),
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


// создаем копию файла
// переименовываем название класса
// возвращаемся в этот файл --- 
// используем навигатор так же как в main , 
// но используем там класс только что созданного файла, где переименовали класс
// пробуем добавть if (i==1 или 2 или 3 ) чтоб навигатор срабатывал не на каждом пункте