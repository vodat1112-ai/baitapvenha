-- Dán toàn bộ vào Supabase > SQL Editor > Run

create table assignments(
  id uuid primary key default gen_random_uuid(),
  title text not null,
  pdf_path text,
  sheet text default '',
  active boolean default true,
  created_at timestamptz default now());

create table submissions(
  id uuid primary key default gen_random_uuid(),
  assignment_id uuid references assignments(id) on delete cascade,
  name text not null check (length(name) <= 80),
  cls text not null check (length(cls) <= 20),
  got int, total int, score10 numeric, done int, count int,
  labels jsonb, answers jsonb,
  created_at timestamptz default now());

alter table assignments enable row level security;
alter table submissions enable row level security;

-- Học sinh (chưa đăng nhập): chỉ xem phiếu đang mở và nộp bài
create policy "hs xem phieu" on assignments for select to anon, authenticated using (active);
create policy "hs nop bai" on submissions for insert to anon, authenticated with check (true);

-- Giáo viên (đã đăng nhập): toàn quyền với phiếu, xem/xoá bài nộp
create policy "gv quan ly phieu" on assignments for all to authenticated using (true) with check (true);
create policy "gv xem bai" on submissions for select to authenticated using (true);
create policy "gv xoa bai" on submissions for delete to authenticated using (true);

-- Nơi lưu file PDF đề bài
insert into storage.buckets (id, name, public) values ('pdfs', 'pdfs', true) on conflict do nothing;
create policy "ai cung doc pdf" on storage.objects for select using (bucket_id = 'pdfs');
create policy "gv tai pdf" on storage.objects for insert to authenticated with check (bucket_id = 'pdfs');
