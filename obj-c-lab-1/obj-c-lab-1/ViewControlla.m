//
//  ViewController.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "ViewControlla.h"
#import "Employee.h"
#import "EmployeeDatabase.h"

@interface ViewControlla () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewControlla

- (void)viewDidLoad {
    [super viewDidLoad];
    Employee *newEmployeeOne = [[Employee alloc]initWithFirstName:@"aubrey" lastName:@"graham" andAge:@29 yearsEmployed:@9 andManager:@"Birdman" withEmail:@"email@example.com"];
    Employee *newEmployeeTwo = [[Employee alloc]initWithFirstName:@"sean" lastName:@"carter" andAge:@46 yearsEmployed:@12 andManager:@"Dame Dash" withEmail:@"email@example.com"];
    Employee *newEmployeeThree = [[Employee alloc]initWithFirstName:@"christopher" lastName:@"wallace" andAge:@46 yearsEmployed:@12 andManager:@"Puff Daddy" withEmail:@"email@example.com"];
    [[EmployeeDatabase shared] add:newEmployeeOne];
    [[EmployeeDatabase shared] add:newEmployeeTwo];
    [[EmployeeDatabase shared] add:newEmployeeThree];
    

    
    NSLog(@"Inside of viewDidLoad: count of employees: %ld", (long)[[EmployeeDatabase shared] count]);
    
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
   
    
    cell.textLabel.text = [[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] firstName];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"Inside of numberOfRowsInSection: %li",(long)[[EmployeeDatabase shared] count]);
    return [[EmployeeDatabase shared] count];
}


@end
