const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 'vagrant',
  host: 'localhost',
  database: 'bootcampx',
});

const queryString = `
SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
FROM students JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;
const cohort = process.argv[2];
const limit = process.argv[3];

const values = [`%${cohort}%`, limit];
pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`
      );
    });
  })
  .catch((err) => {
    console.log('query error: ', err.stack);
  });
