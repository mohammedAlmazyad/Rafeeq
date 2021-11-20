// null check
bool safeIsNotEmpty(object) {
  return object != null && object.isNotEmpty && object != '' && object != 'null';
}

bool safeListIsNotEmpty(object) {
  return object != null && object.length > 0;
}
