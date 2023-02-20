abstract class FailureGet implements Exception {}

class InvalidPageNumber implements FailureGet {}

class MovieDatasourceError implements FailureGet {}

class GenreDatasourceError implements FailureGet {}

class TrailerDatasourceError implements FailureGet {}
