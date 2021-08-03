import 'package:assignment_test/screen/menu/cart.dart';
import 'package:assignment_test/screen/menu/home.dart';
import 'package:assignment_test/screen/menu/message.dart';
import 'package:assignment_test/screen/menu/profile.dart';
import 'package:assignment_test/screen/menu/tag.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectIndex = 0;
    int activeTab= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: selectIndex != 0,
            child: TickerMode(
              enabled: selectIndex == 0,
              child: Home(),
            ),
          ),
          Offstage(
            offstage: selectIndex != 1,
            child: TickerMode(
              enabled: selectIndex == 1,
              child: Message(),
            ),
          ),
          Offstage(
            offstage: selectIndex != 2,
            child: TickerMode(
              enabled: selectIndex == 2,
              child: Cart(),
            ),
          ),
          Offstage(
            offstage: selectIndex != 3,
            child: TickerMode(
              enabled: selectIndex == 3,
              child: Tag(),
            ),
          ),
          Offstage(
            offstage: selectIndex != 4,
            child: TickerMode(
              enabled: selectIndex == 4,
              child: Profile(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = 0;
                    activeTab = 0;
                    print(selectIndex);
                  });
                },
                child: Icon(
                  Icons.home,
                   color: activeTab == 0 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = 1;
                    activeTab = 1;
                    print(selectIndex);
                  });
                },
                child: Icon(
                  Icons.forum,
                  color: activeTab == 1 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = 2;
                    activeTab = 2;
                    print(selectIndex);
                  });
                },
                child: Icon(
                  Icons.shopping_cart,
                   color: activeTab == 2 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = 3;
                    activeTab = 3;
                    print(selectIndex);
                  });
                },
                child: Icon(
                  Icons.bookmark,
                   color: activeTab == 3 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = 4;
                    activeTab = 4;
                    print(selectIndex);
                  });
                },
                child: Icon(
                  Icons.person,
                   color: activeTab == 4 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
