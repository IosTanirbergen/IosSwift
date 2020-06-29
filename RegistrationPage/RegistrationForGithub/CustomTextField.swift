//
//  CustomTextField.swift
//  RegistrationForGithub
//
//  Created by Devnull on 6/26/20.
//  Copyright © 2020 Devnull. All rights reserved.
//

import UIKit

        class CustomTextField : UITextField {
          
          let padding : CGFloat
          
          init(padding : CGFloat){
              self.padding = padding
              super.init(frame : .zero)
            layer.cornerRadius = 25
            fillSuperview(padding: .init(top: 0, left: 32, bottom: 0, right: 32))
              
          }
            
        
          
          override func textRect(forBounds bounds: CGRect) -> CGRect {
              return bounds.insetBy(dx: padding, dy: 0)
          }
          
          override func editingRect(forBounds bounds: CGRect) -> CGRect {
              return bounds.insetBy(dx: padding, dy: 0)
          }
          override var intrinsicContentSize: CGSize {
              return .init(width: 0, height: 50)
          }
          
          required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
          }
    }
    

