'''
Which scaling method works best for data with outliers?
- Robust scaling
Which scaling method produces data that is normally distributed? What is its mean and variance?
- Standard scalar
Which scaling method does not remove sparsity? What is sparsity?
- maxAbs scalar; sparsity is a lack of data or a small sample size
Which scaling method is best to use if the bounds of your data are known from domain knowledge?
- minmax scaling
'''
import pandas as pd
import numpy as np
import sklearn.preprocessing as skprep
from scipy.stats import boxcox, yeojohnson

#read data
data = pd.read_csv("mtcars_mod.csv")

#initialize scalar calculations
minmax = skprep.MinMaxScaler()
standard = skprep.StandardScaler()
maxAbs = skprep.MaxAbsScaler()
robust = skprep.RobustScaler()

'''
Exercise 1

Use the most appropriate scaling technique for each variable to scale `disp`, `hp`, `drat`, and `wt`, assuming wt should be normally distributed and the true bounds are known for disp.
'''
#minmax scale disp (known bounds)
data2 = minmax.fit_transform(X=data[["disp"]])
data2 = data2.reshape((1,-1))[0]
data["disp"] = data2

#maxAbs scale hp (sparse data)
data2 = maxAbs.fit_transform(X=data[["hp"]])
data2 = data2.reshape((1,-1))[0]
data["hp"] = data2

#robust scale drat (outliers)
data2 = robust.fit_transform(X=data[["drat"]])
data2 = data2.reshape((1,-1))[0]
data["drat"] = data2

#standard scale wt (should be normal distribution)
data2 = standard.fit_transform(X=data[["wt"]])
data2 = data2.reshape((1,-1))[0]
data["wt"] = data2

'''
Exercsise 2

Use Box-Cox or Yeo-Johnson to determine the best transformation to use to make mpg and qsec normally distributed. Show the transformed data and the value of $\lambda$.
'''
#boxcox transform mpg
mpg, mpg_lam = boxcox(data.mpg)
data["mpg"] = mpg
print(mpg_lam)
print(data["mpg"])

#yeo-johnson transform qsec
qsec, qsec_lam = yeojohnson(data.qsec)
data["qsec"] = qsec
print(qsec_lam)
print(data["qsec"])

'''
Exercsise 3

Normalize all of the numeric rows using L2-normalization and display the new dataframe.
'''

numeric = ["mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"]
normalized = skprep.normalize(data[numeric])
data[numeric] = normalized
data