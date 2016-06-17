//
//  AddContactViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "AddContactViewController.h"
#import <CoreData/CoreData.h>

#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_PASSWORD_LIMIT @"^.{6,20}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_PHONE_DEFAULT @"[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"

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
    
    [self setupAlerts];
}

-(void)setupAlerts{
    [self.Fullname addRegx:REGEX_USER_NAME_LIMIT withMsg:@"Name limit should be come between 3-10"];
    [self.Fullname addRegx:REGEX_USER_NAME withMsg:@"Only alpha numeric characters are allowed."];
    self.Fullname.validateOnResign=NO;
    
    [self.Email addRegx:REGEX_EMAIL withMsg:@"Enter valid email."];
    
    [self.PhoneNumber addRegx:REGEX_PHONE_DEFAULT withMsg:@"Phone number must be in proper format (eg. ###-###-####)"];
    self.PhoneNumber.isMandatory=NO;
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
    
    if([self.Fullname validate] & [self.Email validate] & [self.PhoneNumber validate] ){
        
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
    
    
    
    
}

- (IBAction)DismissKeyboard:(id)sender {
    [self resignFirstResponder];
}
@end
