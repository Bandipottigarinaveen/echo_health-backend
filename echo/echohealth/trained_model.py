import pandas as pd
import joblib
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Load dataset
df = pd.read_csv('echohealth/datasets/cleaned_oral_cancer_symptoms.csv')

# Automatically generate 'risk_level'
def compute_risk(row):
    if row['Oral Cancer (Diagnosis)'] == 'Yes':
        if row['Tobacco Use'] == 'Yes' or row['Alcohol Consumption'] == 'Yes' or row['HPV Infection'] == 'Yes':
            return 'High'
        return 'Medium'
    return 'Low'

df['risk_level'] = df.apply(compute_risk, axis=1)

# Define features and label
features = [
    'Age', 'Gender', 'Tobacco Use', 'Alcohol Consumption', 'HPV Infection',
    'Betel Quid Use', 'Poor Oral Hygiene', 'Oral Lesions', 'Unexplained Bleeding',
    'Difficulty Swallowing', 'White or Red Patches in Mouth', 'Oral Cancer (Diagnosis)'
]
X = df[features]
y = df['risk_level']

# Label encode categorical features
categorical_cols = X.select_dtypes(include='object').columns
label_encoders = {}

for col in categorical_cols:
    le = LabelEncoder()
    X[col] = le.fit_transform(X[col])
    label_encoders[col] = le

# Encode target
target_encoder = LabelEncoder()
y = target_encoder.fit_transform(y)

# Save target encoder
joblib.dump(target_encoder, 'echohealth/target_encoder.pkl')

# Split and train
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
model = RandomForestClassifier()
model.fit(X_train, y_train)

# Save model and encoders
joblib.dump(model, 'echohealth/oral_cancer_model.pkl')
joblib.dump(label_encoders, 'echohealth/label_encoders.pkl')

print("✅ Oral cancer model trained and risk levels saved successfully.")