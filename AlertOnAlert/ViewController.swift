//
//  ViewController.swift
//  AlertOnAlert
//
//  Created by GIGL iOS on 27/05/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var pressMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print("loaded")
    }
    
    @IBAction func pressMeButtonPressed(_ sender: Any) {
        print("Text Button Tapped")
        let vc = ChildViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @IBAction func topButtonPressed(_ sender: Any) {
        print("top pressed")
    }
}

