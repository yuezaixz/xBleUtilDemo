//
//  TestIndexViewController.h
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestPeripheralManger.h"

@interface TestIndexViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TestPeripheralMangerDeletgate>

@end
