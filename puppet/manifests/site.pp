require stdlib

node default {
  $userdata = parsejson($ec2_userdata)

#set variables from userdata
  $role = $userdate['role']

  case $role {
    "web": { $role_class = "myblog::web" }
    default: { fail ("Unrecognized role: $role") }
      }

#main myblog class
  class { "myblog:"
  }
#role specific class
  class { $role_class:
  }
    
    
}
