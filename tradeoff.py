import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib as mpl
import matplotlib.patheffects
import numpy as np
import statsmodels.api as sm

df = pd.read_excel('data.xlsx', header=1)
 


data2 = df.iloc[:-12, :]



x = np.arange(0, len(data2['y']))
x = sm.add_constant(x)
res = sm.OLS(data2['y'], x).fit()

data2['y_pred'] = res.predict(x)
df['y_pred'] = res.predict(sm.add_constant(np.arange(0, len(df['y']))))

data = df.iloc[-12:-1, :]



data['y_gap'] = data['y'] - data['y_pred']
data['inf_tar'] = data['inf'] -2

data2['y_gap'] = data2['y'] - data2['y_pred']
data2['inf_tar'] = data2['inf'] -2


print(data.head(20))

fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1)

dummy1 = [20]
dummy0 = [0]

ax.scatter(data['y_gap'],data['inf_tar'])
ax.scatter(data2['y_gap'], data2['inf_tar'], color="red", alpha=0.5)
ax.scatter(dummy1, dummy0, alpha=0)

ax.spines['left'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['bottom'].set_position('zero')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

plt.ylabel('Inflation\nrelative\nto target', loc='top', rotation=0)
plt.xlabel('Output\nrelative to\nnatural rate', loc='right')

plt.xlim(-20, 20)
plt.ylim(-2, 2)

for i, row in data.iterrows():
    ax.annotate(row['Unnamed: 0'], (data.loc[i, 'y_gap'], data.loc[i, 'inf_tar']))
plt.savefig('tradeoff.png', dpi=300)

#plt.show()

