## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

### Explanation of each file

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

* `X_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

### Data files that were not used

This analysis was performed using only the files above, and did not use the raw signal data. Therefore, the data files in the "Inertial Signals" folders were ignored.

### 1. Read data and Merge

* merged : bind of X_train and X_test

## 2. Extract only mean() and std()
Create a vector of only mean and std labels, then use the vector to subset dataSet.
* MeanStdOnly : a vector of only mean and std labels extracted from 2nd column of features
* merged : at the end of this step, dataSet will only contain mean and std variables

## 3. Changing Column label of dataSet
Create a vector of "clean" feature names by getting rid of "()" at the end. Then, will apply that to the dataSet to rename column labels.
* CleanFeatureNames : a vector of "clean" feature names 

## 4. Adding Subject and Activity to the dataSet
Combine test data and train data of subject and activity, then give descriptive lables. Finally, bind with dataSet. At the end of this step, dataSet has 2 additonal columns 'subject' and 'activity' in the left side.
* subject : bind of subject_train and subject_test
* activity : bind of y_train and y_test

## 5. Rename ID to activity name
Group the activity column of dataSet as "act_group", then rename each levels with 2nd column of activity_levels. Finally apply the renamed "act_group" to dataSet's activity column.
* act_group : factored activity column of dataSet 

## 6. Output tidy data
In this part, dataSet is melted to create tidy data. It will also add [mean of] to each column labels for better description. Finally output the data as "tidy_data.txt"
* baseData : melted tall and skinny dataSet
* secondDataSet : casete baseData which has means of each variables