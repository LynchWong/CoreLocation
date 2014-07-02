//
//  LocationViewController.h
//  CoreLocationDemo
//
//  Created by Lynch on 7/2/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@interface LocationViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, strong) UILabel *laLabel;
@property (nonatomic, strong) UILabel *loLabel;
@property (nonatomic, strong) UILabel *alLabel;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end
