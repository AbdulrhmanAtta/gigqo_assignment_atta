import 'package:flutter/material.dart';
import 'package:gigqo_assignment/service/api_service.dart';
import 'package:gigqo_assignment/model/Track.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.track);

  final Track track;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();


  String id = '';
  String imagePath = "";
  final picker = ImagePicker();
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _artistController = TextEditingController();
  final _yearController = TextEditingController();
  final _coverController = "";

  @override
  void initState() {
    id = widget.track.id;
    _nameController.text = widget.track.name;
    _artistController.text = widget.track.artist;
    _yearController.text = widget.track.year;
    imagePath = widget.track.cover;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color(0xff16171E),
      appBar: AppBar(
        backgroundColor: Color(0xff121219),
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage('assets/logo.png'), fit: BoxFit.cover, width: 170,),
          ],
        ),
      ),
      body: Form(
        
        key: _addFormKey,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
          child: Container(
            child: Card(
                child: Container(
                   decoration: BoxDecoration(color: Color(0xff16171E)),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                       Container(
                         child:   imagePath != ""
                ? CircleAvatar(
                  radius: 65,
                    child: ClipOval(child: Image.file(File(imagePath), width: 150, height:150, fit: BoxFit.cover,)),
                    
                  )
                : CircleAvatar(
                   radius: 55,
                  backgroundImage: AssetImage('assets/camera.jpeg'),
                ),
                       ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                            
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                               hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ), 
                         
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              
                              TextFormField(
                                style: TextStyle(color: Colors.white),                               
                                controller: _artistController,
                                decoration: const InputDecoration(
                                  hintText: 'Artist',
                                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Artist';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                           Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                               style: TextStyle(color: Colors.white),
                                controller: _yearController,
                                decoration: const InputDecoration(
                                  hintText: 'Year',
                                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Year';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                       
                       Container(
              padding: EdgeInsets.only(left:10, right:10, top:10),
              width: double.infinity,
              child: RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    File? croppedFile = await ImageCropper.cropImage(
                      sourcePath: pickedFile.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      androidUiSettings: AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: Colors.green[700],
                        toolbarWidgetColor: Colors.white,
                        activeControlsWidgetColor: Colors.green[700],
                        initAspectRatio: CropAspectRatioPreset.original,
                        lockAspectRatio: false,
                      ),
                      iosUiSettings: IOSUiSettings(
                        minimumAspectRatio: 1.0,
                      ),
                    );
                    if (croppedFile != null){
                      setState(() {
                        imagePath = croppedFile.path;
                      });
                    }
                  }
                },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Select Cover', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10,),
                   Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                 ],
               ),
                color: Color(0xffDE1534),
              ),
            ),
                      
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                width: double.infinity,
                               child: RaisedButton(
                                  splashColor: Colors.red,
                                  onPressed: () {
                                    if (_addFormKey.currentState!.validate()) {
                                      print(_nameController.text);
                                      _addFormKey.currentState!.save();
                                      api.updateTrack(id, Track(id:id, name: _nameController.text, artist: _artistController.text, year: _yearController.text, cover: imagePath));
                                      
                                      Navigator.pop(context) ;
                                    }
                                  },
                                  child: Text('Save', style: TextStyle(color: Colors.white)),
                                  color: Color(0xffDE1534),
                                ),
                              ),
                         
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }

}