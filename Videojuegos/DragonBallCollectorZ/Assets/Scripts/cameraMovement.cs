using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cameraMovement : MonoBehaviour
{
    [SerializeField] Transform player;

    // Set Camera move breakpoint
    [SerializeField] float minX;
    float minY;

    // Declare camera 
    Camera cam;

    // Set camera refresh rate 
    float refreshRate;


    void Start() {
        cam = GetComponent<Camera>();
        // Get refresh rate based on screen
        refreshRate =  Screen.currentResolution.refreshRate;
    }

    // Update is called once per frame
    void Update()
    {
        minY = minX * cam.aspect;
        float time = Time.deltaTime;
        if (Mathf.Pow(player.position.x - transform.position.x, 2) + Mathf.Pow(player.position.y - transform.position.y,  2) >= (Mathf.Pow(minX, 2) + Mathf.Pow(minY, 2))) {
            transform.position = new Vector3(transform.position.x + (player.position.x - transform.position.x) / (refreshRate / 2), transform.position.y + (player.position.y - transform.position.y) / (refreshRate / 2), transform.position.z);
        }
    }
}
