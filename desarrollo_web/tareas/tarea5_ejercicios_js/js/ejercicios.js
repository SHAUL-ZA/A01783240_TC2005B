// Ejercicios de JavaScript

/*
    1. Funcion que encuentre el primer caracter
    de una cadena que no se repite
*/
function primerCaracter(text){
    return text.substring(1 , text)
}
console.log(primerCaracter("abacddbec"));

/*
    2. Funcion que implementa un algoritmo de bubble-sort para 
    ordenar una lista de numeros
*/
function bubbleSort(list){
    const long = list.length 
    for(let i = 0; i < long; i++){
        for(let j = 0; j < long - i - 1; j++){
            if(list[j] > list[j + 1]){
                // Si el elemento actual es mayor que el siguiente
                const temporal = list[j]
                list[j] = list[j + 1]
                list[j + 1] = temporal
            }
        }
    }
    return list
}
console.log(bubbleSort([1, 5, 3, 2, 4, 6, 8, 7, 10, 9]))


/*
    3. Funcion que invierte un arrgeglo de numeros y otra funcion que 
    modifica el mismo arreglo que se pasa como parametro
*/
function invertir(list){
    const long = list.length
    const newList = []
    for(let i = long - 1; i >= 0; i--){
        newList.push(list[i])
    }
    return newList
}

// Modifica el arreglo que se pasa como parametro multiplicando cada elemento por 2
function modificar(list){
    const resultList = invertir(list)
    const long = list.length
    for(let i = 0; i < long; i++){
        resultList[i] *= 2
    }
    return resultList
}
console.log(modificar([1, 2, 3, 4, 5]))
    
/*
    4. Escribe una función que reciba una cadena de texto y regrese una nueva
    con la primer letra de cada palabra en mayúscula.
*/
function cadenaMayus(text){
    const palabra = text.split(" ") // Separa la cadena en palabras
    const long = palabra.length 
    let newString = "" // Cadena que se va a regresar
    for(let i = 0; i < long; i++){
        newString += palabra[i].charAt(0).toUpperCase() + palabra[i].slice(1) + " " //Ya separada cada palabra, cada una tiene su primer letra en mayuscula en la posicion 0
        //slice(1) regresa la cadena a partir de la posicion 1 sin modificar el resto de la cadena  
    }
    return newString
}
console.log(cadenaMayus("hola mundo desde javascript"))


/*
    5. Escribe una función que calcule el máximo común divisor de dos números.
*/
//recibe dos numeros como parametros
function mcd(num1, num2){
    let max = 0
    for(let i = 1; i <= num1 && i <= num2; i++){
        //Ciclo que recorre los numeros hasta el menor de los dos 
        if(num1 % i == 0 && num2 % i == 0){
            //Si el numero actual es divisor de ambos numeros, se guarda en max
            max = i
        }
    }
    return `El maximo comun divisor de "${num1}" y "${num2}" es "${max}"`
}
console.log(mcd(12, 8))


/*
    6. Crea una función que cambie una cadena de texto a 'Hacker Speak'.
    Por ejemplo, para la cadena 'Javascript es divertido', su hacker speak es: 'J4v45c1pt 35 d1v3rt1d0'.
*/
function hackerSpeak(text){
    const hackText = []
    //Se crea una cadena con el abecedario normal y otro con el abecedario hackeado
    let abecedario = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let abecedarioHack = "48cd3f9h1jk1mn0pqr57uvwxy2ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    abecedario = abecedario.split("") //Separa el abecedario en letras
    abecedarioHack = abecedarioHack.split("") 
    text = text.split("") //Separa la cadena en letras
    const long = text.length
    for(let i = 0; i < long; i++){
        if(text[i] == " "){ 
            //Si el caracter actual es un espacio, se agrega un espacio
            hackText.push(" ") 
        }
        else{
            let h = abecedario.indexOf(text[i]) //Tomamos la posicion del caracter en el abecedario normal
            hackText.push(abecedarioHack[h]) //Se agrega el caracter hackeado a la nueva cadena
        }
    }
    return hackText.join("") //Se regresa la cadena unida
}

console.log(hackerSpeak("Texto hackeado"))

/*
    7. Escribe una función que reciba un número, y regrese una lista con todos sus factores.
    Por ejemplo: factoriza(12) -> [1, 2, 3, 4, 6, 12].
*/
function factores(num){
    const listaFactores = [] //Lista que se va a regresar
    for(let i = 1; i <= num; i++){ 
        if(num % i == 0){
            //Si el numero actual es divisor de num, se agrega a la lista
            listaFactores.push(i) 
        }
    }
    return listaFactores
}

console.log(factores(16))

/*
    8. Escribe una función que quite los elementos duplicados de un arreglo y regrese una lista con los elementos que quedan. 
    Por ejemplo: quitaDuplicados([1, 0, 1, 1, 0, 0]) -> [1, 0]
*/
function noDuplicados(list){
    const newList = []
    const long = list.length
    for(let i = 0; i < long; i++){
        if(newList.indexOf(list[i]) == -1){ 
            //Si el elemento actual no esta en la nueva lista, se agrega 
            //IndexOf busca el elemento en la lista y regresa su posicion, si no lo encuentra regresa -1
            newList.push(list[i])
        }
    }
    return newList
}
console.log(noDuplicados([1, 0, 1, 1, 0, 0]))

/*
    9. Escribe una función que reciba como parámetro una lista de cadenas de texto, y regrese la longitud de la cadena más corta.
*/
function cadenaCorta(list){
    let min = list[0].length //Se guarda la longitud de la primera cadena
    const long = list.length
    for(let i = 1; i < long; i++){
        if(list[i].length < min){
            //Si la longitud de la cadena actual es menor que la longitud minima, se guarda en min
            min = list[i].length
        }
    }
    return min
}
console.log(cadenaCorta(["hola", "adios", "hasta luego", "hasta pronto"]))

/*
    10. Escribe una función que revise si una cadena de texto es un palíndromo o no.
*/
function palindromo(text){
    const long = text.length
    for(let i = 0; i < long; i++){
        if(text[i] != text[long - 1 - i]){
            //Si el caracter actual es diferente al caracter en la posicion long - 1 - i, no es palindromo
            return ` "${text}" No es un palindromo`
        }
    }
    return `"${text}" Si es un palindromo`
}
console.log(palindromo("OSO"))

/*
    11. Escribe una función que tome una lista de cadena de textos y devuelva una nueva lista con todas las cadenas en orden alfabético.
*/

function ordenAlfabetico(list){
    return list.sort() //Metodo recursivo que ordena la lista ya que divide la lista en listas mas pequeñas y las compara
}
console.log(ordenAlfabetico(["Google", "Apple", "Samsung", "Meta", "HuaWei"]))

/*
    12. Escribe una función que tome una lista de números y devuelva la mediana y la moda.
*/
function estadistica(list){
    const long = list.length
    let sum = 0
    let moda = 0
    let modaNum = 0
    for(let i = 0; i < long; i++){
        sum += list[i] //Acumula la suma de los numeros
        let cont = 0 //Contador para saber cuantas veces se repite un numero
        for(let j = 0; j < long; j++){
            if(list[i] == list[j]){ //Si el numero actual es igual al numero en la posicion j, se aumenta el contador
                cont++
            }
        }
        if(cont > moda){
            moda = cont //Se guarda la cantidad de veces que se repite el numero y se guarda en moda
            modaNum = list[i] 
        }
    }
    const mediana = sum / long //La mediana es el promedio de los numeros
    return `La mediana es ${mediana} y la moda es ${modaNum}`     
}

console.log(estadistica([1, 2, 2, 3, 4, 5, 6, 6, 7, 7, 7, 8, 9, 10]))
/*
    13. Escribe una función que tome una lista de cadenas de texto y devuelva la cadena más frecuente.
*/

//Esta funcion es muy similar a la funcion de la mediana y moda, solo que en vez de guardar la moda, se guarda la cadena mas frecuente
function frecuente(list){
    const long = list.length
    let moda = 0
    let modaText = ""
    for(let i = 0; i < long; i++){
        let cont = 0
        for(let j = 0; j < long; j++){
            if(list[i] == list[j]){
                cont++
            }
        }
        if(cont > moda){
            moda = cont
            modaText = list[i]
        }
    }
    return modaText
}

//Trabalenguas
console.log(frecuente(["A", "cuesta", "le", "cuesta", "subir", "la", "cuesta", "y", "en", "medio", "de", "la", "cuesta", "va", "y", "se", "acuesta"]))

/*
    14. Escribe una función que tome un número y devuelva verdadero si es una potencia de dos, falso de lo contrario.
*/
function potenciaDos(num){
    let potencia = 1 //Se inicializa la potencia en 1 ya que 2^0 = 1
    while(potencia < num){
        potencia *= 2 //Se multiplica la potencia por 2 hasta que sea mayor o igual al numero
    }
    return potencia == num //Si la potencia es igual al numero, es potencia de dos y regresa true, si no, regresa false
}

console.log(potenciaDos(16))

/*
    15. Escribe una función que tome una lista de números y devuelva una nueva lista con todos los números en orden descendente.
*/

function descendente(list){
    return list.sort((a, b) => b - a) //Compara el valor de a con el valor de b, si a es mayor que b, se coloca antes que b
}

console.log(descendente([3, 7, 2, 1, 10, 5, 4, 9, 8, 6]))