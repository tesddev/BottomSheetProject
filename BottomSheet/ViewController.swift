//
//  ViewController.swift
//  AlertOnAlert
//
//  Created by GIGL iOS on 27/05/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ChildViewControllerDelegate {
    var value: String = ""
    let child = ChildViewController()
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var pressMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("->>>\(value)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(">>>\(value)")
    }
    
    @IBAction func pressMeButtonPressed(_ sender: Any) {
        print("press me Button Tapped")
        let vc = ChildViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @IBAction func topButtonPressed(_ sender: Any) {
        
        if value != "" {
            moveToNextViewController()
        } else {
            let vc = ChildViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
        print("top pressed")
    }
    
    func moveToNextViewController() {
        let vc = NextViewController()
        print(value)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

