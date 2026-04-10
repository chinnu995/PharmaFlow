-- =================================================================
-- PharmaFlow – Seed Data
-- Run this AFTER schema.sql in Supabase SQL Editor
-- =================================================================

INSERT INTO medicines (
  name, category, quantity, unit, expiry_date,
  threshold, critical_level,
  is_chronic_disease_med, chronic_disease_tag,
  supplier_name, supplier_phone, supplier_whatsapp
) VALUES
  (
    'Metformin 500mg', 'Antidiabetic', 8, 'tablets', '2026-09-01',
    20, 5,
    TRUE, 'Diabetes',
    'MediPharm Wholesale', '9876543210', '9876543210'
  ),
  (
    'Amlodipine 5mg', 'Antihypertensive', 4, 'tablets', '2026-07-15',
    15, 5,
    TRUE, 'Hypertension',
    'CityMed Suppliers', '9123456789', '9123456789'
  ),
  (
    'Paracetamol 650mg', 'Painkiller', 85, 'tablets', '2027-03-20',
    30, 10,
    FALSE, NULL,
    'MediPharm Wholesale', '9876543210', '9876543210'
  ),
  (
    'Salbutamol Inhaler', 'Respiratory', 3, 'units', '2026-04-30',
    5, 2,
    TRUE, 'Asthma',
    'BreatheWell Pharma', '9988776655', '9988776655'
  ),
  (
    'Aspirin 75mg', 'Cardiac', 12, 'tablets', '2025-12-01',
    20, 5,
    TRUE, 'Cardiac',
    'CityMed Suppliers', '9123456789', '9123456789'
  ),
  (
    'Amoxicillin 500mg', 'Antibiotic', 22, 'capsules', '2026-12-10',
    15, 5,
    FALSE, NULL,
    'MediPharm Wholesale', '9876543210', '9876543210'
  );
