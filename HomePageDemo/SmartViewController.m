//
//  SmartViewController.m
//  HomePageDemo
//
//  Created by hoyifo on 2018/12/4.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import "SmartViewController.h"

@interface SmartViewController ()

@property (nonatomic , copy)  NSMutableArray *dataArray;


@end

@implementation SmartViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;

}
- (void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"家庭管理"];
    
    NSLog(@"家庭管理");
    
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
