//
//  TableViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "TableViewController.h"

#import <CoreData/CoreData.h>

#import "TableViewCell.h"

#import "ShowDetailViewController.h"



@interface TableViewController ()

@property (strong) NSMutableArray *contacts;

@end

@implementation TableViewController

- (NSManagedObjectContext *) managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate =  [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewDidAppear:(BOOL)animated{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest  = [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
    
    self.contacts = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView * )tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSManagedObjectModel *contact = [self.contacts objectAtIndex:indexPath.row];
    [cell.NameLabel setText:[NSString stringWithFormat:@"%@",[contact valueForKey:@"name"]]];
    [cell.EmailLabel setText:[NSString stringWithFormat:@"%@",[contact valueForKey:@"email"]]];
    [cell.PhoneLabel setText:[NSString stringWithFormat:@"%@",[contact valueForKey:@"phone"]]];
    
    if(![contact valueForKey:@"photo"]){
        [cell.PhotoView setImage:[UIImage imageNamed:@"user.png"]];
    }else{
        
        NSData *imgData = [contact valueForKey:@"photo"];
        UIImage *image = [UIImage imageWithData:imgData];
        [cell.PhotoView setImage:image];
        
    }
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"ShowDetail"]){
        ShowDetailViewController *detailView = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSManagedObjectModel *contact = [self.contacts objectAtIndex:myIndexPath.row];
        NSString *name = [NSString stringWithFormat:@"%@",[contact valueForKey:@"name"]];
        NSString *email = [NSString stringWithFormat:@"%@",[contact valueForKey:@"email"]];
        NSString *phone = [NSString stringWithFormat:@"%@",[contact valueForKey:@"phone"]];
        NSString *address = [NSString stringWithFormat:@"%@",[contact valueForKey:@"address"]];
        NSData *imgData;
        if(![contact valueForKey:@"photo"]){
           // NSLog();
            imgData = UIImagePNGRepresentation([UIImage imageNamed:@"user.png"]);
        }else{
            imgData = [contact valueForKey:@"photo"];
        }
        ;
        detailView.Details = @[name,email,phone, address, imgData];
        
        //debugging
        
        NSLog(name);
        NSLog(email);
        NSLog(phone);
        NSLog(address);
        
        
    }
}


- (IBAction)SortButton:(id)sender {
    
    
}
@end
