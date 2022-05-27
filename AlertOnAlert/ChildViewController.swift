//
//  ChildViewController.swift
//  AlertOnAlert
//
//  Created by GIGL iOS on 27/05/2022.
//

import UIKit

class ChildViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let dataArray = ["English", "Maths", "History", "German", "Science"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        createTheView()
        activateConstraint()
        picker.delegate = self as UIPickerViewDelegate
        picker.dataSource = self as UIPickerViewDataSource
        categoryTextField.inputView = picker
    }
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let contentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemGray2
        container.clipsToBounds = true
        container.layer.cornerRadius = 15
        container.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return container
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select category of item"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(didTapOkButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let categoryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.setPaddingPoints(20)
        textField.placeholder = "Pick category"
        textField.autocorrectionType = .no
        textField.addTarget(ChildViewController.self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            instructionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            instructionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            categoryTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 25),
            categoryTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryTextField.heightAnchor.constraint(equalToConstant: 40),
            categoryTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            
            picker.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 20),
            picker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            picker.heightAnchor.constraint(equalToConstant: 120),
            picker.widthAnchor.constraint(equalTo: categoryTextField.widthAnchor),
            
            okButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 20),
            okButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            okButton.widthAnchor.constraint(equalToConstant: 60),
            okButton.heightAnchor.constraint(equalToConstant: 30),
            
            cancelButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 60),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    
    private func createTheView() {
        view.addSubview(contentView)
        contentView.addSubview(picker)
        contentView.addSubview(okButton)
        contentView.addSubview(cancelButton)
        contentView.addSubview(instructionLabel)
        contentView.addSubview(categoryTextField)
    }
    
    @objc func didTapOkButton(_ sender: Any) {
        print("ok tapped")
    }
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func textFieldDidChange() {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextField.text = dataArray[row]
    }
}

extension UITextField {
    func setPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
