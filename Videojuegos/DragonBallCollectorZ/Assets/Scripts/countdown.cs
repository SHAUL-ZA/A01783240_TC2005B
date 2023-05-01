using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class countdown : MonoBehaviour
{
    [SerializeField] TMP_Text count;
    float timeLeft = 60f;


    // Update is called once per frame
    void Update()
    {
        timeLeft -= 1 * Time.deltaTime;
        count.text = timeLeft.ToString("0");
        if(timeLeft <= 0){
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex+2); //Carga escena de "Game Over!!"
        }
    }


}
