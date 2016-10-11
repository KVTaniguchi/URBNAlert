//
//  URBNSwiftAlertStyle.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/8/16.
//
//

import Foundation

class URBNSwiftAlertStyle: NSObject {

    fileprivate var buttonEdgeInsetsString = ""
    fileprivate var buttonContentInsetsString = ""

    override init() {}

    /**
     * Background color of the buttons for active alerts
     */
    var  buttonBackgroundColor: UIColor {
        get {
            return buttonBackgroundColor ?? .lightGray
        }
        set {}
    }

    /**
     * Background color of the denial button for an active alert (at position 0)
     */
    var destructionButtonBackgroundColor: UIColor {
        get {
            return destructionButtonBackgroundColor ?? .red
        }
        set {}
    }

    /**
     * Text color of destructive button colors
     */
    var destructiveButtonTitleColor: UIColor {
        get {
            return destructiveButtonTitleColor ?? .white
        }
        set {}
    }

    /**
     * Text color of destructive button title when highlighted
     */
    var destructiveButtonHighlightTitleColor: UIColor {
        get {
            return destructiveButtonHighlightTitleColor ?? destructiveButtonTitleColor
        }
        set {}
    }

    /**
     * Background color of the cancel button for an active alert
     */
    var cancelButtonBackgroundColor: UIColor {
        get {
            return cancelButtonBackgroundColor ?? .lightGray
        }
        set {}
    }

    /**
     * Text color of cancel button colors
     */
    var  cancelButtonTitleColor: UIColor {
        get {
            return cancelButtonTitleColor ?? .white
        }
        set {}
    }

    /**
     * Text color of cancel button title when highlighted
     */

    var cancelButtonHighlightTitleColor: UIColor {
        get {
            return cancelButtonHighlightTitleColor ?? cancelButtonTitleColor
        }
        set {}
    }

    /**
     * Background color of a disabled button for an active alert
     */
    var disabledButtonBackgroundColor: UIColor?

    /**
     * Background color of a selected button for an active alert
     */
    var buttonSelectedBackgroundColor: UIColor {
        get {
            return buttonSelectedBackgroundColor ?? buttonBackgroundColor
        }
        set {}
    }

    /**
     * Button title color for a selected state
     */
    var buttonSelectedTitleColor: UIColor {
        get {
            return buttonSelectedTitleColor ?? buttonTitleColor
        }
        set {}
    }

    /**
     * Background color of a highlighted button for an active alert
     */

    var buttonHighlightBackgroundColor: UIColor {
        get {
            return buttonHighlightBackgroundColor ?? buttonBackgroundColor
        }
        set {}
    }

    /**
     * Background color of a highlighted button for a cancel action
     */

    var cancelButtonHighlightBackgroundColor: UIColor {
        get {
            return cancelButtonHighlightBackgroundColor ?? buttonBackgroundColor
        }
        set {}
    }

    /**
     * Background color of a highlighted button for a destructive action
     */

    var destructiveButtonHighlightBackgroundColor: UIColor {
        get {
            return destructiveButtonHighlightBackgroundColor ?? buttonBackgroundColor
        }
        set {}
    }

    /**
     * Button title color on highlight
     */
    var buttonHighlightTitleColor: UIColor {
        get {
            return buttonHighlightTitleColor ?? buttonTitleColor
        }
        set {}
    }

    /**
     * Text color of a disabled button
     */
    var disabledButtonTitleColor: UIColor?

    /**
     * Alpha value of a disabled button
     */
    var disabledButtonAlpha: Double {
        get {
            return disabledButtonAlpha ?? 0.5
        }
        set {}
    }

    /**
     * Text color of the button titles
     */
    var buttonTitleColor: UIColor {
        get {
            return buttonTitleColor ?? .white
        }
        set {}
    }

    /**
     * Background color of alert view
     */
    var backgroundColor: UIColor {
        get {
            return backgroundColor ?? .white
        }
        set {}
    }

    /**
     * Text color of the alert's title
     */
    var titleColor: UIColor {
        get {
            return titleColor ?? .black
        }
        set {}
    }

    /**
     * Text color of the alert's message
     */
    var messageColor: UIColor {
        get {
            return messageColor ?? .black
        }
        set {}
    }

    /**
     * Font of the alert's title
     */
    var titleFont: UIFont {
        get {
            return titleFont ?? UIFont.boldSystemFont(ofSize: 14)
        }
        set {}
    }

    /**
     * Alignment of the titles's message
     */
    var titleAlignment: NSTextAlignment {
        get {
            return titleAlignment ?? .center
        }
        set {}
    }

    /**
     * Font of the alert's message
     */
    var messageFont: UIFont {
        get {
            return messageFont ?? UIFont.systemFont(ofSize: 14)
        }
        set {}
    }

    /**
     * Alignment of the alert's message
     */
    var messageAlignment: NSTextAlignment {
        get {
            return messageAlignment ?? .left
        }
        set {}
    }

    /**
     * Font of the button's titles
     */
    var buttonFont: UIFont {
        get {
            return buttonFont ?? UIFont.boldSystemFont(ofSize: 14)
        }
        set {}
    }

    /**
     * Corner radius of the alert's buttons
     */
    var buttonCornerRadius: Double {
        get {
            return buttonCornerRadius ?? 8
        }
        set {}
    }

    /**
     * Corner radius of the alert view itself
     */
    var alertCornerRadius: Double {
        get {
            return alertCornerRadius ?? 8
        }
        set {}
    }

    /**
     *  Minimum width the alert view can be. Note if using, alertMaxWidth must also be set
     */
    var alertMinWidth: Double?

    /**
     *  Maximum width the alert view can be. Note if using, alertMinWidth must also be set
     */
    var alertMaxWidth: Double?

    /**
     * Max input length for the text field when enabled
     */
    var textFieldMaxLength: Double {
        get {
            return textFieldMaxLength ?? 25
        }
        set {}
    }

    /**
     *  Vertical margin between textfields
     */
    var textFieldVerticalMargin: Double {
        get {
            return textFieldVerticalMargin ?? 8
        }
        set {}
    }

    /**
     *  Text Insets for input text fields on alerts
     */
    var textFieldEdgeInsets: UIEdgeInsets {
        get {
            return textFieldEdgeInsets ?? UIEdgeInsets.zero
        }
        set {}
    }

    /**
     *  Width of vertical separator between buttons that are laid out horiztonally
     */

    var buttonVerticalSeparatorWidth: Double {
        get {
            return buttonVerticalSeparatorWidth ?? 0
        }
        set {}
    }

    /**
     *  Color of vertical separator between buttons that are laid out horiztonally
     */

    var buttonVerticalSeparatorColor: UIColor {
        get {
            return buttonVerticalSeparatorColor ?? buttonBackgroundColor
        }
        set {}
    }

    /**
     *  Height of horizontal separator between buttons (as in native UIAlertController). Default is nil for compatibility
     */
    var separatorHeight: Double {
        get {
            return separatorHeight ?? 0
        }
        set {}
    }

    /**
     * Color of the horizontal separator between buttons. Default is buttonTitleColor
     */
    var separatorColor: UIColor {
        get {
            return separatorColor ?? buttonTitleColor
        }
        set {}
    }

    /**
     *  Boolean flag if to use vertical layout for 2 buttons (for 3+ always vertical being used). Default is nil for compatibility
     */
    var useVerticalLayoutForTwoButtons: NSNumber {
        get {
            return useVerticalLayoutForTwoButtons ?? 0
        }
        set {}
    }

    /**
     * Height of the alert's buttons
     */
    var buttonHeight: NSNumber {
        get {
            return buttonHeight ?? 44
        }
        set {}
    }

    /**
     * Margin between sections in the alert. ie margin between the title and the message message and the buttons, etc.
     */
    var sectionVerticalMargin: NSNumber {
        get {
            return sectionVerticalMargin ?? 24
        }
        set {}
    }

    /**
     * Left & Right margins of the title & message labels
     */
    var labelHorizontalMargin: NSNumber {
        get {
            return labelHorizontalMargin ?? 16
        }
        set {}
    }

    /**
     * UIEdgeInsets used at the external margins for the buttons of the alert's buttons
     */
    var buttonMarginEdgeInsets: UIEdgeInsets {
        get {
            return buttonMarginEdgeInsets ?? UIEdgeInsets.zero
        }
        set {}
    }

    /**
     * UIEdgeInsets used for internal content for the buttons of the alert's buttons
     */
    var buttonContentInsets: UIEdgeInsets {
        get {
            return buttonContentInsets ?? UIEdgeInsets.zero
        }
        set {}
    }

    /**
     * Width of the alert's button's border layer
     */
    var buttonBorderWidth: NSNumber {
        get {
            return buttonBorderWidth ?? 0
        }
        set {}
    }

    /**
     * UIColor of the alert's button's border
     */

    var buttonBorderColor: UIColor {
        get {
            return buttonBorderColor ?? .clear
        }
        set {}
    }

    /**
     * Opacity of the alert's button's shadows
     */
    var buttonShadowOpacity: NSNumber {
        get {
            return buttonShadowOpacity ?? 0
        }
        set {}
    }

    /**
     * Radius of the alert's button's shadows
     */
    var buttonShadowRadius: NSNumber {
        get {
            return buttonShadowRadius ?? 0
        }
        set {}
    }

    /**
     * Color of the alert's button's shadows
     */
    var buttonShadowColor: UIColor {
        get {
            return buttonShadowColor ?? .clear
        }
        set {}
    }

    /**
     * Offset of the alert's button's shadows
     */
    var buttonShadowOffset: CGSize {
        get {
            return buttonShadowOffset ?? CGSize.zero
        }
        set {}
    }

    /**
     * Margin around the custom view if supplied
     */
    var customViewMargin: NSNumber {
        get {
            return customViewMargin ?? 8
        }
        set {}
    }

    /**
     * Color of the border around a custom view via layer
     */
    var customViewBorderColor: UIColor {
        get {
            return customViewBorderColor ?? .clear
        }
        set {}
    }

    /**
     * Width of the border around a custom view via layer
     */
    var customViewBorderWidth: NSNumber {
        get {
            return customViewBorderWidth ?? 0
        }
        set {}
    }

    /**
     * Duration of the presenting and dismissing of the alert view
     */
    var animationDuration: NSNumber {
        get {
            return animationDuration ?? 0.6
        }
        set {}
    }

    /**
     *  Spring damping for the presenting and dismissing of the alert view
     */
    var animationDamping: NSNumber {
        get {
            return animationDamping ?? 0.6
        }
        set {}
    }

    /**
     *  Spring initial velocity for the presenting and dismissing of the alert view
     */
    var animationInitialVelocity: NSNumber {
        get {
            return animationInitialVelocity ?? -10
        }
        set {}
    }

    /**
     * Opacity of the alert view's shadow
     */
    var alertViewShadowOpacity: NSNumber {
        get {
            return alertViewShadowOpacity ?? 0.3
        }
        set {}
    }

    /**
     * Radius of the alert view's shadow
     */
    var alertViewShadowRadius: NSNumber {
        get {
            return alertViewShadowRadius ?? 2
        }
        set {}
    }

    /**
     * Color of the alert view's shadow
     */
    var alertViewShadowColor: UIColor {
        get {
            return alertViewShadowColor ?? .black
        }
        set {}
    }

    /**
     * Offset of the alert view's shadow
     */
    var alertShadowOffset: CGSize {
        get {
            return alertShadowOffset ?? CGSize(width: 1, height: 1)
        }
        set {}
    }

    /**
     * Pass no to disable blurring in the background
     */
    var blurEnabled: NSNumber {
        get {
            return blurEnabled ?? 1
        }
        set {}
    }

    /**
     * Tint color of the blurred snapshot
     */
    var blurTintColor: UIColor {
        get {
            let tintColor = blurTintColor ?? UIColor.white.withAlphaComponent(0.4)
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha : CGFloat = 0
            tintColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            assert(alpha < 1.0, "URBNAlertStyle: blurTintColor alpha component must be less than 1.0f to see the blur effect. Please use colorWithAlphaComponent: when setting a custom blurTintColor, for example: [[UIColor whiteColor] colorWithAlphaComponent:0.4f]")
            return tintColor
        }
        set {}

    }

    /**
     * Tint color of the view behind the Alert. Blur must be disabled
     */
    var backgroundViewTintColor: UIColor?

    /**
     * Radius of the blurred snapshot
     */
    var blurRadius: NSNumber {
        get {
            return blurRadius ?? 5
        }
        set {}
    }

    /**
     * Saturation blur factor of the blurred snapshot. 1 is normal. < 1 removes color, > 1 adds color
     */
    var blurSaturationDelta: NSNumber {
        get {
            return blurSaturationDelta ?? 1
        }
        set {}
    }

    /**
     * Text color of the error label text
     */
    var errorTextColor: UIColor {
        get {
            return errorTextColor ?? .red
        }
        set {}
    }

    /**
     * Font of the error label text
     */
    var errorTextFont: UIFont {
        get {
            return errorTextFont ?? UIFont.boldSystemFont(ofSize: 14)
        }
        set {}
    }

    /**
     * Color for the top border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerTopBorderColor: UIColor?

    /**
     * Width(thickness) for the top border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerTopBorderWidth: NSNumber = 0

    /**
     * Color for the Bottom border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerBottomBorderColor: UIColor?

    /**
     * Width(thickness) for the Bottom border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerBottomBorderWidth: NSNumber = 0

    /**
     * Color for the Right border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerRightBorderColor: UIColor?
    
    /**
     * Width(thickness) for the Right border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerRightBorderWidth: NSNumber = 0
    
    /**
     * Color for the Left border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerLeftBorderColor: UIColor?
    
    /**
     * Width(thickness) for the Left border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerLeftBorderWidth: NSNumber = 0
    
    /**
     * The view you want to become the first responder when the alert view is finished presenting
     * The alert position will adjust for the keyboard when using this property
     */
    var firstResponder: UIView?
    
    /**
     *  Returns the correct background color for given an actionType
     *
     *  @param actionType Action type associated with the button
     *
     *  @return
     */
    func buttonTitleColorForActionType(actionType: URBNSwiftAlertActionType, isEnabled: Bool) -> UIColor? {
        if !isEnabled, let disabledButtonTitleColor = disabledButtonTitleColor {
            return disabledButtonTitleColor
        }

        switch actionType {
        case .cancel:
            return cancelButtonTitleColor
        case .destructive:
            return destructiveButtonTitleColor
        default:
            return buttonTitleColor
        }
    }

    /**
     *  Returns the correct title color for given an actionType
     *
     *  @param actionType Action type associated with the button
     *
     *  @return
     */
    func buttonBackgroundColorForActionType(actionType: URBNSwiftAlertActionType, isEnabled: Bool) -> UIColor? {
        if !isEnabled, disabledButtonBackgroundColor != nil {
            return disabledButtonBackgroundColor
        }

        switch actionType {
        case .cancel:
            return cancelButtonBackgroundColor
        case.destructive:
            return destructionButtonBackgroundColor
        default:
            return buttonBackgroundColor
        }
    }
}
