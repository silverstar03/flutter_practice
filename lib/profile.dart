import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class RegistProfile extends StatefulWidget {
  @override
  _RegistProfileState createState() => _RegistProfileState();
}

class _RegistProfileState extends State<RegistProfile> {
  PickedFile _imageFile; //카메라/갤러리에서 사진 가져올 때 사용(image_picker)
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regist Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:20, horizontal: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            SizedBox(height: 20),
            nameTextField(),
            SizedBox(height: 20),
          ],
        )
      )
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius:80,
            backgroundImage: _imageFile == null
            ? AssetImage('assets/profile.jfif')
            : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom:20,
            right:20,
            child: InkWell(
              onTap:(){
                showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()));
              }
            )
          )
        ],
      )
    );
  }

  Widget nameTextField(){

  }

  Widget bottomSheet(){
    return Container(
      height:100,
      width: MediaQuery.of(context).size.width, //MediaQuery를 쓰려면 최상위를 materialApp으로 실행
      margin: EdgeInsets.symmetric(
        horizontal:20,
        vertical:20
      ),
      child:Column(
        children:<Widget>[
          Text(
            'Choose Profile photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height:20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera, size:50),
                onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera', style: TextStyle(fontSize:20),),
              ),
              FlatButton.icon(
                icon: Icon(Icons.photo_library, size:50,),
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery', style: TextStyle(fontSize: 20),),
              )
            ],
          )
        ],
      )
    );
  }
  takePhoto(ImageSource source) async{
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

}

