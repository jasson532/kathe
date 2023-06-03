const express = require('express');
const app = express();
const cors = require('cors');
const port = 3010;

app.use(express.json());
app.use(cors());

const connection = require('./db/connection.js');

app.listen(port, () => {
  console.log(`Servidor Node.js escuchando en http://localhost:${port}`);
});

app.get('/estudiantes', (req, res) => {
	connection.query('SELECT * FROM estudiante', (error, results) => {
		if (error) {
			console.error('Error al obtener los usuarios:', error);
			res.status(500).json({ error: 'Error de servidor' });
			return;
		}
		res.json(results);
	});
});

app.post('/insertar-estudiante', (req, res) => {
	const { codigo, identificacion, nombre, apellido, fechanato } = req.body;
	connection.query(`INSERT INTO estudiante (codigo, identificacion, nombre, apellido, fechanato)
		VALUES ('${codigo}', '${identificacion}', '${nombre}', '${apellido}', '${fechanato}')`, (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Estudiante registrado exitosamente' });
		});
});

app.post('/editar-estudiante', (req, res) => {
	const { codigo, identificacion, nombre, apellido, fechanato } = req.body;
	connection.query('UPDATE estudiante SET identificacion = ?, nombre = ?, apellido = ?, fechanato = ? WHERE codigo = ?',
		[identificacion, nombre, apellido, fechanato, codigo], (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Estudiante Actualizado exitosamente' });
		});
});

app.post('/eliminar-estudiante', (req, res) => {
	const { codigo } = req.body;
	connection.query('DELETE FROM estudiante WHERE codigo = ?',
		[codigo], (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Estudiante Eliminado exitosamente' });
		});
});


// ******** asignaturas ***********

app.get('/asignaturas', (req, res) => {
	connection.query('SELECT * FROM asignatura', (error, results) => {
		if (error) {
			console.error('Error al obtener las asignaturas:', error);
			res.status(500).json({ error: 'Error de servidor' });
			return;
		}
		res.json(results);
	});
});


app.post('/insertar-asignatura', (req, res) => {
	const { nombre } = req.body;
	connection.query(`INSERT INTO asignatura (nombre)
		VALUES ('${nombre}')`, (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Asignatura registrada exitosamente' });
		});
});

app.post('/editar-asignatura', (req, res) => {
	const { nombre, id } = req.body;
	connection.query('UPDATE asignatura SET nombre = ? WHERE id = ?',
		[nombre, id], (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Asignatura Actualizada exitosamente' });
		});
});

app.post('/eliminar-asignatura', (req, res) => {
	const { id } = req.body;
	connection.query('DELETE FROM asignatura WHERE id = ?',
		[id], (error) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.status(200).json({ mensaje: 'Asignatura Eliminada exitosamente' });
		});
});

// ******** NOTAS *********
// aqui traemos todas las notas de una materia para un estudiante 
app.post('/notas', (req, res) => {
	const { student, subject } = req.body;
	connection.query('SELECT T1.codigo, T1.nombre, T1.apellido, T1.identificacion, T2.id, T2.nota, T3.nombre AS asignatura FROM estudiante T1 JOIN notas T2 ON T1.codigo = T2.estudiante JOIN asignatura T3 ON T2.asignatura = T3.id WHERE T1.codigo = ? AND T2.asignatura = ?',
		[student, subject], (error, results) => {
			if (error) {
				res.status(500).json({ error: error });
				return;
			}
			res.json(results);
		});
});