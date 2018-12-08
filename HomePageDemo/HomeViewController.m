//
//  HomeViewController.m
//  HomePageDemo
//
//  Created by hoyifo on 2018/12/4.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)  UICollectionView *deviceCollectionView;

@property (strong,nonatomic)NSMutableArray *dataArray;

@end

#define k_width [UIScreen mainScreen].bounds.size.width

#define k_height [UIScreen mainScreen].bounds.size.height

#define GOOD_COUNT 3

#define APPRGBA(r,g,b,a) \
[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define APPRGB(r,g,b) \
APPRGBA(r,g,b,1)

#define TabBarHEIGHT 25

#define CYCLE_HEIGHT2 300*k_width/640

@implementation HomeViewController

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
//  请求数据
- (void)requestData {
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5", nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self requestData];
    
    [self initWithDeviceCollectionView];
    
    
    [self iconDeviceSegment];
    
}

#pragma mark ========== segment 设备分类
- (void)iconDeviceSegment{
    
    NSArray *iconArr = @[@"智能主机",@"智能插座",@"智能开关",@"智能照明",@"智能遥控器",@"传感器",@"影音",@"窗帘电机"];
    // [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];

    UISegmentedControl *deviceSeg = [[UISegmentedControl alloc] initWithItems:iconArr];
    //默认选中的按钮索引
    deviceSeg.selectedSegmentIndex = 0;
    //设置分段控件点击相应事件
    [deviceSeg addTarget:self action:@selector(segmentSelect:)forControlEvents:UIControlEventValueChanged];
    //设置test控件的颜色为透明
    deviceSeg.tintColor = [UIColor clearColor];
    
    deviceSeg.frame = CGRectMake(0, 0, k_width, 45);
    
    
    
    
    
    //定义选中状态的样式selected，类型为字典
    NSDictionary *selected = @{NSFontAttributeName:[UIFont systemFontOfSize:11],
                               NSForegroundColorAttributeName:[UIColor redColor]};
    //定义未选中状态下的样式normal，类型为字典
    NSDictionary *normal = @{NSFontAttributeName:[UIFont systemFontOfSize:10],
                             NSForegroundColorAttributeName:[UIColor blackColor]};
    //通过setTitleTextAttributes: forState: 方法来给test控件设置文字内容的格式
    [deviceSeg setTitleTextAttributes:normal forState:UIControlStateNormal];
    [deviceSeg setTitleTextAttributes:selected forState:UIControlStateSelected];
    
    //设置test初始状态下的选中下标
    deviceSeg.selectedSegmentIndex = 0;
  
#pragma mark ------- segment 图标
    
    
    [self.view addSubview:deviceSeg];
}
// 根据用户的点击选择不同的设备类型数据供用户浏览
- (void)segmentSelect:(UISegmentedControl *)sender{
    
    
    NSLog(@"segmentSelectIndex:%@",sender);

    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);
            
            
            

        }
            break;
        case 1:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
        case 2:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
            
        case 3:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
        case 4:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
        case 5:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
       
        case 6:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
        case 7:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
            
        case 8:
        {
            NSLog(@"segmentSelectIndex:%ld",sender.selectedSegmentIndex);

        }
            break;
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        default:
            NSLog(@"%@",sender);
            
            break;
    }
    
}


    
    
    

- (void)initWithDeviceCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.deviceCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 45, k_width, k_height) collectionViewLayout:flowLayout];
    
    self.deviceCollectionView.delegate = self;
    self.deviceCollectionView.dataSource = self;
    self.deviceCollectionView.scrollEnabled = YES;
    
    self.deviceCollectionView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.deviceCollectionView];
    //注册Cell
    [self.deviceCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
   
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击 %ld",indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((k_width - 20) / GOOD_COUNT, (k_width - 100) / GOOD_COUNT*5/3+30);
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5,5,5,5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.f;
}
#pragma mark - DZNEmpty
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"暂时没有商品哦";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f], NSForegroundColorAttributeName: APPRGB(102,102,102)};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"no_good"];
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -24;
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
