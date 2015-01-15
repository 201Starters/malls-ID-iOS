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

@interface ViewController () <CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>{
    BOOL _didStartMonitoringRegion;
}
@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) NSMutableArray *geofences;

@end

@implementation ViewController{
    NSArray *imagePromoList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.geofences = [NSMutableArray arrayWithArray:[[self.locationManager monitoredRegions]allObjects]];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
//    UIActivityIndicatorView *spinner;
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [spinner setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0)];
//    [self.view addSubview:spinner];
//    [spinner startAnimating];
    
    SWRevealViewController *revealViewController  = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    NSString *path      = [[NSBundle mainBundle]pathForResource:@"Promo" ofType:@"plist"];
    NSDictionary *dict  = [[NSDictionary alloc]initWithContentsOfFile:path];
    imagePromoList = [dict objectForKey:@"thumbnail"];
    
    NSLog(@"System Version is %@",[[UIDevice currentDevice]systemVersion]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 600, 600);
    [self.mapView setRegion:[self.mapView regionThatFits:region]animated:YES];
    [self.locationLabel setText:[NSString stringWithFormat:@"You're at %.4f , %.4f",userLocation.coordinate.latitude,userLocation.coordinate.longitude]];
}

#pragma mark - Location Manager Delegates

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{

}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

#pragma mark - table view delegates

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"promoCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"promoCell"];
    }
    UIImageView *promoImage = (UIImageView *)[cell viewWithTag:10];
    promoImage.image = [UIImage imageNamed:[imagePromoList objectAtIndex:indexPath.row]];
//    cell.imageView.image = [UIImage imageNamed:[imagePromoList objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [imagePromoList count];
}


@end
