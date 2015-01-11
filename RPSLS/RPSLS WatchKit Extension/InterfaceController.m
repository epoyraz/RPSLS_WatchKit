//
//  InterfaceController.m
//  RPSLS WatchKit Extension
//
//  Created by Prashanth Kanduri on 10/01/15.
//  Copyright (c) 2015 Prashanth Kanduri. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *changeBG;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *animateRock;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *animatePaper;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *animateScissor;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *animateLizard;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *animateSpock;


@end
int x = 0;
int status = 0;

@implementation InterfaceController{
    SRWebSocket *webSocket;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self connectWebSocket];
    NSLog(@"willActivate finished");
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


#pragma mark - Connection

- (void)connectWebSocket {
    NSLog(@"entered connectWebSocket");
    webSocket.delegate = nil;
    webSocket = nil;
    
    NSString *urlString = @"ws://10.7.4.15:8080";
    SRWebSocket *newWebSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:urlString]];
    newWebSocket.delegate = self;
    [newWebSocket open];
}


#pragma mark - SRWebSocket delegate

- (void)webSocketDidOpen:(SRWebSocket *)newWebSocket {
    webSocket = newWebSocket;
    [webSocket send:[NSString stringWithFormat:@"Hello from %@", [UIDevice currentDevice].name]];
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    [self connectWebSocket];
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    [self connectWebSocket];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
   // self.messagesTextView.text = [NSString stringWithFormat:@"%@\n%@", self.messagesTextView.text, message];
    if ([message isKindOfClass:[NSString class]]) {
        if ([message isEqualToString:@"WIN"]) {
            self.statusMessage.text = @"You Win !";
            [self testButton];
        }
        if ([message isEqualToString:@"LOSE"]) {
            self.statusMessage.text = @"You Lose !";
            [self loseButton];
        }
    }
}

- (IBAction)rockButton {
    // #1
    x = 1;
    NSString *myString = [NSString stringWithFormat:@"%d",x];
    self.statusMessage.text = myString;
    //change/animate BG
    [self.animateRock setBackgroundImageNamed:(@"rock-.png")];
    int64_t delayInSeconds = 0.4;
    // pause for 1 sec
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animateRock setBackgroundImageNamed:(@"rock")];
    });
    
    [webSocket send:@"{\"user\":\"player1\",\"selection\":\"1\"}"];
    
}
- (IBAction)paperButton {
    // #2
    x = 2;
    NSString *myString = [NSString stringWithFormat:@"%d",x];
    self.statusMessage.text = myString;
    
    //change/animate BG
    [self.animatePaper setBackgroundImageNamed:(@"paper-.png")];
    int64_t delayInSeconds = 0.4;
    // pause for a fraction of sec
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animatePaper setBackgroundImageNamed:(@"paper")];
    });
    [webSocket send:@"{\"user\":\"player1\",\"selection\":\"2\"}"];

}

- (IBAction)scissorButton {
    // #3
    x = 3;
    NSString *myString = [NSString stringWithFormat:@"%d",x];
    self.statusMessage.text = myString;
    
    //change/animate BG
    [self.animateScissor setBackgroundImageNamed:(@"scissors-.png")];
    int64_t delayInSeconds = 0.4;
    // pause for 1 sec
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animateScissor setBackgroundImageNamed:(@"scissors")];
    });
    [webSocket send:@"{\"user\":\"player1\",\"selection\":\"3\"}"];

}
- (IBAction)lizardButton {
    x = 4;
    NSString *myString = [NSString stringWithFormat:@"%d",x];
    self.statusMessage.text = myString;
    
    //change/animate BG
    [self.animateLizard setBackgroundImageNamed:(@"lizard-.png")];
    int64_t delayInSeconds = 0.4;
    // pause for 1 sec
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animateLizard setBackgroundImageNamed:(@"lizard")];
    });
    [webSocket send:@"{\"user\":\"player1\",\"selection\":\"4\"}"];

}
- (IBAction)spockButton {
    x = 5;
    NSString *myString = [NSString stringWithFormat:@"%d",x];
    self.statusMessage.text = myString;
    
    //change/animate BG
    [self.animateSpock setBackgroundImageNamed:(@"spock-.png")];
    int64_t delayInSeconds = 0.4;
    // pause for 1 sec
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animateSpock setBackgroundImageNamed:(@"spock")];
    });
    [webSocket send:@"{\"user\":\"player1\",\"selection\":\"5\"}"];
}
- (IBAction)testButton {
    [self.changeBG setBackgroundImageNamed:(@"g")];

    NSRange range = {0,99};
    [self.changeBG startAnimatingWithImagesInRange:range duration:2 repeatCount:1];
}

- (IBAction)loseButton {
    [self.changeBG setBackgroundImageNamed:(@"r")];
    
    NSRange range = {0,99};
    [self.changeBG startAnimatingWithImagesInRange:range duration:2 repeatCount:1];
}
     
@end



