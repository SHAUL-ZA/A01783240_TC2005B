using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cameraMovement : MonoBehaviour
{
    [SerializeField] Transform player;

    // Set Camera move breakpoint
    [SerializeField] float minlength;

    // Update is called once per frame
    void Update()
    {
        if (Mathf.Pow(player.position.x - transform.position.x, 2) + Mathf.Pow(player.position.y - transform.position.y,  2) >= Mathf.Pow(minlength, 2)) {
            transform.position = new Vector3(transform.position.x + (player.position.x - transform.position.x) / 144, transform.position.y + (player.position.y - transform.position.y) / 10, transform.position.z);
        }
    }
}
