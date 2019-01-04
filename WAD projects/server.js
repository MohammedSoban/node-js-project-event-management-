
var mysql = require('mysql');
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const cors = require('cors')
app.use(bodyParser.json());
app.use(cors())
const port = 3000

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'event management',
    port: '3306'
});

connection.connect(function (err) {
    if (!err) {
        console.log("Database is connected");
    } else {
        console.log("Error connecting database", err);
    }
});

app.get('/', (req, res) => res.send('Hello World!'))

app.post('/userSigupForm', (req, res) => {
    let { firstname, lastname, email, dob, address, phone, password } = req.body

    var sql = `INSERT INTO signup (f_name, l_name, dob, Address, email_id, phone_num, password) VALUES ('${firstname}', '${lastname}','${dob}','${address}','${email}', '${phone}', '${password}')`;
    connection.query(sql, (err, result) => {
        if (err) {
            console.log('Errrrrrrrrrrrrrrrrrrrrrrrrrr', err)
            res.status(500).send(JSON.stringify({ error: err, status: 500 }))
        } else {
            console.log("1 record inserted");
            res.status(200).send({ data: req.body, status: 200 })
        }
    });
})

app.post('/vendorSigupForm', (req, res) => {
    let { firstname,
        lastname,
        dob,
        email,
        companyName,
        companyAddress,
        phone,
        password } = req.body

    var sql = `INSERT INTO vendorsignup (f_name, l_name, dob, email_id, company_name, company_address, phone, password) VALUES ('${firstname}', '${lastname}','${dob}','${email}','${companyName}','${companyAddress}','${phone}', '${password}')`;
    connection.query(sql, (err, result) => {
        if (err) {
            console.log('Errrrrrrrrrrrrrrrrrrrrrrrrrr', err)
            res.status(500).send(JSON.stringify({ error: err, status: 500 }))
        } else {
            console.log("1 record inserted");
            res.status(200).send({ data: req.body, status: 200 })
        }
    });
})


app.post('/login', (req, res) => {
    let {
        email_id, 
        password } = req.body

  //  var sql = 'SELECT * FROM customers WHERE address = ' + mysql.escape(adr);
    var sql = 'SELECT * FROM signup WHERE email_id = ' + mysql.escape(email_id) + 'and password= '+ mysql.escape(password) ;
  //  var sql ='SELECT * FROM signup WHERE email_id = ? and password= ?';
    
    connection.query(sql,[email_id][password],(err, result) => {    
        if (err) {
            console.log('Errrrrrrrrrrrrrrrrrrrrrrrrrr', err)
            res.status(500).send(JSON.stringify({ error: err, status: 500 }))
            
    
          }    


       else
       {
                if(result.length>0)
                {
                    console.log("loign success");
                    res.status(200).send({ data: req.body, status: 200 })
                    
                }
                else
                {
                    res.status(204).send({ data: req.body, status: 204 })
                    console.log("email and pass dont match");
                    //res.status(204).send({ data: req.body, status: 204 })
                }
            }

    });
})



app.listen(port, () => console.log(`Example app listening on port ${port}!`))