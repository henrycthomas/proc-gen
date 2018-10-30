var inquirer = require('inquirer');
const fs = require('fs');
const path = require('path');
const moment = require('moment');

function getDirectories (srcpath) {
  return fs.readdirSync(srcpath)
    .filter(file => fs.lstatSync(path.join(srcpath, file)).isDirectory())
}


function start(){
    inquirer.prompt({
        type: 'list',
        name: 'action',
        message: 'What should we do?',
        choices: [
            {
                name: 'Generate some procedures',
                value: 'generate'
            },
            {
                name: 'Apply a previous generation',
                value: 'apply'
            }
        ],
        default: 'generate'
    }).then(function(answers){
        switch(answers.action){
            case 'generate':
                generate();
                break;
            case 'apply':
                apply();
                break;
        }
    });
}

function apply(){
    inquirer.prompt({
        type: 'list',
        name: 'table',
        message: 'We have generations for the following tables. Which tables generations would you like to apply?',
        choices: getDirectories('./procs')
    }).then(function(answers){
        var generations = getDirectories(`./procs/${answers.table}`)
        .map(g => {
            var notesPath = `./procs/${answers.table}/${g}/notes.txt`;
            return {

            };
        });

    });
}

function generate(){
    inquirer.prompt({
        type: 'list',
        name: 'dbType',
        message: 'Which DB type are we generating for?',
        choices: [
            'mysql'
        ],
        default: 'mysql'
    }).then(function(answers){
        var db = require('./databases/' + answers.dbType + '.js');


        db.setup().then(function(){
            console.log('setup complete');
            db.generate().then(() => {
                console.log('generate complete');
                db.teardown();
            }, (err) => {
                console.log('generate error');
                db.teardown(err);
            });;
        }, function(err){
            console.log('setup error');
            db.teardown(err);
        });
    });
}

start();


