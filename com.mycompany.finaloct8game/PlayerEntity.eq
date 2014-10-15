
/*
 * PlayerEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class PlayerEntity : SEEntity
{
        public SESprite player;
        public void initialize(SEResourceCache rsc) {
                base.initialize(rsc);
                var w = get_scene_width(), h = get_scene_height();
                rsc.prepare_image("mybaby","baby",w*0.1,h*0.1);
                player = add_sprite_for_image(SEImage.for_resource("mybaby"));
                var wp = player.get_width(), hp = player.get_height();
                player.move(w*0.5-wp,h*0.5-hp);
        }

        public void tick (TimeVal time, double delta) {
                player.move(Game.px,Game.py);
        }

        public void cleanup() {
                base.cleanup();
        }
}

