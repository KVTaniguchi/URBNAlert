//
//  URBNSwiftAlertConfig.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/9/16.
//
//

import UIKit

class URBNSwiftAlertConfig: NSObject {
    /**
    *  Title text for the alert
    */
    var title = ""

    /**
    *  Message text for the alert
    */
    var message = ""

    /**
     *  Array of actions added to the alert
     */
    var actions = [URBNSwiftAlertAction]()

    /**
     *  Array of UITextFields added to the array
     */
    var inputs = [UITextField]()

    /**
     *  The view to present from when using showInView:
     */
    weak var presentationView: UIView?

    /**
     *  Flag if the alert is active. False = a passive alert
     */
    var isActiveAlert = true

    /**
     *  Duration of a passive alert (no buttons added)
     */
    var duration = 3

    /**
     *  When set to YES, you can touch outside of an alert to dismiss it
     */
    var shouldTouchOutsideToDismiss = true
}
