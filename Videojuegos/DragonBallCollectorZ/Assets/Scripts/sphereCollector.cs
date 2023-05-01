using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class sphereCollector : MonoBehaviour
{
    int counter = 0;
    [SerializeField] TMP_Text spheres;

    void OnTriggerEnter2D(Collider2D colision){
        if(colision.gameObject.CompareTag("DragonBall")){
            Destroy(colision.gameObject);
            counter++;
            spheres.text = "Score: " + counter;
        } else if (colision.gameObject.CompareTag("Enemy")) {
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex+2); //Carga escena de game over
        }
    }

    void Update(){//Si el jugador colecta todas las esferas
        if(counter == 7){
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex+1); //Carga escena de "Haz ganado!!"
        }
    }
}

