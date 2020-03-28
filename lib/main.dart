import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: TextTheme(title: TextStyle(color: Colors.pinkAccent))),
      home: MyHomePage(title: 'ScaleTransition Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  TextEditingController _textController = new TextEditingController() ;
  String text ;
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();_textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                height: size.height * .4,
                child: Stack(children: <Widget>[
                  Container(
                    height: size.height * .3,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      /* borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))*/
                    ),
                    child: Center(
                      child: Text(
                        'Search APPBAR',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height * .3 * .9,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        //color: Colors.red,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1.0),
                                  color: Colors.white),
                              child: TextFormField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          icon: Icon(Icons.search),
                                          onPressed:(){
                                            setState(() {
                                              text =  _textController.text ;
                                            });
                                          } ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      hintText: 'Search ... '))))),
                ])),


            Center(child: Text(text ?? 'no result', style: TextStyle(color: Colors.black, fontSize: 25),),)
          ],
        ));
  }


}
