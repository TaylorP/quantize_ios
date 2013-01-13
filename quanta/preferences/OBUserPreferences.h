/*
 *
 *  OBPreferences/OBUserPreferences.h
 *
 *  Taylor Petrick
 *  Orange Bytes
 *
 */

#import <Foundation/Foundation.h>
#import "OBPreferences.h"

///A utility class that wraps the NSUserDefaults into an easy to use preferences singleton.
@interface OBUserPreferences : NSObject
{
    NSUserDefaults* mUserPrefs;
}

///Returns the shared singleton instance of the class
+ (OBUserPreferences*)sharedPreferences;

///Sets a boolean preference to the given value
- (void)setPreference:(NSString*)pPrefName withBool:(BOOL)pValue;

///Sets an integer preference to the given value
- (void)setPreference:(NSString*)pPrefName withInt:(int)pValue;

///Sets a float preference to the given value
- (void)setPreference:(NSString*)pPrefName withFloat:(float)pValue;

///Sets a string preference to the given value
- (void)setPreference:(NSString*)pPrefName withString:(NSString*)pValue;

///Sets an array preference to the given value
- (void)setPreference:(NSString*)pPrefName withArray:(NSArray*)pValue;


///Returns the value of a bool preference
- (BOOL)getBoolPreference:(NSString*)pPrefName;

///Returns the value of an integer preference
- (int)getIntPreference:(NSString*)pPrefName;

///Returns the value of a float preference
- (float)getFloatPreference:(NSString*)pPrefName;

///Returns the value of a string preference
- (NSString*)getStringPreference:(NSString*)pPrefName;

///Returns the value of an array preference
- (NSArray*)getArrayPreference:(NSString*)pPrefName;


///Force save the preference state
- (void)savePreferences;

@end
