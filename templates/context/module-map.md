# Module map (living document)

> The map of modules, what each owns, its public contract, and who depends on it.
> This is how the pipeline stays coherent ACROSS a many-module project: an agent working
> on one module reads this to know what it may touch and what it must NOT break.
> The Architecture team updates it whenever a module or contract changes.

## How to read
- **Owns:** data/tables/state this module is the source of truth for.
- **Exposes:** the public contract other modules may use (functions, endpoints, events).
- **Depends on:** other modules' contracts it consumes (a change to those is a breaking risk).
- **Do NOT:** hard rules to prevent unauthorized coupling.

---

## Example
### module: `attendance`
- **Owns:** `AttendanceLog`, GPS-risk scoring.
- **Exposes:** `POST /attendance/checkin|checkout`, `GET /attendance/monthly`.
- **Depends on:** `auth` (identity), `sites` (geofence), `users` (employee record).
- **Do NOT:** write to `User` directly; do not reimplement geofence — call `sites`.

### module: `payroll`
- **Owns:** `Payroll` records.
- **Exposes:** `POST /payroll/generate`.
- **Depends on:** `attendance` (hours), `leave` (paid days), `users` (salary).
- **Do NOT:** recompute attendance — consume `attendance` output only.

---

## Dependency edges (for integration testing)
List the cross-module edges so the Integration team knows which end-to-end flows to test:
- `attendance → users` (check-in updates last-seen)
- `payroll → attendance, leave` (generation reads both)
