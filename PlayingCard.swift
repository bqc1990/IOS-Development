//
//  PlayingCard.swift
//  Set
//
//  Created by Qichang Bao on 6/19/18.
//  Copyright © 2018 Qichang Bao. All rights reserved.
//

import Foundation
struct PlayingCard:Equatable {
    let number:Number
    let shading:Shading
    let color:Color
    let symbol:Symbol
    
    static func ==(lhs:PlayingCard,rhs:PlayingCard) ->Bool{
        return lhs.color == rhs.color && lhs.number == rhs.number && lhs.shading == rhs.shading && lhs.symbol == rhs.symbol
    }
}

enum Number{
    case one
    case two
    case three
    static let all = [one,two,three]
}
enum Shading {
    case open
    case striped
    case solid
    static let all = [open,striped,solid]
}
enum Color {
    case red
    case green
    case purple
    static let all = [red,green,purple]
}
enum Symbol {
    case diamond
    case oval
    case squiggle
    static let all = [diamond,oval,squiggle]
}
