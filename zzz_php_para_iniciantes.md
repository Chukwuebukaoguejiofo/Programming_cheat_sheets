# PHP para iniciantes


###### echo
```php
<?php
    echo "oi";
?>

// o resultado será :  oi

```


###### Variaveis
```php
<?php

$meuNome = "Fulano";

echo $meuNome; 

// o resultado será :  Fulano

?>
```

###### Interpolação
```php
<?php

$meuNome = "Fulano";

echo "oi $meuNome, como vai?"; 

// o resultado será :  oi Fulano, como vai?

?>
```

###### matematica
```php
<?php
    $soma = 1 + 1;

    echo $soma;
?>

// o resultado será :  2

```


###### funçōes
```php
<?php
    function dizerOi(){
        echo "oi";
    }

    dizerOi();
?>

// o resultado será :  oi

```


###### funçōes com parametros
```php
<?php
    function dizerOi($nome, $idade){
        echo "oi $nome, voce tem $idade anos";
    }

    dizerOi("Fulano", 20);
?>

// o resultado será :  oi Fulano, voce tem 20 anos

```


###### retornando um valor de uma função
```php
<?php
    function somaDeDoisNumeros($primeiroNumero, $segundoNumero){
        $resposta = $primeiroNumero + $segundoNumero;

        return $resposta;
    }

    $resultado = somaDeDoisNumeros(2, 2);

    echo $resultado;
?>

// o resultado será :  4

```

###### classes
```php
<?php
    class Pessoa{
        function __construct($nome, $idade){
            $this->nome = $nome;
            $this->idade = $idade;
        }

        function dizerOi(){
            echo "Oi, meu nome é $this->nome, eu tenho $this->idade anos.";
        }
    }

    $fulano = new Pessoa("Fulano", 20);
    $fulano->dizerOi();
?>

// o resultado será :  Oi, meu nome é Fulano, eu tenho 20 anos.

```
