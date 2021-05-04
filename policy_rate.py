import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib as mpl
import matplotlib.patheffects
import numpy as np
import statsmodels.api as sm

df = pd.read_excel('data.xlsx', header=1)
df.columns = ['date', 'y', 'i', 'cpi', 'unemp', 'inf'] 

data = df.iloc[-12:-1, :]
data2 = df.iloc[:-1, :]

fig, ax = plt.subplots(1, 1, dpi=150)
plt.xticks(rotation=90)
plt.title('BoE Policy Rate')
plt.plot(data2['date'], data2['i'])

start, end = ax.get_xlim()
starty, endy = ax.get_ylim()
stepsize = 6
ax.yaxis.set_ticks(np.arange(0, 1.1, 0.1))
ax.xaxis.set_ticks(np.arange(start, end, stepsize))
plt.vlines(len(df['i'])-12, 0, 1, linestyles='dashdot', color='red')
plt.tight_layout()
plt.savefig('policy_rate.png', dpi=300)
plt.show()

