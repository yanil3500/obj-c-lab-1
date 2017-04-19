//
//  AddEmployeeViewControlla.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/19/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "AddEmployeeViewControlla.h"
#import "Employee.h"
#import "EmployeeDatabase.h"

@interface AddEmployeeViewControlla ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *yearsEmployed;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *managerName;
- (IBAction)save:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end

@implementation AddEmployeeViewControlla

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (Employee *)getEmployeeInfo{
    if(![[self.firstName text]  isEqual: @""] && ![[self.lastName text]  isEqual: @""] && ![[self.age text]  isEqual: @""] && ![[self.yearsEmployed text]  isEqual: @""] && ![[self.managerName text]  isEqual: @""] && ![[self.email text]  isEqual: @""]){
        Employee *newEmployee = [[Employee alloc]initWithFirstName:[_firstName text] lastName:[_lastName text] andAge:[NSNumber numberWithInt:(int)[_age text]] yearsEmployed:[NSNumber numberWithInt:(int)[_yearsEmployed text]] andManager:[_managerName text] withEmail:[_email text]];
        
        return newEmployee;
    }

    return nil;
}



- (IBAction)save:(UIBarButtonItem *)sender {
    [[EmployeeDatabase shared] add:[self getEmployeeInfo]];
    //Send notification to tableView that new employee has been added
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addedNewEmployee" object:nil];
    //Goes to previous view controller
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    NSLog(@"Inside of cancel button");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
