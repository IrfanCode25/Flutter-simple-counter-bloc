import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_counter_bloc/cubit/counter_cubit.dart';

import 'second_page.dart';

void main() {
  //manage state dengan BlocProvider
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Simple Counter Bloc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return const SecondPage();
                }));
              },
              icon: const Icon(Icons.chevron_right))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // trigger function state
                    BlocProvider.of<CounterCubit>(context).kurang();
                  },
                  child: const Icon(Icons.exposure_minus_1),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.number.toString(),
                        style: const TextStyle(fontSize: 40),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // trigger function state
                    BlocProvider.of<CounterCubit>(context).tambah();
                  },
                  child: const Icon(Icons.plus_one),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
