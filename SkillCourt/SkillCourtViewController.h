//
//  SkillCourtViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/30/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface SkillCourtViewController : UIViewController <CBPeripheralDelegate, CBCentralManagerDelegate, UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIButton *connectButton;
- (IBAction)pressedConnect:(id)sender;
// Instance of Central Manager.
@property (strong, nonatomic) CBCentralManager *centralManager;
// Stores a list of discovered devices, the key being their UUID.
@property (strong, nonatomic) NSMutableDictionary *devices;
// Instance method, used to act when a peripheral is discovered.
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;
// Instance method, used to act when a peripheral is selected to connect.
@property (strong, nonatomic) CBPeripheral *selectedPeripheral;
// Holds UUIDs.
@property (readonly, nonatomic) CFUUIDRef UUID;
// Stores peripheral characteristics.
@property (strong, nonatomic) CBCharacteristic *characteristics;
// Stores the advertising data of a peripheral.
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) IBOutlet UILabel *RSSI;
@property (strong, nonatomic) IBOutlet UILabel *rxDataLabel;
- (IBAction)pressedStart:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) NSArray *test;
@property (strong, nonatomic) IBOutlet UIButton *disconectButton;
- (IBAction)pressedDisconnect:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *bleNameLabel;
@property (strong, nonatomic) NSArray *theNumbers;
@property (strong, nonatomic) IBOutlet UITableView *myTable;

@end
