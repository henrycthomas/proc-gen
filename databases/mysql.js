var inquirer = require('inquirer');
var mysql = require('mysql');
var os = require('os');
var fs = require('fs');
var mkdirp = require('mkdirp');
var dust = require('dustjs-linkedin');
require('dustjs-helpers');


var settings = {
    host: 'localhost',
    user: 'root',
    password: null,
    db: null,
    tables: [],
    connection: null,
    setupRun: false
}

var templatePaths = [
            {
                name: 'create',
                path: './templates/mysql/create.sql'
            },
            {
                name: 'update',
                path: './templates/mysql/update.sql'
            }
        ];

function loadTemplates(){
    return new Promise((done, error) => {
        
        Promise.all(templatePaths.map(t => {
            return new Promise((done, error) => {
                fs.readFile(t.path, "utf8", (err, data) => {
                    if(err) return error(err);
                    //console.log(data);
                    done(dust.compile(data, t.name));
                })
            });
        })).then((compiledTemplates) => {
            compiledTemplates.forEach(ct => {
                dust.loadSource(ct);
            });
           
            done();
        }, () => {
            console.log("Error loading templates");
            error();
        });
    });
}




exports.test = () => {
    console.log(`this is a mysql test ${settings.user}`);
};

exports.setup = () => {
    return new Promise((done, error) => {
        var questions = [
            {
                type: 'input',
                name: 'host',
                message: 'host?',
                default: settings.host
            },
            {
                type: 'input',
                name: 'user',
                message: 'user?',
                default: settings.user
            },
            {
                type: 'password',
                name: 'password',
                message: 'password?'
            }
        ];
        inquirer.prompt(questions).then(answers => {
            settings.host = answers.host;
            settings.user = answers.user;
            settings.password = answers.password;
            var c = settings.connection = mysql.createConnection({
                host: settings.host,
                user: settings.user,
                password: settings.password,
                database: 'information_schema'
            });

            c.connect();
            c.query('select schema_name from schemata', (err, res, fields) => {
                if(err) return error(err);
                inquirer.prompt({
                    type: 'list',
                    name: 'db',
                    message: 'db?',
                    choices: res.map(r => r.schema_name)
                }).then(answers => {
                    settings.db = answers.db;
                    c.query('select table_name from tables where table_schema = ?', 
                    [settings.db], (err, res, fields) => {
                        if (err) return error(err);
                        inquirer.prompt({
                            type: 'checkbox',
                            name: 'tables',
                            message: 'tables?',
                            choices: res.map(r => r.table_name)
                        }).then(answers => {
                            settings.tables = answers.tables;
                            settings.setupRun = true;
                            loadTemplates().then(done, error);
                        }, error);
                    });
                }, error);
            });
        }, error);
    });
};

function writeOutProc(dir, name, proc){
    return new Promise((done, error) => {
        fs.writeFile(`${dir}/${name}.sql`, proc, (err) => {
            if (err) return error(err);
            done();
        });
    });
}

function generateForTable(tableName){
    return new Promise((done, error) => {
        var c = settings.connection;
        c.query(`describe ${tableName}`, (err, res, fields) => {
            if(err) return error(err);

            console.log(res);
            //identify id fields
            inquirer.prompt({
                type: 'checkbox',
                name: 'idFields',
                message: 'Id field(s)?',
                choices: res.map(f => f.Field)
            }).then((answers) => {
                var fields = {
                    id: [],
                    regular: [],
                    all : [],
                    isAutoIncrement: (chunk, context, bodies, params) => {
                        
                        return context.get(["Extra"]).indexOf('auto_increment') > -1;
                    }
                }
                fields.id = res.filter(f => {
                    return answers.idFields.indexOf(f.Field) > -1;
                });
                fields.regular = res.filter(f => {
                    return answers.idFields.indexOf(f.Field) == -1;
                });

                fields.all = fields.id.concat(fields.regular);

                //console.log("DESCRIPTION");
                //console.log(res);
                var dir = `./procs/${settings.db}/${tableName}`;
                mkdirp(dir, (err) => {
                    if (err) return error(err);
                    Promise.all(
                        templatePaths.map(tp => getStoredProc(tableName, tp.name, fields))
                    ).then(procs => {
                        Promise.all(
                            procs.map((proc, i) => writeOutProc(dir, templatePaths[i].name, proc))
                        ).then(done, error);
                    }, () => {
                        error();
                    });
                });


            }, error);





            
        });
    });
};

function getStoredProc(tableName, templateName, fields){
    return new Promise((done, error) => {
        console.log('generating fields...');
        dust.render(templateName, {
            user: settings.user,
            host: settings.host,
            tableName: tableName,
            fields: fields
        }, (err, out) => {
            if(err) return error();
            done(out);
        });
    });
}

exports.generate = () => {
    return new Promise((done, error) => {
        if(!settings.setupRun){
            return error();
        }
        var c = settings.connection;
        c.changeUser({
            database: settings.db
        }, err => {
            if(err) return error(err);
            Promise.all(settings.tables.map(generateForTable)).then(function(){
                done();
            }, error)
        });
    });
};

exports.teardown = (err) => {
    //console.trace();
    if(err)
        console.error(err);
    console.log('closing mysql connection...');
    if(settings.connection)
        settings.connection.end();
    settings.setupRun = false;
    console.log('mysql connection closed');
};