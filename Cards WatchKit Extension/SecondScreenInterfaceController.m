//
//  SecondScreenInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "SecondScreenInterfaceController.h"


@interface SecondScreenInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *cardInfo;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *ExtractionButton;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *AboutCardButton;
@end

@implementation SecondScreenInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Назад"];

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


@end



