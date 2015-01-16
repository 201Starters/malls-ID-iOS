//
//  VenueViewController.m
//  Malls@ID
//
//  Created by Farandi Kusumo on 1/13/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "VenueViewController.h"
#import "SWRevealViewController.h"
#import "VenueTableViewCell.h"
#import "DetailTabBarController.h"

@interface VenueViewController ()

@end

@implementation VenueViewController{
    NSArray *listMall;
    NSArray *listMallLocation;
    NSArray *listMallThumbnail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    SWRevealViewController *revealViewController  = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    NSString *path      = [[NSBundle mainBundle]pathForResource:@"Venue" ofType:@"plist"];
    NSDictionary *dict  = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    listMall            = [dict objectForKey:@"Name"];
    listMallLocation    = [dict objectForKey:@"Location"];
    listMallThumbnail   = [dict objectForKey:@"Thumbnail"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [listMall count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VenueTableCell" forIndexPath:indexPath];
    
    VenueTableViewCell *cell = (VenueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"VenueTableCell"];
    // Configure the cell...
    
    
    cell.thumbnail.image = [UIImage imageNamed:[listMallThumbnail objectAtIndex:indexPath.row]];
    cell.nameLabel.text = [listMall objectAtIndex:indexPath.row];
    cell.locationLabel.text = [listMallLocation objectAtIndex:indexPath.row];
    
    
    /*
    [cell.thumbnail setImage:[UIImage imageNamed:[listMallThumbnail objectAtIndex:indexPath.row]]];
    [cell.nameLabel setText:[listMall objectAtIndex:indexPath.row]];
    [cell.locationLabel setText:[listMallLocation objectAtIndex:indexPath.row]];
    */
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailTabBarController *destViewController = segue.destinationViewController;
        [destViewController setMallName:[listMall objectAtIndex:indexPath.row]];
        [destViewController setMallLocation:[listMallLocation objectAtIndex:indexPath.row]];
        [destViewController setMallThumbnail:[listMallThumbnail objectAtIndex:indexPath.row]];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
