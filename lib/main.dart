import 'package:app/auth_page.dart';
import 'package:app/eventCart.dart';
import 'package:app/event_list.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_page.dart';
import 'contact_us_page.dart';
import 'application_page.dart';
import 'profile_page.dart';
import 'subscription_page.dart';
import 'event_details_page.dart';
import 'qr_code_page.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {

 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

 
 runApp(
    ChangeNotifierProvider(
      create: (context) => Eventcart(),
      child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthPage(),
      routes: {
        '/events':(context) => EventList(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactUsPage(),
        '/application': (context) => ApplicationPage(),
        '/profile': (context) => ProfilePage(
              fullName: 'Dinna shati',
              email: 'shatisinna490@gmail.com',
              password: 'password123',
            ),
        '/subscription': (context) => SubscriptionPage(),
        '/event-details': (context) => EventDetailsPage(
              phone: '',
              city: '',
              location: '',
              time: '',
              people: '',
              category: '',
              cost: 0.0,
            ),
        '/qr-code': (context) => QRCodePage(),
        '/home': (context) => HomePage(
            email: ''), // Placeholder, the email will be passed dynamically
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          WalkthroughPage(
            imagePath: 'assets/events.jpeg',
            title: 'Our Event portal',
            description:
                'Is the mobile application that deal with registration of events through your mobile devices.',
          ),
          WalkthroughPage(
            imagePath: 'assets/events1.jpeg',
            title: 'Make event with us',
            description:
                'You can make online events with our mobile application with easy steps.',
          ),
          WalkthroughPage(
            imagePath: 'assets/events.jpeg',
            title: 'Make payment with us',
            description:
                'Within our mobile application you can get a subscription plan of paying a small amount for large functionality.',
            isLastPage: true,
          ),
        ],
      ),
    );
  }
}

class WalkthroughPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  const WalkthroughPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300.0),
        const SizedBox(height: 20.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        Text(
          description,
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        if (isLastPage)
          ElevatedButton(
            onPressed: () {
              // Handle button press
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpLoginPage()),
              );
            },
            child: const Text('GET STARTED'),
          ),
      ],
    );
  }
}

class SignUpLoginPage extends StatelessWidget {
  const SignUpLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up / Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
