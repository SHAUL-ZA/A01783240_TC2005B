using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyMovement : MonoBehaviour
{
    [SerializeField] float moveSpeed;
    [SerializeField] float moveRange;
    [SerializeField] int enemyType;

    Vector3 startPos;
    // Start is called before the first frame update
    void Start()
    {
        startPos = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        // Change enemy movement type based off the enemyType variable.
        // enemyType 0 = horizontal movement
        // enemyType 1 = vertical movement 
        // enemyType 2 = diagonal movement 
        // enemyType 3 = circular movement
        // enemyType 4 = reverse diagonal
        if (enemyType == 0)
        {
            transform.position = new Vector3(startPos.x + Mathf.PingPong(Time.time * moveSpeed, moveRange), transform.position.y, transform.position.z);
            
        } else if (enemyType == 1)
        {
            transform.position = new Vector3(transform.position.x, startPos.y + Mathf.PingPong(Time.time * moveSpeed, moveRange), transform.position.z);
        } else if (enemyType == 2)
        {
            transform.position = new Vector3(startPos.x + Mathf.PingPong(Time.time * moveSpeed, moveRange), startPos.y + Mathf.PingPong(Time.time * moveSpeed, moveRange), transform.position.z);
        } 
        else if (enemyType == 3)
        {
            transform.position = new Vector3(startPos.x + Mathf.Sin(Time.time * moveSpeed) * moveRange, startPos.y + Mathf.Cos(Time.time * moveSpeed) * moveRange, transform.position.z);
        } 
        else if (enemyType == 4)
        {
            transform.position = new Vector3(startPos.x + Mathf.PingPong(Time.time * moveSpeed, moveRange), startPos.y - Mathf.PingPong(Time.time * moveSpeed, moveRange), transform.position.z);
        }
    }
}
