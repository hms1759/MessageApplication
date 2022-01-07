import 'package:flutter/material.dart';
import 'package:lovemessage/screen/Message/LoveMessagePages/messagerforhim.dart';

import '../../homepage.dart';
import 'messagerforher.dart';

class LovePage extends StatelessWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.chevron_left,
            color: Colors.red,),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            color: Colors.white,
          ),
          title: const Text("Love Message",
          style: TextStyle(fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.w700),
          ),
          centerTitle: true,


        ),
        bottomNavigationBar: Container(
    decoration: BoxDecoration(

      color: Colors.white,
          ),
          child: const  TabBar(
            labelColor: Colors.red,
            indicatorWeight: 2.0,
            indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For Her",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For Him",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For My Wife",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For My Husband",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For Mummy",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For Daddy",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For My  Son",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "For My Daughter",
                ),
              ],
            )


        ),

        body: const TabBarView(
          children: [
            MessageForHer(),
            MessageForHim(),
            Center(
              child: Icon(Icons.alarm),
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
            Center(
              child: Icon(Icons.alarm),
            ),
            Center(
              child: Icon(Icons.alarm),
            ),
            Center(
              child: Icon(Icons.alarm),
            ),
            Center(
              child: Icon(Icons.alarm),
            )
          ],
        ),
      ),
    );
  }
}
