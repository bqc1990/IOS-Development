//
//  ViewController.swift
//  Set
//
//  Created by Qichang Bao on 6/19/18.
//  Copyright © 2018 Qichang Bao. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var deal3MoreButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func chosseCard(_ sender: UIButton) {
        if let buttonIndex = buttons.firstIndex(of: sender){
            if buttonIndex < game.cardsInGame.count{
                game.select(at: buttonIndex)
            }
            updateViewFromModel()
        }else{
            print("buttons are not set")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        newGame()
    }
    
    @IBAction func deal3MoreCards(_ sender: UIButton) {
        if game.cardsInGame.count >= 24{
            deal3MoreButton.isEnabled = false
            return
        }
        
        game.addCardsInGame(withQuality: 3)
        resetButton()
        updateViewFromModel()
    }
    
    var game = Set()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetButton()
        updateViewFromModel()
    }
    func newGame(){
        deal3MoreButton.isEnabled = true
        game = Set()
        resetButton()
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
        scoreLabel.text = "score: \(game.score)"
        var buttonIndex = 0
        for card in game.cardsInGame{
            ButtonRender.renderButton(ofCard: card, onButton: buttons[buttonIndex],game.cardIsSelect(card),game.isSet())
            buttonIndex += 1
        }
        
    }
    func resetButton(){
        for buttonIndex in buttons.indices {
            let button = buttons[buttonIndex]
            button.deselect()
            button.layer.cornerRadius = 8
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0)
            button.layer.borderColor =  #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.setAttributedTitle(nil, for: UIControl.State.normal)
        }
    }


}

