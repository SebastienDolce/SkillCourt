//
//  SkillCourtViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/30/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "SkillCourtViewController.h"

@interface SkillCourtViewController ()

@end

@implementation SkillCourtViewController 
@synthesize RSSI,rxDataLabel,centralManager,characteristics,connectButton,selectedPeripheral,startButton,statusLabel,devices,data,discoveredPeripheral,UUID, test, disconectButton,bleNameLabel, theNumbers,myTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    myTable.layer.cornerRadius = 10;
    myTable.layer.borderWidth = 1.5;
    myTable.clipsToBounds = YES;
    myTable.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    theNumbers = [[NSArray alloc] initWithObjects:@"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8", @"test9", nil];
    connectButton.layer.cornerRadius = 10;
    connectButton.layer.borderWidth = 1.5;
    connectButton.clipsToBounds = YES;
    connectButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    disconectButton.layer.cornerRadius = 10;
    disconectButton.layer.borderWidth = 1.5;
    disconectButton.clipsToBounds = YES;
    disconectButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    startButton.layer.cornerRadius = 10;
    startButton.layer.borderWidth = 1.5;
    startButton.clipsToBounds = YES;
    startButton.layer.borderColor = [UIColor whiteColor].CGColor;
    

    
    if (selectedPeripheral == nil ||
        selectedPeripheral.state == CBPeripheralStateDisconnected)
    {
        disconectButton.enabled = NO;
        statusLabel.text = @"Disconnected";
        bleNameLabel.text = @"";
        
    }

    test = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    myTable.delegate = self;
    myTable.dataSource = self;
    // Do any additional setup after loading the view.
    // Allocates and initializes an instance of the CBCentralManager.
   // centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    //[self.bleTable reload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Make sure iOS BT is on.  Then start scanning.
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    // You should test all scenarios
    if (central.state != CBCentralManagerStatePoweredOn) {
        // In case Bluetooth is off.
        return;
        // Need to add code here stating unable to access Bluetooth.
    }
    if (central.state == CBCentralManagerStatePoweredOn) {
        //If it's on, scan for devices.
        [centralManager scanForPeripheralsWithServices:nil options:nil];
    }
}

// Report what devices have been found.
- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI
{
    // Set peripheral.
    discoveredPeripheral = peripheral;
    
    // Create a string for the discovered peripheral.
    NSString * uuid = [[peripheral identifier] UUIDString];
    
    if (uuid) //Make sure we got the UUID.
    {
        //This sets the devices object.peripheral = uuid
        [self.devices setObject:peripheral forKey:uuid];
        NSLog([NSString stringWithFormat:@"%@", uuid]);
    }
    
    if ([uuid isEqualToString:@"BFFE58FD-28C9-C62F-827B-ED8D7675A39F"])
    {
        statusLabel.text= @"Connecting...";
        NSLog(@"Connecting to peripheral %@", peripheral);
        [centralManager connectPeripheral:peripheral options:nil];
        
         NSLog(@"Connected to peripheral %@", peripheral.name);
        bleNameLabel.text =peripheral.name;
        [centralManager stopScan];
        NSLog(@"scan stopped %ld", (long)peripheral.state);

    }
        //Refresh data in the table.
    //[self.tableView reloadData];
    
}

- (NSMutableDictionary *)devices
{
    // Make sure the device dictionary is empty.
    if (devices == nil)
    {
        // Let's get the top 6 devices.
        devices = [NSMutableDictionary dictionaryWithCapacity:6];
    }
    // Return a dictionary of devices.
    return devices;
}

// Run this whenever we have connected to a device.
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    statusLabel.text= @"Connected";
    // Set the peripheral delegate.
    peripheral.delegate = self;
    // Set the peripheral method's discoverServices to nil,
    // this searches for all services, its slower but inclusive.
    [peripheral discoverServices:nil];
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    // Enumerate through all services on the connected peripheral.
    for (CBService * service in [peripheral services])
    {
        NSLog(@"Discovered service %@", service);
        // Discover all characteristics for this service.
        [selectedPeripheral discoverCharacteristics:nil forService:service];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral
didDiscoverCharacteristicsForService:(CBService *)service
             error:(NSError *)error
{
    // Enumerate through all services on the connected peripheral.
    for (CBCharacteristic * character in [service characteristics])
    {
        NSLog(@"Discovered characteristic %@", characteristics);
        NSLog(@"Reading value for characteristic %@", characteristics);
        [peripheral readValueForCharacteristic:characteristics];
        // Discover all descriptors for each characteristic.
        [selectedPeripheral discoverDescriptorsForCharacteristic:character];
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error

{
    
    //Put RX data collection here.
    
}

- (void)peripheral:(CBPeripheral *)peripheral
didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic
             error:(NSError *)error
{
    //Store data from the UUID in byte format, save in the bytes variable.
    const char * bytes =[(NSData*)[[characteristic UUID] data] bytes];
    //Check to see if it is two bytes long, and they are both FF and E1.
    if (bytes && strlen(bytes) == 2 && bytes[0] == (char)255 && bytes[1] == (char)225)
    {
        // We set the connected peripheral data to the instance peripheral data.
        selectedPeripheral = peripheral;
        for (CBService * service in [selectedPeripheral services])
        {
            
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // For every characteristic on every service, on the connected peripheral
                // set the setNotifyValue to true.
                [selectedPeripheral setNotifyValue:true forCharacteristic:characteristic];
            }
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)sendData:(NSData *)data {
    
    [self.selectedPeripheral writeValue:data forCharacteristic:self.characteristics type:CBCharacteristicWriteWithResponse];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"send Value" message:@"Sent" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok"];
    [alert show];

}


- (void)peripheral:(CBPeripheral *)peripheral
didWriteValueForCharacteristic:(CBCharacteristic *)characteristic
             error:(NSError *)error {
    if (error == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrote characteristic" message:@"Successfully wrote characteristic" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok"];
        [alert show];
    }
    else {
        NSLog(@"Error writing characteristic %@",error);
    }
}

//-(void)readCharacteristic {
//    [self.selectedPeripheral readCharacteristic:self.characteristics];
//}





- (IBAction)pressedConnect:(id)sender {
    connectButton.enabled = NO;
     centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    disconectButton.enabled = YES;
}
- (IBAction)pressedStart:(id)sender {
    NSString* str = @"s";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self sendData:data];
}
- (IBAction)pressedDisconnect:(id)sender {
    if (selectedPeripheral != nil &&
        selectedPeripheral.state != CBPeripheralStateDisconnected)
    {
        NSLog(@"Peripheral disconnecting");
        [centralManager cancelPeripheralConnection:selectedPeripheral];
        selectedPeripheral = nil;
        statusLabel.text = @"Disconnected";
    }
    else
        NSLog(@"already disconnected");
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    //return [theSteps count];
    return [theNumbers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = theNumbers [indexPath.row];
    return cell;
}



@end
