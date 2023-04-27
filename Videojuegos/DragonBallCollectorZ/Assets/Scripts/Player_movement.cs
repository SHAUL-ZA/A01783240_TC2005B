
using UnityEngine;


public class Player_movement : MonoBehaviour
{
    [SerializeField] float speed;
    [SerializeField] float limitX;
    [SerializeField] float limitY;

    Vector3 move; 
    // Update is called once per frame
    void Update()
    {
        //Move and flip character
        move.x = Input.GetAxisRaw("Horizontal");
        move.y = Input.GetAxisRaw("Vertical");

        if (transform.position.x < -limitX && move.x < 0) {
            move.x = 0;
        } else if (transform.position.x > limitX && move.x > 0) {
            move.x = 0;         
        }

        if(transform.position.y < -limitY && move.y < 0) {
            move.y = 0;
        } else if (transform.position.y > limitY && move.y > 0) {
            move.y = 0;
        }
        transform.Translate(move * speed * Time.deltaTime);
    }
}
