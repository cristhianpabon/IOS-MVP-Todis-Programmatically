//
//  ViewController.swift
//  Todis
//
//  Created by c.pabon.cuellar on 15/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController, MainViewDelegate{
    
    var presenter: MainViewPresenter = MainViewPresenter(CardService: CardService())
    //MARK: UI components
    private lazy var superCard: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0x005580)
        return view
    }()
    
    private lazy var logoImage : UIImageView = {
        let image = UIImage(named: String.logoImageText)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleImage : UIImageView = {
        let image = UIImage(named: String.titleImageText)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.center = self.view.center //A revisar
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cardComponent : CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundButton : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0x005580)
        view.layer.cornerRadius = 8.4
        return view
    }()
    
    private lazy var playButton : UIButton = {
        let image = UIImage(named: String.imageButton) as UIImage?
        let button = UIButton()
        button.setImage( image , for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapHelpButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(MainViewDelegate: self)
        presenter.setBackgroundColor()
        setUpView()
    }
    
    //MARK: Events
    @objc func didTapHelpButton(_ button: UIButton){
        presenter.playTodis()
    }
    
    //MARK: Delegate Methods
    func startBackgroundColor(color: Int) {
        superCard.backgroundColor = UIColor(rgb: color)
        backgroundButton.backgroundColor = UIColor(rgb: color)
    }
    
    func cardAnimation(timeDuration: TimeInterval){
        superCard.flipFromLeft(withDuration: timeDuration)
    }
    
    func cardBackgroundAnimation(background: Int) {
        superCard.backgroundColor = UIColor(rgb: background)
        backgroundButton.backgroundColor = UIColor(rgb: background)
    }
    
    func displayCardSelected(cardTitle: String,cardDesc: String,cardPlay: String) {
        cardComponent.setTitleCardLabel(text: cardTitle)
        cardComponent.setDescriptionCardLabel(text: cardDesc)
        cardComponent.setPlayCardLabel(text: cardPlay)
    }
    
    func enabledButton() {
        playButton.isEnabled = true
    }
    
    func disableButton() {
        playButton.isEnabled = false
    }
}

extension MainViewController: ProgrammaticallyLayoutable {

    //MARK: Programmatically
    func buildViewHierarchy() {
        view.addSubview(superCard)
        superCard.addSubview(logoImage)
        superCard.addSubview(titleImage)
        superCard.addSubview(cardComponent)
        superCard.addSubview(backgroundButton)
        backgroundButton.addSubview(playButton)
    }

    func setUpConstraints() {
        setUpSuperCard()
        setUpLogoImage()
        setUpTitleImage()
        setUpCardComponent()
        setUpBackgroundButton()
        setUpPlayButton()
    }

    func setUpAdditionalConfigs() {
        setUpViewBackground()
    }
    
    //MARK: Constraints Methods
    func setUpSuperCard(){
        superCard.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        superCard.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        superCard.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        superCard.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func setUpLogoImage(){
        let topConstant = self.view.frame.size.height * 0.048
        logoImage.topAnchor.constraint(equalTo: superCard.topAnchor, constant: topConstant).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: superCard.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setUpTitleImage(){
        titleImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor).isActive = true
        titleImage.centerXAnchor.constraint(equalTo: superCard.centerXAnchor, constant: 7).isActive = true
        titleImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpCardComponent(){
        cardComponent.heightAnchor.constraint(equalTo: superCard.heightAnchor, multiplier: 0.70).isActive = true
        cardComponent.centerYAnchor.constraint(equalTo: superCard.centerYAnchor).isActive = true
        cardComponent.leadingAnchor.constraint(equalTo: superCard.leadingAnchor, constant: 20).isActive = true
        cardComponent.trailingAnchor.constraint(equalTo: superCard.trailingAnchor, constant: -20).isActive = true
        cardComponent.bottomAnchor.constraint(equalTo: superCard.bottomAnchor).isActive = true
    }
    
    func setUpBackgroundButton(){
        backgroundButton.bottomAnchor.constraint(equalTo: superCard.bottomAnchor, constant: -50).isActive = true
        backgroundButton.centerXAnchor.constraint(equalTo: superCard.centerXAnchor).isActive = true
        backgroundButton.heightAnchor.constraint(equalToConstant: 260).isActive = true
        backgroundButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
    }
    
    func setUpPlayButton(){
//        let heightConstant = self.view.frame.size.height * 0.032
        playButton.centerYAnchor.constraint(equalTo: backgroundButton.centerYAnchor).isActive = true
        playButton.centerXAnchor.constraint(equalTo: backgroundButton.centerXAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    //MARK: Additional Method Configs
    func setUpViewBackground(){
        view.backgroundColor = .white
    }
}

fileprivate extension String {
    static let logoImageText = "beer"
    static let titleImageText = "logo"
    static let imageButton = "beerButton"
}
