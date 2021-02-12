# i3 window manager အတွက် configuration file များ

### လိုတာတွေ

OS - Manjaro Arch

Window Manager - i3-gaps

Terminal - kitty

Compositor - [ibhagwan](https://github.com/ibhagwan/picom) anti-aliased rounded corner ရယ် background blur ရယ်ရလို့သုံးတာပါ။ မသုံးလည်းရတယ် ဒါပေမဲ့ ရုပ်ဆိုးလိမ့်မယ်။

Bar - polybar

Lock screen - i3lock-color, xss-lock

Launcher - rofi

Rofi Applets - [adi1090x](https://github.com/adi1090x/rofi)

Spotify Theme - [Spiceify/Dribbblish](https://github.com/morpheusthewhite/spicetify-themes/tree/master/Dribbblish)

---

Notification အတွက် dunst

Speaker volume ကိုထိိန်းရန် `pactl` 

Screen brightness ကိုထိန်းဖို့အတွက် `brightnessctl` 

Current session ကို logout လုပ်ဖို့အတွက် `i3exit` 

Font တွေ Gnome နဲ့ဆိုင်တဲ့ Theme တွေ Icon Theme တွေ Cursor Theme တွေပြောင်းဖို့အတွက် `lxappearance` 


`xev`, `xprop` နှင့် `xdotool` တွေကို keycode ရှာဖို့နဲ့ window တစ်ခုရဲ့ information ယူဖို့သုံးထားတယ်

Caps ကို တစ်ခုတည်းဆို Escape၊ ပေါင်းနှိပ်ရင် Ctrl နဲ့ Map တာ၊ Win နဲ့ Alt နေရာလဲတာရယ် Input Method ပြောင်းတာရယ်အတွက် `setxkbmap`, `xcape`

### ဘာတွေလုပ်ဖို့လိုလဲ

1. ဒီ repository ကို `~/.config/i3` ထဲကို clone ပါ

2. `.xinitrc` ကို Home directory ထဲကူးထည့်ပါ

3. `kitty.conf` ရယ် `dunstrc` ရယ်ကို `~/.config/kitty` ထဲရယ် `~/.config/dunst` ထဲရယ် symlink လုပ်ပါ

4. `build` script ကို run ပါ

Rofi applet တွေအတွက်ရယ် Spotify Theme ရယ်ကတော့ သူတို့ Repo တွေကပြောတဲ့အတိုင်းလုပ်ရင်ရတယ်။ 

### မသုံးတတ်ဘူးလား

Shortcuts တွေသိချင်ရင် `configs/shortcuts`, `config/workspaces` ထဲကြည့်ပါ ဒါမှမဟုတ် `mod+period` ကိုနှိပ်ကြည့်ပါ

Desktop background ရယ် Lock screen wallpaper ရယ်ပြောင်းချင်ရင် background.png ကို replace လုပ်ပါ

---

လိုတာတော်တော်များများက Arch/AUR မှာရှိတယ်။ Debian based သုံးတဲ့သူအတွက်တော့ တချို့ဟာတွေ ကိုယ်တိုင် build လုပ်ဖို့လိုလိမ့်မယ်

### ဒါမျိုးလေးတွေ

![ပုံ ၁](https://raw.githubusercontent.com/chanyeinthaw/dotfiles/master/showcase/showcase1.png)

![ပုံ ၂](https://raw.githubusercontent.com/chanyeinthaw/dotfiles/master/showcase/showcase2.png)
