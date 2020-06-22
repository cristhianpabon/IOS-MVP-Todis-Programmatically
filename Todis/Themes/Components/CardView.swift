//
//  CardView.swift
//  Todis
//
//  Created by c.pabon.cuellar on 20/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation
import UIKit

public class CardView: UIView {
    
    //MARK: UI Components
    private lazy var Container: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var LabelsCardStack: UIStackView = {
       let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis  = .vertical
        stackview.distribution  = .fillEqually
        stackview.alignment = .center
        return stackview
    }()
    
    private lazy var TitleCardLabel: UILabel = {
        let label = UILabel()
        label.text = String.titleLabel
        label.font = UIFont.defaultBold.withSize(32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var DescriptionCardLabel: UILabel = {
        let label = UILabel()
        label.text = String.descriptionLabel
        label.textColor = .black
        label.font = UIFont.defaultMedium.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var PlayCardLabel: UILabel = {
        let label = UILabel()
        label.text = String.playLabel
        label.textColor = .black
        label.font = UIFont.defaultSemiBold.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Constructor
    
    public override init(frame: CGRect) {
           super.init(frame: frame)
           setUpView()
       }
       
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:Methods
    
    func setTitleCardLabel(text: String) {
        TitleCardLabel.text = text
    }
    
    func setDescriptionCardLabel(text: String) {
        DescriptionCardLabel.text = text
    }
    
    func setPlayCardLabel(text: String) {
        PlayCardLabel.text = text
    }
}

extension CardView {
    
    //MARK: Programmatically
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    func buildViewHierarchy() {
        addSubview(Container)
        Container.addSubview(LabelsCardStack)
        LabelsCardStack.addArrangedSubview(TitleCardLabel)
        LabelsCardStack.addArrangedSubview(DescriptionCardLabel)
        LabelsCardStack.addArrangedSubview(PlayCardLabel)
    }

    func setUpConstraints() {
        setUpContainer()
        setUpLabelsCardStack()
    }

    func setUpAdditionalConfigs() {
        setUpViewBackground()
    }
    
    //MARK: Constraints Methods
    func setUpContainer(){
        Container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        Container.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        Container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        Container.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    func setUpLabelsCardStack(){
        LabelsCardStack.topAnchor.constraint(equalTo: Container.topAnchor, constant: 30).isActive = true
        LabelsCardStack.trailingAnchor.constraint(equalTo: Container.trailingAnchor, constant: 0).isActive = true
        LabelsCardStack.leadingAnchor.constraint(equalTo: Container.leadingAnchor, constant: 0).isActive = true
    }
    //MARK: Additional Method Configs
    func setUpViewBackground(){
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 8.4
    }
}

fileprivate extension String {
    static let titleLabel = "JUEGA"
    static let descriptionLabel = "¡ Presiona el boton o"
    static let playLabel = " agita el celular !"
}


