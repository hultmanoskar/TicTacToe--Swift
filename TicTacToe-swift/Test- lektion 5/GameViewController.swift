


import UIKit


let GAME_CONTINUE = 0
let RESULT_PLAYER1 = 1
let RESULT_PLAYER2 = 2
let RESULT_DRAW = 3
let CELL_BUSY = 4
let END_GAME = 5

var currentTurn = 1

var firstPlay: Bool = false

var gameStatus = GAME_CONTINUE

var myBoard = [0,0,0,0,0,0,0,0,0]

var playerName1: String = ""
var playerName2: String = ""

var score1 = 0
var score2 = 0

var strScore1 = String(score1)
var strScore2 = String(score2)

class GameViewController: UIViewController {
    
    @IBOutlet weak var lblTurn: UILabel!
    @IBOutlet weak var lblPlayer1: UILabel!
    @IBOutlet weak var lblPlayer2: UILabel!
    
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblScore1: UILabel!
    @IBOutlet weak var lblScore2: UILabel!
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var backgroundGradientView: UIView!
    
    var playerName1: String!
    var playerName2: String!
   
   
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
       
        
        lblTurn.text = "X"
        
        lblPlayer1.text = playerName1
        lblPlayer2.text = playerName2
    
    }
    func addBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 130/255, green: 40/255, blue: 40/255, alpha: 80).cgColor]
        gradientLayer.shouldRasterize = true
        backgroundGradientView.layer.addSublayer(gradientLayer)
    }

    
    func endGame(result: Int) -> Int {
        switchPlayer()
        gameStatus = result
        return result
    }
    
    func switchPlayer() {
        
        if currentTurn == 2 {
            currentTurn = 1
        } else {
            currentTurn = 2
            }
        }
    
    func addMove(position: Int) -> Int {
        
        // Check if game is active
        if gameStatus != GAME_CONTINUE {
            return gameStatus
        }
        

        if myBoard[position] != 0 {
            return CELL_BUSY
        }
        
        myBoard[position] = currentTurn
        
        let result = checkWin()
        
        // We have a winner
        if result != GAME_CONTINUE {
            return endGame(result: result)
        }
        switchPlayer()
        
        return GAME_CONTINUE
    }
    
    
    
    
    func checkWin() -> Int {
        
        // Row 1
        if myBoard[0] == myBoard[1] && myBoard[0] == myBoard[2] && myBoard[0] != 0 {
            print("Row 1")
            print(myBoard)
            return myBoard[0]
            
        }
        // Row 2
        if myBoard[3] == myBoard[4] && myBoard[3] == myBoard[5] && myBoard[3] != 0 {
            print("Row 2")
            print(myBoard)
            return myBoard[3]
           
       }
        // Row 3
        if myBoard[6] == myBoard[7] && myBoard[6] == myBoard[8] && myBoard[6] != 0 {
            print("Row 3")
            print(myBoard)
            return myBoard[6]
            
       }
        // Column 1
        if myBoard[0] == myBoard[3] && myBoard[0] == myBoard[6] && myBoard[0] != 0 {
            print("Column 1")
            print(myBoard)
            return myBoard[0]
            
       }
        // Column 2
        if myBoard[1] == myBoard[4] && myBoard[1] == myBoard[7] && myBoard[1] != 0 {
            print("Column 2")
            print(myBoard)
            return myBoard[1]
           
       }
        // Column 3
        if myBoard[2] == myBoard[5] && myBoard[2] == myBoard[8] && myBoard[2] != 0 {
            print("Column 3")
            return myBoard[2]
            
       }
        // Diagonal 1
        if myBoard[0] == myBoard[4] && myBoard[0] == myBoard[8] && myBoard[0] != 0 {
            print("Diagonal 1")
            return myBoard[0]
           
       }
        // Diagonal 2
        if myBoard[2] == myBoard[4] && myBoard[2] == myBoard[6] && myBoard[2] != 0 {
            print("Diagonal 2")
            return myBoard[2]
       }
        // Draw
        if myBoard[0] != 0 && myBoard[1] != 0 && myBoard[2] != 0 && myBoard[3] != 0 && myBoard[4] != 0 && myBoard[5] != 0 && myBoard[6] != 0 && myBoard[7] != 0 && myBoard[8] != 0 {
            return RESULT_DRAW
       }
        return 0
    }
    
    
    
   
  
    func setMarker(_ sender: UIButton) {
        
        if currentTurn == 1 {
            lblTurn.text = "X"
            sender.setTitle("O", for: .normal)
            sender.tintColor = .red
            
        
       } else if currentTurn == 2 {
        lblTurn.text = "O"
        sender.setTitle("X", for: .normal)
            sender.tintColor = .systemBlue
        }
        
    }
    
    func stopMarker1(_ sender: UIButton) {
        
        currentTurn = 0
    }
    
    func resetGame(_ sender: UIButton) {

        for button in buttons {
            button.setTitle("", for: .normal)

        }
        gameStatus = GAME_CONTINUE
        myBoard = [0,0,0,0,0,0,0,0,0]
        currentTurn = 1
        print("New Game")
        
    }
    
    
    
    @IBAction func btnReset(_ sender: UIButton) {
        
        resetGame(sender)
    }
    
    
    @IBAction func boardBtnClick(_ sender: UIButton) {

        let result = addMove(position:sender.tag)
        
//        Alerts --------------- gonna keep work on it, not done yet.
        
        let alert1 = UIAlertController(title: "Congratz!", message:(playerName1) + " has won!", preferredStyle: .alert)
        let alert2 = UIAlertController(title: "Congratz!", message:(playerName2) + " has won!", preferredStyle: .alert)
        let alert3 = UIAlertController(title: "The game is tied!", message: "No winner in this game!", preferredStyle: .alert)

        let retryAction = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default,handler: { (action) -> Void in
            print("button tapped")
         })


        alert1.addAction(retryAction)
        alert2.addAction(retryAction)
        alert3.addAction(retryAction)
        
        
        switch result {
            
        case GAME_CONTINUE:
            print("Game continues")
            setMarker(sender)
            
            
        case RESULT_PLAYER1:
            print("Player 1 has won!")
            print(myBoard)
            setMarker(sender)
            score1 += 1
            lblScore1.text = "\(score1)"
            print(score1)
            btnReset.isHidden = false
            stopMarker1(sender)
            self.present(alert1, animated: true, completion: nil)
            

        case RESULT_PLAYER2:
            print("Player 2 has won!")
            print(myBoard)
            setMarker(sender)
            score2 += 1
            lblScore2.text = "\(score2)"
            btnReset.isHidden = false
            stopMarker1(sender)
            self.present(alert2, animated: true, completion: nil)
            
        case RESULT_DRAW:
            print("It is a draw!")
            setMarker(sender)
            btnReset.isHidden = false
            stopMarker1(sender)
            self.present(alert3, animated: true, completion: nil)
            
        case CELL_BUSY:
            print("The cell you selected is busy")
            
        case END_GAME:
            print("Game is ended!")
            
        default: return
        }
        
    

}
    
    
}
   







