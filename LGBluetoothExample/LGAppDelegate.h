//
//  LGAppDelegate.h
//  LGBluetoothExample
//
//  Created by David Sahakyan on 2/7/14.
//  Copyright (c) 2014 David Sahakyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FootNavigationController.h"
#import "iConsole.h"

@interface LGAppDelegate : UIResponder <UIApplicationDelegate, iConsoleDelegate>

//@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) FootNavigationController *globalNavigationController;
@property (strong, nonatomic) iConsoleWindow *window;

@end
