import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  List<int> data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  bool isMoreLoading = false;

  void addData() {
    Future.delayed(const Duration(seconds: 2), () {
      int dataLength = data.length;
      for (int i = dataLength; i < dataLength + 5; i++) {
        data.add(i);
      }
      if(mounted) {
        setState(() => data = data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (index >= data.length) {
            addData();  
            return Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text("Loading..."),
            );
          }
          return HomeListViewItemWidget(
            color: index % 2 == 0 ? Colors.amber : Colors.blueGrey,
            width: width,
            item: data[index],
          );
        },
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

class HomeListViewItemWidget extends StatelessWidget {
  final MaterialColor color;
  final int item;
  final double width;
  const HomeListViewItemWidget({Key? key, required this.color, required this.item, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = "https://media.istockphoto.com/vectors/unicorn-face-cute-clipart-vector-isolated-vector-id1206701951?k=20&m=1206701951&s=612x612&w=0&h=4epRJsFRmaoqcxjzgAD3tR8HvxFukBoRGr50xIoipnw=";
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: width,
            child: Image.network(imgUrl),
          ),
          Text(item.toString()),
        ],
      )
    );
  }
  
}