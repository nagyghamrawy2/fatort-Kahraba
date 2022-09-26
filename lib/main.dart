import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double diff = 0.0;
  late String shre7a  = "";
  TextEditingController esthlak1  = new TextEditingController();
  TextEditingController esthlak2  = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "حسابة فاتورة الكهرباء",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Image.network(
                      'https://manhom.com/wp-content/uploads/2013/12/%D8%B4%D8%B1%D9%83%D8%A9-%D8%B4%D9%85%D8%A7%D9%84-%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9-%D9%84%D8%AA%D9%88%D8%B2%D9%8A%D8%B9-%D8%A7%D9%84%D9%83%D9%87%D8%B1%D8%A8%D8%A7%D8%A1.jpg',height: 500,),


                SizedBox(height: 150,),
                Container(
                  width: 220,
                  child: TextField(
                    keyboardType: TextInputType.number ,
                    controller: esthlak1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: "القرأة السابقة",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: 220,
                  child: TextField(
                    keyboardType: TextInputType.number ,
                    controller: esthlak2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: "القرأة الحالية",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                ),
                SizedBox(height: 30,),
                RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        diff = double.parse(esthlak2.text) - double.parse(esthlak1.text);
                        print (diff);
                      });

                    },
                    child: Text(
                      "حساب عدد الكيلو وات المستهلكة",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                ),
                SizedBox(height: 30,),
                Text( "$diff" , style: TextStyle(
                  fontSize: 30 ,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 30,),
                RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        if (0<=diff && diff<=50 ){
                          shre7a = "الشريحة الأولى";
                        }
                        else if ( 51<=diff && diff<=100){
                          shre7a = "الشريحة الثانية";
                        }
                        else if ( 101<=diff && diff<=200){
                          shre7a = "الشريحة الثالثة";
                        }
                        else if ( 201<=diff && diff<=350){
                          shre7a = "الشريحة الرابعة";
                        }
                        else if ( 351<=diff && diff<=650){
                          shre7a = "الشريحة الخامسة";
                        }
                        else if ( 651<=diff && diff<=1000){
                          shre7a = "الشريحة السادسة";
                        }
                        else {
                          shre7a = "الشريحة السابعة";
                        }
                        print(shre7a);

                      });

                    },
                    child: Text(
                      "الشريحة المتاحة الأن",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                ),
                SizedBox(height: 30,),
                Text( "$shre7a" , style: TextStyle(
                    fontSize: 30 ,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
