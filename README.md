# Atelier Java 2026

Application web JSP servant de support aux exercices de **programmation orientée
objet** en Java (objets, constructeurs, polymorphisme).


Le déploiement se fait automatiquement sur un serveur Tomcat hébergé sur AWS EC2,
via GitHub Actions, à chaque `Commit` sur votre dépôt.

---

## Démarche à suivre

### 1. Créer un compte GitHub

Si vous n'en avez pas encore, créez vous un compte sur https://github.com.

### 2. Forker ce projet

Forkez ce Repository dans votre propre
espace GitHub.

> Tutoriel vidéo : https://youtu.be/p33-7XQ29zQ

### 3. Créer les 4 secrets dans votre dépôt

Dans **Settings → Secrets and variables → Actions → New repository secret**,
créez les 4 secrets suivants :

| Nom du secret | Valeur |
|---|---|
| `HOST_DNS`     | `ec2-35-180-71-137.eu-west-3.compute.amazonaws.com` |
| `USERNAME`     | `admin` |
| `DEPLOY_PORT`  | `22` |
| `EC2_SSH_KEY`  | *voir la clé ci-dessous* |

Pour `EC2_SSH_KEY`, collez **tout le contenu** de la clé, lignes
`-----BEGIN RSA PRIVATE KEY-----` et `-----END RSA PRIVATE KEY-----` comprises :

```
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAiYvLXlp7nSoxrhqb0Axot1jhhp/+QDsfE4GQ1WhKq8+bajxD
WZsYcXugsJSAUdni9kw8VD153SXuhYSDaPl/oiXup/7aOHTbY1TH0JbNRSM33aWC
Mgdk9qoe5e6aY3ENHaqT8YsGI9k2bCOB+Nzu8m+2H6E+T180BMMzC20Ft241tC18
sYmVLQa48Jpau4S6h58rrem/z8nR0nmqKshQOrlxPn0N9QkFyLeFMvBO/xuOkemm
tjTFSLkUr7H7ju7UMKJdVQXwlnGDTQXSRZ5jzLyUFcUCfXQrWT9gdlSLwnZRiTih
cs9cEGJCdlkUC0DpJ8sDU3aGm8+BUvfJf3+HSQIDAQABAoIBAFc9s+BEw+MLwDcN
6YYsWL7yQRmCoWFcHnng1FyHqdUP+SOI1a8gEIDqSSG3DyzbZnmSITHNTF5YkNFf
G3qZxbqzFIy5uO/WLtDyFUrYW5penDCZqdrRldheTvrIPGSWcBtA9lVeOKbEPyCX
5PhUKbrb4EhvnXX6jKP4q4ezvsx4zKqvdx/fYMDK/yuvmBNLXvRviPVq8v3kHc+F
EpMqmW+pjs27KZa1tBZxLoJUHtN3b9izZsmKs8Mv+RsLKuXYv3ZxfpYX0V6o88Bi
sGEXirlrHd+4Mimt7ZYWxj1QvK5tIFJNvch6G2YbB5sV0+eh6J0qSHGg8ziHJQRL
Gw3BAAECgYEAwgTGNS8WDDqhKhPQ5M8jzf1p90s31d2SGMpgRJrjWc4jC/PJPBy7
iK8RoHhDp0C5v0CkWz0lcb9Re2x/OntDFUSgIdLSSflk9t+SyiibMMhLTW4Kc5Ax
J0hLMUv4YDuZNuC1utdb7DaeUW9HSQqCLdn6EuYgQRooGuOW8TxchgECgYEAtXyU
/VCmYFkyhBSqTLeKl2ehaigKi7ClhRR/RXyZNVOKYjE36ccpW4XPP6hUjkY5+vf5
0YCjWJM8Q9x+/Eqh2/7SzhXeqmqiA8wao5T7cMtaeA3f5HIW7MljjdWsapiKPfAo
74ksROMWO/oUEMhxxcEvgB6ldzWeJxqJcji3UUkCgYByVRXoaWL4ueQXQ64p59cV
oGw9ilnQ8c0SRtAMHao0VcFZXcQMZHIuzdv5UGWtvfq3tYQlMBdMvI1ryjf/YnvZ
oKMsy2uYpBrXUFDUSLGLQbz+WAZYq3QLzhJhbn9jVjunlywAesB0posNOiIr7MFh
+73ePTZsptlTXyKn7gYoAQKBgF4wiy6xFbg5ctND2mK4ezA683Yh099NzYm06pzI
nscjVVXCz47/80Hxv279UO0KG3taCYimp6AHwiZCIJGVtk10Ajo89XQipXUtD8JI
RvryP0DBiqqIX8eCea2Z8MLd6hldNBGlcplJ9jcoghN3xDxrF9j5jszAwhTvW9gx
AUspAoGAcZYJpQo/vI+uemCXp9O91ASfu8Mxbf4ZkFnmWL33XVYQP8SBSXrIwlnK
8mahjSU4r4sWA+SZ0TSuJhdELqnRO/zRPScn1Jnq9xlAErnzbHVDyL65A5tR6EWZ
1QjvTrDZK/7sToQ3sDzb3z7tj3kGJxSzu9WK+ScvE9zZ9NY18Kk=
-----END RSA PRIVATE KEY-----
```

> Tutoriel vidéo : https://www.youtube.com/watch?v=7CZde1a7rq0

### 4. Activer les GitHub Actions

Dans l'onglet **Actions** de votre Repository Github, cliquez sur le bouton vert
« I understand my workflows, go ahead and enable them ».

### 5. Personnaliser le workflow avec votre prénom

Ouvrez le fichier [`.github/workflows/CICD.yml`](.github/workflows/CICD.yml).

Remplacez `boris` par votre prénom **sans accent et sans espace** aux deux
endroits suivants :

- **Ligne 10** — nom du fichier WAR généré :
  ```yaml
  jar cvf boris.war *
  ```
- **Ligne 18** — fichier WAR copié vers le serveur :
  ```yaml
  source: "boris.war"
  ```

Validez (boutton Commit) vos changements. Le push déclenche automatiquement le
déploiement — vous pouvez suivre son avancement dans l'onglet **Actions**.

### 6. Accéder à votre application

Une fois le déploiement terminé (icône verte dans l'onglet Actions), votre
application est accessible à l'adresse :

```
http://ec2-35-180-71-137.eu-west-3.compute.amazonaws.com/<votre_prénom>
```

### 7. Réaliser les exercices

Sur la page d'accueil de votre application en ligne, vous trouverez la liste des
exercices à réaliser :

- Les objets (`lesobjets.jsp`) — classes, attributs, méthodes, encapsulation
- Les constructeurs (`lesconstructeurs.jsp`) — constructeur par défaut, surcharge,
  chaînage avec `this()`, constructeur de copie
- Le polymorphisme (`lepolymorphisme.jsp`) — héritage, redéfinition de méthodes,
  classes abstraites, interfaces, `instanceof`

Modifiez les fichiers `xxxx.jsp` directement dans votre dépôt forké. Chaque `Commit`
redéploie automatiquement votre application sur le serveur en ligne.

## Comment fonctionne le déploiement ?

À chaque `Commit` sur votre dépôt :

1. GitHub Actions récupère votre code.
2. Tous les fichiers sont empaquetés dans un `<prénom>.war`.
3. Ce WAR est copié par SCP dans `/opt/tomcat/webapps/` sur le serveur EC2.
4. Tomcat détecte le nouveau WAR et déploie automatiquement l'application
   sous le contexte `/<prénom>`.
