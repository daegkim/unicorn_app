import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List<int> data = [];
  int selectedIndex = -1;
  bool isInitFinished = false;
  bool isMoreLoading = false;

  final AutoScrollController _autoScrollController = AutoScrollController();
  final ScrollController _scrollController = ScrollController();

  void addData() {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScrollController.scrollToIndex(selectedIndex);
    });

    // final Map arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    // setState(() {
    //   data = [...(arguments["data"] as List<int>)];
    //   selectedIndex = arguments["selectedIndex"] as int;
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /**
     * 이 부분이 매우 위험해보임.
     */
    if (!isInitFinished) {
      final Map arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      setState(() {
        data = [...(arguments["data"] as List<int>)];
        selectedIndex = arguments["selectedIndex"] as int;
      });
      isInitFinished = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _autoScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Detail Screen"),
      ),
      body: ListView.builder(
        controller: _autoScrollController,
        itemCount: data.length + 1,
        itemBuilder: ((context, index) {
          if (index >= data.length && !isMoreLoading) {
            addData();  
            return Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text("Loading..."),
            );
          }
          return AutoScrollTag(
            controller: _autoScrollController,
            key: ValueKey(index),
            index: index,
            child: HomeListViewItemWidget(
              data: data,
              index: index,
              width: width,
            ),
          );
        }),
      ),
    );
  }
}

class HomeListViewItemWidget extends StatelessWidget {
  final List<int> data;
  final int index;
  final double width;
  const HomeListViewItemWidget({Key? key, required this.data, required this.index, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          // height: data[index] % 2 == 0 ? 20 : 100,
          child: Text(data[index].toString()),
        ),
      ],
    );
  }
}
