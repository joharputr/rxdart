import 'package:flutter/material.dart';
import 'package:rxdart2/viewModel/rx_dart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = new CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You have pushed the button this many times:'),
              new StreamBuilder(
                  stream: _counterBloc.counterObservable,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    return new Text('${snapshot.data}',
                        style: Theme.of(context).textTheme.display1);
                  })
            ],
          ),
        ),
        floatingActionButton: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: new FloatingActionButton(
                    onPressed: _counterBloc.increment,
                    tooltip: 'Increment',
                    child: new Icon(Icons.add),
                  )),
              new FloatingActionButton(
                onPressed: _counterBloc.decrement,
                tooltip: 'Decrement',
                child: new Icon(Icons.remove),
              ),
            ]));
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
