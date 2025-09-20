import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          ///padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  /// Need to build out these sections -AO
                  Text('section 1'),
                  Text('section 2'),
                  Text('section 3'),
                ],
              )
          )
      ),
    );
  }
}
