#!/bin/bash

#:::::::::::::::::::ousmane fall/ linux pour l'embarqué::::::::::::::::::::::::
#:::::::::::::::::::ing2 systeme embarqué et génie biomedical::::::::::::::::::
#:::::::::::::::::::sup galilée/université sorbonne paris nord:::::::::::::::::

menu()     # fonction permettant d'afficher le menu
{
    echo ":::::::::::::: calculatrice bash::::::::::::::::::::::::"
    echo "::::::::::::::    version 1.0 ::::::::::::::::::::::::::"
    echo "choisir l'operation à effectuer"
    echo "1. addition"
    echo "2. soustraction"                                         
    echo "3. multiplication"
    echo "4. division"
    echo "5. tableau trigonometrique"
    echo "6. equation du second degres"
    echo "7. quitter"
}

calculatrice()    # la fonction calculatrice contient tous les operations basiques et appels les fonctions
                  # trigonometrique et equation_du_second degrés
{
menu 
read choix
if test $choix -eq 7 ; then    # si l'utilisateur appuie sur 7, c'est-à-dire quitter la calculatrice
     exit 0
    elif test $choix -eq 5 ; then
    tableau_trigonometrique       # on appel ici la fonction permettant d'afficher le tableau trigonometrique
    calculatrice
    elif test $choix -eq 6 ; then
    equation_second_degres     # on appel ici la fonction permettant de résoudre une équation du second degrés 
    calculatrice             
fi


read -p "saisir la premiere valeur " a # on affiche un message sur l'écran en meme temps on met la valeur dans a 
read -p "saisir la deuxieme valeur " b # on affiche un message sur l'écran en meme temps on met la valeur dans b

somme=$((a+b))          # on faiit la somme de deux entiers(il faut mettre le symbole dollard) 
difference=$((a-b))     # on faiit la difference de deux entiers(il faut mettre le symbole dollard) 
produit=$((a*b))        # on faiit le produit de deux entiers(il faut mettre le symbole dollard) 
division=$((a/b))       # on faiit la division de deux entiers(il faut mettre le symbole dollard) 


if test $choix -eq 1 ; then
        echo "$a+$b=$somme"      #  on affiche le résultat contenu dans somme( ex: 2+3=5) 
    elif test $choix -eq 2 ; then
        echo "$a-$b=$difference"  # de meme pour les autres operations 
    elif test $choix -eq 3 ; then
        echo "$a x $b = $produit"
    elif test $choix -eq 4 ; then
        if test $b -eq 0 ; then    # on teste si le dénominateur est nul ou pas 
             echo "on ne peut pas diviser par zero"  # si oui, la division ne peut pas diviser par zero 
        fi
             echo "$a:$b=$division"
    
fi
}


tableau_trigonometrique() # fonction contenant un tableau de caratere permettant d'afficher le tableau trigonometrique
{
declare -a angle=("0 " "|" "30  "  "|" "45  "  "|" "60  "   "|" "90 " "|")                   
declare -a sinus=("0 " "|" "1/2 "  "|" "1/v2"  "|" "v3/2"   "|" "1  " "|")
declare -a cosin=("1 " "|" "v3/2"  "|" "1/v2"  "|" "1/2 "   "|" "0  " "|")
declare -a tange=("0 " "|" "1/v3"  "|" "1   "  "|" "v3  "   "|" "inf" "|")
echo  "angle| ${angle[@]} "      # 
echo  "sin  | ${sinus[@]} "     #  le symbole @ nous permet d'afficher tout le contenu d'un tableau 
echo  "cos  | ${cosin[@]} "    #    
echo  "tan  | ${tange[@]} "   # 
}
equation_second_degres() # fonction permettant la résolution d'une equation du second degrés 
{
   echo ":::::::::::::resolution d'une equation du second degres::::::::::::::"
   echo ":::::::::::::             ax²+bx+c=0                     ::::::::::::::"
   read -p "saisir la valeur de a: " a
   read -p "saisir la valeur de b: " b     #   on demande à l'utilisateur de saisir les constantes de l'equation 
   read -p "saisir la valeur de c: " c
   delta=$((b*b-4*a*c))       #    on calcul le discriminant delta 
   echo "delta = $delta"      #    on affiche sa valeur 
   if test $delta -lt 0 ; then   # s'il est négatif 
       echo "delta < 0 donc l'equation n'a pas de solution reelle"  # l'equation n'admet pas de solution réelle 
       elif test $delta -eq 0 ; then # s'il est égale à 0 
       xo=$((-b/2*a))     # il existe une solution double notée xo 
       echo "delta = 0 donc xo = $xo" 
       elif test $delta -ge 0 ; then # s'il est positif 
           g=$((2*a))
       echo "delta > 0 donc x1 = (-$b-v$delta)/$g et x2 = (-$b+v$delta)/$g"  # il existe deux solutions  
    fi
   
}

while((1))  #  on met une boucle infinie pour afficher le menu à chaque fois
do
calculatrice
done














