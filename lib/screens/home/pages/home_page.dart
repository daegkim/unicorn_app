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
    /**
     * setState를 사용하면 에러가 발생함.
     * 근데 사실 setState를 사용할 필요가 없음.
     * 얘를 통해서 렌더링을 새롭게 할 것이 아니기 때문
     */
    isMoreLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      int dataLength = data.length;
      for (int i = dataLength; i < dataLength + 10; i++) {
        data.add(i);
      }
      if(mounted) {
        setState(() => data = data);
        isMoreLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
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
        if (index % 2 == 0) {
          return Row(
            children: [
              HomeListViewItemWidget(
                data: data,
                index: index,
                width: width/2,
              ),
              HomeListViewItemWidget(
                data: data,
                index: index + 1,
                width: width/2,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

class HomeListViewItemWidget extends StatelessWidget {
  final List<int> data;
  final int index;
  final double width;
  const HomeListViewItemWidget({Key? key, required this.data, required this.index, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/itemDetail", 
          arguments: {
            "data": data,
            "selectedIndex": index,
          }
        );
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://newsimg.sedaily.com/2017/04/18/1OEP2BWRPS_1.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(data[index].toString())
        ],
      ),
    );
  }
}
