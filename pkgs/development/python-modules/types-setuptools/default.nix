{ lib
, buildPythonPackage
, fetchPypi
, setuptools
}:

buildPythonPackage rec {
  pname = "types-setuptools";
  version = "69.1.0.20240302";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7VRiz4Rwgx0b2/MA4e7qh2BAZDv8QLeFEJpYV/p9PD8=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  # Module doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "setuptools-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for setuptools";
    homepage = "https://github.com/python/typeshed";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
