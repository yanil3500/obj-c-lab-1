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

static void *kvoContext = &kvoContext;
@interface ViewControlla () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewControlla

- (void)viewDidLoad {
    NSLog(@"Inside of viewDidLoad: The number of employees: %i", (int)EmployeeDatabase.shared.counter);
    [super viewDidLoad];
    
    Employee *newEmployeeOne = [[Employee alloc]initWithFirstName:@"aubrey" lastName:@"graham" andAge:@29 yearsEmployed:@9 andManager:@"Birdman" withEmail:@"email@example.com"];
    Employee *newEmployeeTwo = [[Employee alloc]initWithFirstName:@"sean" lastName:@"carter" andAge:@46 yearsEmployed:@12 andManager:@"Dame Dash" withEmail:@"email@example.com"];
    Employee *newEmployeeThree = [[Employee alloc]initWithFirstName:@"christopher" lastName:@"wallace" andAge:@46 yearsEmployed:@12 andManager:@"Puff Daddy" withEmail:@"email@example.com"];
    
    if([[EmployeeDatabase shared] counter] == 0){
        [[EmployeeDatabase shared] add:newEmployeeOne];
        [[EmployeeDatabase shared] add:newEmployeeTwo];
        [[EmployeeDatabase shared] add:newEmployeeThree];
    } 

    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view, typically from a nib.
    UINib *employeeNib = [UINib nibWithNibName:@"EmployeeCell" bundle:[NSBundle mainBundle] ];
    
    
    self.tableView.estimatedRowHeight = kRowHeight;
    [[self tableView] setRowHeight:UITableViewAutomaticDimension];
    [[self tableView] registerNib:employeeNib forCellReuseIdentifier:@"employeeCell"];
}

-(void)reloadTable{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [EmployeeDatabase addObserver:self forKeyPath:@"shared.numberOfEmployees" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:kvoContext];
}

- (void)viewWillDisappear:(BOOL)animated{
//    [EmployeeDatabase removeObserver:self forKeyPath:@"shared.numberOfEmployees"];
}

//Disables automatic kvo
+(BOOL)automaticallyNotifiesObserversOfTableView{
    return NO;
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
    
    return [[EmployeeDatabase shared] counter];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[EmployeeDatabase shared] removeEmployeeAtIndex:(int)indexPath.row];
        [self reloadTable] ;
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (context == kvoContext){
        NSLog(@"The KVO is working!");
        [self reloadTable];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)dealloc{
    [EmployeeDatabase removeObserver:self forKeyPath:@"shared.numberOfEmployees"];
}

@end
