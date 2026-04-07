function isBlank(value) {
  if (value === undefined || value === null) return true;
  if (typeof value === 'string') return value.trim() === '';
  return false;
}

function trimToNull(value) {
  if (value === undefined || value === null) return null;
  const str = String(value).trim();
  return str === '' ? null : str;
}

function trimObjectStrings(obj) {
  const out = { ...(obj || {}) };
  for (const key of Object.keys(out)) {
    if (typeof out[key] === 'string') out[key] = out[key].trim();
  }
  return out;
}

function missingFields(obj, requiredFields) {
  return (requiredFields || []).filter((field) => isBlank(obj?.[field]));
}

function requireAtLeastOne(obj, fields) {
  return (fields || []).some((field) => !isBlank(obj?.[field]));
}

function parseNonNegativeInt(value) {
  if (value === undefined || value === null || value === '') return null;
  const n = Number(value);
  if (!Number.isFinite(n) || !Number.isInteger(n) || n < 0) return null;
  return n;
}

function validateUsername(username) {
  const value = typeof username === 'string' ? username.trim() : String(username ?? '').trim();
  if (value === '') return 'Username is required.';
  if (value.length < 3 || value.length > 20) return 'Username must be 3–20 characters.';
  if (!/^[A-Za-z0-9_]+$/.test(value)) return 'Username must be alphanumeric and underscore only.';
  return null;
}

function validatePassword(password) {
  const value = typeof password === 'string' ? password : String(password ?? '');
  if (value.trim() === '') return 'Password is required.';
  if (value.length < 8) return 'Password must be at least 8 characters.';
  if (!/[A-Z]/.test(value) || !/\d/.test(value)) return 'Password must contain at least 1 uppercase letter and 1 number.';
  return null;
}

module.exports = {
  isBlank,
  trimToNull,
  trimObjectStrings,
  missingFields,
  requireAtLeastOne,
  parseNonNegativeInt,
  validateUsername,
  validatePassword,
};
