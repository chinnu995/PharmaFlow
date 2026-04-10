# 💊 PharmaFlow – Medicine Inventory Alert Dashboard

A complete, production-ready single-file web application for small clinic medicine inventory management.

---

## 📁 Project Structure

```
pharmaflow/
├── pharmaflow.html    ← Main application (open this in a browser)
├── schema.sql         ← Supabase database schema (run in Supabase SQL Editor)
├── seed.sql           ← Sample data (run after schema.sql)
├── .env.example       ← Supabase credentials template
└── README.md          ← This file
```

---

## 🚀 Quick Start (5 Steps)

### Step 1 – Create a Supabase Project
1. Go to [https://supabase.com](https://supabase.com) and sign up / log in
2. Click **New Project**, give it a name like `pharmaflow`
3. Choose a region close to you, set a strong DB password
4. Wait for the project to provision (~1 min)

### Step 2 – Run the Database Schema
1. In your Supabase dashboard → open **SQL Editor**
2. Copy the entire contents of `schema.sql` and paste it in
3. Click **Run** → You should see "Success" for each statement

### Step 3 – Seed Sample Data (Optional but recommended)
1. In Supabase SQL Editor, open a **New Query**
2. Copy the entire contents of `seed.sql` and paste it in
3. Click **Run** → 6 sample medicines will be inserted

### Step 4 – Get Your Supabase Credentials
In your Supabase project:
- Go to **Project Settings → API**
- Copy: **Project URL** (looks like `https://xxxx.supabase.co`)
- Copy: **anon / public key** (long JWT string)

### Step 5 – Connect the App
Open `pharmaflow.html` in a text editor and find these two lines near the top of the `<script>` tag:

```js
const SUPABASE_URL = 'YOUR_SUPABASE_PROJECT_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Replace the placeholders with your actual values, then **save** the file.

---

## ▶️ Running the App

Simply open `pharmaflow.html` in any modern browser:
- **Windows**: Double-click the file
- **Or**: Right-click → Open With → Chrome / Edge / Firefox

> No server, no npm, no build step needed. It's 100% client-side.

---

## ⚠️ Demo Mode (No Supabase)

If you open the file WITHOUT setting up Supabase, the app runs in **Demo Mode** automatically:
- 6 sample medicines are pre-loaded in memory
- All features work (add, edit, delete, dispense, restock)
- Data does NOT persist between page refreshes in demo mode

---

## 🌐 Features

| Feature | Details |
|---|---|
| 📊 Dashboard | KPI cards, chronic disease monitor, alert banners, donut chart |
| 📦 Inventory | Full CRUD table, quick dispense/restock, sort & filter |
| 🛒 Reorder List | Auto-generated, WhatsApp + SMS reorder buttons |
| 📈 Analytics | Category bar chart, stock movement line chart |
| 🗺️ Suppliers | Nearby search via Google Maps, supplier directory |
| 🎤 Voice Search | Web Speech API – say "show expired", "show critical" etc |
| 📷 Barcode Scanner | Camera-based barcode scan to find/add medicines |
| 🌙 Dark Mode | System preference aware + manual toggle |
| ⌨️ Keyboard Shortcuts | A=Add, /=Search, R=Reorder, D=Dashboard, I=Inventory, Esc=Close |
| 📴 Offline Mode | Service Worker + JS cache, syncs on reconnect |
| 📱 Mobile Ready | Fully responsive, mobile bottom navigation |

---

## ⌨️ Keyboard Shortcuts

| Key | Action |
|---|---|
| `A` | Open Add Medicine modal |
| `/` | Focus search bar |
| `R` | Go to Reorder page |
| `D` | Go to Dashboard |
| `I` | Go to Inventory |
| `N` | Go to Analytics |
| `Esc` | Close any open modal |

---

## 🗄️ Database Tables

| Table | Purpose |
|---|---|
| `medicines` | Core inventory data |
| `stock_movements` | Track every dispense & restock |
| `reorder_requests` | Supplier reorder history |
| `alerts` | Auto-generated low stock / expiry alerts |

---

## 🔒 Security

- Row Level Security (RLS) enabled on all tables
- Public access policy for single-user clinic setup
- For multi-user: replace policies with `auth.uid()` checks

---

## 🧩 Tech Stack

- **HTML + CSS + Vanilla JS** — No framework, no build tools
- **Supabase** — PostgreSQL backend with real-time subscriptions
- **Chart.js** — Analytics charts
- **Lucide Icons** — Icon system
- **Html5-QRCode** — Barcode / QR scanner
- **Web Speech API** — Voice search (browser native)
- **Satoshi Font** — Via Fontshare CDN

---

## 📞 CDN Dependencies Used

```html
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://unpkg.com/lucide@latest"></script>
<script src="https://unpkg.com/html5-qrcode"></script>
<link href="https://api.fontshare.com/v2/css?f[]=satoshi@400,500,700&display=swap" rel="stylesheet">
```

---

## 🛠️ Troubleshooting

| Issue | Fix |
|---|---|
| App shows "Demo Mode" toast | Set `SUPABASE_URL` and `SUPABASE_ANON_KEY` in the HTML file |
| Data not saving | Check browser console for Supabase errors; verify RLS policies |
| Barcode scanner not working | Allow camera permission in browser; use HTTPS or localhost |
| Voice search not working | Allow microphone permission; only works in Chrome/Edge |
| Charts not rendering | Ensure internet connection for CDN to load Chart.js |

---

## 📱 Mobile Usage

On mobile devices:
- Navigation collapses to a bottom tab bar
- All table rows become card-style layouts
- Touch targets are minimum 44px
- Barcode scanning uses rear camera by default