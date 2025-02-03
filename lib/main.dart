import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flow',
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(
          title: 'Home',
        ),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin() async {
    // TODO: Implement login logic
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLogin,
              child: Text('Login'),
            ),
          ],
        )
      )
      );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Center(child: FirstScreen()),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // 알림 버튼 동작

            },
          ),
        ],
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex], // ㅅ
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
        persistentFooterButtons: [
            TextButton(
              onPressed: () {},
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('확인'),
            ),
          ],
          drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
              child: Text('메뉴', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('홈'),
              onTap: () {
                print("홈 클릭됨");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
              onTap: () {
                print("설정 클릭됨");
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class FirstScreen extends StatefulWidget {
  
//   const FirstScreen({super.key});

//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }


// class _FirstScreenState extends State<FirstScreen> {
//   int _const = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Screen'),
//       ),
//       body: Center(
//         child: Text('First Screen'),
//       ),
//       // add a floating action button
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _const++;
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

//fix above FirstScreen class to be a stateful widget

class FirstScreen extends StatefulWidget {
  
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
  int _const = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('First Screen $_const'),
      ),
      // add a floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _const++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}