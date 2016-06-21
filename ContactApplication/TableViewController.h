//
//  TableViewController.h
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

- (IBAction)SortButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SortButtonImage;

@property BOOL isAscending;

@end
