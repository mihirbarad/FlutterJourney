import 'package:flutter/material.dart';

class Gridview extends StatefulWidget {
  const Gridview({super.key});

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  final List<String> _listItem = [
    'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
    'https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
    'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
    'https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: _listItem
            .map((Item) => Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(Item))),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
