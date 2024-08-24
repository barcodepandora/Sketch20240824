//
//  ViewController.m
//  CharacterAtRuntime
//
//  Created by Juan Manuel Moreno on 24/08/24.
//

#import "ViewController.h"
#import "ASimpleClass.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *doIt = [UIButton buttonWithType:UIButtonTypeSystem];
    [doIt setTitle:@"Do it" forState:UIControlStateNormal];
    [doIt addTarget:self action:@selector(assignADynamicBehavoir) forControlEvents:UIControlEventTouchUpInside];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat butWidth = 198;
    CGFloat butHeight = 42;
    CGFloat butx = (screenWidth - butWidth) / 2;
    CGFloat buty = (screenHeight - butHeight) / 2;
    doIt.frame = CGRectMake(butx, buty, butWidth, butHeight);

    [self.view addSubview:doIt];
    
}

-(void)assignADynamicBehavoir {
    Class aClass = [ASimpleClass class];
    SEL aSelector = @selector(actionAtRutime);
    class_addMethod(aClass, aSelector, (IMP)actionAtRutime, "v@");
    ASimpleClass *as = [[ASimpleClass alloc] init];
    [as greet];
    [as actionAtRutime];
}

void actionAtRutime(id self, SEL _cmd) {
    NSLog(@"Listo en tiempo de ejecucion");
}

@end
