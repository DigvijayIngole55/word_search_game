import 'package:flutter/material.dart';
import 'package:word_search_game/homePage.dart';
import 'package:word_search_game/wordSearch.dart';

class SearchPage extends StatefulWidget {
  var twoDList;
  int row;
  int col;
  SearchPage({super.key, @required this.twoDList, required this.row, required this.col});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String word;
  late List hlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search the word"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: widget.row,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(
                  widget.row * widget.col,
                  (index) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: hlist.contains(index) ? Colors.blue : Colors.black26,
                        ),
                        child: Text(
                          widget.twoDList[index - ((index / widget.row).floor() * widget.row)][(index / widget.row).floor()],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(hintText: "Word to be searched"),
                onChanged: (value) {
                  word = value;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hlist = SearchWord(widget.twoDList, word, widget.row, widget.col);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomePage())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                      child: Text(
                        "Reset",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
