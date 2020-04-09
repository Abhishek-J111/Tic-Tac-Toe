import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {

  // TODO: Link up images
  AssetImage cross= AssetImage("images/cross.png");
  AssetImage circle= AssetImage("images/circle.png");
  AssetImage edit= AssetImage("images/edit.png");

  bool isCross=true;
  String message;
  List <String> gameState;


  //TODO: initialize the state of box with empty
  @override
  void initState()  {
    super.initState();
    setState(() {
      this.gameState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      

      ];
      this.message="";

    });
  }
  



  //TODO: Reset game method
  resetGame() {
     setState(() {
      this.gameState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty","empty","empty","empty","empty","empty","empty",

      ];
      this.message="";

  });
  }


  //TODO: get image method
   getImage(String value)
   {
     switch (value) {
       case ('empty'):
        return edit;
        break;

       case ('circle'):
        return circle;
        break;

       case('cross'):
         return cross;
         break;
         
     }
   }                                                                                                           
  //TODO: playGame method

playGame(int index)
{
  if(this.gameState[index]=='empty'){
    setState(() {
      if(this.isCross){
        this.gameState[index] ='cross';
      }
      else
     { this.gameState[index]='circle';
      
      }
      this.checkWin();
      this.isCross= !this.isCross;
      });
  }
}





  //TODO: Check for win logic

checkWin() {
  if ((gameState[0] != 'empty') &&
      (gameState[0]== gameState[1]) &&
      (gameState[1] == gameState[2])&&
      (gameState[2])== gameState[3])
{
        setState((){
        this.message = '${this.gameState[0]} wins';

      });

}

else if((gameState[4] != 'empty') &&
      (gameState[4]== gameState[5]) &&
      (gameState[5] == gameState[6]) &&
      gameState[6]== gameState[7])
     { setState(() {
        this.message = '${this.gameState[3]} wins';

      });
}

else if((gameState[8] != 'empty') &&
      (gameState[8]== gameState[9]) &&
      (gameState[9] == gameState[10])&&
      (gameState[10]== gameState [11]))
     { setState(() {
        this.message = '${this.gameState[6]} wins';

      });
}

else if((gameState[3] != 'empty') &&
      (gameState[3]== gameState[4]) &&
      (gameState[4] == gameState[5]))
     { setState(() {
        this.message = '${this.gameState[3]} wins';

      });
}

else if((gameState[0] != 'empty') &&
      (gameState[0]== gameState[4]) &&
      (gameState[4] == gameState[8])&&
      gameState[8]== gameState[12])
     { setState(() {
        this.message = '${this.gameState[0]} wins';

      });
}

else if((gameState[1] != 'empty') &&
      (gameState[1]== gameState[5]) &&
      (gameState[5] == gameState[9])&&
      (gameState[9]== gameState[13]))
     { setState(() {
        this.message = '${this.gameState[1]} wins';

      });
}

else if((gameState[3] != 'empty') &&
      (gameState[3]== gameState[7]) &&
      (gameState[7] == gameState[11])&&
      (gameState[11] == gameState[15]))
     { setState(() {
        this.message = '${this.gameState[2]} wins';

      });
}

else if((gameState[0] != 'empty') &&
      (gameState[0]== gameState[5]) &&
      (gameState[5] == gameState[10])&&
      (gameState[10] == gameState[15]))
     { setState(() {
        this.message = '${this.gameState[0]} wins';

      });
}

else if((gameState[3] != 'empty') &&
      (gameState[3]== gameState[6]) &&
      (gameState[6] == gameState[9])&&
      (gameState[9]== gameState[12]))
     { setState(() {
        this.message = '${this.gameState[2]} wins';

      });
  }

else if (!gameState.contains('empty'))
{
  setState(() {
    this.message='Game Draw';
  });
}

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),

      ),

      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
          
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),

              itemCount: this.gameState.length,
              itemBuilder: (context,i) => SizedBox(
                height: 100.0,
                width: 100.0,

                child: MaterialButton(
                  onPressed: (){
                    playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              )

              
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),

            child: Text(this.message,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            
          ),
          ),

      MaterialButton(

        color: Colors.purple,
        minWidth: 300.0,
        height: 50.0,
        child: Text('Reset',
        style:TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,


        ),),
        
        onPressed: (){
          this.resetGame();
        },
      )
      ],

      )
    );
  }
}