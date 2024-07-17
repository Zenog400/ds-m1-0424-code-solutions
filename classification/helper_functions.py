from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
import sklearn.metrics as metrics

def grid_train_random_forest(X, y, params, n_folds = 4, eval_metric = "accuracy"):
    """
    Train Random Forest binary classifier using a grid of hyperparameters. Return
    the best model according to the specified metric.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        params: Dictionary - Parameter grid on which to perform cross validation.
        n_folds: int - Number of folds to use for cross validation.
        eval_metric: str - Metric to use for evaluating model performance in cross validation.

    Returns:
        model: Best Random Forest model according to evaluation metric.

    Examples:
        model = grid_train_random_forest(X, y, params, 4, "accuracy")
    """

    gsc = GridSearchCV(RandomForestClassifier(), param_grid=params, scoring=eval_metric, n_jobs=n_folds)
    gsc.fit(X, y)
    return gsc.best_estimator_

    # TODO: Implement this function
    pass

def calc_roc_metrics(X, y, model):
    """
    Calculate False Positive Rate (FPR), True Positive Rate (TPR), and Area Under ROC Curve (AUC)
    for a given binary classification model and test data.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        model: Scikit-learn style binary classification model.

    Returns:
        fpr: float - False Positive Rate.
        tpr: float - True Positive Rate.
        auc: float - Area Under ROC Curve.

    Examples:
        fpr, tpr, auc = calc_roc_metrics(X, y, model)
    """

    
    fpr, tpr, thresholds = metrics.roc_curve(y, model.predict_proba(X)[:, 1], pos_label="Yes")

    auc = metrics.roc_auc_score(y, model.predict_proba(X)[:, 1])
    return fpr, tpr, auc

    # TODO: Implement this function
    pass

def train_xgboost(X_train, y_train, X_test, y_test, params, n_round):
    """
    Train an XGBoost model with the given parameters and train/test data.

    Args:
        X_train: Array-like of shape (n_train_samples,n_features) - Train feature data.
        y_train: Array-like of shape (n_train_samples,) - Train target data.
        X_test: Array-like of shape (n_test_samples,n_features) - Test feature data.
        y_test: Array-like of shape (n_test_samples,) - Test target data.
        params: Dictionary - Parameters to pass into XGBoost trainer.
        n_round: int - Number of rounds of training.

    Returns:
        model: Trained XGBoost model.

    Examples:
        model = calc_roc_metrics(X_train, y_train, X_test, y_test, params)
    """

    y_train = y_train.apply(lambda foo: 0 if foo == "No" else 1)
    y_test = y_test.apply(lambda foo: 0 if foo == "No" else 1)
    xgboosted = XGBClassifier(max_depth = params['max_depth'], learning_rate = params['eta'], objective = params['objective'], n_jobs = params['nthread'], eval_metric = params['eval_metric'], n_estimators = n_round)
    xgboosted.fit(X_train, y_train, eval_set=[(X_test, y_test)])
    return xgboosted
    # TODO: Implement this function
    pass
