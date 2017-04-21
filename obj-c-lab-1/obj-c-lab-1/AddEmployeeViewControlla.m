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

@interface AddEmployeeViewControlla () <UITextFieldDelegate>
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
    self.age.delegate = self;
    self.yearsEmployed.delegate = self;
    [super viewDidLoad];
    
}



- (Employee *)getEmployeeInfo{
    if([[self.firstName text] length] != 0 && [[self.lastName text] length] != 0 && [[self.age text] length] != 0 && [[self.yearsEmployed text] length] != 0 && [[self.managerName text] length] != 0 && [[self.email text] length] != 0){
        Employee *newEmployee = [[Employee alloc]initWithFirstName:[self.firstName text]
                                                          lastName:[self.lastName text]
                                                            andAge:[NSNumber numberWithInt:(int)[[self.age text] integerValue]]
                                                     yearsEmployed:[NSNumber numberWithInt:(int)[[self.yearsEmployed text] integerValue]]
                                                        andManager:[self.managerName text]
                                                         withEmail:[self.email text]];
        
        
        
        NSLog(@"Inside of addEmployeeViewControlla (checking value of age): %li",[[self.age text] integerValue]);
        NSLog(@"Inside of addEmployeeViewControlla (checking value of years employed): %@", [self.yearsEmployed text]);
        
        return newEmployee;
    }

    return nil;
}

//Courtesy of Stack Overflow
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    /* for backspace */
    if([string length]==0){
        return YES;
    }
    /*  limit to only numeric characters  */
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) {
            return YES;
        }
    }
    
    return NO;
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
