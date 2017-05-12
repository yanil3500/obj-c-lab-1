//
//  EmployeeCell.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/19/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *managersName;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *yearsEmployed;
@property (weak, nonatomic) IBOutlet UILabel *email;

@end
