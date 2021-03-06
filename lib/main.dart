// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'profile_modify.dart';
import 'profile_last.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //위쪽 디버깅 표시 제거
      title: '프로필',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Myprofile(),
      // home: profile_modify(),
    );
  }
}

class Myprofile extends StatefulWidget {
  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {

  Widget _buildAll(){
    return SingleChildScrollView(
      child: Container(
          // color: Colors.amberAccent,
          height: 700,
          padding : const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildTop(),
              ),
              Expanded(
                flex: 2,
                child: _buildBottom(),
              )
            ],
          )
      ),
    );
  }

  Widget _buildTop(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,

    );
  }

  Widget _buildBottom(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('전화번호',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height:16.0,
            ),
            Text('이메일',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height:16.0,
            ),
            TextFormField(
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: '위치',
              ),
            ),
            SizedBox(
              height:16.0,
            ),
            TextFormField(
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: '맡은 업무',
              ),
            ),
            SizedBox(
              height:16.0,
            ),
            RaisedButton(
                child: Text('프로필 편집'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile_modify()),
                  );
                }
            )
          ]
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '프로필',
          style: TextStyle(color:Colors.black),
        ),
      ),
      body: _buildAll(),
    );
  }


}




