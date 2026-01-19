{
  programs.alacritty = {
    theme = "kanagawa_dragon";
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      };
      window = {
        decorations = "None";
        opacity = 0.65;
        blur = true;
        dynamic_title = false;
      };
    };
  };
}
