//
//  AddContactViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "AddContactViewController.h"
#import <CoreData/CoreData.h>

@interface AddContactViewController ()

@end

@implementation AddContactViewController

@synthesize contact;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SaveButton:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
    [newContact setValue:self.Fullname.text forKey:@"name"];
    [newContact setValue:self.Email.text forKey:@"email"];
    [newContact setValue:self.PhoneNumber.text forKey:@"phone"];
 
    NSError *error = nil;
    
    if(![context save:&error]){
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
 
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

- (IBAction)DismissKeyboard:(id)sender {
    [self resignFirstResponder];
}
@end
