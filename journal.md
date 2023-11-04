# Journal de bord du projet encadré
# 02/10/2023 J'ai cloné le dépôt git sur ma machine.
# 02/10/2023 J'ai mis à jour mes fichiers locaux depuis le dépôt. Je vais ensuite envoyer cette modification sur le dépôt.

# Problem résolu : 16/10/2023 Je sais pas comment utiliser chmod pour convertir un txt en exécutable. 

# 04/11/2023 

1. Problème avec ces codes : 

curl -s https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal | grep -Eo 'charset="[^"]"'

J'essaie de chercher l'encodage du site qui s'écrit par exemple comme : charset="UFT-8". J'essaie 
d'utiliser l'expression régulière [^"] pour dire qu'on cherche n'importe quel string qui n'est pas le 
double guillemet et pour éviter le principe de gourmandise. Mais cela donne un résultat nul.

Voici l'explication du chatgpt que je ne comprends pas trop :

The reason your grep command is not working as expected is that it's not matching the 
character encoding specification correctly. The pattern 'charset="[^"]"' is trying to match charset=" 
followed by any characters that are not double quotes and then ending with a double quote. 
However, it may not accurately capture the character encoding because character encodings are 
typically specified with additional information in the HTML <meta> tag.

Character encodings are usually specified as charset="..." within the <meta> tag, 
but the specification can include other attributes, such as content or http-equiv.

Et ça ne répond pas à ma question de savoir pourquoi [^"] ne fonctionne pas.

Enfin, j'ai trouvé une solution facile qui est d'écrire ça :

curl -s https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal | grep -Eo 'charset=".*"'

Avec ces codes, je prends n'importe quel string contenu entre les doubles guillemets. Mais cela
n'évite pas le principe de gourmandise et pourrait prendre un string bcp plus long. J'aimerais
donc bien savoir pourquoi [^"] ne fonctionne pas et comment résoudre le problem.