{ lib
, buildPythonPackage
, fetchPypi
, pytest
}:

buildPythonPackage rec {
  pname = "pytest-dependency";
  version = "0.6.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-k0sOajnZWZUGLBk/fq7tio/6Bv8bzvS2Kw3HSnCLrME=";
  };

  buildInputs = [ pytest ];

  nativeCheckInputs = [ pytest ];

  checkPhase = ''
    pytest
  '';

  meta = with lib; {
    homepage = "https://github.com/RKrahl/pytest-dependency";
    description = "Manage dependencies of tests";
    license = licenses.asl20;
    maintainers = [ maintainers.marsam ];
  };
}
