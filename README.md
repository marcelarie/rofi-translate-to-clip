# translate to clip


Rofi menu that uses the [LibreTranslate](https://libretranslate.com/) API to translate text on multiple languages on the fly.  
I recommend putting the script on your path and execute it with a custom key combination. 


**Recommended:**
<br>
Install [`moreutils`](https://github.com/stigtsp/moreutils) so `vim` or `neovim` will be used to get the input
for the translation.
<br><br>


![rofi-translate](https://user-images.githubusercontent.com/62728887/156833450-8e32c339-d889-4f8d-9f5c-b51e240c490a.gif)

to use the script:
<br><sub>linux only for the moment :/</sub>
```bash
git clone https://github.com/marcelarie/rofi-translate-to-clip.git
cd rofi-translate-to-clip
chmod +x ./rofi-translate.sh
./rofi-translate.sh
```

You will need to install:<br>
- [`rofi`](https://github.com/davatorium/rofi)
- [`jq`](https://stedolan.github.io/jq/)



