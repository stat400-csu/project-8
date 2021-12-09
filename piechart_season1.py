#!/usr/bin/env python
# coding: utf-8

# # Season-1 Pie Chart Exploration
# 

# In[159]:


import pandas as pd 
df1 = pd.read_csv("season1_generated.csv")


# In[160]:


df1 = df1.iloc[: , 1:]
df1


# In[161]:


df1=df1.mean()
df1


# In[162]:


df1v= df1.values
df1v.shape


# In[163]:


c2,c3,c4,c5,c6,c7,c8,c9,c10=0,0,0,0,0,0,0,0,0
for i in range(len(df1v)):
    if df1v[i]>=2 and df1v[i]<3:
        c2+=1
    if df1v[i]>=3 and df1v[i]<4:
        c3+=1
    if df1v[i]>=4 and df1v[i]<5:
        c4+=1
    if df1v[i]>=5 and df1v[i]<6:
        c5+=1
    if df1v[i]>=6 and df1v[i]<7:
        c6+=1
    if df1v[i]>=7 and df1v[i]<8:
        c7+=1
    if df1v[i]>=8 and df1v[i]<9:
        c8+=1
    if df1v[i]>=9 and df1v[i]<10:
        c9+=1
    if df1v[i]==10:
        c10+=1
c2,c3,c4,c5,c6,c7,c8,c9,c10


# In[164]:


x=[c2,c3,c4,c5,c6,c7,c8,c9,c10]


# In[165]:


x


# In[166]:


import matplotlib.pyplot as plt

#x = [15, 25, 25, 30, 5]
#x=df1v
label=["2-rating","3-rating","4-rating","5-rating","6-rating","7-rating","8-rating","9-rating","10-rating"]
fig, ax = plt.subplots()
ax.pie(x,radius=2.2,
       pctdistance=0.5
          )
plt.legend(labels=label)
plt.show()


# In[ ]:




