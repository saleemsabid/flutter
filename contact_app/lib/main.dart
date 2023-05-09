import 'package:flutter/material.dart';
import 'package:contact_app/src/people.dart';

void main() {
  runApp(const MyApp());
}

// final Person person = people[0];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const Home(
        title: "Contact App",
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return const WideLayout();
          } else if (constraints.maxWidth < 500) {
            return const NarrowLayout();
          } else {
            return const MidLayout();
          }
        },
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class MidLayout extends StatelessWidget {
  const MidLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const ContactTile(index: 4),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_circle_rounded),
      title: Text(people[index].name),
      subtitle: Text(people[index].age),
    );
  }
}
