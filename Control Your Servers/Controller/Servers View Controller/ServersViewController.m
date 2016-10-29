//
//  ServersViewController.m
//  Control Your Servers
//
//  Created by Aleksey on 10/8/16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "ServersViewController.h"
#import "ServerModel.h"
#import "CustomTableViewCell.h"
#import "ChangeServerViewController.h"
@interface ServersViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *gestureRecognizer;
@property (nonatomic, strong) NSMutableArray <ServerModel*> *servers;

@property (nonatomic,strong) NSArray *serversArray;
@end

@implementation ServersViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)viewWillAppear:(BOOL)animated{
    self.serversArray = [[NSUserDefaults standardUserDefaults] arrayForKey:@"servers"];
    [self.tableView reloadData];
}

- (void)setupView {
    self.title = @"Servers";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


#pragma mark - Actions

- (IBAction)longPressOnTableViewCell:(id)sender {
    CGPoint p = [self.gestureRecognizer locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    if (indexPath) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main.storyboard" bundle:nil];
        ChangeServerViewController *viewController = (ChangeServerViewController*)[storyboard instantiateViewControllerWithIdentifier:@"ChangeServerViewController"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.serversArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    
    cell.nameServerLabel.text = [[self.serversArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.addressServerLabel.text = [[self.serversArray objectAtIndex:indexPath.row] objectForKey:@"address"];
    return cell;
}

#pragma mark - Table view delegate

@end
