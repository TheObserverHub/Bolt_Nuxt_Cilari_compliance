/*
  # Create Additional Test User

  Creates another test regular user for testing purposes.
  
  Email: tester@cilari.com
  Password: Test123!
*/

-- Insert test regular user into auth.users
INSERT INTO auth.users (
  id,
  email,
  encrypted_password,
  email_confirmed_at,
  created_at,
  updated_at
) VALUES (
  '22222222-2222-2222-2222-222222222222',
  'tester@cilari.com',
  crypt('Test123!', gen_salt('bf')),
  now(),
  now(),
  now()
);

-- Add user role
INSERT INTO public.user_roles (
  user_id,
  role
) VALUES (
  '22222222-2222-2222-2222-222222222222',
  'user'
);