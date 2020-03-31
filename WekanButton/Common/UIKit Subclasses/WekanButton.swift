//
//  WekanButton.swift
//  WekanButton
//
//  Created by Brian on 25/03/20.
//  Copyright © 2020 Wekan. All rights reserved.
//

import UIKit
import QuartzCore

enum ButtonBackground {
    case filled
    case outlined
    case clear
}

enum ButtonContent {
    case textOnly
    case iconOnly
    case iconAndTextHorizontal
    case textAndIconHorizontal
    case iconAndTextVertical
}

enum ButtonCorner {
    case sharp
    case smooth
    case rounded
    case none
}

class WekanButton: UIButton {
    
    public var cornerType: ButtonCorner = .sharp {
        didSet {
            switch cornerType {
            case .sharp:
                layer.cornerRadius = 0.0
            case .smooth:
                layer.cornerRadius = 5.0
            case .rounded:
                layer.cornerRadius = frame.size.height/2.0
            case .none:
                layer.cornerRadius = 0.0
            }
        }
    }
    
    public var contentType: ButtonContent = .textOnly {
        didSet {
            switch contentType {
            case .textOnly:
                iconImage = nil
            case .iconOnly:
                setTitle("", for: .normal)
            case .iconAndTextHorizontal:
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
                semanticContentAttribute = .unspecified
            case .textAndIconHorizontal:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
                semanticContentAttribute = .forceRightToLeft
            case .iconAndTextVertical:
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            }
        }
    }
    
    public var backgroundType: ButtonBackground = .filled {
        didSet {
            switch backgroundType {
            case .filled:
                iconImage = nil
                setFilledButton(withBGColor: .gray, textColor: .white)
            case .outlined:
                setTitle("", for: .normal)
                setOutline(withColor: .gray, width: 1.0)
            case .clear:
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
                semanticContentAttribute = .unspecified
            }
        }
    }
    
    public var themeColor: UIColor? = .white {
        didSet {
            switch backgroundType {
            case .filled:
                backgroundColor = themeColor
                setTitleColor(.white, for: .normal)
            case .outlined:
                backgroundColor = .white
                layer.borderColor = themeColor?.cgColor
                layer.borderWidth = 1.0
                setTitleColor(themeColor, for: .normal)
            case .clear:
                backgroundColor = .clear
                setTitleColor(themeColor, for: .normal)
            }
            backgroundColor = themeColor
            titleLabel?.textColor = themeColor
        }
    }
    
    public var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
        }
    }
    
    public var iconImage: UIImage? {
        didSet {
            setImage(iconImage, for: .normal)
            imageView?.contentMode = .scaleAspectFit
        }
    }
    
    public var outlineColor: UIColor = .gray {
        didSet {
            layer.borderColor = outlineColor.cgColor
        }
    }
    
    public var outlineWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = outlineWidth
        }
    }
    
    public var textColor: UIColor = .gray {
        didSet {
            setTitleColor(textColor, for: .normal)
        }
    }
    
    public var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    // MARK: -
    
    fileprivate var gradient : CAGradientLayer?
    
    public var gradientStartColor: UIColor? = nil {
        didSet{
            setupGradientBackground()
        }
    }
    
    public var gradientEndColor: UIColor? = nil {
        didSet{
            setupGradientBackground()
        }
    }
    
    public var gradientHorizontal: Bool = false {
        didSet{
            if gradient != nil {
                gradient?.removeFromSuperlayer()
                gradient = nil
                setupGradientBackground()
            }
        }
    }
    
    public var gradientRotation: CGFloat = 0 {
        didSet{
            if gradient != nil {
                gradient?.removeFromSuperlayer()
                gradient = nil
                setupGradientBackground()
            }
        }
    }
    
    // MARK: - Initialize
    
    convenience init(withContent content: ButtonContent,
                     backgroundType background: ButtonBackground,
                     cornerType corner: ButtonCorner,
                     text: String? = nil,
                     icon: UIImage? = nil) {
        self.init()
        contentType = content
        cornerType = corner
        backgroundType = background
        titleText = text ?? titleText
        iconImage = icon ?? iconImage
        clipsToBounds = true
    }
    
    /// Configure buttons
    /// - Parameters:
    ///   - content: <#content description#>
    ///   - background: <#background description#>
    ///   - corner: <#corner description#>
    ///   - text: <#text description#>
    ///   - icon: <#icon description#>
    open func configure(withContent content: ButtonContent,
                        backgroundType background: ButtonBackground,
                        cornerType corner: ButtonCorner,
                        text: String? = nil,
                        icon: UIImage? = nil) {
        contentType = content
        cornerType = corner
        backgroundType = background
        titleText = text ?? titleText
        iconImage = icon ?? iconImage
        clipsToBounds = true
    }
    
    /// For outline buttons, set the outline border color and its width
    /// - Parameters:
    ///   - color: outline border color
    ///   - width: border width
    ///   - textcolor: text color (Optional)
    open func setOutline(withColor color: UIColor, width: CGFloat, textcolor: UIColor? = nil) {
        outlineColor = color
        outlineWidth = width
        textColor = textcolor ?? textColor
    }
    
    /// For filled buttons, set the background color and text color
    /// - Parameters:
    ///   - color: background color of the buttonn
    ///   - textColor: text color
    open func setFilledButton(withBGColor color: UIColor, textColor: UIColor) {
        backgroundColor = color
        setTitleColor(textColor, for: .normal)
    }
    
    // MARK: -

}

extension WekanButton {
    /// Vertically aligns the image and text in a button, with mentioned spacing. This applies only for buttons with both image and text
    /// - Parameter spacing: pading betweenn nthe image and text
    open func alignVertical(spacing: CGFloat = 6.0) {
        guard let imageSize = imageView?.image?.size,
            let text = titleLabel?.text,
            let font = titleLabel?.font
            else { return }
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageSize.width,
            bottom: -(imageSize.height + spacing),
            right: 0.0
        )
        
        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing),
            left: 0.0,
            bottom: 0.0, right: -titleSize.width
        )
        
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: edgeOffset,
            left: 0.0,
            bottom: edgeOffset,
            right: 0.0
        )
    }
    
    /// Horizontally aligns the image and text in a button, with mentioned spacing. This applies only for buttons with both image and text
    /// - Parameters:
    ///   - spacing: padding between image and text, default is 6.0
    ///   - isLeftTextRightIcon: flag that says whether icon should be placed to the left/right of text. default is left image and right text (optional)
    open func alignHorizontal(spacing: CGFloat = 6.0, isLeftTextRightIcon: Bool? = nil) {
        let isRightAligned = isLeftTextRightIcon ?? false
        guard let imageSize = imageView?.image?.size,
            let text = titleLabel?.text,
            let font = titleLabel?.font
            else { return }
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: !isRightAligned ? -(imageSize.width + spacing) : -imageSize.width,
            bottom: 0.0,
            right: !isRightAligned ? -imageSize.width : -(imageSize.width + spacing)
        )
        
        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: !isRightAligned ? -(titleSize.width + spacing) : -titleSize.width,
            bottom: 0.0, right: !isRightAligned ? -titleSize.width : -(titleSize.width + spacing)
        )
        
        let edgeOffset = abs(titleSize.width - imageSize.width) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: edgeOffset,
            bottom: 0.0,
            right: edgeOffset
        )
    }
}

extension WekanButton {
    /// Internal function that sets the gradient for the button
    private func setupGradientBackground() {
        if gradientStartColor != nil && gradientEndColor != nil && gradient == nil{
            gradient = CAGradientLayer()
            gradient!.frame.size = frame.size
            gradient!.colors = [gradientStartColor!.cgColor, gradientEndColor!.cgColor]
            
            let rotation: CGFloat = gradientRotation >= 0 ? min(gradientRotation, CGFloat(360.0)) : max(gradientRotation, CGFloat(-360.0))
            var xAngle: Float = Float(rotation / 360)
            if (gradientHorizontal) {
                xAngle = 0.25
            }
            let a = pow(sinf((2 * Float(Double.pi) * ((xAngle + 0.75) / 2))), 2)
            let b = pow(sinf((2 * Float(Double.pi) * ((xAngle + 0.0) / 2))), 2)
            let c = pow(sinf((2 * Float(Double.pi) * ((xAngle + 0.25) / 2))), 2)
            let d = pow(sinf((2 * Float(Double.pi) * ((xAngle + 0.5) / 2))), 2)
            gradient!.startPoint = CGPoint(x: CGFloat(a), y: CGFloat(b))
            gradient!.endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
            
            layer.insertSublayer(gradient!, below: imageView?.layer)
        }
    }
    
    /// Set gradient background for buttons
    /// - Parameters:
    ///   - startColor: start color of gradient
    ///   - endColor: end color or gradient
    ///   - isHorizontalGradient: flag for the direction of gradient to be horizontal or vertical (optional)
    ///   - rotation: Float value that denotes the rotation of gradient (optional)
    open func setGradientBackground(startColor: UIColor, endColor: UIColor, isHorizontalGradient: Bool? = nil, rotation: CGFloat? = nil) {
        gradientStartColor = startColor
        gradientEndColor = endColor
        gradientHorizontal = isHorizontalGradient ?? gradientHorizontal
        gradientRotation = rotation ?? gradientRotation
        setupGradientBackground()
    }
}
