//
//  TestIndexViewController.m
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import "TestIndexViewController.h"
#import "IndexPeriperalTableViewCell.h"
#import "FootBleSelectViewController.h"

static NSString *IndexPeriperalTableViewCellIdentifier = @"IndexPeriperalTableViewCellIdentifier";

@interface TestIndexViewController ()
@property (weak, nonatomic) IBOutlet UITableView *bleTableView;

@end

@implementation TestIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.bleTableView registerNib:[UINib nibWithNibName:@"IndexPeriperalTableViewCell" bundle:nil]
               forCellReuseIdentifier:IndexPeriperalTableViewCellIdentifier];
    self.bleTableView.tableFooterView = [[UIView alloc] init];
    [TestPeripheralManger sharedInstance].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[TestPeripheralManger sharedInstance].peripherals count] == 0) {
//        FootBleSelectViewController *constroller = [[FootBleSelectViewController alloc] initWithNibName:@"FootBleSelectViewController" bundle:nil];
//        [self.navigationController pushViewController:constroller animated:YES];
    } else {
        [TestPeripheralManger startReadRSSI];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)actionStop:(id)sender {
    [TestPeripheralManger startReadRSSI];
}

-(void)updatePeripheral:(LGPeripheral *)peripheral{
    [self.bleTableView reloadData];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[TestPeripheralManger sharedInstance].peripherals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndexPeriperalTableViewCell *cell = [self.bleTableView dequeueReusableCellWithIdentifier:IndexPeriperalTableViewCellIdentifier];
    [cell setPeripheral:[[TestPeripheralManger sharedInstance].peripherals objectAtIndex:indexPath.row]];
    
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
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
