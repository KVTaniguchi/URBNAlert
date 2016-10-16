//
//  URBNSwiftAlertController.swift
//  Pods
//
//  Created by Kevin Taniguchi on 10/9/16.
//
//

import Foundation

typealias AlertButtonTouched = (_ alertController: URBNAlertController, _ index: Int) -> Void

class URBNSwiftAlertController: NSObject {
    static let sharedInstance = URBNSwiftAlertController()

    /**
     *  Create & set this property if you wish to customize various properties of the alert view.
     *  If none is passed, default values are used. See URBNAlertStyle for properties you can configue & default values.
     */
    var alertStyler: URBNSwiftAlertStyle {
        get {
            return alertStyler ?? URBNSwiftAlertStyle()
        }
        set {}
    }

    func dismissAlert() {

    }

    fileprivate var alertIsVisible = false
    fileprivate var queue = [URBNSwiftAlertView]()
    fileprivate var alertWindow = UIWindow()
    var presentingWindow = UIApplication.shared.windows.first

    func showNextAlert() {
        guard alertIsVisible == false, let alertViewController = queue.first else { return }
        alertIsVisible = true



//            // Called anytime the alert is dismissed after the animation is complete
//            [avc setFinishedDismissingBlock:^(BOOL wasTouchedOutside) {
//                if (wasTouchedOutside) {
//                [weakSelf dismissAlertViewController:weakAlertVC];
//                }
//
//                // If the queue is empty, remove the window. If not keep visible to present next alert(s)
//                if (!weakSelf.queue || weakSelf.queue.count == 0) {
//                [weakSelf.presentingWindow makeKeyAndVisible];
//                weakSelf.alertWindow.hidden = YES;
//                weakSelf.alertWindow = nil;
//                }
//                }];
//
//            [avc.alertView setButtonTouchedBlock:^(URBNAlertAction *action) {
//                if (action.completionBlock) {
//                action.completionBlock(action);
//                }
//
//                if (action.dismissOnCompletion) {
//                [weakSelf dismissAlertViewController:weakAlertVC];
//                }
//                }];
//
//            [avc.alertView setAlertViewTouchedBlock:^(URBNAlertAction *action) {
//                if (action.completionBlock) {
//                action.completionBlock(action);
//                }
//
//                [weakSelf dismissAlertViewController:weakAlertVC];
//                }];
//
//            // showInView: used
//            if (avc.alertConfig.presentationView) {
//                CGRect rect = avc.view.frame;
//                rect.size.width = avc.alertConfig.presentationView.frame.size.width;
//                rect.size.height = avc.alertConfig.presentationView.frame.size.height;
//                avc.view.frame = rect;
//
//                [avc.alertConfig.presentationView addSubview:avc.view];
//            }
//            else {
//                [self setupAlertWindow];
//                self.alertWindow.rootViewController = avc;
//                [self.alertWindow makeKeyAndVisible];
//            }
//
//            [NSObject cancelPreviousPerformRequestsWithTarget:self];
//            if (!avc.alertConfig.isActiveAlert) {
//                CGFloat duration = avc.alertConfig.duration == 0 ? [self calculateDuration:avc.alertConfig] : avc.alertConfig.duration;
//                [self performSelector:@selector(dismissAlertViewController:) withObject:avc afterDelay:duration];
//            }
//        }

    }
}

//**************

//#pragma mark - Show / Dismiss Methods
//- (void)showNextAlert {
//    if (!self.alertIsVisible && [self peekQueue]) {
//        self.alertIsVisible = YES;
//
//        URBNAlertViewController *avc = [self peekQueue];
//
//        // Called anytime the alert is dismissed after the animation is complete
//        [avc setFinishedDismissingBlock:^(BOOL wasTouchedOutside) {
//            if (wasTouchedOutside) {
//            [weakSelf dismissAlertViewController:weakAlertVC];
//            }
//
//            // If the queue is empty, remove the window. If not keep visible to present next alert(s)
//            if (!weakSelf.queue || weakSelf.queue.count == 0) {
//            [weakSelf.presentingWindow makeKeyAndVisible];
//            weakSelf.alertWindow.hidden = YES;
//            weakSelf.alertWindow = nil;
//            }
//            }];
//
//        [avc.alertView setButtonTouchedBlock:^(URBNAlertAction *action) {
//            if (action.completionBlock) {
//            action.completionBlock(action);
//            }
//
//            if (action.dismissOnCompletion) {
//            [weakSelf dismissAlertViewController:weakAlertVC];
//            }
//            }];
//
//        [avc.alertView setAlertViewTouchedBlock:^(URBNAlertAction *action) {
//            if (action.completionBlock) {
//            action.completionBlock(action);
//            }
//
//            [weakSelf dismissAlertViewController:weakAlertVC];
//            }];
//
//        // showInView: used
//        if (avc.alertConfig.presentationView) {
//            CGRect rect = avc.view.frame;
//            rect.size.width = avc.alertConfig.presentationView.frame.size.width;
//            rect.size.height = avc.alertConfig.presentationView.frame.size.height;
//            avc.view.frame = rect;
//
//            [avc.alertConfig.presentationView addSubview:avc.view];
//        }
//        else {
//            [self setupAlertWindow];
//            self.alertWindow.rootViewController = avc;
//            [self.alertWindow makeKeyAndVisible];
//        }
//
//        [NSObject cancelPreviousPerformRequestsWithTarget:self];
//        if (!avc.alertConfig.isActiveAlert) {
//            CGFloat duration = avc.alertConfig.duration == 0 ? [self calculateDuration:avc.alertConfig] : avc.alertConfig.duration;
//            [self performSelector:@selector(dismissAlertViewController:) withObject:avc afterDelay:duration];
//        }
//    }
//    }
//
//    - (void)dismissAlertViewController:(URBNAlertViewController *)avc {
//        self.alertIsVisible = NO;;
//        [avc dismiss];
//        [self showNextAlert];
//        }
//
//        - (void)dismissingAlert {
//            self.alertIsVisible = NO;
//            [self popQueue];
//            [self showNextAlert];
//            }
//
//            - (void)dismissAlert {
//                [self dismissAlertViewController:[self peekQueue]];
//}
//
//#pragma mark - Methods
//- (void)setupAlertWindow {
//    if (self.alertWindow) {
//        return;
//    }
//
//    self.presentingWindow = [[[UIApplication sharedApplication] windows] firstObject];
//
//    self.alertWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.alertWindow.windowLevel = UIWindowLevelAlert;
//    self.alertWindow.hidden = NO;
//    self.alertWindow.backgroundColor = [UIColor clearColor];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive:) name:UIWindowDidBecomeKeyNotification object:nil];
//    }
//
//    - (CGFloat)calculateDuration:(URBNAlertConfig *)config {
//        // The average number of words a person can read for minute is 250 - 300
//        NSInteger wordCount = [[config.title componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] count];
//        wordCount += [[config.message componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] count];
//
//        NSInteger wordsPerSecond = 300 / 60;
//        CGFloat calculatedDuration = ((wordCount / wordsPerSecond) < 2.f) ? 2.f : (wordCount / wordsPerSecond);
//
//        return calculatedDuration;
//}
//
//#pragma mark - Queueing
//- (void)addAlertToQueueWithAlertViewController:(URBNAlertViewController *)avc {
//    NSMutableArray *mutableQueue = [self.queue mutableCopy];
//    if (!mutableQueue) {
//        mutableQueue = [NSMutableArray new];
//    }
//
//    [mutableQueue addObject:avc];
//    self.queue = mutableQueue.copy;
//
//    [self showNextAlert];
//    }
//
//    - (URBNAlertViewController *)popQueue {
//        URBNAlertViewController *avc = self.queue.firstObject;
//
//        if (avc) {
//            NSMutableArray *mutableQueue = self.queue.mutableCopy;
//            [mutableQueue removeObjectAtIndex:0];
//            self.queue = mutableQueue.copy;
//        }
//
//        return avc;
//        }
//
//        - (URBNAlertViewController *)peekQueue {
//            return self.queue.firstObject;
//}
//
//#pragma mark - Notifications
///**
// *  Called when a new window becomes active.
// *  Specifically used to detect new alertViews or actionSheets so we can dismiss ourselves
// **/
//- (void)resignActive:(NSNotification *)note {
//    if (note.object == self.alertWindow || note.object == self.presentingWindow) {
//        return;
//    }
//    
//    [self dismissAlert];
//}
//
//@end
