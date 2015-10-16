//
//  SSCollectionViewController.m
//  新特性界面
//
//  Created by YFL on 15/9/5.
//  Copyright (c) 2015年 text. All rights reserved.
//

#import "SSCollectionViewController.h"
#import "SSCollectionViewCell.h"


@interface SSCollectionViewController ()

@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation SSCollectionViewController
- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        //分页控件
        _pageControl = [[UIPageControl alloc] init];
        //总页数
        _pageControl.numberOfPages = 4;
        //控件尺寸会更具页书自动算出
        CGSize size = [_pageControl sizeForNumberOfPages:5];
        
        _pageControl.bounds = CGRectMake(0, 0 , size.width, size.height);
        //使用最大y貌似就能自动放最下面
        _pageControl.center = CGPointMake(self.view.center.x, CGRectGetMaxY(self.collectionView.bounds)-size.height/2);
        //设置按钮颜色
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];//备选按钮颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];//选中按钮颜色
        //    _pageControl.backgroundColor = [UIColor blackColor];
        
        //设置下默认初始第一页是0
        _pageControl.currentPage = 0;
        //监听一下，在oc中绝大多数控件都可以监听数值变化
        [_pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageControl;
}

- (void)pageChanged
{
    CGFloat X = self.pageControl.currentPage * self.collectionView.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake(X, 0) animated:YES];
    
}

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    //设置行的边距
    layout.minimumLineSpacing = 0;
    //设置列的边距
    layout.minimumInteritemSpacing = 0;
    //设置离上下左右的间距
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    return [super initWithCollectionViewLayout:layout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Register cell classes
    [self.collectionView registerClass:[SSCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //取消弹簧效果
    self.collectionView.bounces = NO;
    
    //不现实水平移动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //自动滑到整页
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    
    //添加分页符
    [self.view addSubview:self.pageControl];
    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 4;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    

    //==============================图片写这里＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    /*
     
     
     
     cell.image =
     
     
     */
    CGFloat red = arc4random()%255;
    CGFloat green = arc4random()%255;
    CGFloat blue = arc4random()%255;
    cell.backgroundColor = [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1.0];
    
    return cell;
}


//计算页数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算在第几页图片
    int page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    //分页的当前按钮在的页数等于页数
    self.pageControl.currentPage = page;
    
    
}

@end
