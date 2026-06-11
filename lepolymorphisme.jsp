<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor=white>
<h1>Exercices sur le polymorphisme</h1>
<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien">
    <p>Saisir le nom d'un chat : <input type="text" name="chat">
    <p><input type="submit" value="Faire crier les animaux">
</form>

<%!
    class Animal {
        String nom;
        public Animal(String nom) { this.nom = nom; }
        public String crier() { return "..."; }
        public String toString() { return "Animal nommé " + nom; }
    }

    class Chien extends Animal implements Affichable {
        public Chien(String nom) { super(nom); }
        public String crier() { return "Wouf wouf !"; }
        public String toString() { return "Chien nommé " + nom; }
        public String afficher() { return toString() + " - " + crier(); }
    }

    class Chat extends Animal implements Affichable {
        public Chat(String nom) { super(nom); }
        public String crier() { return "Miaou !"; }
        public String toString() { return "Chat nommé " + nom; }
        public String afficher() { return toString() + " - " + crier(); }
    }

    // Exercice 4 : Oiseau
    class Oiseau extends Animal {
        public Oiseau(String nom) { super(nom); }
        public String crier() { return "Cui cui !"; }
        public String toString() { return "Oiseau nommé " + nom; }
    }

    // Exercice 2 : classe abstraite Forme
    abstract class Forme {
        abstract double aire();
    }

    class Cercle extends Forme {
        double rayon;
        public Cercle(double rayon) { this.rayon = rayon; }
        public double aire() { return Math.PI * rayon * rayon; }
    }

    class Carre extends Forme {
        double cote;
        public Carre(double cote) { this.cote = cote; }
        public double aire() { return cote * cote; }
    }

    // Exercice 3 : interface Affichable
    interface Affichable {
        String afficher();
    }
%>

<% String chien = request.getParameter("chien"); %>
<% String chat = request.getParameter("chat"); %>
<% if (chien != null && chat != null && !chien.isEmpty() && !chat.isEmpty()) { %>

    <%-- Exercice 4 : tableau avec Oiseau ajouté --%>
    <% Animal[] animaux = { new Chien(chien), new Chat(chat), new Oiseau("Tweety") }; %>
    <p>Démonstration du polymorphisme :</p>
    <% for (Animal a : animaux) { %>
        <p><%= a.nom %> dit : <%= a.crier() %></p>
    <% } %>

    <h2>Exercice 1 : Redéfinir toString()</h2>
    <% for (Animal a : animaux) { %>
        <p><%= a.toString() %></p>
    <% } %>

    <h2>Exercice 2 : La classe abstraite Forme</h2>
    <%
        Forme[] formes = { new Cercle(5), new Carre(4) };
    %>
    <% for (Forme f : formes) { %>
        <p>Aire : <%= String.format("%.2f", f.aire()) %></p>
    <% } %>

    <h2>Exercice 3 : L'interface Affichable</h2>
    <%
        Affichable[] affichables = { new Chien(chien), new Chat(chat) };
    %>
    <% for (Affichable af : affichables) { %>
        <p><%= af.afficher() %></p>
    <% } %>

    <h2>Exercice 4 : Ajouter un Oiseau</h2>
    <p>L'Oiseau "Tweety" a été ajouté au tableau sans modifier la boucle d'affichage.</p>

    <h2>Exercice 5 : L'opérateur instanceof</h2>
    <% for (Animal a : animaux) { %>
        <%
            String type;
            if (a instanceof Chien) type = "C'est un chien";
            else if (a instanceof Chat) type = "C'est un chat";
            else type = "Autre animal";
        %>
        <p><%= a.nom %> : <%= type %></p>
    <% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
