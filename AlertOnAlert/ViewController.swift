//
//  ViewController.swift
//  AlertOnAlert
//
//  Created by GIGL iOS on 27/05/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
//        navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: false)
//        openTextAlert()
    }
    
}

