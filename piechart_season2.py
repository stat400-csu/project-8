#!/usr/bin/env python
# coding: utf-8

# # Season-2 Pie Chart Exploration

# In[167]:


import pandas as pd 
df2 = pd.read_csv("season2_generated_cutoff.csv")


# In[168]:


df2 = df2.iloc[: , 1:]
df2


# In[169]:


df2=df2.mean()
df2


# In[170]:


df2v= df2.values
df2v.shape


# In[171]:


c2,c3,c4,c5,c6,c7,c8,c9,c10=0,0,0,0,0,0,0,0,0
for i in range(len(df2v)):
    if df2v[i]>=2 and df2v[i]<3:
        c2+=1
    if df2v[i]>=3 and df2v[i]<4:
        c3+=1
    if df2v[i]>=4 and df2v[i]<5:
        c4+=1
    if df2v[i]>=5 and df2v[i]<6:
        c5+=1
    if df2v[i]>=6 and df2v[i]<7:
        c6+=1
    if df2v[i]>=7 and df2v[i]<8:
        c7+=1
    if df2v[i]>=8 and df2v[i]<9:
        c8+=1
    if df2v[i]>=9 and df2v[i]<10:
        c9+=1
    if df2v[i]==10:
        c10+=1
c2,c3,c4,c5,c6,c7,c8,c9,c10


# In[172]:


y=[c2,c3,c4,c5,c6,c7,c8,c9,c10]


# In[173]:


import matplotlib.pyplot as plt

#x = [15, 25, 25, 30, 5]
#x=df1v
label=["2-rating","3-rating","4-rating","5-rating","6-rating","7-rating","8-rating","9-rating","10-rating"]
fig, ax = plt.subplots()
ax.pie(y,radius=2.2,
       pctdistance=0.5
          )
plt.legend(labels=label)
plt.show()


# In[ ]:




