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

module.exports = {
  isBlank,
  trimToNull,
  trimObjectStrings,
  missingFields,
  requireAtLeastOne,
  parseNonNegativeInt,
};
