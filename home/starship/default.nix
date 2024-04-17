{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    # This does not work so at the moment we have
    # the global starship config in modules/starship.nix
    # Configuration written to ~/.config/starship.toml
    settings = builtins.fromTOML ''
          format = """
      [](#DF9E2F)\
      $os\
      $username\
      [](fg:#DF9E2F bg:#569FC6)\
      $directory\
      [](fg:#569FC6 bg:#8A8B8B)\
      $git_branch\
      $git_status\
      [](fg:#8A8B8B bg:#86BBD8)\
      $c\
      $elixir\
      $elm\
      $golang\
      $gradle\
      $haskell\
      $java\
      $julia\
      $nodejs\
      $nim\
      $rust\
      $scala\
      [](fg:#86BBD8 bg:#DF9E2F)\
      $docker_context\
      [](fg:#DF9E2F bg:#DF9E2F)\
      $time\
      [ ](fg:#DF9E2F)\
      """

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      [username]
      show_always = true
      style_user = "bg:#DF9E2F"
      style_root = "bg:#CC0403"
      format = '[$user ]($style)'
      disabled = false

      # An alternative to the username module which displays a symbol that
      # represents the current operating system

      [directory]
      style = "bg:#569FC6"
      format = "[ $path ]($style)"
      truncation_length = 3
      truncation_symbol = "…/"

      # Here is how you can shorten some long paths by text replacement
      # similar to mapped_locations in Oh My Posh:
      [directory.substitutions]
      "Documents" = " "
      "Downloads" = " "
      "Music" = " "
      "Pictures" = " "
      # Keep in mind that the order matters. For example:
      # "Important Documents" = "  "
      # will not be replaced, because "Documents" was already substituted before.
      # So either put "Important Documents" before "Documents" or use the substituted version:
      # "Important  " = "  "

      [c]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [docker_context]
      symbol = " "
      style = "bg:#06969A"
      format = '[ $symbol $context ]($style) $path'

      [elixir]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [elm]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [git_branch]
      symbol = ""
      style = "bg:#8A8B8B"
      format = '[ $symbol $branch ]($style)'

      [git_status]
      style = "bg:#8A8B8B"
      format = '[$all_status$ahead_behind ]($style)'

      [golang]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [haskell]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [java]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [julia]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [nodejs]
      symbol = ""
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [nim]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [rust]
      symbol = ""
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [scala]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [time]
      disabled = false
      time_format = "%R" # Hour:Minute Format
      style = "bg:#DF9E2F"
      format = '[ ♥ $time ]($style)'



    '';
  };
}
