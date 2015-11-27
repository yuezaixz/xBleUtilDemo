//
//  FootBleSelectViewController.h
//  Foot
//
//  Created by 吴迪玮 on 15/7/15.
//  Copyright (c) 2015年 pandoranews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootBleSelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *bleDevTableView;

@end
