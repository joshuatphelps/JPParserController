//
//  JPURLDownloader.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JPURLDownloaderDelegate;

@interface JPURLDownloader : NSObject
{
	NSMutableData *_data;
	
	NSURLConnection *_urlConnection;
}

@property (nonatomic, retain) id <JPURLDownloaderDelegate> delegate;

-(void)fetchXMLAtURL:(NSString*)xmlUrl;
-(void)fetchXMLAtURL:(NSString*)xmlUrl headerFields:(NSDictionary*)headerFields;

@end

@protocol JPURLDownloaderDelegate <NSObject>

@required
-(void)jpURLDownloaderDidFail:(JPURLDownloader*)urlDownloader;
-(void)jpURLDownloaderDidFinish:(JPURLDownloader*)urlDownloader withData:(NSData*)data;

@end
