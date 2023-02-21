<?php

interface IVehicule
{
    public function accelerer();

    public function freiner();
}

trait Moteur
{
    function demarrer()
    {
        echo 'demarrage du moteur';
    }
    function arreter()
    {
        echo 'arret du moteur';
    }
}

trait Klaxonne
{
    function klaxonner()
    {
        echo 'klaxonne!!';
    }

}

class Vehicule implements IVehicule
{
    protected string $marque;
    protected float $vitesse_max;

    public function __construct(string $marque, float $vitesse_max)
    {
        $this->marque = $marque;
        $this->setVitesseMax($vitesse_max);
    }

    /**
     * Get the value of vitesse_max
     */
    public function getVitesseMax(): float
    {
        return $this->vitesse_max;
    }

    /**
     * Set the value of vitesse_max
     */
    public function setVitesseMax(float $vitesse_max): self
    {
        if ($vitesse_max > 0) {
            $this->vitesse_max = $vitesse_max;
        }

        return $this;
    }
    

    public function accelerer():void
    {
        echo 'La voiture accélère';
    }

    public function freiner():void
    {
        echo 'La voiture freine';
    }

}

class Voiture extends Vehicule 
{
    use Moteur, Klaxonne;

    public function klaxonner()
    {
        echo 'klaxonne2!!';
    }

    protected int $nombre_roues;
}

class Bateau extends Vehicule 
{
    protected int $nombre_cabines;


}


$voiture1 = new Voiture('Toyota', 275);

echo $voiture1->getVitesseMax();

$voiture2 = new Voiture('Toyota', 300);

echo $voiture2->getVitesseMax();
