{ config, pkgs, ... }:

let

  gtk-omni = pkgs.fetchFromGitHub {
    owner = "getomni";
    repo = "gtk";
    rev = "e81b3fbebebf53369cffe1fb662abc400edb04f7";
    sha256 = "08h4x9bjd3p3h00adj9060q27w544acsnn5ifxyahqxbdy8669im";
  };

in {
  home.file = {
    ".iex.exs".text = ''
      colors_opts = [
        syntax_colors: [
          number: :light_yellow,
          atom: :light_cyan,
          string: :light_green,
          boolean: :light_blue,
          nil: [:magenta, :bright]
        ],
        ls_directory: :cyan,
        ls_device: :yellow,
        doc_code: :green,
        doc_inline_code: :magenta,
        doc_headings: [:cyan, :underline],
        doc_title: [:cyan, :bright, :underline]
      ]

      prompt = [
        # ANSI CHA, move cursor to column 1
        "\e[G",
        :light_magenta,
        # plain string
        "ﬦ",
        ">",
        :white,
        :reset
      ]
      |> IO.ANSI.format()
      |> IO.chardata_to_string()


      IEx.configure(
        inspect: [limit: :infinity, pretty: true],
        colors: colors_opts,
        default_prompt: prompt
      )
    '';

    ".ghci".text = ''
      :set prompt "\ESC[1;34m%s\n\ESC[0;34mλ> \ESC[m"
    '';

    ".themes/gtk-omni" = {
      recursive = true;
      source = gtk-omni;
    };
  };
}