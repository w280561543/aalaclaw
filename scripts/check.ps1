$ErrorActionPreference = "Stop"
$venvPython = ".venv\\Scripts\\python.exe"
if (-not (Test-Path $venvPython)) {
  Write-Error "请先创建并激活 .venv"
  exit 1
}
$python = $venvPython

& $python -m ruff check .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& $python -m pyright
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& $python -m pytest
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
