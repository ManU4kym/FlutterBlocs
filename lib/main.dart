import 'package:bloc_concepts/cubit/counter_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocCubit(),
      child: MaterialApp(
        title: 'Bloc Concepts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'BloCs'),
      ),
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
      backgroundColor: const Color.fromARGB(255, 185, 175, 123),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.settings,
          color: Color.fromARGB(255, 130, 54, 54),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBlocCubit, Counterstate>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(fontSize: 23),
                );
              },
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBlocCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBlocCubit>(context).decrement();
                    },
                    tooltip: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
