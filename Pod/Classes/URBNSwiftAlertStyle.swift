//
//  URBNSwiftAlertStyle.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/8/16.
//
//

import Foundation

class URBNSwiftAlertStyle: NSObject {

    fileprivate var buttontnEdgeInsetsString = ""
    fileprivate var buttonContentInsetsString = ""

    /**
     * Background color of the buttons for active alerts
     */
    var  buttonBackgroundColor: UIColor

    /**
     * Background color of the denial button for an active alert (at position 0)
     */
    var destructionButtonBackgroundColor: UIColor

    /**
     * Text color of destructive button colors
     */
    var destructiveButtonTitleColor: UIColor

    /**
     * Text color of destructive button title when highlighted
     */
    var destructiveButtonHighlightTitleColor: UIColor

    /**
     * Background color of the cancel button for an active alert
     */
    var cancelButtonBackgroundColor: UIColor

    /**
     * Text color of cancel button colors
     */
    var  cancelButtonTitleColor: UIColor

    /**
     * Text color of cancel button title when highlighted
     */

    var cancelButtonHighlightTitleColor: UIColor

    /**
     * Background color of a disabled button for an active alert
     */
    var disabledButtonBackgroundColor: UIColor

    /**
     * Background color of a selected button for an active alert
     */
    var buttonSelectedBackgroundColor: UIColor

    /**
     * Button title color for a selected state
     */
    var buttonSelectedTitleColor: UIColor

    /**
     * Background color of a highlighted button for an active alert
     */

    var buttonHighlightBackgroundColor: UIColor

    /**
     * Background color of a highlighted button for a cancel action
     */

    var cancelButtonHighlightBackgroundColor: UIColor

    /**
     * Background color of a highlighted button for a destructive action
     */

    var destructiveButtonHighlightBackgroundColor: UIColor

    /**
     * Button title color on highlight
     */
    var buttonHighlightTitleColor: UIColor

    /**
     * Text color of a disabled button
     */
    var disabledButtonTitleColor: UIColor

    /**
     * Alpha value of a disabled button
     */
    var disabledButtonAlpha: NSNumber

    /**
     * Text color of the button titles
     */
    var buttonTitleColor: UIColor

    /**
     * Background color of alert view
     */
    var backgroundColor: UIColor

    /**
     * Text color of the alert's title
     */
    var titleColor: UIColor? {
        get {
            guard let titleColor = titleColor else { return .black }
            return titleColor
        }
    }

//    - (UIColor *)titleColor {
//    return _titleColor ?: [UIColor blackColor];
//    }


    /**
     * Text color of the alert's message
     */
    var messageColor: UIColor

    /**
     * Font of the alert's title
     */
    var titleFont: UIFont

    /**
     * Alignment of the titles's message
     */
    var titleAlignment: NSTextAlignment

    /**
     * Font of the alert's message
     */
    var messageFont: UIFont

    /**
     * Alignment of the alert's message
     */
    var messageAlignment: NSTextAlignment

    /**
     * Font of the button's titles
     */
    var buttonFont: UIFont

    /**
     * Corner radius of the alert's buttons
     */
    var buttonCornerRadius: NSNumber

    /**
     * Corner radius of the alert view itself
     */
    var alertCornerRadius: NSNumber

    /**
     *  Minimum width the alert view can be. Note if using, alertMaxWidth must also be set
     */
    var alertMinWidth: NSNumber

    /**
     *  Maximum width the alert view can be. Note if using, alertMinWidth must also be set
     */
    var alertMaxWidth: NSNumber

    /**
     * Max input length for the text field when enabled
     */
    var textFieldMaxLength: NSNumber

    /**
     *  Vertical margin between textfields
     */
    var textFieldVerticalMargin: NSNumber

    /**
     *  Text Insets for input text fields on alerts
     */
    var textFieldEdgeInsets: UIEdgeInsets

    /**
     *  Width of vertical separator between buttons that are laid out horiztonally
     */

    var buttonVerticalSeparatorWidth: NSNumber

    /**
     *  Color of vertical separator between buttons that are laid out horiztonally
     */

    var buttonVerticalSeparatorColor: UIColor

    /**
     *  Height of horizontal separator between buttons (as in native UIAlertController). Default is nil for compatibility
     */
    var separatorHeight: NSNumber

    /**
     * Color of the horizontal separator between buttons. Default is buttonTitleColor
     */
    var separatorColor: UIColor

    /**
     *  Boolean flag if to use vertical layout for 2 buttons (for 3+ always vertical being used). Default is nil for compatibility
     */
    var useVerticalLayoutForTwoButtons: NSNumber

    /**
     * Height of the alert's buttons
     */
    var buttonHeight: NSNumber

    /**
     * Margin between sections in the alert. ie margin between the title and the message message and the buttons, etc.
     */
    var sectionVerticalMargin: NSNumber

    /**
     * Left & Right margins of the title & message labels
     */
    var labelHorizontalMargin: NSNumber

    /**
     * UIEdgeInsets used at the external margins for the buttons of the alert's buttons
     */
    var buttonMarginEdgeInsets: UIEdgeInsets

    /**
     * UIEdgeInsets used for internal content for the buttons of the alert's buttons
     */
    var buttonContentInsets: UIEdgeInsets

    /**
     * Width of the alert's button's border layer
     */
    var buttonBorderWidth: NSNumber

    /**
     * UIColor of the alert's button's border
     */

    var buttonBorderColor: UIColor

    /**
     * Opacity of the alert's button's shadows
     */
    var buttonShadowOpacity: NSNumber

    /**
     * Radius of the alert's button's shadows
     */
    var buttonShadowRadius: NSNumber

    /**
     * Color of the alert's button's shadows
     */
    var buttonShadowColor: UIColor

    /**
     * Offset of the alert's button's shadows
     */
    var buttonShadowOffset: CGSize

    /**
     * Margin around the custom view if supplied
     */
    var customViewMargin: NSNumber

    /**
     * Color of the border around a custom view via layer
     */
    var customViewBorderColor: UIColor

    /**
     * Width of the border around a custom view via layer
     */
    var customViewBorderWidth: NSNumber

    /**
     * Duration of the presenting and dismissing of the alert view
     */
    var animationDuration: NSNumber

    /**
     *  Spring damping for the presenting and dismissing of the alert view
     */
    var animationDamping: NSNumber

    /**
     *  Spring initial velocity for the presenting and dismissing of the alert view
     */
    var animationInitialVelocity: NSNumber

    /**
     * Opacity of the alert view's shadow
     */
    var alertViewShadowOpacity: NSNumber

    /**
     * Radius of the alert view's shadow
     */
    var alertViewShadowRadius: NSNumber

    /**
     * Color of the alert view's shadow
     */
    var alertViewShadowColor: UIColor

    /**
     * Offset of the alert view's shadow
     */
    var alertShadowOffset: CGSize

    /**
     * Pass no to disable blurring in the background
     */
    var blurEnabled: NSNumber

    /**
     * Tint color of the blurred snapshot
     */
    var blurTintColor: UIColor

    /**
     * Tint color of the view behind the Alert. Blur must be disabled
     */
    var backgroundViewTintColor: UIColor

    /**
     * Radius of the blurred snapshot
     */
    var blurRadius: NSNumber

    /**
     * Saturation blur factor of the blurred snapshot. 1 is normal. < 1 removes color, > 1 adds color
     */
    var blurSaturationDelta: NSNumber

    /**
     * Text color of the error label text
     */
    var errorTextColor: UIColor

    /**
     * Font of the error label text
     */
    var errorTextFont: UIFont

    /**
     * Color for the top border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerTopBorderColor: UIColor

    /**
     * Width(thickness) for the top border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerTopBorderWidth: NSNumber

    /**
     * Color for the Bottom border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerBottomBorderColor: UIColor

    /**
     * Width(thickness) for the Bottom border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerBottomBorderWidth: NSNumber

    /**
     * Color for the Right border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerRightBorderColor: UIColor
    
    /**
     * Width(thickness) for the Right border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerRightBorderWidth: NSNumber
    
    /**
     * Color for the Left border of the button container
     * No default provided
     * Must be used with a non-nil BorderWidth
     */
    var buttonContainerLeftBorderColor: UIColor
    
    /**
     * Width(thickness) for the Left border of the button container
     * No default provided
     * Must be used with a non-nil BorderColor
     */
    var buttonContainerLeftBorderWidth: NSNumber
    
    /**
     * The view you want to become the first responder when the alert view is finished presenting
     * The alert position will adjust for the keyboard when using this property
     */
    var firstResponder: UIView
    
    /**
     *  Returns the correct background color for given an actionType
     *
     *  @param actionType Action type associated with the button
     *
     *  @return
     */
    func buttonTitleColorForActionType(actionType: URBNSwiftAlertActionType, isEnabled: BOOL) -> UIColor {
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
    func buttonBackgroundColorForActionType(actionType: URBNSwiftAlertActionType, isEnabled: BOOL) -> UIColor {
        if !isEnabled, let disabledButtonBackgroundColor = disabledButtonBackgroundColor {
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
