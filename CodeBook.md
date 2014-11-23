Data dictionary
===============

subject.id
  : id for subjects in the experiment, range is 1-30
  
activity
  : activity that the subject is doing while the data is recorded
  
Data in columns 3 through 68 are averaged over each subject and each activity

Naming conventions for column names in columns 3 through 68 is as follows (from the beginning of the column name)

 1. 't' or 'f'
      * t: time domain signals
      * f: frequency domain signals
 2. 'Body' or 'Gravity'
      * Body: body motion component
      * Gravity: gravitational motion component
 3. 'Acc' or 'Gyro'
      * Acc: linear acceleration
      * Gyro: angular velocity
 4. optional 'Jerk'
    Indicates data as derivative of the acceleration (jerk of the motion)
 5. optional 'Mag'
    Indicates data as Euclidean norm
 6. '.mean' or '.std'
      * .mean: mean of the signal data
      * .std: standard deviation of the signal data
 7. optional '.X', '.Y', or '.Z'
    Indicates the axis for which the signal is measured