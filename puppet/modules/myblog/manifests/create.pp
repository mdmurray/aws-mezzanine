class myblog::create {
  #create mezzanine project
  exec { "init-mezzanine-project":
    command => "/usr/local/bin/mezzanine-project $myblog::app_path",
    user => "mezzanine",
    creates => "$myblog::app_path/__init__.py",
    notify => Exec["init-mezzanine-db"]
  }
  #create mezzanine databse using sqlite
  exec { "init-mezzanine-db":
    command => "/etc/local/python manage.py createdb --noinput",
    user => "mezzanine",
    cwd => "$myblog::app_path",
    refreshonly => true,
    }
}

