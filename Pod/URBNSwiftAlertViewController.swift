//
//  URBNSwiftAlertViewController.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/9/16.
//
//

import UIKit

typealias URBNSwiftAlertViewControllerFinishedDismissing = (_ wasTouchedOutside: Bool) -> Void

class URBNAlertViewController: UIViewController {
    //typedef void(^URBNAlertViewControllerFinishedDismissing)(BOOL wasTouchedOutside);
    //

    /**
     *  Initialize with a title and/or message, as well as a customView if desired
     *
     *  @param title   Optional. The title text displayed in the alert
     *  @param message Optional. The message text displayed in the alert
     *  @param view    The custom UIView you wish to display in the alert
     *
     *  @return A URBNAlertViewController ready to be configurated further or displayed
     */
    init(title: String, message: String? = nil, view: UIView? = nil) {


        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     *  The actual alertView created & displayed within this view controller
     */
    //@property (nonatomic, strong) URBNAlertView *alertView;
    var alertView: URBNAlertView?

    /**
     *  The style object associated with this alert
     */
    //@property (nonatomic, strong) URBNAlertStyle *alertStyler;
    var alertStyler: URBNSwiftAlertStyle?

    /**
     *  The configuration object associated with this alert
     */
    //@property (nonatomic, strong) URBNAlertConfig *alertConfig;
    var alertConfig: URBNSwiftAlertConfig?

    /**
     *  The customView displayed in the alert, if passed
     */
    //@property (nonatomic, strong) UIView *customView;
    var customView: UIView?

    /**
     *  Use this method to show a created/configurated URBNAlertViewController.
     *  Alert will be presented in a new window on top of your app
     */
    //- (void)show;
    func show() {

    }

    /**
     *  Use this method if you wish to show the alert in a specific view and not in a new window
     *
     *  @param view The view in which the alert will appear
     */
    //- (void)showInView:(UIView *)view;
    func showInView(view: UIView) {

    }

    /**
     *  Call anytime you want to dismiss the currently presented alert
     */
    //- (void)dismiss;
    func dismiss() {

    }

    /**
     *  Dismiss the alert with a sender. Used to detect when the dismiss is called from a gesture
     *
     *  @param sender Who is causing the dismiss
     */
    //- (void)dismissAlert:(id)sender;
    func dismissAlert(sender: AnyObject) {

    }

    /**
     *  Add a action to the alert. See URBNAlertAction.h for types & initializers
     *
     *  @param action The URBNAlertAction to be added to the alert
     */
    //- (void)addAction:(URBNAlertAction *)action;
    func addAction(action: URBNSwiftAlertAction) {

    }

    /**
     *  Add a textField to the alert. Configure the textField's properties in the handler.
     *  Note: only 1 text field is supported at the moment
     *
     *  @param configurationHandler If you wish to customize the textFields properties, provide this block
     */
    //- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler;
    func addTextFieldWithConfigurationHandler(_ textField: (UITextField) -> Void) {

    }

    /**
     *  Use this method to display an error message to the user.
     *  The error displays under above the buttons, and below a textField
     *
     *  @param errorText The error you want to display to the user
     */
    ////- (void)showInputError:(NSString *)errorText;
    func showInputError(errorText: String) {

    }

    /**
     *  When called, any buttons are disabled and the textfield at the given index
     *     animates with a loading indicator
     *
     *  @param index Index of the textfield you wish to animate
     */
    ////- (void)startLoadingTextFieldAtIndex:(NSUInteger)index;
    func startLoadingTextFieldAtIndex(index: Int) {

    }

    /**
     *  When called, any buttons are disabled and the first textfield
     *      adnimates with a loading indicator. Kept for convenience & backwards compatability
     */
    ////- (void)startLoading;
    func startLoading() {

    }

    /**
     *  Enables all buttons and removes the textField loading spinner if present
     */
    ////- (void)stopLoading;
    func stopLoading() {

    }

    /**
     *  Getter for the 1st textField added to the alert. Kept for convenience & backwards compatability
     */
    //- (UITextField *)textField;
    var textField: UITextField {
        get {
            return UITextField()
        }
        set {}
    }

    /**
     *  Helpers to get a textfield for a given index
     *
     *  @param index The index of the textfield you wish to get
     *
     *  @return
     */
    //- (UITextField *)textFieldAtIndex:(NSUInteger)index;
    func textFieldAtIndex(index: Int) -> UITextField? {
        return nil
    }
    
    /**
     *  Used to detect when the alert has completed its dismissing animation
     */
    //@property (nonatomic, copy) URBNAlertViewControllerFinishedDismissing finishedDismissingBlock;
    var finishedDismissingClosure: URBNSwiftAlertViewControllerFinishedDismissing? {
        get {
            return nil
        }
        set {}
    }
    
    /**
     *  Provide a block that will run when the alert has completed its dismissing animation
     *
     *  @param finishedDismissingBlock Block of code to run
     */
    ////- (void)setFinishedDismissingBlock:(URBNAlertViewControllerFinishedDismissing)finishedDismissingBlock;
    //
    //@end
}
