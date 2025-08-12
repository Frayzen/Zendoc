---
title: "Medical classification Project"
---
Last edited time: June 2, 2024 6:15 PM

## Introduction

The objective of this project is to leverage the concepts from the introductory course on artificial intelligence using clustering and classification techniques. In this project, we will use the Breast Cancer Wisconsin dataset as the working dataset. Project validation will be performed through a script implementing performance criteria to evaluate the results obtained by the algorithms developed during this project. The submission will solely consist of code written in Python using the numpy library. The use of any other library is not permitted.

## Dataset

The dataset to be used is available at the following [link 1](http://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic). This dataset has been selected for its relevance in the chosen domain and its ability to illustrate various aspects of clustering and classification.

[Data layout](Medical%20classification%20Project/Data%20layout.md)

## Data Clustering

[https://www.kaggle.com/code/raphaelekete/cluster-analysis-of-breast-cancer-data-set](https://www.kaggle.com/code/raphaelekete/cluster-analysis-of-breast-cancer-data-set)

In this first part, we develop the K-Means clustering algorithm. We assess the quality of the formed clusters using the silhouette score. The clustering model will adhere to the class signature described below.

- Development of the clustering algorithm.
- Parameterisation of the number of clusters during the construction of the KMeans class.
- Utilization of a silhouette metric to evaluate the quality of the formed clusters.
- The clustering model following the provided class signature.

The silhouette equation is an evaluation measure of the quality of a clustering that takes into account both the average distance between a point and the other points in its cluster (cohesion) and the average distance between this point and the points of neighboring clusters (separation). Here is the silhouette equation:

$$
s(i) = \frac{b(i) - a(i)}{\max\{a(i), b(i)\}}
$$

here:

- ***s*(*i*)** is the silhouette coefficient for point ***i***.
- ***a*(*i*)** is the average distance between point ***i*** and the other points in the same cluster as ***i** (cohesion)*
- ***b*(*i*)** is the average distance between point ***i*** and the points of the nearest neighboring cluster (separation).

The silhouette coefficient varies from -1 to 1. A silhouette coefficient close to 1 indicates that the point is well-clustered, a coefficient close to 0 indicates that the point is close to the boundary between two clusters, and a coefficient close to -1 indicates that it is likely in the wrong cluster. In general, the closer the average silhouette coefficient is to 1 for all points, the better the quality of the clustering. 

### Data clustering python code

```python
class ClusteringModel:
    def __init__(self, num_clusters):
        """
        Initializes the clustering model with a specified number of clusters.

        :param num_clusters: (int) The number of clusters to form during clustering.
        """
        self.num_clusters = num_clusters

    def fit(self, data):
        """
        Trains the clustering model on the provided data.

        :param data: (array-like) The data to train the model on.
        Each row corresponds to an observation, and each column corresponds to a feature.
        """
        pass

    def predict(self, data):
        """
        Predicts the clusters for new data using the trained clustering model.

        :param data: (array-like) New data to predict clusters for.
        Each row corresponds to an observation, and each column corresponds to a feature.
        :return: (array-like) Predicted clusters for the new data.
        """
        pass

    def silhouette_score(self, data):
        """
        Evaluates the performance of the clustering model using the Silhouette Score.

        :param data: (array-like) The data to calculate the Silhouette Score on.
        :return: (float) The value of the Silhouette Score for the clustering model.
        """
        pass

```

## Classification Model

In this second part, we will develop a classification model using an algorithm of your choice. Using the numpy library, we will parameterize the algorithm, automatically split the dataset into training and test sets, and ensure a balanced distribution of classes. The model is then trained and evaluated using the following classification metrics: precision, recall, and F1-score. The class signature must be respected, and private variables can be added as needed.

- Use of the numpy library to create the chosen classification model.
- Parameterization of the algorithm is to be chosen in the constructor.
- Training the model on the training set.
- Automatic evaluation of performance on the test set.
- Use of automatic classification metrics, precision, recall, and F1-score.

### Classification model python

```python
class ClassificationModel:
    def __init__(self, input_dim, output_dim):
        """
        Initializes the classification model with the given
        input and output dimensions.

        :param input_dim: (int) The input dimension of the model.
        :param output_dim: (int) The output dimension of the model.
        """
        self.input_dim = input_dim
        self.output_dim = output_dim

    def train(self, X_train, y_train):
        """
        Trains the classification model on the given training data.

        :param X_train: (numpy.ndarray) The training data,
        with shape (n_samples, input_dim).
        :param y_train: (numpy.ndarray) The training labels,
        with shape (n_samples, output_dim).
        """
        pass

    def predict(self, X_test):
        """
        Makes predictions on new data using the trained classification model.

        :param X_test: (numpy.ndarray) The new data,
        with shape (n_samples, input_dim).
        :return: (numpy.ndarray) The model predictions,
        with shape (n_samples, output_dim).
        """
        pass

    def evaluate(self, X_test, y_test):
        """
        Evaluates the performance of the classification model
        on the given test data using classification metrics.

        :param X_test: (numpy.ndarray) The test data,
        with shape (n_samples, input_dim).
        :param y_test: (numpy.ndarray) The test labels,
        with shape (n_samples, output_dim).
        :return: (dict) A dictionary containing the computed
        classification metrics.
        """
        pass

```

## Distance to Centroids as Representation

In this final part, we implement an alternative approach to represent each point in the dataset using the distance to the centroid of each cluster identified by the clustering algorithm implemented in the first part. Instead of using raw data as input for our classification model, this approach will be beneficial for capturing intra-cluster relationships. In this third approach, we wilGl accomplish the following tasks:

- Calculation of centroids for each cluster formed during the clustering process.
- For each data point, calculation of the Euclidean distance to the centroids of the clusters.
- Using these distances to centroids as new features representing each point in the dataset.
- The classification model following the provided class signature.
- The method "def compute_representation(self, X)" should be added to the clustering class to calculate the new representation of test points.

This approach can improve the separability of classes when applying a classification model learned on this new data representation. An implementation of this modification can be added in the data preprocessing section, before training the classification model.

## Training Code for Evaluation

The following example code trains the clustering and classification models on the targeted data before performing evaluation. Firstly, the WDBC (Wisconsin Diagnostic Breast Cancer) dataset is loaded from a CSV file, and the target labels are encoded as numerical values.

The first model is a clustering model, which is trained on the training set using a specified number of clusters. The clustering model is then saved to a pickle file for later use.

The second model is a classification model of your choice, which is trained on the training set using the specified input and output dimensions. The classification model is also saved to a pickle file for later use.

Finally, a third classification model is trained using the centroid descriptors calculated from the previously trained clustering model. This model is also saved to a pickle file for later use.

### Training Code Python

```python
import os, sys
import numpy as np
import pandas as pd
import pickle as pkl

from models import ClusteringModel, ClassificationModel

def train_test_split(X, y, test_size=0.2, random_state=None):
    if random_state is not None:
        np.random.seed(random_state)

    num_samples = X.shape[0]
    indices = np.arange(num_samples)
    np.random.shuffle(indices)

    test_samples = int(num_samples * test_size)

    test_indices = indices[:test_samples]
    train_indices = indices[test_samples:]

    X_train, X_test = X[train_indices], X[test_indices]
    y_train, y_test = y[train_indices], y[test_indices]

    return X_train, X_test, y_train, y_test

def student_model_train():

    script_directory = os.path.dirname(os.path.abspath(__file__))
    os.chdir(script_directory)
    save_folder = "./models/"

    print("Loading the dataset")
    wdbc_data = pd.read_csv("data/wdbc.data", header=None)
    X = wdbc_data.iloc[:, 2:-1].values
    y = wdbc_data.iloc[:, 1].values

    print("Encoding target labels")
    y_int = np.zeros((len(y), 1), dtype=int)
    y_int[y == 'B'] = 0
    y_int[y == 'M'] = 1
    y = y_int

    print("Sampling the training set")
    X_train, _, y_train, _ = train_test_split(X, y, test_size=0.2, random_state=None)

    print("Training and saving the Clustering model")
    num_clusters = 5
    clustering_model = ClusteringModel(num_clusters)
    clustering_model.fit(X_train)
    with open(os.path.join(save_folder, 'clustering.pkl'), 'wb') as f:
        pkl.dump(obj=clustering_model, file=f)

    print("Training and saving the Classification model")
    input_dim = X.shape[1]
    output_dim = len(np.unique(y))
    classif_model = ClassificationModel(input_dim, output_dim)
    classif_model.train(X_train, y_train)
    with open(os.path.join(save_folder, 'classif.pkl'), 'wb') as f:
        pkl.dump(obj=classif_model, file=f)

    print("Training and saving the Classification model with centroid descriptors")
    representation_X_train = clustering_model.compute_representation(X_train)
    input_dim = representation_X_train.shape[1]
    output_dim = len(np.unique(y))
    classif_model_repr = ClassificationModel(input_dim, output_dim)
    classif_model_repr.train(representation_X_train, y_train)

    print("Saving the Classification model with centroid descriptors")
    with open(os.path.join(save_folder, 'classif-centroid.pkl'), 'wb') as f:
        pkl.dump(obj=classif_model_repr, file=f)

if __name__ == "__main__":
    student_model_train()

```

## Here are the descriptions of the tests:

1. **Test clustering silhouette on dataset 4 clusters**: Test the silhouette score of the clustering model with 4 clusters on the dataset.
2. **Test clustering silhouette on dataset 8 clusters**: Test the silhouette score of the clustering model with 8 clusters on the dataset.
3. **Test clustering silhouette on dataset 16 clusters**: Test the silhouette score of the clustering model with 16 clusters on the dataset.
4. **Test clustering silhouette on dataset 32 clusters**: Test the silhouette score of the clustering model with 32 clusters on the dataset.
5. **Test clustering silhouette on dataset 16 clusters with noise**: Test the silhouette score of the clustering model with 16 clusters on the noisy dataset.
6. **Test classification accuracy with noisy data**: Test the accuracy of the classification model on noisy data.
7. **Test classification accuracy with clustering initialized model**: Test the accuracy of the classification model initialized with a clustering model on noisy data.
8. **Test classification accuracy with original data**: Test the accuracy of the classification model on the original data.
9. **Test classification of all malignant cases**: Test if the classification model can correctly classify all malignant cases.
10. **Test classification of all benign cases**: Test if the classification model can correctly classify all benign cases.
11. **Test classification of all malignant cases with clustering representation**: Test if the clustering representation model can correctly classify all malignant cases.
12. **Test classification of all benign cases with clustering representation**: Test if the clustering representation model can correctly classify all benign cases.
13. **Test classification with missing data**: Test classification with missing data.
14. **Test classification with outlier data**: Test classification with outlier data.
15. **Test classification with scaled data**: Test classification with scaled data.
16. **Test classification with translated data**: Test classification with translated data.
17. **Test classification with permuted data**: Test classification with permuted data.
18. **Test classification with outlier data with clustering representation**: Test classification with outlier data using the clustering representation.
19. **Test classification with scaled data with clustering representation**: Test classification with scaled data using the clustering representation.
20. **Test classification with translated data with clustering representation**: Test classification with translated data using the clustering representation.
