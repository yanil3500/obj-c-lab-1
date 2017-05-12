//
//  EmployeeDatabase.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/18/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "EmployeeDatabase.h"
#import "Employee.h"

@interface EmployeeDatabase ()

@property(strong, nonatomic) NSMutableArray *employees;

@end

@implementation EmployeeDatabase

+(instancetype)shared{
    

    static EmployeeDatabase *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class] alloc] init];
    });
    return shared;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.employees = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(NSURL *)documentsDirectory{
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    return documentsDirectoryURL;
}

-(NSURL *) archiveURL {
    return [[self documentsDirectory] URLByAppendingPathComponent:@"archive"];
}

-(NSInteger)count{
    return (NSInteger)_employees.count;
}

-(NSMutableArray *)allEmployees {
    NSMutableArray *copyOf = [[NSMutableArray alloc] initWithArray:_employees copyItems:YES];
    return copyOf;
}
-(Employee *)employeeAtIndex:(int)index{
    return [_employees objectAtIndex: index];
}
-(void)remove:(Employee *)employee {
    [_employees removeObject:employee];
    NSLog(@"Inside of removeEmployee: (after removal) number of employees %lu",(unsigned long)_employees.count);
}
-(void)removeAllEmployees{
    [_employees removeAllObjects];
}
-(void)add:(Employee *)employee{
    [self willChangeValueForKey:@"count"];
    NSLog(@"Inside of EmployeeDatabase: %@",employee.firstName);
    [_employees addObject:employee];
    [self didChangeValueForKey:@"count"];
}
-(void)removeEmployeeAtIndex:(int)index{
    [_employees removeObjectAtIndex:index];
}


//Makes a deep copy
//-(id)copyWithZone:(NSZone *)zone {
//    Person *person = [[Person alloc]init];
//    person.name = self.name;
//    person.email = self.email;
//    
//    return person;
//}
@end
