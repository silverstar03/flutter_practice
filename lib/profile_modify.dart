import 'package:flutter/material.dart';

import 'main.dart';

class profile_modify extends StatelessWidget {

  final TextEditingController _controller = new TextEditingController();

  Widget _modify(){
    return SingleChildScrollView (
      child:Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                controller: _controller,
                decoration:InputDecoration(
                    labelText:'이름',
                    hintText: 'ex) 홍길동',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed:(){
                          _controller.clear();
                        }
                    )
                ),
              ),
              SizedBox(
                height:16.0,
              ),
              TextFormField(
                decoration:InputDecoration(
                    labelText: '전화번호',
                    hintText: '\'-\' 없이 숫자만',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed:(){
                          _controller.clear();
                        }
                    )
                ),
                keyboardType:TextInputType.number, //숫자만 입력 가능
              ),
              SizedBox(
                height:16.0,
              ),
              TextFormField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '위치',
                    hintText: '위치',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed:(){
                          _controller.clear();
                        }
                    )
                ),
              ),
              SizedBox(
                height:16.0,
              ),
              TextFormField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '맡은 업무',
                    labelText: '맡은 업무',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed:(){
                          _controller.clear();
                        }
                    )
                ),
              ),
              SizedBox(
                height:16.0,
              ),
              RaisedButton(
                child: Text('완료'),
                onPressed:(){
                  // Navigator.pop(context);
                },
              )
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(''
            '프로필 편집',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _modify(),
    );
  }
}
