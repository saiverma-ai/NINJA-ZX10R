-- 1. Create the test_rides table
CREATE TABLE public.test_rides (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    full_name text NOT NULL,
    phone_number text NOT NULL,
    email_address text NOT NULL,
    booking_date date NOT NULL,
    time_slot text NOT NULL,
    riding_experience text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);

-- 2. Turn on Row Level Security (RLS)
-- This ensures that anonymous users (from your website) can safely insert data 
-- without being able to read or delete other people's data.
ALTER TABLE public.test_rides ENABLE ROW LEVEL SECURITY;

-- 3. Create a policy allowing your website visitors to insert new bookings
CREATE POLICY "Allow anonymous inserts" 
ON public.test_rides 
FOR INSERT 
TO anon 
WITH CHECK (true);
