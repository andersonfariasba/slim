<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

$app = new \Slim\App;

// CLIENTES
$app->group('/api', function () use ($app) {

    // Library group
    $app->group('/cliente', function () use ($app) {

    	
    	require 'controllers/Pessoa.php';
		
		
		//LISTAR CLIENTE (http://localhost:8080/slim/index.php/api/cliente/listar/)
		$app->get('/listar/', function (Request $request, Response $response) {

			$pessoa = new Pessoa();
			$pessoa->listar();

		});


		// SALVAR CLIENTE
        $app->post('/add/', function ($request, Response $response) {
        	//$pessoa = new Pessoa();
			//$pessoa->cadastrar();
		

        });

        
        //TESTE SALVAR
        $app->post('/register/', function() use ($app) { 
        	echo $_POST['nome'];
        	

        });

        // VISUALIZAR PELO ID
        $app->get('/visualizar/:id', function ($id) {

        });

        // EDITAR PELO ID
        $app->put('/editar/:id', function ($id) {

        });

        // EXCLUIR PELO ID
        $app->delete('/excluir/:id', function ($id) {

        });

         $app->get('/teste/', function () {
           echo "teste xxx";
        });

    });
    //FINAL CLIENTE


});








$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hellox, $name");

    return $response;
});


//Lista de clientes
$app->get('/clientes/', function (Request $request, Response $response) {
	
	require 'controllers/Pessoa.php';
	$pessoa = new Pessoa();
	$pessoa->listar();

});




$app->run();