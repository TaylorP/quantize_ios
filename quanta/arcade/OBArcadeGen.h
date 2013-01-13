#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int* createArray( int size );
int getNextPosition( int index, int size );
int numOfBubbles( int size );
int selectRandomNumber( int min, int max );

int* createArray( int size )
{
	srand( time(0) );
    
	int bubbleNum = numOfBubbles( size );
	int sizeSquared = size*size;
	int numOfAntiBubbles = (sizeSquared) - bubbleNum;
    
	int* array = (int*)malloc( sizeof(int)*sizeSquared );
	int i = 0;
	for( i=0; i<sizeSquared; i++){
		array[i] = 1;
	}
    
	int currentAntiBubbles = 0;
    
	int currentIndex = selectRandomNumber( 0, sizeSquared );
    
	while( currentAntiBubbles < numOfAntiBubbles ){
		
		int temp = getNextPosition( currentIndex, size );
        
		//checking boundaries
		if( temp == currentIndex )
			continue;
		if( temp >= 0 && temp < sizeSquared ){
			if( currentIndex % size == 0 && ( ( temp == currentIndex-1 ) || ( temp == currentIndex + size -1 ) || ( temp == currentIndex - size - 1) ) )
				continue;
			if( currentIndex % size == size-1 && ( ( temp == currentIndex+1 ) || ( temp == currentIndex+size+1 ) || ( temp == currentIndex-size+1 ) ) )
				continue;
			//getting new value
			currentIndex = temp;
			if( array[currentIndex] != 0){
				currentAntiBubbles++;
				array[currentIndex] = 0;
			}
		}
        
	}
    
	return array;
    
}

int getNextPosition( int index, int size )
{
	return ( index+selectRandomNumber( -1, 2 )*size + selectRandomNumber(-1, 2 ) );
}

int numOfBubbles( int size )
{
	int sizeSquared = size*size;
	int maxBubbles = (sizeSquared)/2 + (sizeSquared/6);
	int minBubbles = (sizeSquared)/2 - (sizeSquared/6);
    
	int bubbleNum = selectRandomNumber( minBubbles, maxBubbles );
    
	return bubbleNum;
}

int selectRandomNumber( int min, int max )
{
	return ( rand() % ( max - min ) ) + min;
}