import 'package:flutter/material.dart';

class CreateAutomationPartpick extends StatefulWidget {
  final String title;
  final Map commitInfoMap;

  const CreateAutomationPartpick(
      {Key key, this.commitInfoMap, this.title,})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAutomationPartpickState();
  }
}

class CreateAutomationPartpickState extends State<CreateAutomationPartpick> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context, widget.commitInfoMap);
            }),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: Text(widget.commitInfoMap.toString()),
      ),
    );
  }

  getDevice(int i) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: Checkbox(value: false, onChanged: (bool){}),
            );
          }),
    );
  }
}

