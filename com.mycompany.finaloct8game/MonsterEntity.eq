
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity: SEEntity
{
        int px1;
        int py1;
        int speed;
        int a;
        public SESprite player;
        public void initialize(SEResourceCache rsc) {
                base.initialize(rsc);
                rsc.prepare_image("gm","gameover",get_scene_width(),get_scene_height());
                var w = get_scene_width(), h = get_scene_height();
                rsc.prepare_image("mons2","dog",w*0.1,h*0.1);
                rsc.prepare_image("mons1","dog",w*0.1,h*0.1);
                a = Math.random(1,3);
                player = add_sprite_for_image(SEImage.for_resource("mons%d".printf().add(Primitive.for_integer(a)).to_string()));
                px1 = Math.random(0,w);
                py1 = Math.random(0,h);
                player.move(px1,py1);
                speed = Math.random(4,15);
        }

        public void tick (TimeVal time, double delta) {
                if(px1 < Game.px){
                        px1 = px1 + Math.random(speed/-4,speed);
                }
                else if(px1 > Game.px){
                        px1 = px1 - Math.random(speed/-4,speed);
                }
                
                if(py1 < Game.py){
                        py1 = py1 + Math.random(speed/-4,speed);
                        }
                else if(py1 > Game.py){
                        py1 = py1 - Math.random(speed/-4,speed);
                }

                if(px1==Game.px&&py1==Game.py) {
                        Game.desert = add_sprite_for_image(SEImage.for_resource("gm"));

                        Game.desert.move(0,0);
                }
                player.move(px1,py1);

        }

        public void cleanup() {
                base.cleanup();
        }
}
