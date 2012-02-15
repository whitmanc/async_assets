//
//  GameData.m
//  Stranger in the woods
//
//  Created by Chris Whitman on 07/09/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameData.h"

@implementation GameData

@synthesize arrayToLoad;

+ (GameData *)instance  {
	static GameData *instance;
	
	@synchronized(self) {
		if(!instance) { 
			instance = [[GameData alloc] init];
		} 
	}
	
	return instance;
}

-(void) loadAssetsAsync:(NSArray*)array delegate:(id)d{
	[[CCTextureCache sharedTextureCache] removeUnusedTextures];
	[[CCDirector sharedDirector] purgeCachedData];
	NSLog(@"START ASYNC DOWNLOAD");
	finishedDelegate = d;
	self.arrayToLoad=array;
	loadPointer=0;
	totalToLoad=[array count];
	[[CCTextureCache sharedTextureCache] addImageAsync:[self.arrayToLoad objectAtIndex:loadPointer++] target:self selector:@selector(didLoadImage:)];
}

-(void) didLoadImage:(CCTexture2D*)texture{
	NSLog(@"ASYN NEXT STEP");
	if(loadPointer < totalToLoad) [[CCTextureCache sharedTextureCache] addImageAsync:[self.arrayToLoad objectAtIndex:loadPointer++] target:self selector:@selector(didLoadImage:)];
	else [finishedDelegate performSelector:@selector(textureLoadingDone)];
}

-(id) init{
	if((self = [super init])){
		
	}
	return self;
}


-(void) dealloc{
	[self.arrayToLoad release];
	[super dealloc];
}



@end
