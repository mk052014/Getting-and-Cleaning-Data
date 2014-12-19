
Initial Data Set 
=================

## Data set includes the following files:

- Class labels with their activity name : activity_labels.txt
- List of names of features : features.txt
- Test Set : X_test.txt
- Test labels : y_test.txt
- Subject Ids :subject_test.txt
- Training Set : X_train.txt
- Training labels : y_train.txt
- Subject Ids : subject_train.txt

## For each record, 
-   Triaxial acceleration from the accelerometer( Total acceleration X Y Z) and estimated body acceleration.
-   Triaxial angular velocity from the gyroscope.
-   A 561 feature vector with time and frequency domain variables
-   Activity label
-   An identifier of the subject who carried out the experiment.

Description of run_analysis.R
Require reshape2 package.

Used read.table to read all the data sets into data frames.
Used rbind to concatenate traing and testing data sets.
Added column names from features.txt using merge.
Create the subset of the data which contains only the measurements of mean() and std().

For final independent tidy data set with average of each variable for each activity and each subject, 
created melted data set by using melt function and activitity and subject as ids. Melted 
data set contains four columns: activity, subject, variable, value.  Then used dcast function
with the formula activity + subject ~ variable and mean as aggregation function.


The output tidy data has 68 columns:

 ActivityName            
 SubjectID               
 tBodyAccMeanX           
 tBodyAccMeanY           
 tBodyAccMeanZ           
 tBodyAccStdX            
 tBodyAccStdY            
 tBodyAccStdZ            
 tGravityAccMeanX        
 tGravityAccMeanY        
 tGravityAccMeanZ        
 tGravityAccStdX         
 tGravityAccStdY         
 tGravityAccStdZ         
 tBodyAccJerkMeanX       
 tBodyAccJerkMeanY       
 tBodyAccJerkMeanZ       
 tBodyAccJerkStdX        
 tBodyAccJerkStdY        
 tBodyAccJerkStdZ        
 tBodyGyroMeanX          
 tBodyGyroMeanY          
 tBodyGyroMeanZ          
 tBodyGyroStdX           
 tBodyGyroStdY           
 tBodyGyroStdZ           
 tBodyGyroJerkMeanX      
 tBodyGyroJerkMeanY      
 tBodyGyroJerkMeanZ      
 tBodyGyroJerkStdX       
 tBodyGyroJerkStdY       
 tBodyGyroJerkStdZ       
 tBodyAccMagMean         
 tBodyAccMagStd          
 tGravityAccMagMean      
 tGravityAccMagStd       
 tBodyAccJerkMagMean     
 tBodyAccJerkMagStd      
 tBodyGyroMagMean        
 tBodyGyroMagStd         
 tBodyGyroJerkMagMean    
 tBodyGyroJerkMagStd     
 fBodyAccMeanX           
 fBodyAccMeanY           
 fBodyAccMeanZ           
 fBodyAccStdX            
 fBodyAccStdY            
 fBodyAccStdZ            
 fBodyAccJerkMeanX       
 fBodyAccJerkMeanY       
 fBodyAccJerkMeanZ       
 fBodyAccJerkStdX        
 fBodyAccJerkStdY        
 fBodyAccJerkStdZ        
 fBodyGyroMeanX          
 fBodyGyroMeanY          
 fBodyGyroMeanZ          
 fBodyGyroStdX           
 fBodyGyroStdY           
 fBodyGyroStdZ           
 fBodyAccMagMean         
 fBodyAccMagStd          
 fBodyBodyAccJerkMagMean 
 fBodyBodyAccJerkMagStd  
 fBodyBodyGyroMagMean    
 fBodyBodyGyroMagStd     
 fBodyBodyGyroJerkMagMean
 fBodyBodyGyroJerkMagStd 

