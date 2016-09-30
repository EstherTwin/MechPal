//
//  PreviewMechViewController.m
//  MechPal
//
//  Created by ilabafrica on 26/09/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "PreviewMechViewController.h"
#import "ViewMechViewController.h"

@interface PreviewMechViewController ()

@end

@implementation PreviewMechViewController
@synthesize PreviewModel=_PreviewModel;
@synthesize name=_name;
@synthesize icon=_icon;
@synthesize detail=_detail;
@synthesize contact=_contact;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_icon setImage:[UIImage imageNamed: @"mech1.jpeg"]];
    [_detail setText:_PreviewModel.snippet];
    [_name setText:_PreviewModel.title];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
