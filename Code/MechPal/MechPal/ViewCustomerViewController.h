//
//  ViewCustomerViewController.h
//  MechPal
//
//  Created by ilabadmin on 9/29/16.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ViewController.h"
#import "DbManager.h"

@interface ViewCustomerViewController : ViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) DbManager *dbManager;

@property (nonatomic, strong) NSArray *arrPeopleInfo;

@property (weak, nonatomic) IBOutlet UITableView *tblPeople;

-(void)loadData;

@end
