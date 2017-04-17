//
//  Employee.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Employee.h"

@implementation Employee

NSNumber * _employeeNumber;
NSNumber * _yearsEmployed;
NSString * _managerName;

- (NSNumber *) employeeNumber {
    return _employeeNumber;
}

- (void) setEmployeeNumber:(NSNumber *) employeeNum {
    _employeeNumber = employeeNum;
}

- (NSNumber *) yearsEmployed {
    return _yearsEmployed;
}

- (void) setYearsEmployed:(NSNumber *) years {
    _yearsEmployed = years;
}

- (NSString *) managerName {
    return _managerName;
}

- (void) setManagerName:(NSString *) managerName {
    _managerName = managerName;
}

@end
