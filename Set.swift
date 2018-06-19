//
//  Set.swift
//  Set
//
//  Created by Qichang Bao on 6/19/18.
//  Copyright © 2018 Qichang Bao. All rights reserved.
//

import Foundation
struct Set {
    var cardsInDeck = [PlayingCard]()
    var cardsInGame = [PlayingCard]()
    var cardsInSelect = [PlayingCard]()
    var score = 0
    
    init(){
       newGame()
    }
    private mutating func generateCardsInDeck(){
        for num in Number.all{
            for sha in Shading.all{
                for col in Color.all{
                    for sym in Symbol.all{
                        let card = PlayingCard(number: num, shading: sha, color: col, symbol: sym)
                        cardsInDeck.append(card)
                    }
                }
            }
        }
    }
    
    mutating func addCardsInGame(withQuality quality:Int){
        for _ in 0..<quality{
            addCard()
        }
    }
    private mutating func addCard(){
        let card = cardsInDeck.remove(at: cardsInDeck.count.arc4)
        cardsInGame.append(card)
    }
    mutating func cardIsSelect(_ card:PlayingCard) ->Bool{
        return cardsInSelect.contains(card)
        
    }
    mutating func select(at index:Int){
        
        if index >= cardsInGame.count{
            return
        }
        
        if cardsInSelect.count == 3 && isSet(){
            print("I am here")
            for card in cardsInSelect{
                if let indexInGame = cardsInGame.firstIndex(of: card){
                    cardsInGame.remove(at: indexInGame)
                    if cardsInDeck.count > 0{
                        let newCard = cardsInDeck.remove(at: cardsInDeck.count.arc4)
                        cardsInGame.insert(newCard, at: indexInGame)
                    }
                }
            }
            score += 3
            cardsInSelect.removeAll()
        }else if cardsInSelect.count == 3 && !isSet(){
            score -= 1
            cardsInSelect.removeAll()
            
        }
        
        if let indexInSelect = cardsInSelect.firstIndex(of: cardsInGame[index]){
            cardsInSelect.remove(at: indexInSelect)
        }else{
            cardsInSelect.append(cardsInGame[index])
        }
        
    }
    func isSet() ->Bool{
        if cardsInSelect.count != 3{
            return false
        }
        
        if cardsInSelect[0].color == cardsInSelect[1].color{
            if cardsInSelect[0].color != cardsInSelect[2].color{
                return false
            }
        }else{
            if cardsInSelect[0].color == cardsInSelect[2].color{
                return false
            }
            if cardsInSelect[1].color == cardsInSelect[2].color{
                return false
            }
        }
        
        if cardsInSelect[0].number == cardsInSelect[1].number{
            if cardsInSelect[0].number != cardsInSelect[2].number{
                return false
            }
        }else{
            if cardsInSelect[0].number == cardsInSelect[2].number{
                return false
            }
            if cardsInSelect[1].number == cardsInSelect[2].number{
                return false
            }
        }
        if cardsInSelect[0].symbol == cardsInSelect[1].symbol{
            if cardsInSelect[0].symbol != cardsInSelect[2].symbol{
                return false
            }
        }else{
            if cardsInSelect[0].symbol == cardsInSelect[2].symbol{
                return false
            }
            if cardsInSelect[1].symbol == cardsInSelect[2].symbol{
                return false
            }
        }
        
        if cardsInSelect[0].shading == cardsInSelect[1].shading{
            if cardsInSelect[0].shading != cardsInSelect[2].shading{
                return false
            }
        }else{
            if cardsInSelect[0].shading == cardsInSelect[2].shading{
                return false
            }
            if cardsInSelect[1].shading == cardsInSelect[2].shading{
                return false
            }
        }
        
        return true
    }
    
    mutating func newGame(){
        cardsInDeck.removeAll()
        cardsInGame.removeAll()
        cardsInSelect.removeAll()
        generateCardsInDeck()
        score = 0
        addCardsInGame(withQuality: 12)
    }
}


extension Int{
    var arc4:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}
