import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_counter_bloc/cubit/counter_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second pages'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Second Page')),
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text('state value : ${state.number.toString()}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
