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

@property (weak, nonatomic) IBOutlet UILabel *lessThan50Label;
@property (weak, nonatomic) IBOutlet UILabel *moreThan50Label;
@property (weak, nonatomic) IBOutlet UILabel *moreThan70Label;
@property (weak, nonatomic) IBOutlet UILabel *moreThan90Label;
@property (weak, nonatomic) IBOutlet UIView *levelView;


@end

@implementation IndexPeriperalTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    self.levelView.hidden = !self.levelView.hidden;
}

-(void)setPeripheral:(LGPeripheral *)peripheral{
    self.deviceName.text = peripheral.name;
    self.rssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.RSSI];
    self.maxRssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.maxRssi];
    self.avgRssiLabel.text = [NSString stringWithFormat:@"%ld",peripheral.avgRssi];
    self.minRssiLabe.text = [NSString stringWithFormat:@"%ld",peripheral.minRssi];
    
    self.lessThan50Label.text = [NSString stringWithFormat:@"%ld",peripheral.countLessThan50];
    self.moreThan50Label.text = [NSString stringWithFormat:@"%ld",peripheral.countMoreThan50];
    self.moreThan70Label.text = [NSString stringWithFormat:@"%ld",peripheral.countMoreThan70];
    self.moreThan90Label.text = [NSString stringWithFormat:@"%ld",peripheral.countMoreThan90];
}

@end
