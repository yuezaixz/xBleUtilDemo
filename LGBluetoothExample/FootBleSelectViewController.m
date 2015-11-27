//
//  FootBleSelectViewController.m
//  Foot
//
//  Created by 吴迪玮 on 15/7/15.
//  Copyright (c) 2015年 pandoranews. All rights reserved.
//

#import "FootBleSelectViewController.h"
#import "FootBleDevTableViewCell.h"
#import "LGBluetooth.h"

static NSString *FootBleDevTableViewCellIdentifier = @"FootBleDevTableViewCellIdentifier";

@interface FootBleSelectViewController ()

@end

@implementation FootBleSelectViewController{
    NSArray *tablePeripherals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tablePeripherals = @[];
    
    [self.bleDevTableView registerNib:[UINib nibWithNibName:@"FootBleDevTableViewCell" bundle:nil]
               forCellReuseIdentifier:FootBleDevTableViewCellIdentifier];
    self.bleDevTableView.tableFooterView = [[UIView alloc] init];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[LGCentralManager sharedInstance] stopScanForPeripherals];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tablePeripherals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FootBleDevTableViewCell *cell = [self.bleDevTableView dequeueReusableCellWithIdentifier:FootBleDevTableViewCellIdentifier];
    [cell setPeripheral:[tablePeripherals objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)table heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (IBAction)searchAgain:(id)sender {
    LGCentralManagerDiscoverPeripheralsCallback completion = ^(NSArray *peripherals)
    {
        if (peripherals.count) {
            tablePeripherals = [peripherals copy];
            
            [self.bleDevTableView reloadData];
        }
    };
    [[LGCentralManager sharedInstance] scanForPeripheralsByInterval:1
                                                         completion:completion];
}

- (IBAction)startAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
