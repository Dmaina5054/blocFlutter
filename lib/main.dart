import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubit/countercubit_cubit.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

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
        title: 'State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Bloc STteeeeee'),
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

      //bottomsheet here
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: 0,
        sheetChild: Center(
            child: BlocListener<CountercubitCubit, CountercubitState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<CountercubitCubit, CountercubitState>(
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
        )),
        // ignore: prefer_const_constructors
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
            size: 60,
            color: const Color(0xFF2B65E3),
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            )),
        onSelectItem: (index) {
          if (index == 0) {
            BlocProvider.of<CountercubitCubit>(context).increment();
          } else if (index == 1) {
            BlocProvider.of<CountercubitCubit>(context).decrement();
          }
        },
        items: [
          BottomBarWithSheetItem(icon: Icons.add),
          BottomBarWithSheetItem(icon: Icons.remove),
          BottomBarWithSheetItem(icon: Icons.reset_tv),
          BottomBarWithSheetItem(icon: Icons.settings),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
