import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib 
from matplotlib.ticker import ScalarFormatter
import matplotlib.dates as mdates

inf_df = pd.read_excel('SNB_data.xlsx', sheet_name="Inf", header=0)

fig = plt.subplot()

plt.plot(inf_df['Date'], inf_df['Real Inflation'])


plt.plot(inf_df['Date'], inf_df.iloc[:, 2:], ':', alpha=0.7)

plt.ylabel('Inflation')

# set the ticks so they don't overlap 
fig.set_xticks(np.arange(0, len(inf_df['Date'])+1, 10))
plt.xticks(rotation=30)
#fig.set_yticks(np.arange(0, max(inf_df['Real Inflation']), 3))


for i1, col in enumerate(inf_df.iloc[:, 2:].columns):

    col1 = col
    if (col == '20015-Q4'):
        col1 = '2015-Q4'
    
    
    i = inf_df.index[inf_df['Date'] == col1].tolist()[0]
    y_pos = inf_df.iloc[:, 2:].notna()[::-1].idxmax()

    df2 = inf_df.iloc[:, 2:].copy(deep=False)
    y = df2.iloc[y_pos[i1], i1]

    i = min(i, 64-i1)

    plt.annotate(col, xy=(i + 12, y), size=4)

plt.savefig('output/inflation_forecasts.png', dpi=300)


##### Figure 2: FX vs M0
df2 = pd.read_excel('yolan.xlsx', sheet_name="FXvsM0", header=0)

df2['Date'] = pd.to_datetime(df2['Date'])

fig1, ax = plt.subplots(1,1)

df2.plot(x="Date", y=['FX', 'M0'], ax=ax)
labels=["Foreign Currency Reserve", "Monetary Base"]
plt.legend(labels)
plt.yscale('log')
ax.yaxis.set_major_formatter(ScalarFormatter()) 
ax.ticklabel_format(style='plain', axis='y')
ax.get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))

plt.ylabel('mil. CHF')

#plt.legend()
plt.savefig('output/fx.png', dpi=300)


## Figure 3: FX
df3 = pd.read_excel('yolan.xlsx', sheet_name="FX", header=0)
fig2, ax1 = plt.subplots(1,1)

df3['Date'] = pd.to_datetime(df3['Date'], format='%Y')

df3.plot(x='Date', y=['EUR', 'GBP', 'USD', 'JPY', 'CNY/10'], ax=ax1)
years = mdates.YearLocator() 
months = mdates.MonthLocator()  # every month
years_fmt = mdates.DateFormatter('%Y')

# ax1.xaxis.set_major_locator(years)
# ax1.xaxis.set_major_formatter(years_fmt)
# ax1.xaxis.set_minor_locator(months)
plt.ylabel('CHF')

plt.savefig('output/fx2.png', dpi=300)


## Figure 4) Swiss exports
df4 = pd.read_excel('yolan.xlsx', sheet_name="Swiss Exports", header=0)
fig3, ax3 = plt.subplots(1,1)

df4['Date'] = pd.to_datetime(df4['Date'], format='%Y')

df4.plot(x='Date', ax=ax3)

ax3.yaxis.set_major_formatter(ScalarFormatter()) 
ax3.ticklabel_format(style='plain', axis='y')
ax3.get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))

plt.ylabel('mil. CHF')
plt.tight_layout()
 

plt.savefig('output/exports.png', dpi=300)


## Figure 5) Balance Sheet

df5 = pd.read_excel('yolan.xlsx', sheet_name="BalSheet", header=0)
fig4, ax4 = plt.subplots(1,2, sharex=False, figsize=(11, 7), sharey=True)

fig41, ax41 = plt.subplots(1,2, sharex=False, figsize=(11, 7), sharey=True)

df5['Date'] = pd.to_datetime(df5['Date'], format='%Y-%m')


# time series plot
df5.plot.area(x='Date', y=['Assets - Gold holdings and claims from gold transactions', 'Assets - Foreign currency investments', 'Assets - Secured loans', 'Assets - Other'], ax=ax4[0], linewidth=0)
df5.plot.area(x='Date', y=['Liabilities - Banknotes in circulation', 'Liabilities - Sight deposits of domestic banks',	'Liabilities - Foreign currency liabilities',	'Liabilities - Provisions and equity capital',	'Liabilities - Other'], ax=ax4[1], linewidth=0)


# 2021 plot.
df5.loc['2019-01':, :].plot.area(x='Date', y=['Assets - Gold holdings and claims from gold transactions', 'Assets - Foreign currency investments', 'Assets - Secured loans', 'Assets - Other'], ax=ax41[0])
df5.loc['2019-01':, :].plot.area(x='Date', y=['Liabilities - Banknotes in circulation', 'Liabilities - Sight deposits of domestic banks',	'Liabilities - Foreign currency liabilities',	'Liabilities - Provisions and equity capital',	'Liabilities - Other'], ax=ax41[1], linewidth=0)


ax4[0].yaxis.set_major_formatter(ScalarFormatter()) 
ax4[0].ticklabel_format(style='plain', axis='y')
ax4[0].get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))

ax4[1].yaxis.set_major_formatter(ScalarFormatter()) 
ax4[1].ticklabel_format(style='plain', axis='y')
ax4[1].get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))


ax4[0].legend(fontsize=5)
ax4[1].legend(fontsize=5)

ax41[0].title.set_text('Assets')
ax41[1].title.set_text('Liabilities')


ax41[0].yaxis.set_major_formatter(ScalarFormatter()) 
ax41[0].ticklabel_format(style='plain', axis='y')
ax41[0].get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))

ax41[1].yaxis.set_major_formatter(ScalarFormatter()) 
ax41[1].ticklabel_format(style='plain', axis='y')
ax41[1].get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')))


ax41[0].legend(fontsize=5)
ax41[1].legend(fontsize=5)

ax41[0].title.set_text('Assets')
ax41[1].title.set_text('Liabilities')


fig4.savefig('output/balSheet.png', dpi=300)
fig41.savefig('output/balSheet2020.png', dpi=300)
plt.clf()

## Balance sheet 2
import squarify 
fig6, ax6 = plt.subplots(1, 2, figsize=(15, 8))
label= df5.columns[1:5]

def removeCat(item):
    splitted = item.split('-')
    return splitted[1].strip()

label = map(removeCat, label)


squarify.plot(sizes=df5.iloc[33, 1:5], label=label, alpha=0.6, text_kwargs={'fontsize':10}, ax=ax6[0])
plt.axis('off')
ax6[0].title.set_text('Assets')


ax6[1].title.set_text('Liabilities')
label2= df5.columns[5:]
label2 = map(removeCat, label2)

squarify.plot(sizes=df5.iloc[33, 5:-1], label=label2, alpha=0.6, text_kwargs={'fontsize':10}, ax=ax6[1])
ax6[0].axis('off')
ax6[1].axis('off')

fig6.suptitle('SNB Balance Sheet: 03-2021')


plt.tight_layout()
plt.savefig('output/bal2.png', dpi=300)
