
using UnityEngine;


public class Player_movement : MonoBehaviour
{
    [SerializeField] float speed;

    // Sprite Renderer
    SpriteRenderer spriteRenderer;

    void Start() {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    Vector3 move; 
    // Update is called once per frame
    void Update()
    {

        // Get keyinputs to flip character
        if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow)) {
            spriteRenderer.flipX = true;
        } else if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow)) {
            spriteRenderer.flipX = false;
        }
        
        //Move and flip character
        move.x = Input.GetAxisRaw("Horizontal");
        move.y = Input.GetAxisRaw("Vertical");

        transform.Translate(move * speed * Time.deltaTime);
    }
}
