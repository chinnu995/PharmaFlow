-- Medicines Table
CREATE TABLE medicines (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 0,
  unit TEXT DEFAULT 'tablets', -- tablets / capsules / ml / units
  expiry_date DATE NOT NULL,
  threshold INTEGER NOT NULL DEFAULT 10, -- minimum stock level
  critical_level INTEGER NOT NULL DEFAULT 5,
  supplier_name TEXT,
  supplier_phone TEXT,
  supplier_whatsapp TEXT,
  is_chronic_disease_med BOOLEAN DEFAULT FALSE,
  chronic_disease_tag TEXT, -- 'Diabetes' | 'Hypertension' | 'Asthma' | 'Cardiac' | 'Arthritis'
  barcode TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Stock Movements Table (for tracking usage)
CREATE TABLE stock_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  medicine_id UUID REFERENCES medicines(id) ON DELETE CASCADE,
  change_amount INTEGER NOT NULL, -- negative = dispensed, positive = restocked
  reason TEXT, -- 'dispensed' | 'restock' | 'expired_disposal' | 'adjustment'
  notes TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Reorder Requests Table
CREATE TABLE reorder_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  medicine_id UUID REFERENCES medicines(id) ON DELETE CASCADE,
  requested_quantity INTEGER NOT NULL,
  status TEXT DEFAULT 'pending', -- 'pending' | 'sent' | 'received'
  sent_at TIMESTAMP,
  received_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Alerts Table
CREATE TABLE alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  medicine_id UUID REFERENCES medicines(id) ON DELETE CASCADE,
  alert_type TEXT NOT NULL, -- 'low_stock' | 'critical_stock' | 'expiring_soon' | 'expired' | 'reorder'
  message TEXT NOT NULL,
  is_dismissed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE medicines ENABLE ROW LEVEL SECURITY;
ALTER TABLE stock_movements ENABLE ROW LEVEL SECURITY;
ALTER TABLE reorder_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE alerts ENABLE ROW LEVEL SECURITY;

-- Allow public access (for small clinic single-user setup)
CREATE POLICY "public_access" ON medicines FOR ALL USING (true);
CREATE POLICY "public_access" ON stock_movements FOR ALL USING (true);
CREATE POLICY "public_access" ON reorder_requests FOR ALL USING (true);
CREATE POLICY "public_access" ON alerts FOR ALL USING (true);
