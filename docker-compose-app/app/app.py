from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )

@app.route("/")
def home():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT 'Hello from PostgreSQL inside Docker!'")
    message = cur.fetchone()[0]
    cur.close()
    conn.close()
    return message

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
