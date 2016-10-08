//
//  ServersViewController.m
//  Control Your Servers
//
//  Created by Aleksey on 10/8/16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "ServersViewController.h"

@interface ServersViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *servers;

@end

@implementation ServersViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"Servers";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.servers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    return cell;
}

#pragma mark - Table view delegate

@end
