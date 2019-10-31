isProgramInstalled()
{
      command -v $1 >/dev/null 2>&1 || { return 1 >&2;  }
          return 0
}

info()
{
      echo -e "${accent}$1${reset}"
}

success()
{
      echo -e "${success}$1${reset}"
}

error()
{
      echo -e "${error}$1${reset}"
}
