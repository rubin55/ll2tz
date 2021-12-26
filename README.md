# ll2tz - Latitude and Longitude to Time Zone

A very simple Python script that utilizes Geoclue through PYGobject with
timezonefinder to obtain a timezone string which could be used to assist
with dynamically setting /etc/localtime.

```
venv --system-site-packages .venv
. .venv/bin/activate
pip install -r requirements.txt
python ll2tz.py
```

After you've created a `venv` with the necessary dependencies, you can
execute through `ll2tz.sh` from anywhere, without the need to activate the
virtual environement first.

You could set /etc/localtime like this:

```
sudo ln -sf /usr/share/zoneinfo/$(l22tz.sh) /etc/localtime
```

In fact, I've made a helper script that can be used in combination with
`NetworkManager-dispatch`. Place `ll2tz-setter.sh` in:

`/etc/NetworkManager/dispatch.d`

Make sure the script is executable and owned by `root`. The script will
trigger when a network interface goes `up`. You can see what it did by
looking at `/tmp/ll2tz-setter.out`.

## Todo

  * Make pip-installablea (upload to pip)
  * Optional: make package for void linux
