import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

# Load the data
def load_data(file_path):
    return pd.read_csv(file_path)

# Prepare dataframes with and without biomarkers and sensor data
def prepare_dataframes(df):
    # Assume 'outcome' is the target variable
    X = df.drop('outcome', axis=1)
    y = df['outcome']
    
    # Identify biomarker and sensor columns (example names, adjust as needed)
    biomarker_cols = [col for col in X.columns if col.startswith('biomarker_')]
    sensor_cols = [col for col in X.columns if col.startswith('sensor_')]
    
    # Create dataframe without biomarkers and sensors
    X_without = X.drop(biomarker_cols + sensor_cols, axis=1)
    
    return X, X_without, y

# Perform feature selection
def feature_selection(X, y, k=10):
    selector = SelectKBest(score_func=f_classif, k=k)
    X_selected = selector.fit_transform(X, y)
    selected_features = X.columns[selector.get_support()].tolist()
    return X_selected, selected_features

# Train and evaluate models
def train_evaluate_models(X_train, X_test, y_train, y_test):
    models = {
        'Logistic Regression': LogisticRegression(),
        'Random Forest': RandomForestClassifier(),
        'SVM': SVC(),
        # Remove XGBoost from the models dictionary
        # 'XGBoost': XGBClassifier()
    }
    
    results = {}
    
    for name, model in models.items():
        model.fit(X_train, y_train)
        y_pred = model.predict(X_test)
        
        results[name] = {
            'accuracy': accuracy_score(y_test, y_pred),
            'precision': precision_score(y_test, y_pred, average='weighted'),
            'recall': recall_score(y_test, y_pred, average='weighted'),
            'f1': f1_score(y_test, y_pred, average='weighted')
        }
    
    return results

# Main function
def main():
    # Load data
    df = load_data('heart_failure_data.csv')  # Replace with your actual data file
    
    # Prepare dataframes
    X_full, X_without, y = prepare_dataframes(df)
    
    # Perform feature selection on both dataframes
    X_full_selected, full_features = feature_selection(X_full, y)
    X_without_selected, without_features = feature_selection(X_without, y)
    
    # Split the data
    X_full_train, X_full_test, y_full_train, y_full_test = train_test_split(X_full_selected, y, test_size=0.2, random_state=42)
    X_without_train, X_without_test, y_without_train, y_without_test = train_test_split(X_without_selected, y, test_size=0.2, random_state=42)
    
    # Scale the features
    scaler = StandardScaler()
    X_full_train = scaler.fit_transform(X_full_train)
    X_full_test = scaler.transform(X_full_test)
    X_without_train = scaler.fit_transform(X_without_train)
    X_without_test = scaler.transform(X_without_test)
    
    # Train and evaluate models
    print("Results with all features:")
    results_full = train_evaluate_models(X_full_train, X_full_test, y_full_train, y_full_test)
    for model, metrics in results_full.items():
        print(f"{model}: {metrics}")
    
    print("\nResults without biomarkers and sensor data:")
    results_without = train_evaluate_models(X_without_train, X_without_test, y_without_train, y_without_test)
    for model, metrics in results_without.items():
        print(f"{model}: {metrics}")
    
    print("\nSelected features (full dataset):", full_features)
    print("Selected features (without biomarkers and sensors):", without_features)

if __name__ == "__main__":
    main()

import os
os.getcwd()
3**2
np.arrary([1,2,3,4,5,6,7,8,9,10])





