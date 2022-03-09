import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/counter_bloc/counter_bloc.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        switch (state.status) {
          case CounterStatus.initial:
          case CounterStatus.loading:
          case CounterStatus.success:
            return Column(
              children: [

                Text('You have pushed the button this ${state.value} times:'),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterIncremented()),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterDecremented()),
                ),
              ],
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

