{
  programs = {
    fish = {
      interactiveShellInit = ''
                set fish_greeting
                fastfetch
                starship init fish | source
        	      direnv hook fish | source
      '';
    };
  };
}
