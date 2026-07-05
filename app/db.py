import boto3
import json
import psycopg2


def get_connection():
    client = boto3.client("secretsmanager", region_name="ap-south-1")

    secret = client.get_secret_value(
        SecretId="enterprisecloudplatform-dev-database-secret"
    )

    creds = json.loads(secret["SecretString"])

    conn = psycopg2.connect(
        host="enterprisecloudplatform-dev-postgresql.cf4ys4giwpdn.ap-south-1.rds.amazonaws.com",
        database="enterprise_db",
        user=creds["username"],
        password=creds["password"],
        port=5432,
    )

    return conn
