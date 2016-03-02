015/12/26 update:
在 Xcode 7 裡在新增給 KIF 用的 target 時，選擇的是 iOS Unit Testing Bundle，而不是 iOS UI Testing Bundle 哦！

2016/1/6 update:
使用 KIF 作出"下拉更新"的動作：
[tester swipeViewWithAccessibilityLabel:<labelName> value:nil inDirection:KIFSwipeDirectionDown];

使用 KIF 取得某個 view 元件：

#import “UIAccessibilityElement-KIFAdditions.h"

UIAccessibilityElement *element = [[[UIApplication sharedApplication] keyWindow] accessibilityElementWithLabel:<labelName>];

UIView *someView = (UIView *)[UIAccessibilityElement viewContainingAccessibilityElement:element];




KIFUITestActor


#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "WordPressTestCredentials.h"
#import "UIWindow-KIFAdditions.h"
#import "WPUITestCase.h"

@interface MeTabTests : WPUITestCase

@end

@implementation MeTabTests

- (void)beforeAll
{
    [self logoutIfNeeded];
    [self login];
}

- (void)afterAll
{
    [self logout];
}

- (void)testMeTab
{
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];
    [tester waitForViewWithAccessibilityIdentifier:@"Blogs"];
}

- (void)testHideBlog
{
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Edit"];
    
    [tester setOn:NO forSwitchWithAccessibilityIdentifier:[NSString stringWithFormat:@"Switch-Visibility-%@", oneStepUser]];
    
    [tester tapViewWithAccessibilityLabel:@"Done"];
    
    [tester tapViewWithAccessibilityLabel:@"Edit"];
    
    [tester setOn:YES forSwitchWithAccessibilityIdentifier:[NSString stringWithFormat:@"Switch-Visibility-%@", oneStepUser]];

    [tester tapViewWithAccessibilityLabel:@"Done"];
}

- (void)testMeNavigation
{
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"My Sites"];
    [tester waitForTimeInterval:2];

    [tester tapRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] inTableViewWithAccessibilityIdentifier:@"Blogs"];
    
    [tester tapViewWithAccessibilityLabel:@"Blog Posts"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    
    [tester tapViewWithAccessibilityLabel:@"Pages"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForTimeInterval:2];
    
    [tester tapViewWithAccessibilityLabel:@"Comments"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForTimeInterval:2];
    
    [tester tapViewWithAccessibilityLabel:@"Stats"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForTimeInterval:2];
    
    [tester tapViewWithAccessibilityLabel:@"View Site"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForTimeInterval:2];
    
    [tester tapViewWithAccessibilityLabel:@"Settings"];
    [tester waitForTimeInterval:2];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForTimeInterval:2];
}
