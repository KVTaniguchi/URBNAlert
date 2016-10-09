//
//  URBNSwiftAlertActionButton.swift
//  Pods
//
//  Created by Kevin Taniguchi on 9/27/16.
//
//

import UIKit

//// URBNAlertActionButton
//@interface URBNAlertActionButton : UIButton
//
//@property (nonatomic, assign) URBNAlertActionType actionType;
//@property (nonatomic, weak) URBNAlertStyle *alertStyler;
//
//@end

class URBNSwiftAlertActionButton: UIButton {
    var actionType: URBNSwiftAlertActionType?
    var alertStyler: URBNAlertStyle?

    override var isHighlighted: Bool {
        set {
            guard let type = actionType else { return }
            switch type {
            case .destructive:
                backgroundColor = isHighlighted ? .red: .green
            case .cancel:
                backgroundColor = isHighlighted ? .red: .green
            default:
                backgroundColor = isHighlighted ? .red: .green
            }
        }
        get {
            return super.isHighlighted
        }
    }

    override var isSelected: Bool {
        set {
//        self.backgroundColor = selected ? self.alertStyler.buttonSelectedBackgroundColor : [self.alertStyler buttonBackgroundColorForActionType:self.actionType isEnabled:self.enabled];
            backgroundColor = isSelected ? .red : .green
        }
        get {
            return super.isSelected
        }
    }
}
