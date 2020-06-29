//
//  dsa.swift
//  RegistrationForGithub
//
//  Created by Devnull on 6/26/20.
//  Copyright © 2020 Devnull. All rights reserved.
//

import UIKit

class dsa: UIView {
    override init(frame: CGRect) {
        super.init(frame : frame)
        buttons()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buttons() {
        let selectImageButton : UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("Select Photo", for: .normal)
               button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .light)
               button.backgroundColor = .white
               button.setTitleColor(#colorLiteral(red: 0.4149784446, green: 0.4487785101, blue: 0.8248928785, alpha: 1), for: .normal)
               return button
           }()
           let userNameTextField : UITextField = {
               let textField = UITextField()
               textField.placeholder = "Username"
               textField.backgroundColor = .white
               return textField
           }()
           let emailTextField : UITextField = {
               let textField = UITextField()
               textField.placeholder = "Email"
               textField.keyboardType = .emailAddress
               textField.backgroundColor = .white
               return textField
           }()
           let passwordTextField : UITextField = {
               let textField = UITextField()
               textField.placeholder = "Password"
               textField.isSecureTextEntry = true
               textField.backgroundColor = .white
               return textField
           }()
           var registrationButton : UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("registration", for: .normal)
               button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
               button.backgroundColor = .white
               return button
           }()
           
    }
}
