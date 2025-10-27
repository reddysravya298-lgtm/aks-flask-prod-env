aks-flask-prod-env/
│
├── app/
│   ├── app.py
│   │   from flask import Flask, jsonify
│   │
│   │   app = Flask(__name__)
│   │
│   │   @app.route("/")
│   │   def home():
│   │       return jsonify({"message": "Hello from aks-flask-prod-env!"})
│   │
│   │   @app.route("/health")
│   │   def health():
│   │       return jsonify({"status": "healthy"})
│   │
│   │   if __name__ == "__main__":
│   │       app.run(host="0.0.0.0", port=5000)
