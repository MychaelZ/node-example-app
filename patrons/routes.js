import { Router } from 'express';
import { findPatron, createPatron, editPatron, deletePatron } from './controllers';

var router = Router();

router.get('/:name', findPatron);

router.post('/', createPatron);

router.put('/', editPatron);

router.delete('/', deletePatron);

module.exports = router;
