//
//  InterfaceController.h
//  RPSLS WatchKit Extension
//
//  Created by Prashanth Kanduri on 10/01/15.
//  Copyright (c) 2015 Prashanth Kanduri. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>

@interface InterfaceController : WKInterfaceController <SRWebSocketDelegate>
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *statusMessage;

@end
