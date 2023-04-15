// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:findflamesui/calendar.dart';
import 'package:findflamesui/explore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> pages = [
    Explore(),
    Calendar(),
    Calendar(),
    ChatWidget()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        elevation: 10,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("lib/assets/Vectorhome.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("lib/assets/globalsearchglob.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("lib/assets/calendaredit.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("lib/assets/chat.png"),
            label: "",
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 246, 226, 226),
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("lib/assets/Ellipse2profile.jpg"),
          ),
        ),
        title: Text(
          "Find Flames",
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 30,
              color: Color(0xffFF5F8F),
            ),
          ),
        ),
        actions: [Image.asset("lib/assets/Vectorsettings.png")],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final List<String> images = [
    "lib/assets/0.jpg",
    "lib/assets/1.png",
    "lib/assets/2.jpg",
    "lib/assets/2.jpg"
  ];
  final List<String> text = ["Likes", "Tony", "James", "Jordan"];
  final List<String> chatImages = [
    "lib/assets/40.jpg",
    "lib/assets/2.jpg",
    "lib/assets/1.png",
  ];
  final List<String> chatName = ["Jordan", "Tim", "James"];
  final List<String> chatText = ["Hii!", "Hii!", "Typing..."];
  final List<String> unreadChatCount = ["1", "", " 9 +"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 4.2,
                color: Color.fromARGB(255, 246, 226, 226),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 100,
                            crossAxisCount: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (BuildContext context, _index) {
                            return GridTile(
                              child: Container(
                                // clipBehavior: Clip.hardEdge,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    NewContainer(images: images, index: _index),
                                    Positioned(
                                      top: 119,
                                      left: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              left: 10,
                                              right: 10,
                                              bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                text[_index],
                                              ),
                                              text[_index] != "Likes"
                                                  ? Icon(
                                                      Icons.verified,
                                                      color: Colors.blue,
                                                      size: 14,
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 190,
                left: 60 - 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(width: 0.1),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0.9, 0.0),
                      ),
                    ],
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.3,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset("lib/assets/Vectorsearch.png"),
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: chatImages.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.1),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(chatImages[index]),
                        ),
                        title: chatName[index] == "James"
                            ? Text(chatName[index])
                            : Row(
                                children: [
                                  Text(chatName[index] + " "),
                                  Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                    size: 13,
                                  ),
                                ],
                              ),
                        subtitle: Text(
                          chatText[index],
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: chatText[index] == "Typing..."
                                    ? Colors.red
                                    : Colors.black),
                          ),
                        ),
                        trailing: Column(
                          children: [
                            Text("13:10"),
                            SizedBox(
                              height: 3,
                            ),
                            unreadChatCount[index] == ""
                                ? Text("")
                                : CircleAvatar(
                                    radius: 8,
                                    child: Text(
                                      unreadChatCount[index],
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.pink,
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  List<String> images;
  int index;
  NewContainer({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            child: index == 0
                ? Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          images[index],
                        ),
                      ),
                      Container(
                        child: Positioned(
                          top: 55,
                          left: 35,
                          child: Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "20",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Image.asset(
                    images[index],
                  )),
      ],
    );
  }
}
