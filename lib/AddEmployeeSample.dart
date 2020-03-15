import 'package:flutter/material.dart';

class AddEmplyoee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("Add Employee"),
      ),
      body: EmployeeState(),
    );
  }
}

class Employee {
  var id;
  var name;
  var isFav;

  Employee(var id, var name,var isFav) {
    this.id = id;
    this.name = name;
    this.isFav = isFav;
  }
}

class EmployeeState extends StatefulWidget {
  @override
  EmployeeDisplay createState() => EmployeeDisplay();
}

class EmployeeDisplay extends State<EmployeeState> {
  var employeeList = new List<Employee>();
  final editController = TextEditingController();

  void saveEmployee(var employee) {
    employeeList.add(employee);
    editController.clear();
    //To dynamically change the state
    setState(() {

    });
  }

  void deleteElement(){
    employeeList.removeLast();
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: editController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ))),
              new Flexible(
                  child: RaisedButton(
                      child: Text("Add"),
                      color: Colors.green,
                      padding: EdgeInsets.all(10),
                      textColor: Colors.white,
                      onPressed: ()=>saveEmployee(Employee(employeeList.length+1,
                          editController.text,false)))),
              new Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: RaisedButton(
                      child: Text("Delete"),
                      color: Colors.red,
                      padding: EdgeInsets.all(10),
                      textColor: Colors.white,
                      onPressed: deleteElement))
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("List of Employees",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
            )),
        new Expanded(
          child: Card(
            child: ListView.builder(
                     key: Key("String"),
                     itemCount: employeeList.length,
                       //To add the scroll properties
                       scrollDirection: Axis.vertical,
                       //To Wrap the list element
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(18.0),
                       itemBuilder: (context,i){
                         if(i<employeeList.length) {
                           return ListTile(
                             leading: Text(employeeList[i].id.toString()+".",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold
                             ),),
                             title: Text(employeeList[i].name),
                             trailing: Icon(employeeList[i].isFav?Icons.favorite:Icons.favorite_border,
                              color: employeeList[i].isFav?Colors.red:null
                             ),
                             onTap: (){employeeList[i].isFav = !employeeList[i].isFav;
                                setState(() {});},
                           );
                         }else{
                           return null;
                         }

                       }
                       )
          ),

        )
      ],
    ));
  }
}
