
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
            console.log(err)
            
        throw err;
           
        };
        
        
        console.log("1 record inserted");
    });
    res.send(req.body)
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
            console.log(err)
            
        throw err;
           
        };    
        console.log("1 record inserted");
    });
    res.send(req.body)
})



app.listen(port, () => console.log(`Example app listening on port ${port}!`))