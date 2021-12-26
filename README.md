# c2t.py - Coordinates to timezone

A very simple Python script that utilizes Geoclue through PYGobject with
timezonefinder to obtain a timezone string which could be used to assist
with dynamically setting /etc/localtime.

```
venv --system-site-packages .venv
. .venv/bin/activate
pip install -r requirements.txt
python c2t.py
```

After you've created a `venv` with the necessary dependencies, you can
execute through `c2t.sh` from anywhere, without the need to activate the
virtual environement first.

You could set /etc/localtime like this:

```
sudo ln -sf /usr/share/zoneinfo/$(c2t.sh) /etc/localtime
```
