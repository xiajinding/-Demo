//
//  ViewController.m
//  分段控制器Demo
//
//  Created by Lemon on 15/12/8.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "ViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"

#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#define ScreeFrame [UIScreen mainScreen].bounds
@interface ViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>

@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSegment];
    [self initFlipTableView];
}

-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 64, ScreeFrame.size.width, 40) withDataArray:[NSArray arrayWithObjects:@"first",@"second",@"third",@"fouth", nil] withFont:15];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
}

-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    
    ViewController1 *v1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    ViewController2 *v2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
    ViewController3 *v3 = [[ViewController3 alloc]initWithNibName:@"ViewController3" bundle:nil];
    ViewController4 *v4 = [[ViewController4 alloc]initWithNibName:@"ViewController4" bundle:nil];
    
//    ViewController1 *v1 = [[UIStoryboard storyboardWithName:@"Body" bundle:nil] instantiateViewControllerWithIdentifier:@"first"];
//    ViewController2 *v2 = [[UIStoryboard storyboardWithName:@"Body" bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
//    ViewController3 *v3 = [[UIStoryboard storyboardWithName:@"Body" bundle:nil] instantiateViewControllerWithIdentifier:@"third"];
//    ViewController4 *v4 = [[UIStoryboard storyboardWithName:@"Body" bundle:nil] instantiateViewControllerWithIdentifier:@"fouth"];
    [self.controllsArray addObject:v1];
    [self.controllsArray addObject:v2];
    [self.controllsArray addObject:v3];
    [self.controllsArray addObject:v4];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 104, ScreeFrame.size.width, self.view.frame.size.height - 104) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
}

- (void)selectedIndex:(NSInteger)index {
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
}

-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
}
@end
