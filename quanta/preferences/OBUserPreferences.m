/*
 *
 *  OBPreferences/OBUserPreferences.m
 *
 *  Taylor Petrick
 *  Orange Bytes
 *
 */

#import "OBUserPreferences.h"

@implementation OBUserPreferences

static OBUserPreferences* sharedPreferences;

+ (OBUserPreferences*)sharedPreferences
{
    if (sharedPreferences == nil) 
    {
        sharedPreferences = [[OBUserPreferences alloc] init];
    }
    
    return  sharedPreferences;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        mUserPrefs = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)setPreference:(NSString*)pPrefName withBool:(BOOL)pValue
{
    [mUserPrefs setBool: pValue
                 forKey: [self preferenceKeyForName:pPrefName] ];
}
     
- (void)setPreference:(NSString*)pPrefName withInt:(int)pValue
{   
    [mUserPrefs setInteger: pValue
                    forKey: [self preferenceKeyForName:pPrefName] ];
}
     
- (void)setPreference:(NSString*)pPrefName withFloat:(float)pValue
{  
    [mUserPrefs setFloat: pValue
                  forKey: [self preferenceKeyForName:pPrefName] ];
}
     
- (void)setPreference:(NSString*)pPrefName withString:(NSString*)pValue
{
    [mUserPrefs setObject: pValue
                   forKey: [self preferenceKeyForName:pPrefName] ];
}

- (void)setPreference:(NSString*)pPrefName withArray:(NSArray*)pValue
{
    [mUserPrefs setObject: pValue
                   forKey: [self preferenceKeyForName:pPrefName] ];
}


- (NSString*)preferenceKeyForName:(NSString*)pName
{
    return [NSString stringWithFormat:@"OBPref_%@",pName];
}

- (BOOL)getBoolPreference:(NSString*)pPrefName
{
    return [mUserPrefs boolForKey:[self preferenceKeyForName:pPrefName]];
}

- (int)getIntPreference:(NSString*)pPrefName
{
    return [mUserPrefs integerForKey:[self preferenceKeyForName:pPrefName]];
}

- (float)getFloatPreference:(NSString*)pPrefName
{
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    return [prefs floatForKey:[self preferenceKeyForName:pPrefName]];
}

- (NSString*)getStringPreference:(NSString*)pPrefName
{
    return [mUserPrefs objectForKey:[self preferenceKeyForName:pPrefName]];
}

- (NSArray*)getArrayPreference:(NSString*)pPrefName
{
    return [mUserPrefs arrayForKey:[self preferenceKeyForName:pPrefName]];
}

- (void)savePreferences
{
    NSAssert([mUserPrefs synchronize], @"Failed to save user preferences.");
}
     
@end
