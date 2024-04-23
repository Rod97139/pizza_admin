# pizza_admin

 

Exemple de fichier JSON contenant la configuration CORS:

```json
[
    {
      "origin": ["https://your-example-website.appspot.com"],
      "method": ["GET", "HEAD", "POST", "PUT", "DELETE"],
      "responseHeader": ["Content-Type"],
      "maxAgeSeconds": 3600
    }
]
```

commande bash pour le storage firebase à executer dans le terminal google cloud du projet :
cors setup for Image upload :

```bash
gsutil cors set cors.json gs://<your-url>.appspot.com
```