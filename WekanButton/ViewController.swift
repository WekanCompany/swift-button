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
    @IBOutlet weak var borderedTextBtn: WekanButton!
    @IBOutlet weak var filledTextBtn: WekanButton!
    @IBOutlet weak var borderedIconTextBtn: WekanButton!
    @IBOutlet weak var filledIconTextBtn: WekanButton!
    @IBOutlet weak var borderedTextIconBtn: WekanButton!
    @IBOutlet weak var filledTextIconBtn: WekanButton!
    @IBOutlet weak var textIconBtn: WekanButton!
    @IBOutlet weak var iconOnlyBtn: WekanButton!
    @IBOutlet weak var circleIconBtn: WekanButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureSystemButton()
        configureTextOnlyButton()
        configureTextButtonWithBorder()
        configureOutlineButtonWithLeftIconRightText()
        configureLeftTextRightIconOutlineButton()
        configureFilledButtonWithText()
        configureFilledButtonWithLeftIconRightText()
        configureFilledButtonWithLeftTextRightIcon()
        configureRoundButtonWithText()
        configureOutlineButtonWithLeftIconRightText()
        configureRoundOutlineButtonWithIcon()
    }
    
    func configureSystemButton() {
        systemBtn.configure(withContent: .textOnly,
                            backgroundType: .clear,
                            cornerType: .none,
                            text: "System Button",
                            icon: nil)
    }
    
    func configureTextOnlyButton() {
        textOnlyBtn.configure(withContent: .textOnly,
                              backgroundType: .clear,
                              cornerType: .sharp,
                              text: "Forgot Password")
        //        textOnlyBtn.themeColor = .orange
    }
    
    func configureTextButtonWithBorder() {
        borderedTextBtn.configure(withContent: .textOnly,
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
    
    func configureFilledButtonWithLeftIconRightText() {
        filledIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "Start Shift",
                                    icon: UIImage(named: "handwash"))
        filledIconTextBtn.setGradientBackground(startColor: .purple, endColor: .red)
        filledIconTextBtn.alignHorizontal(spacing: 5.0)
    }
    
    func configureFilledButtonWithLeftTextRightIcon() {
        filledTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                    backgroundType: .filled,
                                    cornerType: .rounded,
                                    text: "End Shift",
                                    icon: UIImage(named: "medicine"))
        filledTextIconBtn.setGradientBackground(startColor: .yellow, endColor: .green, isHorizontalGradient: true)
        
        filledTextIconBtn.alignHorizontal(spacing: 10, isLeftTextRightIcon: false)
    }
    

    
    func configureOutlineButtonWithLeftIconRightText() {
        borderedIconTextBtn.configure(withContent: .iconAndTextHorizontal,
                                      backgroundType: .outlined,
                                      cornerType: .rounded,
                                      text: "Checkin",
                                      icon: UIImage(named: "covid19"))
        borderedIconTextBtn.alignHorizontal(spacing: 10)
    }
    
    func configureLeftTextRightIconOutlineButton() {
        borderedTextIconBtn.configure(withContent: .textAndIconHorizontal,
                                      backgroundType: .outlined,
                                      cornerType: .smooth,
                                      text: "Checkout",
                                      icon: UIImage(named: "covid19"))
        borderedTextIconBtn.alignHorizontal(spacing: 10, isLeftTextRightIcon: false)
    }
    
    func configureRoundButtonWithText() {
        textIconBtn.configure(withContent: .textOnly,
                              backgroundType: .clear,
                              cornerType: .rounded, text: "$55")
        textIconBtn.setOutline(withColor: .orange, width: 1.0)
        textIconBtn.sizeToFit()
    }
    
    func configureClearButtonWithIconOnly() {
        iconOnlyBtn.configure(withContent: .iconOnly,
                              backgroundType: .clear,
                              cornerType: .sharp,
                              icon: UIImage(named: "medicine"))
        
    }
    
    func configureRoundOutlineButtonWithIcon() {
        circleIconBtn.configure(withContent: .iconOnly,
                                backgroundType: .outlined,
                                cornerType: .rounded,
                                icon: UIImage(named: "handwash"))
        circleIconBtn.setOutline(withColor: .blue, width: 1.0)
    }
    
}

