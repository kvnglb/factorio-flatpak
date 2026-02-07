This repo is meant to install factorio as flatpak, as vanilla as possible. So no need for flatpak-builder. Everything is handled by flatpak itself and [this little script](./com.factorio.Factorio.sh) will install the game in all its glory.

# Instructions
1) clone this repo
1) delete the palceholder file `factorio-space-age_linux_2.0.72`
1) download factorio (or factorio space age) and save it in the repo's directory
1) run `./com.factorio.Factorio.sh` to install the game as flatpak

# Note
The last command where the timestamp is changed is needed, because factorio crashes when the files have the timestamp of unixtime 0. The funny part is, only the timestamp for the files in `factorio/data/core/graphics/color_luts` mustn't have unixtime 0; to have it consistent, the whole directory gets `touch`ed.
