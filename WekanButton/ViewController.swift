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
    @IBOutlet weak var outlinedTextBtn: WekanButton!
    @IBOutlet weak var filledTextBtn: WekanButton!
    @IBOutlet weak var gradientBGIconTextBtn: WekanButton!
    @IBOutlet weak var gradientBGTextIconBtn: WekanButton!
    @IBOutlet weak var filledIconTextBtn: WekanButton!
    @IBOutlet weak var outlinedTextIconBtn: WekanButton!
    @IBOutlet weak var roundTextIconBtn: WekanButton!
    @IBOutlet weak var roundImageBtn: WekanButton!
    @IBOutlet weak var roundImageOutlineBtn: WekanButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureSystemButton()
        configureTextOnlyButton()
        configureTextButtonWithBorder()
        configureFilledButtonWithText()
        configureGradientButtonWithLeftIconRightTextAndShadow()
        configureGradientButtonWithLeftTextRightIcon()
        configureFilledButtonWithLeftIconRightTextAndShadow()
        configureLeftTextRightIconOutlineButton()
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
                              text: "Forgot Password")
        textOnlyBtn.themeColor = .orange
    }
    
    func configureTextButtonWithBorder() {
        outlinedTextBtn.configure(withContent: .textOnly,
                                  backgroundType: .outlined,
                                  cornerType: .smooth,
                                  text: "New User?")
    }
    
    func configureFilledButtonWithText() {
        filledTextBtn.configure(withContent: .textOnly,
                                backgroundType: .filled,
                                cornerType: .sharp,
                                text: "Register")
    }
    
    func configureFilledButtonWithLeftIconRightTextAndShadow() {
        gradientBGIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "Start Shift",
                                    icon: UIImage(named: "handwash"))
        gradientBGIconTextBtn.alignHorizontal(spacing: 5.0)
        gradientBGIconTextBtn.setGradientBackground(startColor: .purple, endColor: .red)
        gradientBGIconTextBtn.setShadow()

    }
    
    func configureGradientButtonWithLeftTextRightIcon() {
        gradientBGTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "End Shift",
                                    icon: UIImage(named: "medicine"))
        gradientBGTextIconBtn.setGradientBackground(startColor: .yellow, endColor: .green, isHorizontalGradient: true)
        gradientBGTextIconBtn.alignHorizontal(spacing: 5, isLeftTextRightIcon: false)
        gradientBGTextIconBtn.textColor = .blue
    }
    

    
    func configureGradientButtonWithLeftIconRightTextAndShadow() {
        filledIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                      backgroundType: .filled,
                                      cornerType: .rounded,
                                      text: "Checkin",
                                      icon: UIImage(named: "covid19"))
        filledIconTextBtn.alignHorizontal(spacing: 10)
        filledIconTextBtn.setFilledButton(withBGColor: .purple, textColor: .white)
        filledIconTextBtn.setShadow()
    }
    
    func configureLeftTextRightIconOutlineButton() {
        outlinedTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                      backgroundType: .outlined,
                                      cornerType: .smooth,
                                      text: "Checkout",
                                      icon: UIImage(named: "covid19"))
        outlinedTextIconBtn.alignHorizontal(spacing: 10, isLeftTextRightIcon: false)
    }
    
    func configureRoundTextOnlyButtonWithBorder() {
        roundTextIconBtn.configure(withContent: .textOnly,
                              backgroundType: .clear,
                              cornerType: .rounded, text: "$55")
        roundTextIconBtn.setOutline(withColor: .orange, width: 1.0)
        roundTextIconBtn.sizeToFit()
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
                                icon: UIImage(named: "handwash"))
        roundImageOutlineBtn.setOutline(withColor: .blue, width: 1.0)
    }
    
}

