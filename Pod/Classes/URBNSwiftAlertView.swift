//
//  URBNSwiftAlertView.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/9/16.
//
//

import Foundation
import URBNConvenience
import URBNConvenience.UIView_URBNBorders

typealias URBNSwiftAlertViewButtonTouched = (URBNSwiftAlertAction) -> Void
typealias URBNSwiftAlertViewTouched = (URBNSwiftAlertAction) -> Void

class URBNSwiftAlertView: UIView, UITextFieldDelegate {
    var errorLabelText: String {
        get {
            return ""
        }
        set {}
    }

    func setLoadingState(hasNewState: Bool, forTextFieldAtIndex: Int) {

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var buttonTouchedBlock: URBNSwiftAlertViewButtonTouched? {
        get {
            return buttonTouchedBlock ?? nil
        }
        set {}
    }
    var alertViewTouchedClosure: URBNSwiftAlertViewTouched? {
        get {
            return alertViewTouchedClosure ?? nil
        }
        set {}
    }

    var alertConfig: URBNSwiftAlertConfig
    var alertStyler: URBNSwiftAlertStyle
    var titleLabel = UILabel()
    var messageTextView = UITextView()
    var errorLabel = UILabel()
    var customView: UIView?
    var buttons = [UIButton]()
    var sectionCount: Int = 0

    init(alertConfig: URBNSwiftAlertConfig, alertStyler: URBNSwiftAlertStyle, customView: UIView? = nil) {
        self.alertStyler = alertStyler
        self.alertConfig = alertConfig

        super.init(frame: CGRect.zero)

        if let customView = customView {
            self.customView = customView
            sectionCount += 1
            self.customView?.layer.borderWidth = CGFloat(self.alertStyler.customViewBorderWidth)
            self.customView?.layer.borderColor = self.alertStyler.customViewBorderColor.cgColor
        }
        else {
            self.customView = UIView()
        }

        self.customView?.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = self.alertStyler.backgroundColor ?? .white
        layer.cornerRadius = CGFloat(self.alertStyler.alertCornerRadius)

        let buttonContainer = UIView()
        buttonContainer.setURBNBorder(border: buttonContainer.urbn_topBorder, color: self.alertStyler.buttonContainerTopBorderColor, width: CGFloat(self.alertStyler.buttonContainerTopBorderWidth))
        buttonContainer.setURBNBorder(border: buttonContainer.urbn_bottomBorder, color: self.alertStyler.buttonContainerBottomBorderColor, width: CGFloat(self.alertStyler.buttonContainerBottomBorderWidth))
        buttonContainer.setURBNBorder(border: buttonContainer.urbn_rightBorder, color: self.alertStyler.buttonContainerRightBorderColor, width: CGFloat(self.alertStyler.buttonContainerRightBorderWidth))
        buttonContainer.setURBNBorder(border: buttonContainer.urbn_leftBorder, color: self.alertStyler.buttonContainerLeftBorderColor, width: CGFloat(self.alertStyler.buttonContainerLeftBorderWidth))

        var views = ["titleLabel": titleLabel, "messageTextView": messageTextView, "buttonContainer": buttonContainer, "errorLabel": errorLabel]
        addSubview(titleLabel)
        addSubview(messageTextView)
        addSubview(errorLabel)
        if let customView = customView {
            addSubview(customView)
            views["customView"] = customView
        }

        for (index, textField) in alertConfig.inputs.enumerated() {
            textField.edgeInsets = alertStyler.textFieldEdgeInsets
            textField.translatesAutoresizingMaskIntoConstraints = false
            views["textField\(index)"] = textField
            sectionCount += 1
            addSubview(textField)
        }

        // add some buttons
        var buttons = [URBNSwiftAlertActionButton]()
        var separators = [UIView]()

        buttonContainer.translatesAutoresizingMaskIntoConstraints = false

        for (index, action) in alertConfig.actions.enumerated() {
            if action.isButton {
                if alertStyler.separatorHeight > 0 {
                    let separator = UIView()
                    separator.backgroundColor = alertStyler.separatorColor
                    separator.translatesAutoresizingMaskIntoConstraints = false
                    buttonContainer.addSubview(separator)
                    separators.append(separator)
                }
            }

            let button = createAlertViewButtonWith(action: action, index: index)
            buttonContainer.addSubview(button)
            buttons.append(button)
            action.actionButton = button
        }

        addSubview(buttonContainer)
    }
}


//        // Handle if no title or messages, give 0 margins
//        NSNumber *titleMargin = self.alertConfig.title.length > 0 ? self.alertStyler.sectionVerticalMargin : @0;
//        NSNumber *msgMargin = self.alertConfig.message.length > 0 ? self.alertStyler.sectionVerticalMargin : @0;
//
//        if (titleMargin.floatValue > 0) {
//            self.sectionCount++;
//        }
//
//        if (msgMargin.floatValue > 0) {
//            self.sectionCount++;
//        }
//
//        NSDictionary *metrics = @{@"sectionMargin" : self.alertStyler.sectionVerticalMargin,
//            @"btnH" : self.alertStyler.buttonHeight,
//            @"lblHMargin" : self.alertStyler.labelHorizontalMargin,
//            @"topVMargin" : titleMargin,
//            @"msgVMargin" : msgMargin,
//            @"sprHeight"  : self.alertStyler.separatorHeight,
//            @"btnTopMargin" : @(self.alertStyler.buttonMarginEdgeInsets.top),
//            @"btnLeftMargin" : @(self.alertStyler.buttonMarginEdgeInsets.left),
//            @"btnBottomMargin" : @(self.alertStyler.buttonMarginEdgeInsets.bottom),
//            @"btnRightMargin" : @(self.alertStyler.buttonMarginEdgeInsets.right),
//            @"btnVInterval" : @(self.alertStyler.buttonMarginEdgeInsets.top + self.alertStyler.buttonMarginEdgeInsets.bottom),
//            @"cvMargin" : self.alertStyler.customViewMargin,
//            @"tfVMargin" : self.alertStyler.textFieldVerticalMargin,
//            @"btnVSepW" : self.alertStyler.buttonVerticalSeparatorWidth,
//            @"btnVSepMargin": @(self.alertStyler.buttonMarginEdgeInsets.right/2)
//        };
//
//        for (UIView *lbl in @[self.titleLabel, self.messageTextView, self.errorLabel]) {
//            lbl.translatesAutoresizingMaskIntoConstraints = NO;
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-lblHMargin-[lbl]-lblHMargin-|" options:0 metrics:metrics views:NSDictionaryOfVariableBindings(lbl)]];
//        }
//
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-cvMargin-[_customView]-cvMargin-|" options:0 metrics:metrics views:views]];
//
//        if (!self.alertConfig.inputs && self.alertConfig.inputs.count == 0) {
//            if (self.alertConfig.isActiveAlert) {
//                [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topVMargin-[_titleLabel]-msgVMargin-[_messageTextView]-cvMargin-[_customView]-5-[_errorLabel]-cvMargin-[buttonContainer]|" options:0 metrics:metrics views:views]];
//            }
//                // Passive alert, dont added margins for buttonContainer
//            else {
//                [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topVMargin-[_titleLabel]-msgVMargin-[_messageTextView]-cvMargin-[_customView]-cvMargin-|" options:0 metrics:metrics views:views]];
//            }
//        }
//        else {
//            NSMutableString *vertVfl = [NSMutableString stringWithString:@"V:|-topVMargin-[_titleLabel]-msgVMargin-[_messageTextView]-cvMargin-[_customView]-cvMargin-"];
//
//            [self.alertConfig.inputs enumerateObjectsUsingBlock:^(UITextField *tf, NSUInteger idx, BOOL *stop) {
//            [vertVfl appendString:[NSString stringWithFormat:@"[textField%lu]-tfVMargin-", (unsigned long)idx]];
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-lblHMargin-[textField%lu]-lblHMargin-|", (unsigned long)idx] options:0 metrics:metrics views:views]];
//            }];
//
//            [vertVfl appendString:@"[_errorLabel][buttonContainer]|"];
//
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vertVfl options:0 metrics:metrics views:views]];
//        }
//
//        // Button Constraints
//        self.buttons = [btns copy];
//        self.sectionCount++;
//        if (self.buttons.count == 1) {
//            [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnLeftMargin-[btnOne]-btnRightMargin-|" options:0 metrics:metrics views:@{@"btnOne" : self.buttons.firstObject}]];
//            [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-btnTopMargin-[btnOne(btnH)]-btnBottomMargin-|" options:0 metrics:metrics views:@{@"btnOne" : self.buttons.firstObject}]];
//        }
//        else if (self.buttons.count == 2 && !self.alertStyler.useVerticalLayoutForTwoButtons.boolValue) {
//            if (!self.alertStyler.buttonVerticalSeparatorWidth) {
//                [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnLeftMargin-[btnOne]-btnRightMargin-[btnTwo(==btnOne)]-btnRightMargin-|" options:0 metrics:metrics views:@{@"btnOne" : self.buttons.firstObject, @"btnTwo" : self.buttons.lastObject}]];
//            }
//            else {
//                UIView *verticalSeparator = [UIView new];
//                verticalSeparator.backgroundColor = self.alertStyler.buttonVerticalSeparatorColor;
//                verticalSeparator.translatesAutoresizingMaskIntoConstraints = NO;
//                [buttonContainer addSubview:verticalSeparator];
//
//                [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnLeftMargin-[btnOne]-btnVSepMargin-[vertSep(btnVSepW)]-btnVSepMargin-[btnTwo(==btnOne)]-btnRightMargin-|" options:0 metrics:metrics views:@{@"btnOne" : self.buttons.firstObject, @"btnTwo" : self.buttons.lastObject, @"vertSep": verticalSeparator}]];
//                [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-btnTopMargin-[vertSep(btnH)]-btnBottomMargin-|" options:0 metrics:metrics views:@{@"vertSep": verticalSeparator}]];
//            }
//
//            [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-btnTopMargin-[btnOne(btnH)]-btnBottomMargin-|" options:0 metrics:metrics views:@{@"btnOne" : self.buttons.firstObject}]];
//            [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-btnTopMargin-[btnTwo(btnH)]-btnBottomMargin-|" options:0 metrics:metrics views:@{@"btnTwo" : self.buttons[1]}]];
//        }
//        else {
//            NSMutableDictionary *viewsDictionary = [NSMutableDictionary new];
//            NSMutableString *verticalConstraintsFormat = [NSMutableString stringWithString:@"V:|"];
//            for (int i = 0; i < self.buttons.count; i++) {
//                NSString *buttonName = [NSString stringWithFormat:@"btn%d", i];
//                [viewsDictionary setValue:self.buttons[i] forKey:buttonName];
//                if ([separators count]) {
//                    NSString *separatorName = [NSString stringWithFormat:@"spr%d", i];
//                    [verticalConstraintsFormat appendFormat:@"[%@(sprHeight)]-btnTopMargin-", separatorName];
//                    [viewsDictionary setValue:separators[i] forKey:separatorName];
//                    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnLeftMargin-[separator]-btnRightMargin-|" options:0 metrics:metrics views:@{@"separator" : separators[i]}]];
//                }
//                else if (i == 0) {
//                    [verticalConstraintsFormat appendString:@"-btnTopMargin-"];
//                }
//                else {
//                    [verticalConstraintsFormat appendString:@"-btnVInterval-"];
//                }
//                [verticalConstraintsFormat appendFormat:@"[%@(btnH)]", buttonName];
//                [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnLeftMargin-[button]-btnRightMargin-|" options:0 metrics:metrics views:@{@"button" : self.buttons[i]}]];
//            }
//            if (self.buttons.count) {
//                [verticalConstraintsFormat appendString:@"-btnBottomMargin-|"];
//                [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintsFormat options:0 metrics:metrics views:viewsDictionary]];
//            }
//        }
//
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buttonContainer]|" options:0 metrics:metrics views:views]];
//
//        // If passive alert & a passive action was added, need call back when alertview is touched
//        if (!self.alertConfig.isActiveAlert && self.alertConfig.actions.count > 0) {
//            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(passiveAlertViewTouched)];
//            [self addGestureRecognizer:tapGesture];
//        }
//    }
//
//    return self;
//    }
//
//    - (void)layoutSubviews {
//        [self.messageTextView sizeToFit];
//        [self.messageTextView layoutIfNeeded];
//
//        CGFloat buttonHeight = self.buttons.count == 0 ? 0 : self.alertStyler.buttonHeight.floatValue;
//        CGFloat numberOfVerticalButtons;
//
//        if (self.buttons.count == 2 && !self.alertStyler.useVerticalLayoutForTwoButtons.boolValue) {
//            numberOfVerticalButtons = 1;
//        }
//        else {
//            numberOfVerticalButtons = self.buttons.count;
//        }
//
//        CGFloat screenHeight = SCREEN_HEIGHT;
//
//        // Need this check because before iOS 8 screen.bounes.size is NOT orientation dependent
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        if ((SYSTEM_VERSION_LESS_THAN(@"8.0")) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
//            screenHeight = screenSize.width;
//        }
//
//        CGFloat verticalSectionMarginsHeight = (self.alertStyler.sectionVerticalMargin.floatValue * self.sectionCount);
//        CGFloat buttonsHeight = (buttonHeight * numberOfVerticalButtons);
//        CGFloat buttonsSeperatorHieght  = (numberOfVerticalButtons > 1) ? (self.alertStyler.separatorHeight.floatValue * numberOfVerticalButtons) : 0;
//        CGFloat maxHeight = screenHeight - self.titleLabel.intrinsicContentSize.height - verticalSectionMarginsHeight - buttonsHeight - buttonsSeperatorHieght - kURBNAlertViewHeightPadding;
//
//        if (!self.messageTextView.urbn_heightLayoutConstraint) {
//            [self.messageTextView urbn_addHeightLayoutConstraintWithConstant:0];
//        }
//
//        if (self.messageTextView.text.length > 0) {
//            if (self.messageTextView.contentSize.height > maxHeight) {
//                self.messageTextView.urbn_heightLayoutConstraint.constant = maxHeight;
//                self.messageTextView.scrollEnabled = YES;
//            }
//            else {
//                self.messageTextView.urbn_heightLayoutConstraint.constant = self.messageTextView.contentSize.height;
//            }
//        }
//        // code above needs to be called before super. Crashes on iOS 7 if called after
//
//        [super layoutSubviews];
//
//        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.frame.size.width;
//
//        self.layer.shadowColor = self.alertStyler.alertViewShadowColor.CGColor;
//        self.layer.shadowOffset = self.alertStyler.alertShadowOffset;
//        self.layer.shadowOpacity = self.alertStyler.alertViewShadowOpacity.floatValue;
//        self.layer.shadowRadius = self.alertStyler.alertViewShadowRadius.floatValue;
//        [self.layer setActions:@{@"shadowPath" : [NSNull null]}];
//}
//
//#pragma mark - Getters
//- (UILabel *)titleLabel {
//    if (!_titleLabel) {
//        _titleLabel = [UILabel new];
//        _titleLabel.numberOfLines = 2;
//        _titleLabel.textAlignment = self.alertStyler.titleAlignment;
//        _titleLabel.adjustsFontSizeToFitWidth = YES;
//        _titleLabel.font = self.alertStyler.titleFont;
//        _titleLabel.textColor = self.alertStyler.titleColor;
//        _titleLabel.text = self.alertConfig.title;
//    }
//
//    return _titleLabel;
//    }
//
//    - (UITextView *)messageTextView {
//        if (!_messageTextView) {
//            _messageTextView = [UITextView new];
//            _messageTextView.backgroundColor = [UIColor clearColor];
//            _messageTextView.font = self.alertStyler.messageFont;
//            _messageTextView.textColor = self.alertStyler.messageColor;
//            _messageTextView.text = self.alertConfig.message;
//            _messageTextView.textAlignment = self.alertStyler.messageAlignment;
//            _messageTextView.scrollEnabled = NO;
//            _messageTextView.editable = NO;
//            [_messageTextView setContentInset:UIEdgeInsetsZero];
//            [_messageTextView scrollRangeToVisible:NSMakeRange(0, 0)];
//        }
//
//        return _messageTextView;
//        }
//
//        - (UILabel *)errorLabel {
//            if (!_errorLabel) {
//                _errorLabel = [UILabel new];
//                _errorLabel.numberOfLines = 0;
//                _errorLabel.font = self.alertStyler.errorTextFont;
//                _errorLabel.textColor = self.alertStyler.errorTextColor;
//                _errorLabel.alpha = 0;
//            }
//
//            return _errorLabel;
//}
//



//
//    - (void)setErrorLabelText:(NSString *)errorText {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.errorLabel.text = errorText;
//            self.errorLabel.alpha = 1;
//            }];
//        }
//
//        - (void)setLoadingState:(BOOL)newState forTextFieldAtIndex:(NSUInteger)index {
//            [self setButtonsEnabled:!newState];
//            if (index < self.alertConfig.inputs.count) {
//                UITextField *textField = [self.alertConfig.inputs objectAtIndex:index];
//
//                if (newState) {
//                    // Disable buttons, show loading
//                    [textField urbn_showLoading:YES animated:YES spinnerInsets:UIEdgeInsetsMake(0, 0, 0, 8)];
//                }
//                else {
//                    if (textField) {
//                        [textField urbn_showLoading:NO animated:YES];
//                    }
//                }
//            }
//            }
//
//            - (void)setButtonsEnabled:(BOOL)enabled {
//                for (URBNAlertAction *action in self.alertConfig.actions) {
//                    [action setEnabled:enabled];
//                }
//}
//
//#pragma mark - Actions
//- (void)buttonTouch:(id)sender {
//    UIButton *btn = (UIButton *)sender;
//
//    if (self.buttonTouchedBlock) {
//        self.buttonTouchedBlock([self.alertConfig.actions objectAtIndex:btn.tag]);
//    }
//    }
//
//    - (void)passiveAlertViewTouched {
//        if (self.alertViewTouchedBlock) {
//            self.alertViewTouchedBlock(self.alertConfig.actions.firstObject);
//        }
//}
//
//#pragma mark - UITextFieldDelegate
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    // Prevent crashing undo bug
//    if(range.length + range.location > textField.text.length) {
//        return NO;
//    }
//
//    NSUInteger newLength = [textField.text length] + [string length] - range.length;
//
//    return (newLength > self.alertStyler.textFieldMaxLength.integerValue) ? NO : YES;
//    }
//
//    - (BOOL)textFieldShouldReturn:(UITextField *)textField {
//        [textField resignFirstResponder];
//
//        return NO;
//}
//
//@end
//
//#pragma mark - Helper for Button Container Style
//@implementation UIView (URBNBorderConfig)
//
//- (void)setURBNBorder:(URBNBorder *)border withColor:(UIColor *)color andWidth:(NSNumber *)width {
//    if (!color || !width) {
//        return;
//    }
//
//    border.color = color;
//    border.width = width.floatValue;
//}




extension URBNSwiftAlertView {
    func createAlertViewButtonWith(action: URBNSwiftAlertAction, index: Int) -> URBNSwiftAlertActionButton {
        var bgColor = action.isSelected ? alertStyler.buttonSelectedBackgroundColor : alertStyler.buttonBackgroundColor
        var titleColor = alertStyler.buttonTitleColor
        var highlightColor = alertStyler.buttonHighlightTitleColor
        let selectedColor = alertStyler.buttonSelectedTitleColor

        if action.actionType == .destructive {
            titleColor = alertStyler.destructiveButtonTitleColor
            bgColor = alertStyler.destructionButtonBackgroundColor;
            highlightColor = alertStyler.destructiveButtonHighlightTitleColor;
        }
        else if action.actionType == .cancel {
            titleColor = alertStyler.cancelButtonTitleColor;
            bgColor = alertStyler.cancelButtonBackgroundColor;
            highlightColor = alertStyler.cancelButtonHighlightTitleColor;
        }

        let btn = URBNSwiftAlertActionButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = bgColor
        btn.titleLabel?.font = alertStyler.buttonFont;
        btn.layer.cornerRadius = CGFloat(alertStyler.buttonCornerRadius)
        btn.layer.shadowColor = alertStyler.buttonShadowColor.cgColor
        btn.layer.shadowOpacity = Float(alertStyler.buttonShadowOpacity)
        btn.layer.shadowRadius = CGFloat(alertStyler.buttonShadowRadius)
        btn.layer.shadowOffset = alertStyler.buttonShadowOffset
        btn.layer.borderColor = alertStyler.buttonBorderColor.cgColor;
        btn.layer.borderWidth = CGFloat(alertStyler.buttonBorderWidth)
        btn.contentEdgeInsets = alertStyler.buttonContentInsets;
    
        btn.tag = index;
        btn.actionType = action.actionType;
        btn.alertStyler = alertStyler;

        btn.setTitle(action.title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setTitleColor(highlightColor, for: .highlighted)
        btn.setTitleColor(selectedColor, for: .selected)

        btn.addTarget(self, action: #selector(URBNSwiftAlertView.buttonTouch(sender:)), for: .touchUpInside)
        btn.isSelected = action.isSelected
        return btn
    }

    func buttonTouch(sender: URBNSwiftAlertActionButton) {

    }
}

extension UIView {
    func setURBNBorder(border: URBNBorder, color: UIColor?, width: CGFloat) {
        border.color = color
        border.width = width
    }
}

