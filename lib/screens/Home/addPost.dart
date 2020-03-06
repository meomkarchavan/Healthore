import 'package:flutter/material.dart';
import 'package:heatlhore/models/Post.dart';
import 'package:heatlhore/models/user.dart';
import 'package:heatlhore/services/database.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: MyCustomForm()),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final formKey = new GlobalKey<FormState>();
  List _categories;
  List<dynamic> _categoriesResult;
  var message;
  List<String> tags = [];
  var categorys = [
    {"display": "Stress", "value": "Stress"},
    {"display": "Motivated", "value": "Motivated"},
    {"display": "Anxity", "value": "Anxity"},
    {"display": "Focus", "value": "Focus"},
    {"display": "Peace", "value": "Peace"},
    {"display": "Guidence", "value": "Guidence"},
  ];
  final messageController = TextEditingController();
  final tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categories = [];
    tagsController.addListener(_saveForm);
    messageController.addListener(_saveForm);
  }

  @override
  void dispose() {
    messageController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  _saveForm() {
    var form = formKey.currentState;
    setState(() {
      _categoriesResult = _categories;
      tags = tagsController.text.split("#");
      message = messageController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              //MEssage Field
              controller: messageController,
            ),
            TextField(
              //Tags Field
              controller: tagsController,
            ),
            MultiSelectFormField(
              autovalidate: false,
              titleText: 'Categories',
              validator: (value) {
                if (value == null || value.length == 0) {
                  return 'Please select one or more options';
                }
              },
              dataSource: categorys,
                textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  value: _categories,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      print(value.runtimeType);
                      _categories = value;
                    });
                  },
                
            ),
            RaisedButton(onPressed: () async {
              var data = Post(
                  dateTime: DateTime.now().toString(),
                  message: message,
                  userid: user.uid,
                  category: _categoriesResult.cast<String>(),
                  tags: tags).toJson();
              await DatabaseService(uid: user.uid).addPost(data);
              // print(data);
            })
          ],
        ),
      ),
    );
  }
}
