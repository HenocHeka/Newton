# celle-ci est la fonction elle
def fonction(x):
    return -x ** 3 + 3 * x + 1  # ex: -x^3+3x+1 cf. Note du cours

# cellc-ci est la fonction derivée première
def fonction_derivee(x):
    return -3 * (x ** 2) + 3  # ex: -3^2+3 cf. Note du cours

# celle-ci est la fonction qui calcule les differentes racines approchées
# Il prend deux paramètres le premier est la valeur par defaut de la racine x0
# et le deuxieme est epsilon ou la précision
def Newton_Raphson(x0, eps):

    i = 0  # le compteur qui nous fera connaitre le nombre d'iteration
    x = x0  # on initialise la premiere racine par sa valeur par defaut introduit par l'utilisateur
    if (fonction_derivee(x) == 0):
        return print('la fonction derivée n\'est pas être nulle ')
    xn = x - fonction(x0) / fonction_derivee(x0)  # on calcule la premiere iteration soit x1

    # NB: xn :  etant la racine suivante et x : etant la racine précédente, le critère d'arret est : | xn - x | < Epsilon
    # Pour arriver à avoir le test d'arret, ont doit avoir de valeur à verifier par rapport a Epsilon ce qui est á la ligne 14 et 15
    # N'oublions que ces valeurs sont en valeurs absolues c-a-d strictement positif, c'est pourquoi je les ai multiplié tous deux par -1 cfr. ligne 21

    while (xn * -1) - (x * -1) > eps: # on s'arréte quand (xn * -1) - (x * -1) inferieurs à Epsilon,donc la derniere racine est la racine qui annule la fonction
        i = i + 1
        if (fonction_derivee(x)==0):  # je verifie si le denomiteur est nul, si oui on arrète par break
            # car on aura une opération dans l'infini et dans ce cas notre racine sera xn(ligne 15) sinon on continue les iterations
            break
        x = xn                                      #  x garde la valeur de xn précédente
        xn = x - fonction(x) / fonction_derivee(x)  # on calcule la racine suivante en faisant appel aux fontions

        print(i,x)

    return print(i+1,xn,' \n la valeur approchée est : ', xn)

x0 = int(input('Entrer la valeur de x0 : '))
eps = float(input('Entrer la precision : '))
Newton_Raphson(x0, eps) # On appelle la fonction apres avoir réçu les differentes valeurs venant de l'utilisateur

# res = fonction(-0.3473)
#
# print(res)
