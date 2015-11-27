//
//  IndexPeriperalTableViewCell.m
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import "IndexPeriperalTableViewCell.h"

@interface IndexPeriperalTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (weak, nonatomic) IBOutlet UILabel *rssiLabel;
@property (weak, nonatomic) IBOutlet UILabel *avgRssiLabel;
@property (weak, nonatomic) IBOutlet UILabel *minRssiLabe;
@property (weak, nonatomic) IBOutlet UILabel *maxRssiLabel;

@end

@implementation IndexPeriperalTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setPeripheral:(LGPeripheral *)peripheral{
    self.deviceName.text = peripheral.name;
    self.rssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.RSSI];
    self.maxRssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.maxRssi];
    self.avgRssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.avgRssi];
    self.minRssiLabe.text = [NSString stringWithFormat:@"%ld",peripheral.minRssi];
}

@end
