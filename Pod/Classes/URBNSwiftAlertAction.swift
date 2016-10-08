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


}

//
//        - (BOOL)isButton {
//            return (self.actionType != URBNAlertActionTypePassive);
//            }
//
//            - (void)setEnabled:(BOOL)enabled {
//                if (self.isButton && self.actionButton && self.actionType != URBNAlertActionTypeCancel) {
//                    [self.actionButton setEnabled:enabled];
//                    [self styleButton:self.actionButton isEnabled:enabled];
//                }
//                }
//
//                - (void)styleButton:(URBNAlertActionButton *)actionButton isEnabled:(BOOL)enabled {
//                    UIColor *titleColor = [self.actionButton.alertStyler buttonTitleColorForActionType:actionButton.actionType isEnabled:enabled];
//                    UIColor *bgColor = [self.actionButton.alertStyler buttonBackgroundColorForActionType:actionButton.actionType isEnabled:enabled];
//
//                    [actionButton setTitleColor:titleColor forState:UIControlStateNormal];
//                    [actionButton setBackgroundColor:bgColor];
//                    actionButton.alpha = enabled ? 1.f : self.actionButton.alertStyler.disabledButtonAlpha.floatValue;
//}


//@class URBNAlertAction, URBNAlertActionButton;
//
//typedef NS_ENUM(NSInteger, URBNAlertActionType) {
//    URBNAlertActionTypeNormal,
//    URBNAlertActionTypeDestructive,
//    URBNAlertActionTypeCancel,
//    URBNAlertActionTypePassive
//};
//
//typedef void(^URBNAlertCompletion)(URBNAlertAction *action);
//
//@interface URBNAlertAction : NSObject
//
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, assign) BOOL dismissOnCompletion;
//@property (nonatomic, assign) BOOL isSelected;
//@property (nonatomic, assign) URBNAlertActionType actionType;
//@property (nonatomic, weak) URBNAlertActionButton *actionButton;
//
//@property (nonatomic, copy) URBNAlertCompletion completionBlock;
//- (void)setCompletionBlock:(URBNAlertCompletion)completionBlock;
//
//+ (URBNAlertAction *)actionWithTitle:(NSString *)title actionType:(URBNAlertActionType)actionType actionCompleted:(URBNAlertCompletion)completionBlock;
//
//+ (URBNAlertAction *)actionWithTitle:(NSString *)title actionType:(URBNAlertActionType)actionType dismissOnActionComplete:(BOOL)dismiss actionCompleted:(URBNAlertCompletion)completionBlock;
//
///**
// *  Returns whether the action is a button or not
// *
// *  @return BOOL
// */
//- (BOOL)isButton;
//
///**
// *  If the action is a button, set the enabled state of that button.
// *
// *  @param enabled
// */
//- (void)setEnabled:(BOOL)enabled;
//
//@end

