import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:word_search_game/searchPage.dart';

class GridPage extends StatefulWidget {
  final int row;
  final int col;
  GridPage({super.key, required this.row, required this.col});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late int r, c;
  late var twoDList;
  @override
  void initState() {
    r = widget.row;
    c = widget.col;
    twoDList = List.generate(r, (i) => List.filled(c, "", growable: false), growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid formation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: r,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(
                    r * c,
                    (index) {
                      return Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          initialValue: twoDList[index - ((index / r).floor() * r)][(index / r).floor()],
                          onChanged: (value) {
                            twoDList[index - ((index / r).floor() * r)][(index / r).floor()] = value;
                          },
                        ),
                        // "${index - ((index / r).floor() * r)},${(index / r).floor()}",
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SearchPage(
                                    twoDList: twoDList,
                                    row: r,
                                    col: c,
                                  ))));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Form Grid",
                        style: TextStyle(fontSize: 25),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
