const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 'vagrant',
  host: 'localhost',
  database: 'bootcampx',
});

pool
  .query(
    `
    SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
    FROM teachers
      JOIN assistance_requests ON teachers.id = teacher_id
      JOIN students ON student_id = students.id
      JOIN cohorts ON cohort_id = cohorts.id
    WHERE  cohorts.name = '${process.argv[2]}'
    ORDER BY teachers.name;
`
  )
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  })
  .catch((err) => {
    console.log('query error: ', err.stack);
  });
