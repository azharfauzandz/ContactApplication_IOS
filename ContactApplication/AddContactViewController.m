//
//  AddContactViewController.m
//  ContactApplication
//
//  Created by Bukalapak on 6/16/16.
//  Copyright © 2016 Bukalapak. All rights reserved.
//

#import "AddContactViewController.h"
#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>

#define REGEX_NAME_LIMIT @"^.{3,16}$"
#define REGEX_NAME @"[A-Za-z\\s]{3,16}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_PHONE_DEFAULT @"[\\+0-9][0-9]{6,16}"

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
    //setup alert
    [self setupAlerts];
    
    //To make the border look very close to a UITextField
    [self.Address.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.Address.layer setBorderWidth:0.4];
    //The rounded corner part, where you specify your view's corner radius:
    self.Address.layer.cornerRadius = 5;
    self.Address.clipsToBounds = YES;
    //set no profile image
    [self.PhotoProfile setImage:[UIImage imageNamed:@"user.png"]];
}

-(void)setupAlerts{
    //fullName alert
    [self.Fullname addRegx:REGEX_NAME_LIMIT withMsg:@"Name limit should be come between 3-10"];
    [self.Fullname addRegx:REGEX_NAME withMsg:@"Only alphabet A-z dan space"];
    self.Fullname.validateOnResign=NO;
    //emailAlert
    [self.Email addRegx:REGEX_EMAIL withMsg:@"Enter valid email"];
    //phoneNumberAlert
    [self.PhoneNumber addRegx:REGEX_PHONE_DEFAULT withMsg:@"Enter valid phone"];
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

- (IBAction)PickerImage:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (IBAction)CameraImage:(id)sender {
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.PhotoProfile setImage:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SaveButton:(id)sender {
    
    if([self.Fullname validate] & [self.Email validate] & [self.PhoneNumber validate]){
        
        NSManagedObjectContext *context = [self managedObjectContext];
        NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
        
        UIImage *img = [self.PhotoProfile image];
        NSData *imgData = UIImagePNGRepresentation(img);
        
        //save to core data
        [newContact setValue:self.Fullname.text forKey:@"name"];
        [newContact setValue:self.Email.text forKey:@"email"];
        [newContact setValue:self.PhoneNumber.text forKey:@"phone"];
        [newContact setValue:self.Address.text forKey:@"address"];
        [newContact setValue:imgData forKey:@"photo"];
        
        //if there is error
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
