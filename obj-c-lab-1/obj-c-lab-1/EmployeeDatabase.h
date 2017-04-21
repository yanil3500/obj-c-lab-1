//
//  EmployeeDatabase.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/18/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface EmployeeDatabase : NSObject 

+(instancetype)shared;

-(NSInteger)counter;

-(NSArray *)allEmployees;

-(Employee *)employeeAtIndex:(int)index;

-(void)add:(Employee *)employee;

-(void)remove:(Employee *)employee;

-(NSInteger)count;

-(void)removeEmployeeAtIndex:(int)index;

-(void)removeAllEmployees;

@end
