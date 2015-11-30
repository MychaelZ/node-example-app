import { Router } from 'express';
import { retrieveBook, createBook, checkOutBook, deleteBook } from './controllers';

var router = Router();

router.get('/', retrieveBook);

router.post('/', createBook);

router.put('/', checkOutBook);

router.delete('/', deleteBook);

module.exports = router;
