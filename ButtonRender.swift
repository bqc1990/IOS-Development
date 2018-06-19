//
//  ButtonRender.swift
//  Set
//
//  Created by Qichang Bao on 6/19/18.
//  Copyright © 2018 Qichang Bao. All rights reserved.
//

import Foundation
import UIKit
class ButtonRender{
    private static func getSymbol(ofCard card:PlayingCard) ->String{
        switch card.symbol{
        case .diamond:
            return "▲"
        case .oval:
            return "●"
        case .squiggle:
            return "■"
     
        }
    }
    private static func getColor(ofCard card:PlayingCard) ->UIColor{
        switch card.color {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .purple:
            return UIColor.purple
        }
    }
    private static func getButtonTitle(ofCard card:PlayingCard, withSymbol symbol:String) ->String{
        switch card.number {
        case .one:
            return symbol
        case .two:
            return "\(symbol)\(symbol)"
        case .three:
            return "\(symbol)\(symbol)\(symbol)"
        }
    }
    private static func getAttributedTitle(ofCard card:PlayingCard, withTitle title:String, withColor color:UIColor) ->NSAttributedString{
        var attributes:[NSAttributedString.Key:Any] = [:]
        switch card.shading {
        case .open:
            attributes[.strokeWidth] = 4.0
            attributes[.foregroundColor] = color
        case .solid:
            attributes[.strokeWidth] = -4.0
            attributes[.foregroundColor] = color
        case .striped:
            attributes[.strokeWidth] = -4.0
            attributes[.foregroundColor] = color.withAlphaComponent(0.35)
            
        }
        return NSAttributedString(string: title, attributes: attributes)
    }
    static func renderButton(ofCard card:PlayingCard,onButton button:UIButton, _ isSelect:Bool, _ isSet:Bool){
        let symbol = getSymbol(ofCard: card)
        let color = getColor(ofCard: card)
        let title = getButtonTitle(ofCard: card, withSymbol: symbol)
        let attributedTitle = getAttributedTitle(ofCard: card, withTitle: title, withColor: color)
        button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        if isSelect{
            if isSet{
                button.select(borderColor:#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))
            }else{
                button.select()
            }
        }else{
            button.deselect()
        }
    }
}


extension UIButton{
    func select(borderColor:UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)){
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 4.0
    }
    func deselect(){
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
