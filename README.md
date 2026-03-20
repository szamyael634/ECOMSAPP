# ECOMS Flutter App (Supabase + Vercel)

This project includes:
- Login screen
- Register screen
- Dashboard screen
- Supabase email/password authentication
- Flutter web deployment setup for Vercel

## 1) Prerequisites

Install:
- Flutter SDK (stable)
- Vercel CLI (`npm i -g vercel`)
- A Supabase project

## 2) Generate missing Flutter platform files

This workspace started empty, so run this once in project root:

```bash
flutter create .
```

If prompted about overwriting, keep existing `lib/` files from this project.

## 3) Install packages

```bash
flutter pub get
```

## 4) Supabase setup

In Supabase Dashboard:
1. Go to Authentication -> Providers
2. Enable Email provider

This project is currently configured with Supabase URL and anon key directly in `lib/main.dart`.

## 5) Run locally (web)

```bash
flutter run -d chrome
```

## 6) Build web for production

```bash
flutter build web --release
```

The build output is created in `build/web`.

## 7) Deploy to Vercel

`vercel.json` is configured with SPA routing and output directory.

Deploy prebuilt static files:

```bash
vercel deploy --prebuilt
```

For production:

```bash
vercel deploy --prebuilt --prod
```

If you prefer, you can also deploy by importing this repo in Vercel and setting output directory to `build/web` after building in CI.

## App flow

- `lib/screens/login_screen.dart`: user login via Supabase
- `lib/screens/register_screen.dart`: user signup via Supabase
- `lib/screens/dashboard_screen.dart`: protected area with logout
- `lib/services/auth_service.dart`: Supabase auth wrapper
- `lib/main.dart`: Supabase initialization + auth state routing
