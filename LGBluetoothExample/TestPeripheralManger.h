//
//  TestPeripheralManger.h
//  LGBluetoothExample
//
//  Created by 吴迪玮 on 15/11/27.
//  Copyright © 2015年 David Sahakyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGBluetooth.h"

@protocol TestPeripheralMangerDeletgate <NSObject>

@optional

- (void)updateAllPeripheral:(NSMutableArray *)peripherals;

- (void)updatePeripheral:(LGPeripheral *)peripheral;

@end

@interface TestPeripheralManger : NSObject

@property (nonatomic,strong) NSMutableArray *peripherals;
@property (nonatomic,weak) id<TestPeripheralMangerDeletgate> delegate;

+ (TestPeripheralManger *)sharedInstance;

+ (void)startReadRSSI;

+ (void)stopReadRSSI;

@end
