## Custom Modules
Creating Your Own Modules
You can create your own modules by creating a shell script in "/etc/ifetch/modules/".

Modules must be executable POSIX shell scripts!

For example:
```
sudo nano /etc/ifetch/modules/CustomModule.sh
```

Add the following shebang at the top of the file:
```
#!/bin/sh
```

Then make the module executable:
```
sudo chmod +x /etc/ifetch/modules/CustomModule.sh
```

Modules are regular POSIX shell scripts, so you can use standard shell features such as "case" statements, and create your own custom options.

For example:
```
case "$1" in
    -g)
        echo ":)"
        ;;
    -h)
        echo "-h option"
        ;;
    *)
        echo "Default option"
        ;;
esac
```