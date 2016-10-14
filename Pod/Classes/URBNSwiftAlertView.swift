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
    var buttons = [URBNSwiftAlertActionButton]()
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

        // Handle if no title or messages, give 0 margins
        let titleMargin = alertConfig.title.isEmpty ? 0 : alertStyler.sectionVerticalMargin
        let msgMargin = alertConfig.message.isEmpty ? 0 : alertStyler.sectionVerticalMargin

        if titleMargin.intValue > 0 {
            sectionCount += 1
        }

        if msgMargin.intValue > 0 {
            sectionCount += 1
        }

        let metrics = ["sectionMargin" : self.alertStyler.sectionVerticalMargin,
                        "btnH" : self.alertStyler.buttonHeight,
                        "lblHMargin" : self.alertStyler.labelHorizontalMargin,
                        "topVMargin" : titleMargin,
                        "msgVMargin" : msgMargin,
                        "sprHeight"  : self.alertStyler.separatorHeight,
                        "btnTopMargin" : self.alertStyler.buttonMarginEdgeInsets.top,
                        "btnLeftMargin" : self.alertStyler.buttonMarginEdgeInsets.left,
                        "btnBottomMargin" : self.alertStyler.buttonMarginEdgeInsets.bottom,
                        "btnRightMargin" : self.alertStyler.buttonMarginEdgeInsets.right,
                        "btnVInterval" : self.alertStyler.buttonMarginEdgeInsets.top + self.alertStyler.buttonMarginEdgeInsets.bottom,
                        "cvMargin" : self.alertStyler.customViewMargin,
                        "tfVMargin" : self.alertStyler.textFieldVerticalMargin,
                        "btnVSepW" : self.alertStyler.buttonVerticalSeparatorWidth,
                        "btnVSepMargin": self.alertStyler.buttonMarginEdgeInsets.right/2] as [String: Any]

        for lbl in [titleLabel, errorLabel] {
            lbl.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-lblHMargin-[lbl]-lblHMargin-|", options: [], metrics: metrics, views: ["lbl": lbl]))
        }

        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-lblHMargin-[tv]-lblHMargin-|", options: [], metrics: metrics, views: ["tv": messageTextView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-cvMargin-[customView]-cvMargin-|", options: [], metrics: metrics, views: views))

        if self.alertConfig.inputs.isEmpty {
            if self.alertConfig.isActiveAlert {
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-topVMargin-[titleLabel]-msgVMargin-[messageTextView]-cvMargin-[customView]-5-[errorLabel]-cvMargin-[buttonContainer]|", options: [], metrics: metrics, views: views))
            }
            else {
                // Passive alert, dont added margins for buttonContainer
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-topVMargin-[_titleLabel]-msgVMargin-[_messageTextView]-cvMargin-[_customView]-cvMargin-|", options: [], metrics: metrics, views: views))
            }
        }
        else {
            var vertVFL = "V:|-topVMargin-[titleLabel]-msgVMargin-[messageTextView]-cvMargin-[customView]-cvMargin-"

            for (index, tf) in self.alertConfig.inputs.enumerated() {
                vertVFL += "[textField\(index)]-tfVMargin-"
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-lblHMargin-[textField\(index)]-lblHMargin-|", options: [], metrics: metrics, views: views))
            }

            vertVFL += "[errorLabel][buttonContainer]|"
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: vertVFL, options: [], metrics: metrics, views: views))
        }


        // Button Constraints
        self.sectionCount += 1

        if buttons.count == 1, let btnOne = buttons.first {
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-btnLeftMargin-[btnOne]-btnRightMargin-|", options: [], metrics: metrics, views: ["btnOne": btnOne]))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-btnTopMargin-[btnOne(btnH)]-btnBottomMargin-|", options: [], metrics: metrics, views: ["btnOne": btnOne]))
        }
        else if buttons.count == 2 && self.alertStyler.useVerticalLayoutForTwoButtons.boolValue == false, let btnOne = buttons.first, let btnTwo = buttons.last  {
            var btns = ["btnOne": btnOne ,"btnTwo": btnTwo] as [String: Any]
            if self.alertStyler.buttonVerticalSeparatorWidth == nil {
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-btnLeftMargin-[btnOne]-btnRightMargin-[btnTwo(==btnOne)]-btnRightMargin-|", options: [], metrics: metrics, views: btns ))
            }
            else {
                let verticalSeparator = UIView()
                verticalSeparator.backgroundColor = self.alertStyler.buttonVerticalSeparatorColor
                verticalSeparator.translatesAutoresizingMaskIntoConstraints = false
                buttonContainer.addSubview(verticalSeparator)

                btns["vertSep"] = verticalSeparator

                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-btnLeftMargin-[btnOne]-btnVSepMargin-[vertSep(btnVSepW)]-btnVSepMargin-[btnTwo(==btnOne)]-btnRightMargin-|", options: [], metrics: metrics, views: btns))
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-btnTopMargin-[vertSep(btnH)]-btnBottomMargin-|", options: [], metrics: metrics, views: btns))
            }

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-btnTopMargin-[btnOne(btnH)]-btnBottomMargin-|", options: [], metrics: metrics, views: btns))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-btnTopMargin-[btnTwo(btnH)]-btnBottomMargin-|", options: [], metrics: metrics, views: btns))
        }
        else {
            var viewsDict = [:] as [String: Any]
            var vertVFL = "V:|"

            for index in 0...buttons.count {
                let buttonName = "btn\(index)"
                viewsDict[buttonName] = buttons[index]

                if separators.count == buttons.count {
                    let separatorName = "spr\(index)"
                    vertVFL += "[\(separatorName)(sprHeight)]-btnTopMargin-"
                    viewsDict[separatorName] = separators[index]
                    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-btnLeftMargin-[separator]-btnRightMargin-|", options: [], metrics: metrics, views: ["separator": separators[index]]))
                }
                else if index == 0 {
                    vertVFL += "-btnTopMargin-"
                }
                else {
                    vertVFL += "-btnVInterval-"
                }

                vertVFL += "[\(buttonName)(btnH)]"
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-btnLeftMargin-[button]-btnRightMargin-|", options: [], metrics: metrics, views: ["button": buttons[index]]))
            }

            if !buttons.isEmpty {
                vertVFL += "-btnBottomMargin-|"
                NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: vertVFL, options: [], metrics: metrics, views: viewsDict))
            }
        }

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[buttonContainer]|", options: [], metrics: metrics, views: views))

        // If passive alert & a passive action was added, need call back when alertview is touched
        if !self.alertConfig.isActiveAlert && !self.alertConfig.actions.isEmpty {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(passiveAlertViewTouched))
        }
    }

    func passiveAlertViewTouched() {
        guard let alertViewTouchedClosure = alertViewTouchedClosure, let firstAction = alertConfig.actions.first else { return }
        alertViewTouchedClosure(firstAction)
    }
}

extension URBNSwiftAlertView {
    override func layoutSubviews() {
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
    }
}


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

