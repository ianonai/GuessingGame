//
//  ViewController.swift
//  Iano_GuessingGame
//
//  Created by Iano Francisco on 2020-10-24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    var gamesplayed=0
    var attempts=5
    var randomNum=Int(arc4random())%25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Button1(_ sender: Any) {
        //if guess is empty
        if guessField.text == nil{
            
        }
        else{
            let answer:Int!=Int(guessField.text!)
            //if answer is correct
            if answer==randomNum{
                attempts=5
                Label1.text="\(attempts) Attempts Left"
                Label2.text="Hint:"
                guessField.text=""
                randomNum=Int(arc4random())%25
                
                let alert=UIAlertController(title: "YOU WIN!!!", message: "New Game?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{action in print("tapped Dismiss")}))
                present(alert,animated: true)
            }
            //if answer is wrong
            else{
                if attempts>1{
                    attempts-=1
                    Label1.text="\(attempts) Attempts Left"
                    if answer > randomNum{
                        Label2.text="Hint: TOO HIGH"
                    }
                    else{
                        Label2.text="Hint: TOO LOW"
                    }
                }
                //ran out of attempts
                else{
                    attempts=5
                    Label1.text="\(attempts) Attempts Left"
                    Label2.text="Hint:"
                    guessField.text=""
                    randomNum=Int(arc4random())%25
                    
                    let alert=UIAlertController(title: "YOU LOSE!", message: "New Game?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{action in print("tapped Dismiss")}))
                    present(alert,animated: true)
                }
            }
        }
    }

}

