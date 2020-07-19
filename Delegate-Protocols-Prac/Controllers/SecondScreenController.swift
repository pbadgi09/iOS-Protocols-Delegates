//
//  SecondScreenController.swift
//  Delegate-Protocols-Prac
//
//  Created by Pranav Badgi on 23/04/20.
//  Copyright © 2020 Pranav Badgi. All rights reserved.
//

import UIKit

//protocol to send to the first screen

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}



class SecondScreenController: UIViewController {
    
    //now create a var for this protocol
    var selectionDelegate: SideSelectionDelegate!
    
    
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Choose Your Side"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .yellow
        return label
    }()

    
    private let imperialButtonTapped: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "imperial"), for: .normal)
        button.addTarget(self, action: #selector(handleButton1), for: .touchUpInside)
        return button
    }()
    
    private let rebelButtonTapped: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "rebel"), for: .normal)
        button.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func handleButton1() {
        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleButton2() {
        selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Sky Walker", color: .cyan)
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI() {
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        view.addSubview(imperialButtonTapped)
        imperialButtonTapped.centerX(inView: view)
        imperialButtonTapped.setDimensions(height: 140, width: 140)
        imperialButtonTapped.anchor(top: titleLabel.bottomAnchor, paddingTop: 32)
        view.addSubview(rebelButtonTapped)
        rebelButtonTapped.centerX(inView: view)
        rebelButtonTapped.setDimensions(height: 140, width: 140)
        rebelButtonTapped.anchor(top: imperialButtonTapped.bottomAnchor, paddingTop: 32)
        
    }
    
}

//steps:
//1. in boss screen create a protocol
//2. create a variable for the protocol delegate
//3. wherever we need to use call the protocol for eg. in this case
//   whenever the buttons are clicked
//4. Go to intern page or where you want to use this information
//5. confrom to self
//6. create extension and use that function.
