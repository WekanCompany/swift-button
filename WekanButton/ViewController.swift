//
//  ViewController.swift
//  WekanButton
//
//  Created by Brian on 25/03/20.
//  Copyright © 2020 Wekan. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    @IBOutlet weak var systemBtn: WekanButton!
    @IBOutlet weak var textOnlyBtn: WekanButton!
    @IBOutlet weak var filledTextBtn: WekanButton!
    @IBOutlet weak var gradientBGIconTextBtn: WekanButton!
    @IBOutlet weak var gradientBGTextIconBtn: WekanButton!
    @IBOutlet weak var filledIconTextBtn: WekanButton!
    @IBOutlet weak var outlinedTextIconBtn: WekanButton!
    @IBOutlet weak var outlinedTextBtn: WekanButton!
    @IBOutlet weak var roundTextIconBtn: WekanButton!
    @IBOutlet weak var roundImageBtn: WekanButton!
    @IBOutlet weak var roundImageOutlineBtn: WekanButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureSystemButton()
        configureTextOnlyButton()
        configureFilledButtonWithText()
        configureGradientButtonWithLeftIconRightTextAndShadow()
        configureGradientButtonWithLeftTextRightIcon()
        configureFilledButtonWithLeftIconRightTextAndShadow()
        configureLeftTextRightIconOutlineButton()
        configureTextButtonWithBorder()
        configureRoundTextOnlyButtonWithBorder()
        configureRoundImageOnlyButton()
        configureRoundImageOnlyOutlineButton()
    }
    
    func configureSystemButton() {

        systemBtn.configure(withContent: .system,
                            backgroundType: .none,
                            cornerType: .none,
                            text: "System Button",
                            icon: nil)
    }
    
    func configureTextOnlyButton() {
        textOnlyBtn.configure(withContent: .textOnly,
                              backgroundType: .clear,
                              cornerType: .sharp,
                              text: "Let's Get Started")
        textOnlyBtn.themeColor = .systemGreen
    }
        
    func configureFilledButtonWithText() {
        filledTextBtn.configure(withContent: .textOnly,
                                backgroundType: .filled,
                                cornerType: .sharp,
                                text: "Register")
        filledTextBtn.setGradientBackground(startColor: .systemBlue, endColor: .systemPurple, isHorizontalGradient: true)
    }
    
    func configureFilledButtonWithLeftIconRightTextAndShadow() {
        gradientBGIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "Start Shift",
                                    icon: UIImage(named: "iconLogin"))
        gradientBGIconTextBtn.alignHorizontal(spacing: -20.0)
        gradientBGIconTextBtn.setGradientBackground(startColor: .systemBlue, endColor: .systemPurple)
        gradientBGIconTextBtn.setShadow()

    }
    
    func configureGradientButtonWithLeftTextRightIcon() {
        gradientBGTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "End Shift",
                                    icon: UIImage(named: "iconLogout"))
        gradientBGTextIconBtn.setGradientBackground(startColor: .gray, endColor: .black, isHorizontalGradient: true)
        gradientBGTextIconBtn.alignHorizontal(spacing: 15, isLeftTextRightIcon: false)
        gradientBGTextIconBtn.textColor = .white
    }
    

    
    func configureGradientButtonWithLeftIconRightTextAndShadow() {
        filledIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                      backgroundType: .filled,
                                      cornerType: .rounded,
                                      text: "Checkin",
                                      icon: UIImage(named: "iconLogin"))
        filledIconTextBtn.alignHorizontal(spacing: -20)
        filledIconTextBtn.setFilledButton(withBGColor: .gray, textColor: .black)
        filledIconTextBtn.setShadow()
    }
    
    func configureLeftTextRightIconOutlineButton() {
        outlinedTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                      backgroundType: .outlined,
                                      cornerType: .sharp,
                                      text: "Checkout",
                                      icon: UIImage(named: "iconLogout"))
        outlinedTextIconBtn.alignHorizontal(spacing: 10, isLeftTextRightIcon: false)
        outlinedTextIconBtn.backgroundColor = .white
        outlinedTextIconBtn.setShadow()
    }
    
    func configureTextButtonWithBorder() {
        outlinedTextBtn.configure(withContent: .textOnly,
                                  backgroundType: .outlined,
                                  cornerType: .smooth,
                                  text: "Forgot Password?")
    }
    
    func configureRoundTextOnlyButtonWithBorder() {
        roundTextIconBtn.configure(withContent: .textOnly,
                              backgroundType: .clear,
                              cornerType: .rounded, text: "$55")
        roundTextIconBtn.setOutline(withColor: .gray, width: 1.0)
//        roundTextIconBtn.sizeToFit()
    }
    
    func configureRoundImageOnlyButton() {
        roundImageBtn.configure(withContent: .iconOnly,
                              backgroundType: .clear,
                              cornerType: .sharp,
                              icon: UIImage(named: "medicine"))
        
    }
    
    func configureRoundImageOnlyOutlineButton() {
        roundImageOutlineBtn.configure(withContent: .iconOnly,
                                backgroundType: .outlined,
                                cornerType: .rounded,
                                icon: UIImage(named: "iconLogin"))
        roundImageOutlineBtn.setOutline(withColor: .systemBlue, width: 1.0)
    }
    
}

