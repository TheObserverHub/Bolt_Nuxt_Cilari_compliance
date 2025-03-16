/*
  # Create Test User

  Creates a test regular user for testing purposes.
  
  Email: user@cilari.com
  Password: User123!
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
  '11111111-1111-1111-1111-111111111111',
  'user@cilari.com',
  crypt('User123!', gen_salt('bf')),
  now(),
  now(),
  now()
);

-- Add user role
INSERT INTO public.user_roles (
  user_id,
  role
) VALUES (
  '11111111-1111-1111-1111-111111111111',
  'user'
);