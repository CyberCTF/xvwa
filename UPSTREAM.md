# Upstream

| | |
| --- | --- |
| Project | XVWA (Xtreme Vulnerable Web Application) |
| Repository | https://github.com/s4n7h0/xvwa (archived) |
| Version | master (no releases) |
| Commit | fb30fa517d288e618b521d252f61107ef6a24797 |
| Licence | GPL-3.0 |

`build/xvwa/app/` is that commit, unchanged, without its Git history. Upstream has no Dockerfile:
`build/xvwa/Dockerfile` follows its manual installation (the folder served as `/xvwa/` by Apache
with PHP, `php.ini` settings applied) on `php:5.6-apache`, sets the database host and account in
the copied `config.php` to the db machine, and runs `setup-db.sh` in the background at start,
which calls XVWA's Setup page once. `build/db/Dockerfile` is MariaDB 10.11 with the database and
account baked in. To update, replace `build/xvwa/app/` with a newer commit, then change this table.
