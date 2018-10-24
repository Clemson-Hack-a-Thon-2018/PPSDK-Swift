//
//  PPLoginButton.swift
//  PlayPortal
//
//  Created by Gary J. Baldwin on 9/12/18.
//  Copyright © 2018 Dynepic. All rights reserved.
//

import Foundation
import UIKit

/**
 Responsible for opening SSO WebView when tapped and initializing auth flow
 */
public class PlayPortalLoginButton: UIButton {
    
    /**
     Create login button.
     
     - Parameter atCenter: Where in view to center the button.
    */
    public init(atCenter center: CGPoint? = nil) {
        // Ratio is 279w / 55h
        var buttonWidth: CGFloat = UIScreen.main.bounds.size.width * 0.7
        if buttonWidth > 300 {
            buttonWidth = 300
        }
        let buttonHeight: CGFloat = buttonWidth * (55 / 279)
        let rect = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)

        super.init(frame: rect)
        
        if let center = center {
            self.center = center
        }
        
        addImage()
        addTarget(self, action: #selector(PlayPortalLoginButton.didTouch), for: .touchUpInside)
        layer.cornerRadius = buttonHeight / 2
        layer.masksToBounds = true
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImage() {
        
        let frameworkBundle = Bundle(for: PlayPortalLoginButton.self)
        let url = frameworkBundle.resourceURL?.appendingPathComponent("PPSDK-Swift-Assets.bundle")
        
        guard let bundleURL = url else {
            print()
            return
        }
        
        if let resourceBundle = Bundle(url: bundleURL) {
            let image = UIImage(named: "anonUser", in: frameworkBundle, compatibleWith: traitCollection)
            if image != nil {
                print()
            } else {
                print()
            }
            
            let ssoButtonImage = UIImageView(image: image)
            ssoButtonImage.frame = bounds
            ssoButtonImage.contentMode = .scaleAspectFit
            addSubview(ssoButtonImage)
            sendSubview(toBack: ssoButtonImage)
        } else {
            print()
        }
    }
    
    @objc func didTouch() {
//        PPManager.sharedInstance.PPusersvc.login()
    }
}