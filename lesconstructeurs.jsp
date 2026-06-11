<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les constructeurs</h1>
<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre">
    <p>Saisir un auteur : <input type="text" name="auteur">
    <p><input type="submit" value="Créer les livres">
</form>

<%!
    class Livre {
        String titre;
        String auteur;
        public Livre() {
            this.titre = "Titre inconnu";
            this.auteur = "Auteur inconnu";
        }
        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }
    }

    // Exercices 1, 2, 3, 4 : classe Etudiant avec tous les constructeurs
    class Etudiant {
        String nom;
        double note;

        // Exercice 3 : constructeur par défaut chaîné avec this()
        public Etudiant() {
            this("Anonyme", 10);
        }

        // Exercice 2 : constructeur avec nom uniquement
        public Etudiant(String nom) {
            this(nom, 10);
        }

        // Exercice 2 : constructeur avec nom et note
        public Etudiant(String nom, double note) {
            this.nom = nom;
            this.note = note;
        }

        // Exercice 4 : constructeur de copie
        public Etudiant(Etudiant autre) {
            this.nom = autre.nom;
            this.note = autre.note;
        }
    }

    // Exercice 5 : classe Produit avec validation du prix
    class Produit {
        double prix;

        public Produit(double prix) {
            this.prix = (prix < 0) ? 0 : prix;
        }
    }
%>

<% String titre = request.getParameter("titre"); %>
<% String auteur = request.getParameter("auteur"); %>
<% if (titre != null && auteur != null) { %>

    <% Livre livreVide = new Livre(); %>
    <% Livre livrePlein = new Livre(titre, auteur); %>
    <p>Livre créé via le constructeur par défaut :</p>
    <p>Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>
    <p>Livre créé via le constructeur avec paramètres :</p>
    <p>Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>

    <h2>Exercice 1 : Le constructeur par défaut</h2>
    <%
        Etudiant e1 = new Etudiant();
    %>
    <p>Etudiant par défaut - Nom : <%= e1.nom %>, Note : <%= e1.note %></p>

    <h2>Exercice 2 : La surcharge de constructeurs</h2>
    <%
        Etudiant eA = new Etudiant();
        Etudiant eB = new Etudiant("Alice");
        Etudiant eC = new Etudiant("Bob", 18);
    %>
    <p>Etudiant 1 (défaut) - Nom : <%= eA.nom %>, Note : <%= eA.note %></p>
    <p>Etudiant 2 (nom seul) - Nom : <%= eB.nom %>, Note : <%= eB.note %></p>
    <p>Etudiant 3 (nom + note) - Nom : <%= eC.nom %>, Note : <%= eC.note %></p>

    <h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
    <p>Le constructeur sans paramètre appelle <code>this("Anonyme", 10)</code> - voir code source.</p>

    <h2>Exercice 4 : Le constructeur de copie</h2>
    <%
        Etudiant original = new Etudiant("Marie", 15);
        Etudiant copie = new Etudiant(original);
    %>
    <p>Original - Nom : <%= original.nom %>, Note : <%= original.note %></p>
    <p>Copie - Nom : <%= copie.nom %>, Note : <%= copie.note %></p>

    <h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
    <%
        Produit p = new Produit(-50);
    %>
    <p>Produit créé à -50€, prix réel : <%= p.prix %> €</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
