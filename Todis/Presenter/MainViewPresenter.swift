//
//  MainViewPresenter.swift
//  Todis
//
//  Created by c.pabon.cuellar on 16/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public protocol MainViewDelegate: AnyObject {
    func startBackgroundColor(color: Int)
    func cardAnimation(timeDuration: TimeInterval)
    func cardBackgroundAnimation(background: Int)
    func displayCardSelected(cardTitle: String,cardDesc: String,cardPlay: String)
    func disableButton()
    func enabledButton()
}

public class MainViewPresenter {

    //Creamos la variable que va recibir el presenter
    private let CardService: CardService
    weak private var MainViewDelegate : MainViewDelegate?
    private var contador: Int = 0
    private var rollTodis : Timer?
    private var time : Double = 0.25
    
    init(CardService: CardService) {
        self.CardService = CardService
    }
    
    //Actualiza el codigo de las funciones protocol "MainViewDelegate"
    func setViewDelegate(MainViewDelegate:MainViewDelegate?){
        self.MainViewDelegate = MainViewDelegate
    }
    
    func setBackgroundColor(){
        let color = self.CardService.showBackground()
        self.MainViewDelegate?.startBackgroundColor(color: color)
    }
    
    @objc func shuffleCard(){
        
        let cardSelected = self.CardService.showCard()
        let cardBackground = self.CardService.showBackground()
        
        self.MainViewDelegate?.cardAnimation(timeDuration: TimeInterval(time))
        self.MainViewDelegate?.cardBackgroundAnimation(background: cardBackground)
        guard let title = cardSelected.title else { return }
        guard let desc = cardSelected.desc else { return }
        guard let play = cardSelected.play else { return }
        self.MainViewDelegate?.displayCardSelected(cardTitle: title,cardDesc: desc,cardPlay: play)
        if contador == 6 {
            contador = 0
            endShuffleCards()
            time = 0.20
        }

        contador+=1
        time = time + 0.05
        print("tiempo: \(time)")
    }
    
    func playTodis() {
        print("Inicia el juego!")
        shuffleCards()
    }
    
    func shuffleCards(){
        print("Mezclando cartas..")
//        shuffleCard()
        self.MainViewDelegate?.disableButton()
        rollTodis = Timer.scheduledTimer(timeInterval: (TimeInterval(self.time)), target: self, selector: #selector(shuffleCard), userInfo: nil, repeats: true)
    }
    
    func endShuffleCards(){
        print("Fin de seleccion de cartas..")
        rollTodis?.invalidate()
        self.MainViewDelegate?.enabledButton()
    }
}
