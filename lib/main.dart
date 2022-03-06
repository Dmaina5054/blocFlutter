import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubit/countercubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountercubitCubit>(
      create: (context) => CountercubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CountercubitCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CountercubitCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CountercubitCubit>(context).reset();
                    },
                    tooltip: 'Reset',
                    child: const Icon(Icons.restore_from_trash)),
              ],
            ),
            BlocBuilder<CountercubitCubit, CountercubitState>(
              builder: (context, state) {
                //manipulate state
                if (state.counterValue == 5) {
                  return Column(
                    children: [Text('Heey..number 5'), Icon(Icons.looks_5)],
                  );
                }
                if (state.counterValue == 4) {
                  return Column(
                    children: [
                      Text('Heey..number 4'),
                      Icon(Icons.looks_4_rounded)
                    ],
                  );
                }
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      //
    );
  }
}
