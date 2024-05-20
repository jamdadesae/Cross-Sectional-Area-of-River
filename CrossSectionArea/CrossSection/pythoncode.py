import pandas as pd
import matplotlib.pyplot as plt
import datetime
import time
import math
from scipy.interpolate import splrep
from scipy.interpolate import splev
import openpyxl




#read data/time

data_17 = pd.read_excel(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\UploadedFiles\xsectionflow.11.13_xsArea.xlsx", sheet_name='WY17', usecols='A')

#convert date/time string to date/time format 

dateTimeWL17 = pd.to_datetime(data_17['date (m/dd/yyyy hh:mm)'], format = '%m/%d/%Y %I:%M:%S %p')

dateTimeWL17.head()

#process the Waterlevels


WL17 = pd.read_excel(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\UploadedFiles\xsectionflow.11.13_xsArea.xlsx", sheet_name= 'WY17', usecols = 'B')

#Read the x-y coordinates for the cross section

sxdata17 = pd.read_excel(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\UploadedFiles\xsectionflow.11.13_xsArea.xlsx", sheet_name='2017crosssection', usecols='A')
sydata17 = pd.read_excel(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\UploadedFiles\xsectionflow.11.13_xsArea.xlsx", sheet_name='2017crosssection', usecols='B')

# Combine 'xdata17' and 'ydata17' into a single DataFrame
data17 = pd.concat([sxdata17, sydata17], axis=1)
data17.columns = ['x', 'y']  # Assign column names

# Sort the DataFrame by 'xdata17' column
sorted_data17 = data17.sort_values(by='x')

# If you want to assign the sorted 'ydata17' back to a variable
ydata17 = sorted_data17['y']
xdata17 = sorted_data17['x']

# translate data to place min point on the horizintal axis
translated_data = -1 * ydata17
#print(translated_data)


plt.plot(xdata17.to_numpy(),ydata17.to_numpy())
plt.legend(['2017crosssection'], loc = 'best')
# both grid and minorticks are ued to enhance the appearance of the plots by displayings both teh minor and major ticks 
plt.grid(True, which='both') # turns on the grid and both means for both minor and major ticks 
plt.minorticks_on() # minorticks ensures that minor ticks are activated and visible 
plt.title('Cross- Sectional Area')
plt.xlabel('Distance from East Bank, ft')
plt.ylabel('Bank Depth, ft')
#plt.show()
plt.savefig('data.jpg')  
time.sleep(10)
plt.close()

#save the file to excel                                                                                                                      
df = pd.DataFrame({'x':xdata17, 'y':ydata17})
df.to_csv(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\Book1.csv", index=False)
#df.to_excel(r"C:\Users\sae jamdade\OneDrive\Desktop\x-y CrossSection.xlsx", startrow=1, startcol=2, index=False)  
    

import numpy as np
#Interpolate Data 
#Create "query points"
res = 0.01
#set resolution

qxdata17 = np.arange(0, max(xdata17), res)



# Interpolate the function at the query points and plot the results
# Perform 1-D interpolation
#qydata17 = np.arange(0, max(ydata17['y']), res)

qydata17 = np.interp(qxdata17, xdata17, ydata17)


#save the file to excel                                                                                                                      
df = pd.DataFrame({'qxdata17':qxdata17, 'qydata17':qydata17})
df.to_csv(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\Book2.csv", index=False)
#df.to_excel(r"C:\Users\sae jamdade\OneDrive\Desktop\x-y CrossSection.xlsx", startrow=1, startcol=2, index=False)  
                                       

plt.plot(qxdata17, qydata17, ':.', label='Dataset 17')

plt.legend(['2017crosssection'], loc='best')
plt.grid(True, which='both')
plt.minorticks_on()
plt.title('Cross-Sectional Area')
plt.xlabel('Distance from East Bank, ft') 
plt.ylabel('Bank Depth, ft')
plt.savefig('data1.jpg')  
#plt.show()
time.sleep(10)
plt.close()

max_qydata17 = max(qydata17)

nqydata17 = len(qydata17)  # Outputs the size of the y-coordinate vector
nWL17 = len(WL17)  # Size of Water Level vector
yWL17 = np.zeros((nWL17, 1))  # Assigns zeros to the first column of size nWL array of the first column (dimension)
xsAreaWL17 = np.zeros((len(WL17), 1))  # Assigns zeros to the first column of size WL array of the first column
timeIterCount = 0
tic = datetime.datetime.now()  # start stopwatch timer to measure the time the code execution time
x17 = []


'''
# Assuming data is recorded every 10 minutes, calculate steps for a 24-hour interval
steps_per_day = int(24 * 60 / 10)  # 24 hours * 60 minutes / 10 minutes
print(steps_per_day)
'''

for l in range(0, nWL17):
    yWL17[l] = min(qydata17) + WL17.iloc[l]  # Calcs the y-depth at Water Level for each date/time value
qydata17_rounded = np.round(qydata17, 2)   

qx17 = []
for i in range(len(qxdata17)):
    x = qxdata17[i]
    #print(x)
    qx17.append(x)
#print(len(qx17))

qy17 = []
for j in range(len(qydata17)):
    y = qydata17[i]
    #print(x)
    qy17.append(y)
#print(len(qy17))

timeIterCount = 0
yWL17_rounded = np.round(yWL17, 1)
for l in range(0, nWL17):
    # print(l)
    timeIterCount += 1
    for m in range(nqydata17):
        if np.isclose(yWL17_rounded[l], qydata17_rounded[m], atol = 0.01):
            if pd.notnull(WL17.iloc[l]['Water Level, ft']):
                if (0 <= WL17.iloc[l]['Water Level, ft']):
                    if (WL17.iloc[l]['Water Level, ft'] < max_qydata17):
                        #print("non :",k)
                        x17.append([m, qx17[m]])  # Store the pair [k, qxdata16[k]] in x16
                        # print("length of x17 : ",len(x17))
                        # print(start_index)
                        # print(end_index)
                        if not math.isnan(WL17.iloc[l].iloc[0]):
                            if WL17.iloc[l]['Water Level, ft'] < max(qydata17):
                                if WL17.iloc[l]['Water Level, ft'] >= 0:
                                    if len(x17) > 1:
                                        #print("area :",k)
                                        #print(x16)
                                        start_index = int(x17[0][0])
                                        end_index = int(x17[-1][0])
                                        #print(start_index)
                                        #print(end_index)                        
                                        # Check if the indices are within the range of x16
                                        if not math.isnan(WL17.iloc[l].iloc[0]):
                                            if WL17.iloc[l]['Water Level, ft'] < max(qydata17):
                                                 if WL17.iloc[l]['Water Level, ft'] >= 0:
                                                    if len(x17) > 1:
                                                        # print(k)
                                                        transWLqydata17 = qydata17 - yWL17[l]  # The data set needs to be translated DOWN so that the water level becomes the horizontal axis; this needs to be done for every timeIterCount water level iteration.
                                                        yWL_x17 = transWLqydata17[int(x17[0][0]):int(x17[-1][0])]  # Extracts the y-coordinates at the water level corresponding to the x-coordinates.
                                                        xdom17 = np.arange(x17[0][1], x17[-1][1], res)  # Set integration domain values
                                                        #xsAreaWL16[timeIterCount - 1] = abs(np.trapz(yWL_x16, xdom16))
                                                        #print("yWL_x16 : ",yWL_x16)
                                                        yWL_x17_len = len(yWL_x17)
                                                        #print("xdom16 : ",xdom16)
                                                        xdom17_len = len(xdom17)
                                                        if (yWL_x17_len == xdom17_len):
                                                            if yWL_x17_len > 0:
                                                                xsAreaWL17[timeIterCount - 1] = abs(np.trapz(yWL_x17, xdom17))
                                                                #print(xsAreaWL17)
                        
#print(x16)
                                        

Area17 = xsAreaWL17.flatten().tolist()
print(Area17)

Area17_Modified = []
for i in range(len(Area17)):
    if xsAreaWL17[i] != 0:
        Area17_Modified.append(Area17[i])

#print(len(Area17_Modified))

WL17_24hours=[]
arr_array = []
w1='Water Level, ft'
for value in WL17[w1]:
    arr_array.append(value)

for j in range(0, nWL17):
    WL17_24hours.append(arr_array[j])

    
#print(len(WL17_24hours))

WL17_24hoursModified = []
for i in range(len(Area17_Modified)):
    WL17_24hoursModified.append(WL17_24hours[i])

#print(Area17)
#print(len(Area17))
plt.scatter(WL17_24hoursModified, Area17_Modified)
plt.title('Water-Level Cross-Sectional Area Over Time - 2017')
plt.xlabel('Water Level')
plt.ylabel('Area, ft^{2}')
plt.savefig('data2.jpg')  
#plt.show()

#save the file to excel                                                                                                                      
df = pd.DataFrame({'WL17':WL17_24hoursModified, 'Area17':Area17_Modified})
df.to_csv(r"E:\Myproject\CrossSectionArea\CrossSectionArea\CrossSection\Book3.csv", index=False)



