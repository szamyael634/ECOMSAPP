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
3. Copy:
	- Project URL
	- Project API anon key

This app reads Supabase values from Dart defines in `lib/main.dart`.

## 5) Run locally (web)

```bash
flutter run -d chrome --dart-define=SUPABASE_URL=YOUR_SUPABASE_URL --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

## 6) Build web for production

```bash
flutter build web --release --dart-define=SUPABASE_URL=YOUR_SUPABASE_URL --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
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

For Vercel project settings, add environment variables:
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`

Then build with these values in CI before running `vercel deploy --prebuilt`.

If you prefer, you can also deploy by importing this repo in Vercel and setting output directory to `build/web` after building in CI.

## 8) Auto deploy with GitHub Actions

This repo includes workflow `deploy-vercel.yml` at `.github/workflows/deploy-vercel.yml`.

It will:
- run on every push to `main`
- build Flutter web with Supabase defines
- deploy to Vercel production using prebuilt output

Add these GitHub repository secrets in Settings -> Secrets and variables -> Actions:
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `VERCEL_TOKEN`
- `VERCEL_ORG_ID`
- `VERCEL_PROJECT_ID`

How to get Vercel values:
1. Run `vercel login`
2. Run `vercel link` in this project once
3. Get `VERCEL_ORG_ID` and `VERCEL_PROJECT_ID` from `.vercel/project.json`
4. Create `VERCEL_TOKEN` from Vercel Account Settings -> Tokens

## App flow

- `lib/screens/login_screen.dart`: user login via Supabase
- `lib/screens/register_screen.dart`: user signup via Supabase
- `lib/screens/dashboard_screen.dart`: protected area with logout
- `lib/services/auth_service.dart`: Supabase auth wrapper
- `lib/main.dart`: Supabase initialization + auth state routing
