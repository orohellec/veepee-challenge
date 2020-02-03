# Veepee Challenge / Interface de management de produits

## Introduction

Voici ma solution concernant votre test technique

Ce n’est pas parfait et si c’était une vrai application je ne l’aurais pas poussé en production à ce stade. Je n’ai pas tout testé, il y a des détails à revoir, des tests à rajouter, une interface administrateur qui pourrait être plus intuitive… C’était très intéressant, j’ai appris beaucoup de choses et j’aurais aimé en faire davantage mais j’y ai déjà consacré beaucoup de temps.

Je n’ai pas commit au fur à mesure ni compter le nombres d’heures qu’il m’a fallu pour parvenir à ce résultat. Si je devais faire une estimation je dirais que j’y ai bien passé 4 jours.

Les principales difficultés que j’ai rencontré sont:

* Trouver la meilleure solution pour ajouter des attributs flexibles au produit. Au début j’ai pensé utilisé MongoDB avec Mongoid. J’ai commencé à creuser la piste et puis j’ai relu l’énoncé et j’ai vu que je devais utiliser postgresql (my bad !).

* Apprendre les rudiments de Vuejs. Ce n’était pas si compliqué, mais j’ai du prendre le temps d’apprendre les notions fondamentales, me familiariser avec la syntaxe ainsi que les différentes manières de l’intégrer à un projet Ruby on Rails. C’est la première fois que je l’utilise et même si je n’ai utilisé qu’une infime partie de ses fonctionnalités j’ai pris plaisir à l’utiliser :) 

* Active Admin est super quand on reste sur des opérations classiques mais devient un peu plus laborieux dès lors que l’on sort des sentiers battus.

* Jongler avec les nested attributes, (stocker des données dans un champ text (serialized, Hash), formstatic et des partials n’aura pas été de tout repos. 

## Part 1

```ruby
require ‘json’

users = User.includes(products: [:prices])

File.open(« ./products.json","w") do |f|
  f.write(
    JSON.pretty_generate(users.as_json(
      only: [:id, :username],
      include: {
        products: {
          only: [:id, :name, :size],
          include: {
            prices: {
              only: [:currency, :value]
            }
          }
        }
      })
    )
  )
end
```

## Part 2

### Lien de L’application en production

https://veepee-challenge.herokuapp.com/

### Technologies

* Ruby on Rails
* Posgresql
* Active admin
* Heroku
* Vue.js

### Visiteur

Tableau listant les différents produits avec tri par colonne ainsi que pagination géré par Vuejs.

### Administrateur

Utilisation d’active admin pour gérer la création, édition, suppression de produits…

### Produit information

* Un produit appartient à un utilisateur et à un type de produit
* Tous les produits doivent impérativement avoir un nom et un prix
* Un produit a également des attributs flexibles par l’intermédiaire du type auquel il appartient (model: ProductType)
* Un type de produits à un ou plusieurs champ (model: ProductField)
* Les attributs flexibles du produit seront stockés dans la colonne Properties sous forme de Hash

### Cycle de création de produit

Pour créer un nouveau produit il suffit de se rendre sur la page products et de cliquer sur New product. Il faut alors choisir la catégorie auquel appartient ce produit. Si ce produit ne rentre dans aucune catégorie existante on peut créer un nouveau type de produit à la page Product Type.
Une foi la catégorie choisi on a plus qu’a rentrer le nom et le prix du produit ainsi que des propriétés propres au type de produit auquel il appartient.

### Type de produits (ProductType)

Un type de produit a un nom et plusieurs champs (ProductField) associés

### Types de champs (ProductField)

J’ai créé 2 types de champs (text_field et check_box) que l’on peut retrouver dans des partials. Si l’on veut ajouter d’autres types de champs il suffit d’aller dans ./app/admin/product_types.rb et de rajouter un nom de type de champ. Il faut également créé une partial associée dans ./app/views/admin/products


## Part 3

1. Un problème N + 1 est un problème de performance SQL basique. Cela consiste à exécuter une requête pour obtenir la relation parente puis récupérer les enfants un à un (N enfants, N requêtes). Un des moyen d’empêcher ça en Ruby consiste à utiliser la méthode includes. (Ex: User.includes(:products)). Cela permet de passer de N + 1 requêtes à seulement 2 requêtes. Cela utilise néanmoins davantage de mémoire car les produits sont stockés en cache.
2. Je n’ai jamais fait face à ce genre de ce problème jusqu’à présent mais je commencerai par approfondir mes connaissances sur les indexes.
