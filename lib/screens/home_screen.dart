import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;

  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          title: Text('TicTacToe'),
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              getScoreBorad(),
              SizedBox(
                height: 40,
              ),
              getGridView(),
              getTurn(),
            ],
          ),
        ));
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                xOrOList[index],
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    print('$index');
    setState(() {
      if (isTurnO && xOrOList[index] == '') {
        xOrOList[index] = 'O';
        isTurnO = false;
      }

      if (!isTurnO && xOrOList[index] == '') {
        xOrOList[index] = 'X';
        isTurnO = true;
      }
    });
  }

  Widget getScoreBorad() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player O',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player X',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
