import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'home.dart';


void main() {
  runApp(MaterialApp(home: AuthScreen()));
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State createState() => _AuthScreenState();
}

class _AuthScreenState extends State {
    //var _loading = true;
  // Контроллеры для входа
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

  // Контроллеры для регистрации
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  final TextEditingController _registerConfirmPasswordController = TextEditingController();

  bool _agreeToTerms = false;
  bool _isLoading = false;

 // Метод для получения пользователей из API
  Future<List<dynamic>> fetchUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Метод для входа
  void _login () async {
    String email = _loginEmailController.text.trim();
    String password = _loginPasswordController.text.trim();
if(email == "lol" && password == "112")
{

        // Успешный вход
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp()),
        );
 }
 else { print("wrong password");  }     
  }

  // Метод для регистрации
  void _register() {
    String name = _registerNameController.text;
    String email = _registerEmailController.text;
    String password = _registerPasswordController.text;
    String confirmPassword = _registerConfirmPasswordController.text;

    print('Name: $name, Email: $email, Password: $password, Confirm: $confirmPassword');

    // Проверка условий
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все поля')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пароли не совпадают')),
      );
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Необходимо согласие с условиями')),
      );
      return;
    }

    // Здесь вы можете добавить логику регистрации
    print('Регистрация успешна!');
  }

  @override
  Widget build(BuildContext context) {
   // print(_loading);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              
              const Text(
                'Добро пожаловать!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 211, 96, 125),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Войдите или создайте аккаунт',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tabs: const [
                    Tab(text: 'Вход'),
                    Tab(text: 'Регистрация'),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              Expanded(
                child: TabBarView(
                  children: [
                    // ВКЛАДКА ВХОДА
                    Column(
                      children: [
                        TextField(
                          controller: _loginEmailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _loginPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Пароль',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Забыли пароль?'),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _login,
                            child: const Text('Войти'),
                          ),
                        ),
                      ],
                    ),
                    
                    // ВКЛАДКА РЕГИСТРАЦИИ
                    Column(
                      children: [
                        TextField(
                          controller: _registerNameController,
                          decoration: const InputDecoration(
                            labelText: 'Имя',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _registerEmailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _registerPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Пароль',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _registerConfirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Повторите пароль',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Checkbox(
                              value: _agreeToTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreeToTerms = value!;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text('Согласие с условиями'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _register,
                            child: const Text('Зарегистрироваться'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

