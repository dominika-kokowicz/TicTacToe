//
//  ViewController.swift
//  TicTacToe
//
//  Created by Dominika Kokowicz on 23/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = Player.Crosses
    //Cross always starts first.!
    var noughtsArray: Array = [Int]()
    var crossArray: Array = [Int]()
    
    var winningCombinations: [[Int]] = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var index = 0
    
    lazy var commonElementsCross = crossArray.filter(winningCombinations[index].contains)
    lazy var commonElementsNoughts = noughtsArray.filter(winningCombinations[index].contains)
    
    enum Player {
        case Crosses
        case Noughts
    }
    
    func changePlayer() -> () {
        if currentPlayer == Player.Crosses {
            currentPlayer = Player.Noughts
        } else {
            currentPlayer = Player.Crosses
        }
    }
    
    func checkForWin() {
        for (index, _) in winningCombinations.enumerated() {
        
            let commonElementsCross = crossArray.filter(winningCombinations[index].contains)
            let commonElementsNoughts = noughtsArray.filter(winningCombinations[index].contains)
            
        print(commonElementsCross)
        print(commonElementsNoughts)
            
            if commonElementsCross.count == 3  {
                print("Crosses won")
                gameEnded()
            }
            if commonElementsNoughts.count == 3 {
                print("Noughts won")
                gameEnded()
            }
           
        }
    }
    
    
    @IBOutlet var crossOrNoughtButton: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if currentPlayer == Player.Crosses {
    
           
            sender.setBackgroundImage(UIImage(named: "X.png"), for: .normal)
            sender.adjustsImageWhenDisabled = false
            sender.isEnabled = false
            crossArray.append(sender.tag)
            print("Cross array is \(crossArray)")
            checkForWin()
            
        
        } else {
            currentPlayer = Player.Noughts
            sender.setBackgroundImage(UIImage(named: "O.png"), for: .normal)
            sender.adjustsImageWhenDisabled = false
            sender.isEnabled = false

            noughtsArray.append(sender.tag)
            print("Noughts array is \(noughtsArray)")

            checkForWin()
      
        }
        changePlayer()
        print("Current player is \(currentPlayer)")
        checkForWin()
    }
    
    func gameEnded() -> () {
        let alert = UIAlertController(title: "Game Ended", message: "\(currentPlayer) won!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Everything loaded")


            }


}

