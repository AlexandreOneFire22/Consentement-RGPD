<?php

use App\Modele\Modele_Entreprise;
use App\Modele\Modele_Salarie;
use App\Modele\Modele_Utilisateur;
use App\Vue\Vue_Connexion_Formulaire_client;
use App\Vue\Vue_Mail_Confirme;
use App\Vue\Vue_Mail_ReinitMdp;
use App\Vue\Vue_Menu_Administration;
use App\Vue\Vue_Structure_BasDePage;
use App\Vue\Vue_Structure_Entete;

use PHPMailer\PHPMailer\PHPMailer;
//Ce contrôleur gère le formulaire de connexion pour les visiteurs

$Vue->setEntete(new Vue_Structure_Entete());

switch ($action) {
    case "reinitmdpconfirm":

          //comme un qqc qui manque... je dis ça ! je dis rien !

        $Vue->addToCorps(new Vue_Mail_Confirme());

        break;
    case "reinitmdp":


        $Vue->addToCorps(new Vue_Mail_ReinitMdp());

        break;
    case "Se connecter" :
        if (isset($_REQUEST["compte"]) and isset($_REQUEST["password"])) {
            //Si tous les paramètres du formulaire sont bons

            $utilisateur = Modele_Utilisateur::Utilisateur_Select_ParLogin($_REQUEST["compte"]);

            if ($utilisateur != null) {
                //error_log("utilisateur : " . $utilisateur["idUtilisateur"]);
                if ($utilisateur["desactiver"] == 0) {
                    if ($_REQUEST["password"] == $utilisateur["motDePasse"]) {
                        $_SESSION["idUtilisateur"] = $utilisateur["idUtilisateur"];
                        //error_log("idUtilisateur : " . $_SESSION["idUtilisateur"]);
                        $_SESSION["idCategorie_utilisateur"] = $utilisateur["idCategorie_utilisateur"];
                        echo "idCategorie_utilisateur : " . $_SESSION["idCategorie_utilisateur"];
                        //error_log("idCategorie_utilisateur : " . $_SESSION["idCategorie_utilisateur"]);
                      //  var_dump($utilisateur);
                        if ($utilisateur["aAccepteRGPD"] ==1){
                            switch ($utilisateur["idCategorie_utilisateur"]) {
                                case 1:
                                    $_SESSION["typeConnexionBack"] = "administrateurLogiciel"; //Champ inutile, mais bien pour voir ce qu'il se passe avec des étudiants !
                                    $Vue->setMenu(new Vue_Menu_Administration($_SESSION["typeConnexionBack"]));
                                    break;
                                case 2:
                                    $_SESSION["typeConnexionBack"] = "gestionnaireCatalogue";
                                    $Vue->setMenu(new Vue_Menu_Administration($_SESSION["typeConnexionBack"]));
                                    $Vue->addToCorps(new \App\Vue\Vue_AfficherMessage("Bienvenue " . $_REQUEST["compte"]));
                                    break;
                                case 3:
                                    $_SESSION["typeConnexionBack"] = "entrepriseCliente";
                                    //error_log("idUtilisateur : " . $_SESSION["idUtilisateur"]);
                                    $_SESSION["idEntreprise"] = Modele_Entreprise::Entreprise_Select_Par_IdUtilisateur($_SESSION["idUtilisateur"])["idEntreprise"];
                                    include "./Controleur/Controleur_Gerer_Entreprise.php";
                                    break;
                                case 4:
                                    $_SESSION["typeConnexionBack"] = "salarieEntrepriseCliente";
                                    $_SESSION["idSalarie"] = $utilisateur["idUtilisateur"];
                                    $_SESSION["idEntreprise"] = Modele_Salarie::Salarie_Select_byId($_SESSION["idUtilisateur"])["idEntreprise"];
                                    include "./Controleur/Controleur_Catalogue_client.php";
                                    break;
                                case 5:
                                    $_SESSION["typeConnexionBack"] = "commercialCafe";
                                    $Vue->setMenu(new Vue_Menu_Administration($_SESSION["typeConnexionBack"]));
                                    break;
                            }
                        }else{
                            $Vue->addToCorps(new \App\Vue\Vue_ConsentementRGPD());
                        }

                    } else {//mot de passe pas bon
                        $msgError = "Mot de passe erroné";

                        $Vue->addToCorps(new Vue_Connexion_Formulaire_client($msgError));

                    }
                } else {
                    $msgError = "Compte désactivé";

                    $Vue->addToCorps(new Vue_Connexion_Formulaire_client($msgError));

                }
            } else {
                $msgError = "Identification invalide";

                $Vue->addToCorps(new Vue_Connexion_Formulaire_client($msgError));
            }
        } else {
            $msgError = "Identification incomplete";

            $Vue->addToCorps(new Vue_Connexion_Formulaire_client($msgError));
        }
    break;
    default:

        $Vue->addToCorps(new Vue_Connexion_Formulaire_client());

        break;
}


$Vue->setBasDePage(new Vue_Structure_BasDePage());