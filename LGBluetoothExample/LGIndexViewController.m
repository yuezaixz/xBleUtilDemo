//
//  LGIndexViewController.m
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import "LGIndexViewController.h"
#import "IndexPeriperalTableViewCell.h"
#import "FootBleSelectViewController.h"

static NSString *IndexPeriperalTableViewCellIdentifier = @"IndexPeriperalTableViewCellIdentifier";

@interface LGIndexViewController ()
@property (weak, nonatomic) IBOutlet UITableView *bleTableView;

@end

@implementation LGIndexViewController

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
        FootBleSelectViewController *constroller = [[FootBleSelectViewController alloc] initWithNibName:@"FootBleSelectViewController" bundle:nil];
        [self.navigationController pushViewController:constroller animated:YES];
    } else {
        [TestPeripheralManger startReadRSSI];
        [self.bleTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)actionStop:(id)sender {
    NSArray *peripherals = [TestPeripheralManger sharedInstance].peripherals;
    NSMutableArray *logs = [NSMutableArray array];
    for (LGPeripheral *peripheral in peripherals) {
        [logs addObject:peripheral.resultForRssiTest];
    }
    //TODO 发送数据
    NSString *URLSafeName = [self URLEncodedString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]];
    NSString *URLSafeLog = [self URLEncodedString:[logs componentsJoinedByString:@"\n"]];
    NSMutableString *URLString = [NSMutableString stringWithFormat:@"mailto:%@?subject=%@%%20Console%%20Log&body=%@",
                                  @"david@paodong.cn" ?: @"", URLSafeName, URLSafeLog];
    
    [TestPeripheralManger stopReadRSSI];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString]];
}

- (NSString *)URLEncodedString:(NSString *)string
{
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, CFSTR("!*'\"();:@&=+$,/?%#[]% "), kCFStringEncodingUTF8));
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
