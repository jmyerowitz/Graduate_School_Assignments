## Amazon Customer Reviews: Predicting 5-Star Review Rating

A case analysis from December 2019 that highlighted many techniqes that had been learned at that point. The attached Jupyter notebook includes:

• Performing preliminary sentiment analysis using TextBlob and Vader Python packages.

•	Creating features spaces for machine learning via Document-Term Matrices from stemmed Amazon reviews in order to extract top 1000 tokens of 3 million review dataset (randomly sampled for 100,000 reviews).

•	Performing 3 dimension-reduction techniques to (PCA, Sparse PCA, UMAP) in order to perform machine learning algorithms.

•	Conducting multiple machine learning algorithms (KNN, Random Forest, Gradient Boost, XGBoost) for classification purposes and to predict star-rating based on token frequencies.

There were many lessons learned in this assignment, including the limitations of my local machine's processing power and putting in hours and days of work for models that are only 45-ish% accurate. While the algorithms used are powerful, sometimes they're not quite the right tool for the job.
