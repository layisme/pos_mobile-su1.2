import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qty = 0;

  void increase() {
    qty++;
    setState(() {});
    print(qty);
  }

  void decrease() {
    qty--;
    setState(() {});
    print(qty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.add_circled)),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text(
              qty.toString(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: decrease,
                icon: Icon(Icons.remove),
                padding: EdgeInsets.all(20),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  side: WidgetStatePropertyAll(BorderSide()),
                  iconColor: WidgetStatePropertyAll(Colors.blue),
                  backgroundColor: WidgetStatePropertyAll(Colors.purple),
                  shape: WidgetStatePropertyAll(
                    CircleBorder(side: BorderSide(width: 1)),
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(onPressed: increase, icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
