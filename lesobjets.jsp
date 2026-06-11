<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les objets</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <span>Les objets</span>
    <a href="index.html">Retour au sommaire</a>
</header>
<div class="container">

<h1>Exercices sur les objets</h1>

<%!
    class Personne {
        private String nom;
        private int age;

        public String getNom() { return nom; }
        public void setNom(String nom) { this.nom = nom; }
        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }

        public String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans";
        }
    }
%>
<%!
    class Voiture {
        String marque;
        String modele;
        int annee;
    }
%>
<%!
    class Rectangle {
        double longueur;
        double largeur;
        double calculerSurface() { return longueur * largeur; }
    }
%>
<%!
    class CompteBancaire {
        double solde;
        void deposer(double montant) { solde += montant; }
        void retirer(double montant) { solde -= montant; }
    }
%>

<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom"></p>
    <p>Saisir un âge : <input type="text" name="age"></p>
    <p><input type="submit" value="Créer la personne"></p>
</form>

<% String nom = request.getParameter("nom"); %>
<% String age = request.getParameter("age"); %>
<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <% Personne p = new Personne(); %>
    <% p.setNom(nom); %>
    <% p.setAge(Integer.parseInt(age)); %>
    <p>Objet Personne créé !</p>
    <p>Nom : <%= p.getNom() %></p>
    <p>Age : <%= p.getAge() %> ans</p>

    <h2>Exercice 1 : La classe Voiture</h2>
    <%
        Voiture v = new Voiture();
        v.marque = "Renault";
        v.modele = "Clio";
        v.annee = 2020;
    %>
    <p>Marque : <%= v.marque %>, Modèle : <%= v.modele %>, Année : <%= v.annee %></p>

    <h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
    <p>Résultat de seDecrire() : <%= p.seDecrire() %></p>

    <h2>Exercice 3 : La classe Rectangle</h2>
    <%
        Rectangle r = new Rectangle();
        r.longueur = 5;
        r.largeur = 3;
    %>
    <p>Surface du rectangle (5x3) : <%= r.calculerSurface() %></p>

    <h2>Exercice 4 : Le compte bancaire</h2>
    <%
        CompteBancaire compte = new CompteBancaire();
        compte.deposer(100);
        compte.retirer(30);
    %>
    <p>Solde après dépôt de 100€ et retrait de 30€ : <%= compte.solde %> €</p>

    <h2>Exercice 5 : L'encapsulation</h2>
    <p>La classe Personne utilise des attributs privés avec getters/setters.</p>

<% } %>

</div>
</body>
</html>
