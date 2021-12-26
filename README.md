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

In fact, I've made a helper script that can be used in combination with
`NetworkManager-dispatch`. Place `set-timezone.sh` in:

`/etc/NetworkManager/dispatch.d`

Make sure the script is executable and owned by `root`. The script will
trigger when a network interface goes `up`. You can see what it did by
looking at `/tmp/c2t.out`.
