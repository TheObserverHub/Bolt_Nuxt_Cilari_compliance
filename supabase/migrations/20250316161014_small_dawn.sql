/*
  # Create Test Admin User

  Creates a test admin user for initial system access.
  
  Email: admin@cilari.com
  Password: Admin123!
*/

-- Insert test admin user into auth.users
INSERT INTO auth.users (
  id,
  email,
  encrypted_password,
  email_confirmed_at,
  created_at,
  updated_at
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'admin@cilari.com',
  crypt('Admin123!', gen_salt('bf')),
  now(),
  now(),
  now()
);

-- Add admin role
INSERT INTO public.user_roles (
  user_id,
  role
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'admin'
);