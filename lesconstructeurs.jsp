<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <span>Exercices Java POO</span>
    <nav>
        <a href="index.html">Sommaire</a>
        <a href="lesobjets.jsp">Les objets</a>
        <a href="lesconstructeurs.jsp">Les constructeurs</a>
        <a href="lepolymorphisme.jsp">Le polymorphisme</a>
    </nav>
</header>
<div class="container">

<h1>Exercices sur les constructeurs</h1>

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

    class Etudiant {
        String nom;
        double note;

        public Etudiant() {
            this("Anonyme", 10);
        }
        public Etudiant(String nom) {
            this(nom, 10);
        }
        public Etudiant(String nom, double note) {
            this.nom = nom;
            this.note = note;
        }
        public Etudiant(Etudiant autre) {
            this.nom = autre.nom;
            this.note = autre.note;
        }
    }

    class Produit {
        double prix;
        public Produit(double prix) {
            this.prix = (prix < 0) ? 0 : prix;
        }
    }
%>

<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre"></p>
    <p>Saisir un auteur : <input type="text" name="auteur"></p>
    <p><input type="submit" value="Créer les livres"></p>
</form>

<% String titre = request.getParameter("titre"); %>
<% String auteur = request.getParameter("auteur"); %>
<% if (titre != null && auteur != null) { %>

    <% Livre livreVide = new Livre(); %>
    <% Livre livrePlein = new Livre(titre, auteur); %>
    <p>Livre par défaut - Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>
    <p>Livre saisi - Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>

    <h2>Exercice 1 : Le constructeur par défaut</h2>
    <% Etudiant e1 = new Etudiant(); %>
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
    <p>Le constructeur sans paramètre appelle <code>this("Anonyme", 10)</code>.</p>

    <h2>Exercice 4 : Le constructeur de copie</h2>
    <%
        Etudiant original = new Etudiant("Marie", 15);
        Etudiant copie = new Etudiant(original);
    %>
    <p>Original - Nom : <%= original.nom %>, Note : <%= original.note %></p>
    <p>Copie - Nom : <%= copie.nom %>, Note : <%= copie.note %></p>

    <h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
    <% Produit p = new Produit(-50); %>
    <p>Produit créé à -50€, prix réel : <%= p.prix %> €</p>

<% } %>

</div>
</body>
</html>
