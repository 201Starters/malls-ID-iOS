//
//  DetailStoreViewController.m
//  Malls@ID
//
//  Created by reza hadafi on 1/15/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "DetailStoreViewController.h"

@interface DetailStoreViewController ()

@end

@implementation DetailStoreViewController

{
    NSArray *listVenue;
    NSArray *listLocation;
    NSArray *listVenueThumbnail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path      = [[NSBundle mainBundle]pathForResource:@"Venue" ofType:@"plist"];
    NSDictionary *dict  = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    listVenue           = [dict objectForKey:@"Name"];
    listLocation        = [dict objectForKey:@"Location"];
    listVenueThumbnail  = [dict objectForKey:@"Thumbnail"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [listVenue count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableItem" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableItem"];
    }
    
    UIImageView *ImageThumb = (UIImageView *)[cell viewWithTag:100];
    UILabel *LabelText=(UILabel *)[cell viewWithTag:101];
    UILabel *LabelLocation=(UILabel *)[cell viewWithTag:102];
    
    // Configure the cell...
    LabelText.text = [listVenue objectAtIndex:indexPath.row];
    ImageThumb.image = [UIImage imageNamed:[listVenueThumbnail objectAtIndex:indexPath.row]];
    LabelLocation.text =[listLocation objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
