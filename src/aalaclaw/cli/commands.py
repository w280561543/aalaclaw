import typer
from rich.console import Console

from aalaclaw import __version__

app = typer.Typer(
    name="aalaclaw",
    help="aalaclaw - Personal Adaptive AI Learning Assistant",
    no_args_is_help=True,
)

console = Console()

def version_callback(value: bool):
    if value:
        console.print(f"aalaclaw v{__version__}")
        raise typer.Exit()


@app.callback()
def main(
    _version: bool = typer.Option(
        None, "--version", "-v", callback=version_callback, is_eager=True, help="Show version"
    ),
):
    pass