//
//  ViewController.m
//  HomePageDemo
//
//  Created by hoyifo on 2018/11/28.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import "ViewController.h"

#import "JTOptionView.h"
#import "KxMenu.h"


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
    
    [self menuRight];
}
//  选择栏  当行栏右
- (void)createChooseMenu{
    
    JTOptionView *view = [[JTOptionView alloc] initWithFrame:CGRectMake(5, 66, 125, 35)];
    view.dataSource = @[@"我的家",@"默认房间"];
    view.title = [NSString stringWithFormat:@"%@",view.dataSource[0]];

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
- (void)menuRight{
    // 右
    const CGFloat W = self.view.bounds.size.width;

    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame = CGRectMake(W - 180, 66, 65, 35);
    [searchBtn setTitle:@"🔍" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    infoBtn.frame = CGRectMake(W - 120, 66, 65, 35);
    [infoBtn setTitle:@"信息" forState:UIControlStateNormal];
    [infoBtn addTarget:self action:@selector(infoBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoBtn];
    
    UIButton *rightMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightMenu.frame = CGRectMake(W - 60, 66, 65, 35);
    [rightMenu setTitle:@"➕" forState:UIControlStateNormal];
    [rightMenu addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightMenu];
    
    
    
    
    
}
- (void)infoBtn{
    NSLog(@"infoBtn");

}
- (void)searchBtn{
    NSLog(@"searchBtn");

}
- (void)showMenu:(UIButton *)sender
{
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"扫一扫"
                     image:nil
                    target:nil
                    action:NULL],
      
      [KxMenuItem menuItem:@"设备添加"
                     image:[UIImage imageNamed:@"action_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"场景添加"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"添加家庭成员"
                     image:[UIImage imageNamed:@"search_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.view
                  fromRect:sender.frame
                 menuItems:menuItems];
}

- (void) pushMenuItem:(id)sender
{
    NSLog(@"点击 %@", sender);
}

#pragma mark ---------- 请求数据
- (void)requestData{
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
