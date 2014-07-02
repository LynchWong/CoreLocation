//
//  LocationViewController.m
//  CoreLocationDemo
//
//  Created by Lynch on 7/2/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize locationManager = _locationManager;
@synthesize laLabel = _laLabel;
@synthesize loLabel = _loLabel;
@synthesize alLabel = _alLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     _laLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 40, 100, 20)];
     _loLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 80, 100, 20)];
     _alLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 120, 100, 20)];
    
    _laLabel.text = @"latitude";
    _loLabel.text = @"longitude";
    _alLabel.text = @"altitude";
    
    _laLabel.textAlignment = NSTextAlignmentCenter;
    _loLabel.textAlignment = NSTextAlignmentCenter;
    _alLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_laLabel];
    [self.view addSubview:_loLabel];
    [self.view addSubview:_alLabel];
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 100.0f;
    [_locationManager startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    _laLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    _loLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
    _alLabel.text = [NSString stringWithFormat:@"%f", location.altitude];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error : %@", error);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
