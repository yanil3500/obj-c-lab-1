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
#import "EmployeeCell.h"
#define kRowHeight 50

@interface ViewControlla () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewControlla

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"addedNewEmployee" object:nil];
    [super viewDidLoad];
    
    NSLog(@"All employees: %@", [[EmployeeDatabase shared] allEmployees]);
    Employee *newEmployeeOne = [[Employee alloc]initWithFirstName:@"aubrey" lastName:@"graham" andAge:@29 yearsEmployed:@9 andManager:@"Birdman" withEmail:@"email@example.com"];
    Employee *newEmployeeTwo = [[Employee alloc]initWithFirstName:@"sean" lastName:@"carter" andAge:@46 yearsEmployed:@12 andManager:@"Dame Dash" withEmail:@"email@example.com"];
    Employee *newEmployeeThree = [[Employee alloc]initWithFirstName:@"christopher" lastName:@"wallace" andAge:@46 yearsEmployed:@12 andManager:@"Puff Daddy" withEmail:@"email@example.com"];
    
    if([[EmployeeDatabase shared] count] == 0){
        [[EmployeeDatabase shared] add:newEmployeeOne];
        [[EmployeeDatabase shared] add:newEmployeeTwo];
        [[EmployeeDatabase shared] add:newEmployeeThree];
    } else {
    
    [[EmployeeDatabase shared] remove:newEmployeeThree];

    }

    
    NSLog(@"Inside of viewDidLoad: count of employees: %ld", (long)[[EmployeeDatabase shared] count]);
    
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view, typically from a nib.
    UINib *employeeNib = [UINib nibWithNibName:@"EmployeeCell" bundle:[NSBundle mainBundle] ];
    
    
    self.tableView.estimatedRowHeight = kRowHeight;
    [[self tableView] setRowHeight:UITableViewAutomaticDimension];
    [[self tableView] registerNib:employeeNib forCellReuseIdentifier:@"employeeCell"];
}

-(void)reloadData {
    [[self tableView] reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EmployeeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    

    cell.firstName.text = [@"First Name: " stringByAppendingString:[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] firstName]];
    cell.lastName.text = [@"Last Name: " stringByAppendingString:[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] lastName]];
    
    cell.age.text = [@"Age: " stringByAppendingString:[[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] age] stringValue]];
    cell.yearsEmployed.text = [@"# of Years Employed: " stringByAppendingString:[[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] yearsEmployed] stringValue]];
    cell.managersName.text = [@"Manager's Name: " stringByAppendingString:[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] managerName]];
    
    cell.email.text = [@"Email: " stringByAppendingString:[[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] email]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[EmployeeDatabase shared] count];
}


@end
