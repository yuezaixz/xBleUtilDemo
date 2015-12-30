//
//  TestPeripheralManger.m
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import "TestPeripheralManger.h"

@implementation TestPeripheralManger{
    NSTimer *readTimer;
}

static TestPeripheralManger *instance;

+ (TestPeripheralManger *)sharedInstance {
    if (!instance) {
        instance = [[self alloc] init];
    }
    return instance;
}

-(NSMutableArray *)peripherals{
    if (!_peripherals) {
        _peripherals = [NSMutableArray array];
    }
    return _peripherals;
}

+ (void)startReadRSSI {
    [[TestPeripheralManger sharedInstance] startReadRSSI];
}

+ (void)stopReadRSSI {
    [[TestPeripheralManger sharedInstance] stopReadRSSI];
}

- (void)startReadRSSI {
    if (!readTimer) {
        readTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(readAllRSSI) userInfo:nil repeats:YES];
    }
}

- (void)readAllRSSI{
    for (LGPeripheral *peripheral in self.peripherals) {
        [peripheral readRSSIValueCompletion:^(NSNumber *rssi,NSError *error){
            if (rssi) {
                [peripheral.rssiArray addObject:rssi];
                peripheral.RSSI = rssi.integerValue;
                if ([self.delegate respondsToSelector:@selector(updateAllPeripheral:)]) {
                    [self.delegate updateAllPeripheral:self.peripherals];
                }
                if ([self.delegate respondsToSelector:@selector(updatePeripheral:)]) {
                    [self.delegate updatePeripheral:peripheral];
                }
            }
        }];
    }
}

- (void)stopReadRSSI {
    [readTimer invalidate];
    readTimer = nil;
}

@end
