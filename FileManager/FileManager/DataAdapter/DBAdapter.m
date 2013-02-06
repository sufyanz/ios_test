//
//  DBAdapter.m
//
//  Created by Sufyan Anees on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#import"AppDelegate.h"
#import "DBAdapter.h"


@implementation DBAdapter

@synthesize managedObjectContext;

- (id)init{
    if ((self = [super init])){
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        //#warning Copy the core data libs
        self.managedObjectContext = [appDelegate managedObjectContext];
    }
    return self;
}

/*
 * A generic function that can query that given entity with the given condition and return sorted results.
 */
- (NSArray *)queryDBForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate sortByField:(NSString *)sortField {
    NSFetchRequest *request = [[NSFetchRequest alloc] init]; 
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]]; 
    [request setEntity:entity];
    
    if(sortField != nil)
    {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortField ascending:YES]; 
        NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil]; 
        [request setSortDescriptors:sortDescriptors]; 
        [sortDescriptors release]; 
        [sortDescriptor release];
    }
    
    if(predicate != nil)
        [request setPredicate:predicate];
    
    NSError *error; 
    //    NSMutableArray *mutableFetchResults = [[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy]; 
    NSArray *fetchResults = [[self managedObjectContext] executeFetchRequest:request error:&error]; 
    [request release];
    
    if (fetchResults == nil) {
        NSLog(@"Error fetching result %@", [error description]);
    }
    return fetchResults;
}

- (NSArray *)queryDBForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate sortByField:(NSString *)sortField SortASC:(BOOL)ASC {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    if(sortField != nil)
    {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortField ascending:ASC];
        NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
        [sortDescriptors release];
        [sortDescriptor release];
    }
    
    if(predicate != nil)
        [request setPredicate:predicate];
    
    NSError *error;
    //    NSMutableArray *mutableFetchResults = [[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSArray *fetchResults = [[self managedObjectContext] executeFetchRequest:request error:&error];
    [request release];
    
    if (fetchResults == nil) {
        NSLog(@"Error fetching result %@", [error description]);
    }
    return fetchResults;
}

/*
 * A generic function that inserts a new row for the given entity and fill that row with given key/values
 */
- (void)insertObjectForEntity:(NSString *)entityName objectsToInsert:(NSDictionary *)dictObjects{
    NSError *error;
    NSManagedObject *objToInsert = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    
    for (id key in [dictObjects allKeys]) {
        [objToInsert setValue:key forKey:[dictObjects objectForKey:key]];
    }
    [[self managedObjectContext] save:&error];
}

//To Delete Object
- (BOOL)deleteObject:(id)obj{
    NSError *error;
    if(obj != nil){
        [[self managedObjectContext] deleteObject:obj];
        if( [[self managedObjectContext] save:&error] )
            return YES;
    }
    return NO;
}

- (BOOL)doesRecordExistForEntity:(NSString *)entity fieldToCheck:(NSString *)fieldName valueToMatch:(id)val{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(%K = %@)", fieldName, val];
    //NSLog(@"(P: %@)", [pred predicateFormat]);
    NSArray *arr = [self queryDBForEntity:entity predicate:pred sortByField:fieldName];
    //NSLog(@"%@", arr);
    return ([arr count] > 0);
}

- (id)getRecordFromEntity:(NSString *)entity whereField:(NSString *)fieldName isEqualTo:(id)val{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(%K = %@)", fieldName, val];
    //NSLog(@"(P: %@)", [pred predicateFormat]);
    NSArray *arr = [self queryDBForEntity:entity predicate:pred sortByField:fieldName];
    //NSLog(@"%@", arr);
    if ([arr count] > 0)
        return [arr objectAtIndex:0];
    return nil;
}

- (NSArray*)getAllRecordsFromEntity:(NSString *)entity{
    NSArray *arr = [self queryDBForEntity:entity predicate:nil sortByField:nil];
    //NSLog(@"%@", arr);
    return arr;
}

- (BOOL)saveToDb{
    NSError *error = nil;
    BOOL returnVal =  ( [[self managedObjectContext] save:&error] );
    if(error != nil)
        NSLog(@"%@", error);
    return returnVal;
}

+ (DBAdapter *)create{
    return [[[DBAdapter alloc]init] autorelease]; 
}

- (void)dealloc{
    [managedObjectContext release];
    [super dealloc];

}





@end
