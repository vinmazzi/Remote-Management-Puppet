class profile::stages {
  
  stage {'before_main': }
  stage {'after_main': }

  Stage['before_main'] -> Stage['main'] -> Stage['after_main']
}
