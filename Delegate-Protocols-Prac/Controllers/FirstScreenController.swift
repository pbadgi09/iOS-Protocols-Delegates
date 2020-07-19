//
//  FirstScreenController.swift
//  Delegate-Protocols-Prac
//
//  Created by Pranav Badgi on 23/04/20.
//  Copyright © 2020 Pranav Badgi. All rights reserved.
//

import UIKit

class FirstScreenController: UIViewController {
    
    private let goToSecondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Side", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setDimensions(height: 50, width: 80)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(handleIntent), for: .touchUpInside)
        return button
    }()
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private let wallpaper: UIImageView = {
       let wallpaper = UIImageView()
        wallpaper.image = #imageLiteral(resourceName: "logo")
        wallpaper.setHeight(height: 150)
        return wallpaper
    }()
    
    @objc func handleIntent() {
        let controller = SecondScreenController()
        controller.modalPresentationStyle = .fullScreen
        //this is like the intern saying to the boss i'd like to be the intern
        controller.selectionDelegate = self
        self.present(controller, animated: true, completion: nil)
        print("DEBUG: GO to second page here")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        view.addSubview(goToSecondButton)
        goToSecondButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 50, paddingRight: 16)
        
        view.addSubview(wallpaper)
        wallpaper.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 120, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(characterLabel)
        characterLabel.centerX(inView: view)
        characterLabel.anchor(top: wallpaper.bottomAnchor, paddingTop: 32)
    }
    

}


extension FirstScreenController: SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        wallpaper.image = image
        characterLabel.text = name
        view.backgroundColor = color
    }
}
