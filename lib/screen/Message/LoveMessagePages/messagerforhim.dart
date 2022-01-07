import 'package:flutter/material.dart';
import 'package:lovemessage/model/model.dart';
import 'package:lovemessage/model/testing.dart';
import 'package:lovemessage/service/message_for_her.dart';


class MessageForHim extends StatelessWidget {
  const MessageForHim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<MessageModel>>(
            future: MessageForHerApiService.getAllMessage(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data;
                return

                  ListView.builder(
                    itemCount: messages!.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(

                                 title: Text(message.body,
                                   style: const TextStyle(fontSize: 12.0),
                                   textAlign: TextAlign.justify,),
                               subtitle: const Padding(
                                 padding: EdgeInsets.only(top: 8.0),
                                 child: Text("refrence",
                                    style: TextStyle(
                                        fontSize: 8, fontStyle: FontStyle.italic)),
                               ),
                               ),

                             ),
                          ),
                           const SizedBox(
                             height: 5.0,
                           ),

                        ],
                      );

                    });
              }
              else if (snapshot.hasError) {
                return  Center(
                  child: Text("${snapshot.error}"),
                );
              }
              else if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return const Text("loading");
              }
            }));
  }
}

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tittle",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: const Text(
                    "Performing hot reload Syncing files to device ONEPLUS A3010...Reloaded 1 of 559 libraries in 350ms.Performing hot reload...Syncing files to device ONEPLUS A3010...Reloaded 1 of 559 libraries in 350ms.Performing hot reload...Syncing files to device ONEPLUS A3010...Reloaded 1 of 559 libraries in 350ms.",
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("refrence",
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.redAccent),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5.0),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
