<?php

namespace App\Repository;

use App\Entity\Book;

class BookRepository
{
    public function findOneById(int $id)
    {
        // Appel bdd
        $book = ['id' => 1, 'title' => 'titre test', 'description'=> 'description test'];

        $bookEntity = new Book();
        $bookEntity->setId($book['id']);
        $bookEntity->setTitle($book['title']);
        $bookEntity->setDescription($book['description']);

        /*
        foreach ($book as $key => $value) {
            $bookEntity->{'set'}($value);
        }
        */

        return $bookEntity;

    }
}