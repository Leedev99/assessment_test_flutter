import 'package:assignment_test/config/config.dart';
import 'package:assignment_test/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var loading = false;
  String _gettype = "getAllItems";
  List<ProductModel> data = [];
  Future<List<ProductModel>> list;
  @override
  void initState() {
    super.initState();
    list = ConfigURL.fetchItem(gettype: _gettype);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Font-End Flutter"),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<ProductModel>>(
            future: list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data;
                return getBody();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator(color: Theme.of(context).primaryColor);
            },
          ),
        ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _popularSection(),
        SizedBox(height: 5),
        _popularItem(),
        SizedBox(height: 5),
        _recommendSection(),
        SizedBox(height: 5),
        _recommendItem(),
        SizedBox(height: 1),
        _allItemSection(),
        _allItems(),
      ],
    );
  }

  Widget _allItems() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: _buildGridList(),
      ),
    );
  }

  Widget _allItemSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "All Items",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _recommendSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommend Item",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => print("See all Recommend Item Click"),
            child: Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
   
  Widget _recommendItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(data.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(data[index].image),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].price,
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                      Text(
                        data[index].name,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _popularSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => print('See all Popular Click'),
            child: Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget _popularItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(data.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(data[index].image),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].price,
                        style: TextStyle(color: Colors.orange, fontSize: 11),
                      ),
                      Text(
                        data[index].name,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  List<Column> _buildGridList() {
    return List.generate(data.length, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 190,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(data[index].image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index].price,
                    style: TextStyle(color: Colors.orange, fontSize: 14)),
                Text(data[index].name,
                    style: TextStyle(fontSize: 14, color: Colors.grey))
              ],
            ),
          )
        ],
      );
    });
  }

  

 
}
