//
//  EmployeeDatabase.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/18/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "EmployeeDatabase.h"

@implementation EmployeeDatabase


-(NSURL *)documentsDirectory{
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    return documentsDirectoryURL;
}

-(NSURL *) archiveURL {
    return [[self documentsDirectory] URLByAppendingPathComponent:@"archive"];
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
