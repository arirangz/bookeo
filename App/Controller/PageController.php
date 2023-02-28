<?php

namespace App\Controller;

class PageController extends Controller
{
    public function route(): void
    {
        try {
            if (isset($_GET['action'])) {
                switch ($_GET['action']) {
                    case 'about':
                        //On appelle la méthode about()
                        $this->about();
                        break;
                    case 'home':
                        //charger controleur home
                        $this->home();
                        break;
                    default:
                        throw new \Exception("Cette action n'existe pas : ".$_GET['action']);
                        break;
                }
            } else {
                throw new \Exception("Aucune action détectée");
            }
        } catch(\Exception $e) {
            $this->render('errors/default', [
                'error' => $e->getMessage()
            ]);
        }

    }

    /*
    Exemple d'appel depuis l'url
        ?controller=page&action=about
    */
    protected function about()
    {
        /* On passe en premier paramètre la page à charger
            et en deuxième un tableau associatif de paramètres
        */
        $this->render('page/about', [
            'test' => 'abc',
            'test2' => 'abc2',
        ]);
    }

    /*
    Exemple d'appel depuis l'url
        ?controller=page&action=home
    */
    protected function home()
    {
        $this->render('page/home', [
        ]);

    }

}