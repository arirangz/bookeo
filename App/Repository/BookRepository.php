<?php

namespace App\Repository;

use App\Entity\Book;
use App\Db\Mysql;
use App\Tools\StringTools;

class BookRepository
{
    public function findOneById(int $id)
    {
        // Appel bdd
        $mysql = Mysql::getInstance();
        $pdo = $mysql->getPDO();
        
        $query = $pdo->prepare('SELECT * FROM book WHERE id = :id');
        $query->bindValue(':id', $id, $pdo::PARAM_INT);
        $query->execute();
        $book = $query->fetch($pdo::FETCH_ASSOC);
        $bookEntity = new Book();

        foreach ($book as $key => $value) {
            $bookEntity->{'set'.StringTools::toPascalCase($key)  }($value);
        }

        return $bookEntity;
    }
}