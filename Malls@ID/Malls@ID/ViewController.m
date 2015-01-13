//
//  ViewController.m
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/13/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    SWRevealViewController *revealViewController  = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 600, 600);
    [self.mapView setRegion:[self.mapView regionThatFits:region]animated:YES];
    
    //Annotation Location
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = userLocation.coordinate;
    point.title = @"You're at";
    point.subtitle = @"Farandi's House";
    
    [self.mapView addAnnotation:point];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",[locations lastObject]);
}

@end
