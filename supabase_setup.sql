-- 1. waitlist 테이블 생성
CREATE TABLE waitlist (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  source text NOT NULL,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Row Level Security (RLS) 활성화
ALTER TABLE waitlist ENABLE ROW LEVEL SECURITY;

-- 3. Select (조회) 정책: 누구나 카운트를 셀 수 있도록 (또는 조회할 수 있도록) 허용
CREATE POLICY "Enable read access for all anonymous users" ON waitlist
  FOR SELECT
  USING (true);

-- 4. Insert (삽입) 정책: 누구나 데이터를 추가할 수 있도록 허용
CREATE POLICY "Enable insert for all anonymous users" ON waitlist
  FOR INSERT
  WITH CHECK (true);
