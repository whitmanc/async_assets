//
//  GameData.h
//  Stranger in the Woods
//
//  Created by Chris Whitman on 07/09/11
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"
#import "cocos2d.h"

@interface GameData : NSObject {
	int loadPointer;
	int totalToLoad;
	NSArray *arrayToLoad;
	id finishedDelegate;
}

@property(nonatomic,retain)NSArray *arrayToLoad;

+ (GameData *)instance;
-(void) loadAssetsAsync:(NSArray*)array delegate:(id)d;

@end
