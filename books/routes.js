import { Router } from 'express';
import { retrieveBook, createBook, editBook, deleteBook } from './controllers';

var router = Router();

router.get('/', retrieveBook);

router.post('/', createBook);

router.put('/', editBook);

router.delete('/', deleteBook);

module.exports = router;
