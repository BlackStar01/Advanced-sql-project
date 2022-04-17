const express = require('express');
const mysql = require('mysql');

const app = express();
const path = require('path');

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'project'
});

db.connect((err) => {
    if(err) {
        console.log(err)
    }
    else
    {
        console.log('Connected...')
    }
})

app.get("/", (req, res) => {
    let sql = 'SELECT * FROM rapport_activite'
    db.query(sql, (err, result) => {
        if(err) console.log(err);
        res.send(result)
    })
})

app.listen('3000', () => {
    console.log("Server run on port 3000");
})