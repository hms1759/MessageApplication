import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovemessage/model/model.dart';
import 'package:lovemessage/service/message_for_her.dart';

import 'Message/LoveMessagePages/messagerforher.dart';
import 'Message/LoveMessagePages/home_page.dart';
class HomePage extends StatefulWidget {
  //HomePage(Type messageForHerRepository, MessageForHerRepository messageForHerRepository2);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late MessageForHerBloc _messageForHerBloc;
  late Future<FeaturedModel> featuredMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Love message",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.red.shade700),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //   ),
                //   child: Text(
                //     'Drawer Header',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 24,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Love Messages'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LovePage()));
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Birth Messages'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Daily Message'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Funny Messages'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Congratulation Messages'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LovePage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Thank You Messages'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Sympathy Messages'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Daily Qoute'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageForHer()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
                child: Image.asset(
              "assets/image.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: Colors.red.withOpacity(1.0),
              colorBlendMode: BlendMode.softLight,
            )),
            Center(
              child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.7),
                  ),
                  child: FeaturedMessages()),
            )
          ],
        ));
  }
}
class FeaturedMessages extends StatelessWidget {
  const FeaturedMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<FeaturedModel>(
            future: FeatureMessageApiService.getFeaturedMSG(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(messages!.content,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: const Text(
                          "Refresh",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0),
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Text("loading");
              }
            }));
  }
}

