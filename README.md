# .dotfiles
Repo obsahuje dotfiles pro pekne UI v Debianu

Stahnout skript setup.sh, dat mu +x a melo by to vse projit samo.

Na skript taky ukazuje URL

https://api.martus.cz/q/setup.php
- [ ] Aby /q/setup.php nebyl jen prachprostej redirect (stahovat soubor lokalne do cache na serveru, ktery jej dale poskytuje)

Lze spustit jako
```
curl -L api.martus.cz/q/setup.php | bash --
```
Nebo
```
wget -qO- api.martus.cz/q/setup.php | bash
```
