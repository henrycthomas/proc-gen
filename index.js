var inquirer = require('inquirer');

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