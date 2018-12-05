//
//  ViewController.m
//  HomePageDemo
//
//  Created by hoyifo on 2018/11/28.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import "ViewController.h"

#import "JTOptionView.h"



#import "HomeViewController.h"
#import "RoomViewController.h"
#import "SmartViewController.h"
#import "MineViewController.h"

#define APPRGBA(r,g,b,a) \
[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define APPRGB(r,g,b) \
APPRGBA(r,g,b,1)

#define TabBarHEIGHT 25

#define CYCLE_HEIGHT2 300*k_width/640
#define k_width [UIScreen mainScreen].bounds.size.width

#define k_height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic , assign) NSInteger selectdSection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //  隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    [self initTabBar];
    [self initViewControllers];
    [self createChooseMenu];
}
//  选择栏  当行栏右
- (void)createChooseMenu{
    
    JTOptionView *view = [[JTOptionView alloc] initWithFrame:CGRectMake(5, 10, 125, 35)];
    view.dataSource = @[@"我的家",@"默认房间"];
//    view.selectedBlock = ^(JTOptionView * _Nonnull optionView, NSInteger selectedIndex) {
//        NSLog(@"optionView %@",optionView);
//        NSLog(@"selectedIndex %ld",selectedIndex);
//    };

    
    view.selectdSectionBlock = ^(JTOptionView *optionView, NSInteger selectedIndex, NSInteger selectdSection) {
        
        
        self.selectdSection = selectdSection;
    
        NSLog(@"optionView %@",optionView);
        NSLog(@"selectedIndex %ld",selectedIndex);
        if (selectdSection == 1) {
            
            SmartViewController *smartVC = [[SmartViewController alloc] init];
            
            [self.navigationController pushViewController:smartVC animated:NO];
            
            NSLog(@"需要跳转到 家庭管理 界面");
        }else{
            NSLog(@"默认房间等界面数据变化");
        }
        
    };
    
    [self.view addSubview:view];

}

//  跳转界面 家庭管理
- (void)putView{
    
    if (self.selectdSection == 1) {
        SmartViewController *smartVC = [[SmartViewController alloc] init];
        
        [self.navigationController pushViewController:smartVC animated:NO];
    }else{
        NSLog(@"点击的不是 家庭管理");
    }
    
}

- (void)initTabBar {
    [self setTabBarFrame:CGRectMake(0, 64+CYCLE_HEIGHT2, k_width, TabBarHEIGHT)
        contentViewFrame:CGRectMake(0, 64+TabBarHEIGHT+CYCLE_HEIGHT2, k_width, k_height - 64 - TabBarHEIGHT -CYCLE_HEIGHT2)];
    self.tabBar.itemTitleColor = APPRGB(102,102,102);
    self.tabBar.itemTitleSelectedColor = APPRGB(218,94,66);
    self.tabBar.itemTitleFont = [UIFont systemFontOfSize:14];
    self.tabBar.itemTitleSelectedFont = [UIFont systemFontOfSize:16];
    self.tabBar.leftAndRightSpacing = 10;
    self.tabBar.itemFontChangeFollowContentScroll = YES;
    self.tabBar.itemSelectedBgScrollFollowContent = YES;
    self.tabBar.itemSelectedBgColor = APPRGB(218,94,66);
    [self.tabBar setItemSelectedBgInsets:UIEdgeInsetsMake(32, 0, 3, 0) tapSwitchAnimated:NO];
    [self.tabBar setScrollEnabledAndItemFitTextWidthWithSpacing:30];
    [self setContentScrollEnabledAndTapSwitchAnimated:NO];
    self.loadViewOfChildContollerWhileAppear = YES;
    
}


- (void)initViewControllers
{
   
    
    HomeViewController *controller1 = [[HomeViewController alloc] init];
    controller1.yp_tabItemTitle = @"常用设备";

    RoomViewController *controller2 = [[RoomViewController alloc] init];
    controller2.yp_tabItemTitle = @"常用场景";

   
    
    self.viewControllers = [NSMutableArray arrayWithObjects:controller1, controller2, nil];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
