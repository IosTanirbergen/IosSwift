//
//  ViewController.swift
//  RegistrationForGithub
//
//  Created by Devnull on 6/24/20.
//  Copyright © 2020 Devnull. All rights reserved.
//

import UIKit
fileprivate let size_S : CGFloat = 200
fileprivate let gradientLayer = CAGradientLayer()
class RegistrationViewController: UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           setupGradientLayer()
           setupNotificationObserver()
           setupTopGesture()
           addingOverralStackView()
           viewDidLayoutSubviews()
       }
      lazy var verticalStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
                        userNameTextField,
                         emailTextField,
                         passwordTextField,
                         registrationButton
        ])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 9
        return sv
    }()
    lazy var OverallstackView = UIStackView(arrangedSubviews: [
                   selectImageButton,
                   verticalStackView
    ])
   
    fileprivate func addingOverralStackView() {
             view.addSubview(OverallstackView)
             OverallstackView.axis = .vertical
             OverallstackView.spacing = 8
             OverallstackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 0, right: 50))
             OverallstackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
             OverallstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             OverallstackView.arrangedSubviews[0].layer.cornerRadius = 15
         }
    fileprivate func setupTopGesture(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
    @objc fileprivate func handleTapGesture() {
        self.view.endEditing(true)
    }
    fileprivate func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc fileprivate func handleKeyboardShow(notification : Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = value.cgRectValue
        print(keyboardFrame)
        let bottomSpace = view.frame.height - OverallstackView.frame.origin.y - OverallstackView.frame.height
        print(bottomSpace)
        let diffrence = keyboardFrame.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -diffrence - 10)
    }
    @objc fileprivate func handleKeyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                   self.view.transform = .identity
               })
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    let selectImageButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Photo", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .light)
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.4149784446, green: 0.4487785101, blue: 0.8248928785, alpha: 1), for: .normal)
        button.layer.borderWidth = 4
        button.layer.borderColor = #colorLiteral(red: 0.3531453609, green: 0.3775973618, blue: 0.8729493022, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: size_S).isActive = true
        return button
    }()
    let userNameTextField : CustomTextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Username"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 4
        textField.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.3531453609, green: 0.3775973618, blue: 0.8729493022, alpha: 1)
        return textField
    }()
    let emailTextField : CustomTextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.layer.borderWidth = 4
        textField.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.3531453609, green: 0.3775973618, blue: 0.8729493022, alpha: 1)
        return textField
    }()
    let passwordTextField : CustomTextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.borderWidth = 4
        textField.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.3531453609, green: 0.3775973618, blue: 0.8729493022, alpha: 1)
        return textField
    }()
    var registrationButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("registration", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3531453609, green: 0.3775973618, blue: 0.8729493022, alpha: 1)
        return button
    }()
        // MARK:- Private
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    //background color Gradient Layer
    fileprivate func setupGradientLayer() {
        let topColor = #colorLiteral(red: 0.1431493163, green: 0.8379608989, blue: 0.9435141683, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.529194057, green: 0.4121648669, blue: 0.9077042937, alpha: 1)
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        gradientLayer.locations = [0, 0.7]
        view.layer.addSublayer(gradientLayer)
        
    }
    
 
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
                if self.traitCollection.verticalSizeClass == .compact {
                    OverallstackView.axis = .horizontal
                    OverallstackView.spacing = 8
                    OverallstackView.arrangedSubviews[0].widthAnchor.constraint(equalToConstant: size_S).isActive = true
                    
                    OverallstackView.arrangedSubviews[0].layer.cornerRadius = size_S / 2
                }
                else {
                    OverallstackView.axis = .vertical
                    OverallstackView.spacing = 8
                    OverallstackView.arrangedSubviews[0].layer.cornerRadius = 15
                }
                
            }



}

