//
//  URBNSwiftAlertAction.swift
//  Pods
//
//  Created by Kevin Taniguchi on 9/27/16.
//
//

import Foundation

enum URBNSwiftAlertActionType {
    case normal
    case destructive
    case cancel
    case passive
}

typealias URBNSwiftAlertCompletion = (URBNSwiftAlertAction) -> Void

class URBNSwiftAlertAction {
    var title = ""
    var dismissOnCompletion = true
    var isSelected = false
    var isButton: Bool {
        return self.actionType != .passive
    }

    var isEnabled: Bool = false {
        didSet {
            if isButton && actionButton != nil && actionType != .cancel {
                //                    [self.actionButton setEnabled:enabled];
                //                    [self styleButton:self.actionButton isEnabled:enabled];
            }
        }
    }

    var actionType: URBNSwiftAlertActionType = .normal
    var actionButton: URBNSwiftAlertActionButton?
    var completionBlock: URBNSwiftAlertCompletion?
    
    static func actionWithTitle(title: String, actionType: URBNSwiftAlertActionType, completion: @escaping URBNSwiftAlertCompletion) -> URBNSwiftAlertAction {
        return URBNSwiftAlertAction(title: title, actionType: actionType, dismissOnCompletion: true, completion: completion)
    }
    
    static func actionWithTitle(title: String, actionType: URBNSwiftAlertActionType, dismissOnCompletion: Bool, completion: @escaping URBNSwiftAlertCompletion) -> URBNSwiftAlertAction {
        return URBNSwiftAlertAction(title: title, actionType: actionType, dismissOnCompletion: dismissOnCompletion, completion: completion)
    }
    
    init(title: String, actionType: URBNSwiftAlertActionType, dismissOnCompletion: Bool, completion: URBNSwiftAlertCompletion?) {
        self.title = title
        self.actionType = actionType
        self.dismissOnCompletion = dismissOnCompletion
        self.completionBlock = completion
    }

    func styleButton(actionButton: URBNSwiftAlertActionButton, isEnabled: Bool) {
        //                    UIColor *titleColor = [self.actionButton.alertStyler buttonTitleColorForActionType:actionButton.actionType isEnabled:enabled];
        //                    UIColor *bgColor = [self.actionButton.alertStyler buttonBackgroundColorForActionType:actionButton.actionType isEnabled:enabled];
        //
        //                    [actionButton setTitleColor:titleColor forState:UIControlStateNormal];
        //                    [actionButton setBackgroundColor:bgColor];
        //                    actionButton.alpha = enabled ? 1.f : self.actionButton.alertStyler.disabledButtonAlpha.floatValue;
    }
}

