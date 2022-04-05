import 'dart:math';

import 'package:app/store/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:app/store/counter.dart'; // Import the Counter

final counter = Counter(); // Instantiate the store
final userStore = UserStore();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(

        child: Column(
          children: [

            Text(
              'You have pushed the button this many times:',
            ),

            Observer(
              builder: (_) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),

            
            

            ElevatedButton(
              onPressed: () {
                print("esta logado");
                print(userStore.isLoggedin);
                print(userStore.userCredential!.user ?? "usuario nulo");
              },
              child: Text("Esta Logado"),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.airplanemode_off),
      ),
    );
  }
}

