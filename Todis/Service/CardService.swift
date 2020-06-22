//
//  CardServices.swift
//  Todis
//
//  Created by c.pabon.cuellar on 16/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public class CardService{
    //Cards list
    private let cards = [Card(title: "Todos", desc: "¡Todos toman!", play : "¡Juega el mismo jugador!"),
                 Card(title: "Obligado", desc: "¡Elige quien toma!", play : "¡Juega el mismo jugador!"),
                 Card(title: "Derecha", desc: "¡Toma tu derecha!", play : "¡Juega el mismo jugador!"),
                 Card(title: "Izquierda", desc: "¡Toma tu izquierda!", play : "¡Juega el mismo jugador!"),
                 Card(title: "Solo", desc: "¡Tomas solo!", play : "¡Juega el mismo jugador!"),
                 Card(title: "Siguiente", desc: "¡Nadie toma!", play : "¡Siguiente jugador!"),
                 Card(title: "Siguiente", desc: "¡Nadie toma!", play : "¡Siguiente jugador!"),
                 Card(title: "Siguiente", desc: "¡Nadie toma!", play : "Siguiente jugador")
    ]
    
    //LINK
    //https://flatuicolors.com/palette/defo
    private let cardBackgrounds = [0x1abc9c,0x2ecc71,0x3498db,0x9b59b6,0x34495e,0x16a085,0x27ae60,0x2980b9,0x8e44ad,0x2c3e50,0xf1c40f,0xe67e22,0xe74c3,0x95a5a6,0xf39c12,0xd35400,0xc0392b,0xbdc3c7,0x7f8c8d]
    
    func showCard() -> Card {
        let num = Int.random(in: 0...7)
        let cardsShuffled = cards.shuffled()
        return cardsShuffled[num]
    }
    
    func showBackground() -> Int {
        let num = Int.random(in: 0...18)
        let cardsShuffled = cardBackgrounds.shuffled()
        return cardsShuffled[num]
    }
    
  
}
