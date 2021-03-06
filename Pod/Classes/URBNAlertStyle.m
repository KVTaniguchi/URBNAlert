//
//  URBNAlertStyle.m
//  Pods
//
//  Created by Ryan Garchinsky on 3/6/15.
//
//

#import "URBNAlertStyle.h"

@interface URBNAlertStyle()

// Need to store this so we know when to use the default values since UIEdgeInsets is not an object
@property (nonatomic, copy) NSString *buttontnEdgeInsetsString;
@property (nonatomic, copy) NSString *buttonContentInsetsString;

@end

@implementation URBNAlertStyle

#pragma mark - Title
- (UIColor *)titleColor {
    return _titleColor ?: [UIColor blackColor];
}

- (UIFont *)titleFont {
    return _titleFont ?: [UIFont boldSystemFontOfSize:14];
}

- (NSTextAlignment)titleAlignment {
    return _titleAlignment ?: NSTextAlignmentCenter;
}

#pragma mark - Message
- (UIColor *)messageColor {
    return _messageColor ?: [UIColor blackColor];
}

- (UIFont *)messageFont {
    return _messageFont ?: [UIFont systemFontOfSize:14];
}

- (NSTextAlignment)messageAlignment {
    return _messageAlignment ?: NSTextAlignmentLeft;
}

#pragma mark - Error
- (UIColor *)errorTextColor {
    return _errorTextColor ?: [UIColor redColor];
}

- (UIFont *)errorTextFont {
    return _errorTextFont ?: [UIFont boldSystemFontOfSize:14];
}

#pragma mark - Separators
- (NSNumber *)buttonVerticalSeparatorWidth {
    return _buttonVerticalSeparatorWidth ?: @0;
}

- (UIColor *)buttonVerticalSeparatorColor {
    return _buttonVerticalSeparatorColor ?: [self buttonBackgroundColor];
}

- (NSNumber *)separatorHeight {
    return _separatorHeight ?: @0;
}

- (UIColor *)separatorColor {
    return _separatorColor ?: [self buttonTitleColor];
}

#pragma mark - Buttons
- (NSNumber *)useVerticalLayoutForTwoButtons {
    return _useVerticalLayoutForTwoButtons ?: @0;
}

- (UIColor *)buttonTitleColor {
    return _buttonTitleColor ?: [UIColor whiteColor];
}

- (UIColor *)buttonHighlightTitleColor {
    return _buttonHighlightTitleColor ?: [self buttonTitleColor];
}

- (UIColor *)buttonSelectedTitleColor {
    return _buttonSelectedTitleColor ?: [self buttonTitleColor];
}

- (UIFont *)buttonFont {
    return _buttonFont ?: [UIFont boldSystemFontOfSize:14];
}

- (UIColor *)buttonBackgroundColor {
    return _buttonBackgroundColor ?: [UIColor lightGrayColor];
}

- (UIColor *)destructionButtonBackgroundColor {
    return _destructionButtonBackgroundColor ?: [UIColor redColor];
}

- (UIColor *)destructiveButtonTitleColor {
    return _destructiveButtonTitleColor ?: [UIColor whiteColor];
}

- (UIColor *)cancelButtonBackgroundColor {
    return _cancelButtonBackgroundColor ?: [UIColor lightGrayColor];
}

- (UIColor *)destructiveButtonHighlightTitleColor {
    return _destructiveButtonHighlightTitleColor ?: [self destructiveButtonTitleColor];
}

- (UIColor *)cancelButtonTitleColor {
    return _cancelButtonTitleColor ?: [UIColor whiteColor];
}

- (UIColor *)cancelButtonHighlightTitleColor {
    return _cancelButtonHighlightTitleColor ?: [self cancelButtonTitleColor];
}

- (NSNumber *)buttonCornerRadius {
    return _buttonCornerRadius ?: @8;
}

- (NSNumber *)buttonHeight {
    return _buttonHeight ?: @44;
}

- (UIColor *)buttonHighlightBackgroundColor {
    return _buttonHighlightBackgroundColor ?: [self buttonBackgroundColor];
}

- (UIColor *)buttonSelectedBackgroundColor {
    return _buttonSelectedBackgroundColor ?: [self buttonBackgroundColor];
}

- (UIColor *)cancelButtonHighlightBackgroundColor {
    return _cancelButtonHighlightBackgroundColor ?: [self buttonBackgroundColor];
}

- (UIColor *)destructiveButtonHighlightBackgroundColor {
    return _destructiveButtonHighlightBackgroundColor ?: [self buttonBackgroundColor];
}

// TODO: Delete when buttonHorizontalMargin property goes away
- (NSNumber *)buttonHorizontalMargin {
    return _buttonHorizontalMargin ?: @8;
}

- (void)setButtonMarginEdgeInsets:(UIEdgeInsets)buttonMarginEdgeInsets {
    self.buttontnEdgeInsetsString = NSStringFromUIEdgeInsets(buttonMarginEdgeInsets);
}

- (UIEdgeInsets)buttonMarginEdgeInsets {
    if (self.buttontnEdgeInsetsString) {
        return UIEdgeInsetsFromString(self.buttontnEdgeInsetsString);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Using buttonHorizontalMargin for all values to be backwards compatiable. Originally named poorly
    return UIEdgeInsetsMake(self.buttonHorizontalMargin.floatValue, self.buttonHorizontalMargin.floatValue, self.buttonHorizontalMargin.floatValue, self.buttonHorizontalMargin.floatValue);
#pragma clang diagnostic pop
}

- (void)setButtonContentInsets:(UIEdgeInsets)buttonContentInsets {
    self.buttonContentInsetsString = NSStringFromUIEdgeInsets(buttonContentInsets);
}

- (UIEdgeInsets)buttonContentInsets {
    return UIEdgeInsetsFromString(self.buttonContentInsetsString);
}

- (NSNumber *)buttonShadowOpacity {
    return _buttonShadowOpacity ?: @0;
}

- (NSNumber *)buttonShadowRadius {
    return _buttonShadowRadius ?: @0;
}

- (UIColor *)buttonShadowColor {
    return _buttonShadowColor ?: [UIColor clearColor];
}

- (NSNumber *)buttonBorderWidth {
    return _buttonBorderWidth ?: @0;
}

- (UIColor *)buttonBorderColor {
    return _buttonBorderColor ?: [UIColor clearColor];
}

#pragma mark - Alert View
- (NSNumber *)alertCornerRadius {
    return _alertCornerRadius ?: @8;
}

- (NSNumber *)sectionVerticalMargin {
    return _sectionVerticalMargin ?: @24;
}

- (NSNumber *)labelHorizontalMargin {
    return _labelHorizontalMargin ?: @16;
}

- (NSNumber *)animationDuration {
    return _animationDuration ?: @0.6f;
}

- (NSNumber *)animationDamping {
    return _animationDamping ?: @0.6f;
}

- (NSNumber *)animationInitialVelocity {
    return _animationInitialVelocity ?: @(-10);
}

- (NSNumber *)customViewMargin {
    return _customViewMargin ?: @8;
}

- (UIColor *)customViewBorderColor {
    return _customViewBorderColor ?: [UIColor clearColor];
}

- (NSNumber *)customViewBorderWidth {
    return _customViewBorderWidth ?: @(0);
}

- (UIColor *)backgroundColor {
    return _backgroundColor ?: [UIColor whiteColor];
}

#pragma mark - Text Field
- (NSNumber *)textFieldMaxLength {
    return _textFieldMaxLength ?: @25;
}

- (NSNumber *)textFieldVerticalMargin {
    return _textFieldVerticalMargin ?: @8;
}

#pragma mark - Shadow
- (NSNumber *)alertViewShadowRadius {
    return _alertViewShadowRadius ?: @2;
}

- (NSNumber *)alertViewShadowOpacity {
    return _alertViewShadowOpacity ?: @0.3f;
}

- (UIColor *)alertViewShadowColor {
    return _alertViewShadowColor ?: [UIColor blackColor];
}

- (CGSize)alertShadowOffset {
    return CGSizeEqualToSize(_alertShadowOffset, CGSizeZero) ? CGSizeMake(1, 1) : _alertShadowOffset;
}

#pragma mark - Blur / Background View
- (NSNumber *)blurEnabled {
    return _blurEnabled ?: @YES;
}

- (NSNumber *)blurRadius {
    return _blurRadius ?: @5;
}

- (NSNumber *)blurSaturationDelta {
    return _blurSaturationDelta ?: @1;
}

- (UIColor *)blurTintColor {
    _blurTintColor = _blurTintColor ?: [[UIColor whiteColor] colorWithAlphaComponent:0.4f];
    CGFloat red, green, blue, alpha;
    [_blurTintColor getRed:&red green:&green blue:&blue alpha:&alpha];
    NSAssert(alpha < 1.0f, @"URBNAlertStyle: blurTintColor alpha component must be less than 1.0f to see the blur effect. Please use colorWithAlphaComponent: when setting a custom blurTintColor, for example: [[UIColor whiteColor] colorWithAlphaComponent:0.4f]");
    
    return _blurTintColor;
}

#pragma mark - Disabled button styling
- (UIColor *)buttonTitleColorForActionType:(URBNAlertActionType)actionType isEnabled:(BOOL)enabled {
    if (self.disabledButtonTitleColor && !enabled) {
        return self.disabledButtonTitleColor;
    }
    
    switch (actionType) {
        case URBNAlertActionTypeCancel:
            return self.cancelButtonTitleColor;
            break;
        case URBNAlertActionTypeNormal:
            return self.buttonTitleColor;
            break;
        case URBNAlertActionTypeDestructive:
            return self.destructiveButtonTitleColor;
            break;
        default:
            return self.buttonTitleColor;
            break;
    }
}

- (UIColor *)buttonBackgroundColorForActionType:(URBNAlertActionType)actionType isEnabled:(BOOL)enabled {
    if (self.disabledButtonBackgroundColor && !enabled) {
        return self.disabledButtonBackgroundColor;
    }
    
    switch (actionType) {
        case URBNAlertActionTypeCancel:
            return self.cancelButtonBackgroundColor;
            break;
        case URBNAlertActionTypeNormal:
            return self.buttonBackgroundColor;
            break;
        case URBNAlertActionTypeDestructive:
            return self.destructionButtonBackgroundColor;
            break;
        default:
            return self.buttonBackgroundColor;
            break;
    }
}


- (NSNumber *)disabledButtonAlpha {
    return _disabledButtonAlpha ?: @(0.5f);
}

#pragma mark - Copying
- (instancetype)copyWithZone:(NSZone *)zone {
    URBNAlertStyle *styler = [URBNAlertStyle new];
    
    styler.alertMinWidth = self.alertMinWidth;
    styler.alertMaxWidth = self.alertMaxWidth;
    styler.buttonBackgroundColor = self.buttonBackgroundColor;
    styler.destructionButtonBackgroundColor = self.destructionButtonBackgroundColor;
    styler.destructiveButtonTitleColor = self.destructiveButtonTitleColor;
    styler.destructiveButtonHighlightTitleColor = self.destructiveButtonHighlightTitleColor;
    styler.cancelButtonBackgroundColor = self.cancelButtonBackgroundColor;
    styler.cancelButtonHighlightTitleColor = self.cancelButtonHighlightTitleColor;
    styler.cancelButtonTitleColor = self.cancelButtonTitleColor;
    styler.buttonTitleColor = self.buttonTitleColor;
    styler.backgroundColor = self.backgroundColor;
    styler.titleColor = self.titleColor;
    styler.buttonSelectedTitleColor = self.buttonSelectedTitleColor;
    styler.buttonSelectedBackgroundColor = self.buttonSelectedBackgroundColor;
    styler.messageColor = self.messageColor;
    styler.titleFont = self.titleFont;
    styler.titleAlignment = self.titleAlignment;
    styler.messageFont = self.messageFont;
    styler.messageAlignment = self.messageAlignment;
    styler.buttonFont = self.buttonFont;
    styler.buttonCornerRadius = self.buttonCornerRadius;
    styler.alertCornerRadius = self.alertCornerRadius;
    styler.textFieldMaxLength = self.textFieldMaxLength;
    styler.textFieldVerticalMargin = self.textFieldVerticalMargin;
    styler.textFieldEdgeInsets = self.textFieldEdgeInsets;
    styler.buttonHeight = self.buttonHeight;
    
    styler.buttonShadowOpacity = self.buttonShadowOpacity;
    styler.buttonShadowRadius = self.buttonShadowRadius;
    styler.buttonShadowColor = self.buttonShadowColor;
    styler.buttonShadowOffset = self.buttonShadowOffset;
    styler.buttonBorderColor = self.buttonBorderColor;
    styler.buttonBorderWidth = self.buttonBorderWidth;
    styler.buttonVerticalSeparatorWidth = self.buttonVerticalSeparatorWidth;
    styler.buttonVerticalSeparatorColor = self.buttonVerticalSeparatorColor;
    styler.buttonHighlightBackgroundColor = self.buttonHighlightBackgroundColor;
    styler.cancelButtonHighlightBackgroundColor = self.cancelButtonHighlightBackgroundColor;
    styler.destructiveButtonHighlightBackgroundColor = self.destructiveButtonHighlightBackgroundColor;
    styler.buttonHighlightTitleColor = self.buttonHighlightTitleColor;
    
    styler.sectionVerticalMargin = self.sectionVerticalMargin;
    styler.labelHorizontalMargin = self.labelHorizontalMargin;
    styler.buttonContentInsets = self.buttonContentInsets;
    styler.buttonMarginEdgeInsets = self.buttonMarginEdgeInsets;
    styler.buttontnEdgeInsetsString = self.buttontnEdgeInsetsString;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    styler.buttonHorizontalMargin = self.buttonHorizontalMargin;
#pragma clang diagnostic pop
    styler.customViewMargin = self.customViewMargin;
    styler.customViewBorderWidth = self.customViewBorderWidth;
    styler.customViewBorderColor = self.customViewBorderColor;
    styler.animationDuration = self.animationDuration;
    styler.animationDamping = self.animationDamping;
    styler.animationInitialVelocity = self.animationInitialVelocity;
    styler.alertViewShadowOpacity = self.alertViewShadowOpacity;
    styler.alertViewShadowRadius = self.alertViewShadowRadius;
    styler.alertViewShadowColor = self.alertViewShadowColor;
    styler.alertShadowOffset = self.alertShadowOffset;
    styler.blurEnabled = self.blurEnabled;
    styler.blurTintColor = self.blurTintColor;
    styler.backgroundViewTintColor = self.backgroundViewTintColor;
    styler.blurRadius = self.blurRadius;
    styler.blurSaturationDelta = self.blurSaturationDelta;
    styler.errorTextColor = self.errorTextColor;
    styler.errorTextFont = self.errorTextFont;
    styler.separatorColor = self.separatorColor;
    styler.separatorHeight = self.separatorHeight;
    styler.useVerticalLayoutForTwoButtons = self.useVerticalLayoutForTwoButtons;
    
    styler.buttonContainerTopBorderColor = self.buttonContainerTopBorderColor;
    styler.buttonContainerTopBorderWidth = self.buttonContainerTopBorderWidth;
    
    styler.buttonContainerBottomBorderColor = self.buttonContainerBottomBorderColor;
    styler.buttonContainerBottomBorderWidth = self.buttonContainerBottomBorderWidth;
    
    styler.buttonContainerRightBorderColor = self.buttonContainerRightBorderColor;
    styler.buttonContainerRightBorderWidth = self.buttonContainerRightBorderWidth;
    
    styler.buttonContainerLeftBorderColor = self.buttonContainerLeftBorderColor;
    styler.buttonContainerLeftBorderWidth = self.buttonContainerLeftBorderWidth;
    
    return styler;
}

@end
