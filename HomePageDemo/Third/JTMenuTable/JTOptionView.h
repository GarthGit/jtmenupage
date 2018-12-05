//
//  JTOptionView.h
//  JTMenuDemo
//
//  Created by hoyifo on 2018/12/4.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTOptionView;

@protocol JTOptionViewDelegate <NSObject>

@optional

// 传递所选中的 index   以及 选中的section
//- (void)optionView:(JTOptionView *)optionView
//    selectdSection:(NSInteger)selectdSection;


- (void)optionView:(JTOptionView *)optionView
     selectedIndex:(NSInteger)selectedIndex
    selectdSection:(NSInteger)selectdSection;



@end

@interface JTOptionView : UIView


/**
 标题名
 */
@property (nonatomic, strong) IBInspectable NSString *title;

/**
 标题颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *titleColor;

/**
 标题字体大小
 */
@property (nonatomic, assign) IBInspectable CGFloat titleFontSize;

/**
 视图圆角
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 视图边框颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 边框宽度
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/**
 cell高度
 */
@property (nonatomic, assign) CGFloat rowHeigt;

/**
 数据源
 */
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, weak) id<JTOptionViewDelegate> delegate;

@property (nonatomic,copy) void(^selectedBlock)(JTOptionView *optionView,NSInteger selectedIndex);

@property (nonatomic,copy) void(^selectdSectionBlock)(JTOptionView *optionView,NSInteger selectedIndex,NSInteger selectdSection);





- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource;




@end
