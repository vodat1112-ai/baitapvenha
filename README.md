# Phiếu bài tập cuối tuần (Supabase)

Trang tĩnh trên GitHub Pages. Dữ liệu và bài nộp lưu ở Supabase. Không còn dùng `Code.gs` và Google Sheet.

## Cài đặt (khoảng 10 phút)
1. Tạo project tại supabase.com.
2. **SQL Editor** → dán toàn bộ `supabase.sql` → Run.
3. **Authentication → Users → Add user**: email `thao2910@phieubaitap.vn`, mật khẩu của cô/thầy, tích **Auto Confirm User**.
   Đăng nhập trên web bằng tên `Thao2910` (trang tự ghép thành email này, mật khẩu không nằm trong code).
4. **Authentication → Sign In / Providers → Email → tắt "Allow new users to sign up"**. Bắt buộc, nếu không người lạ tự đăng ký được và xem bài nộp.
5. **Project Settings → API**: chép *Project URL* và *anon public key* dán vào dòng `const SB_URL=... SB_KEY=...` trong `index.html`.
6. Tải `index.html` lên GitHub Pages như cũ, gửi link cho học sinh. Link không đổi qua các tuần.

## Mỗi tuần
1. Mở link → **Đăng nhập giáo viên** → điền tên phiếu, chọn file PDF, dán phiếu đáp án → **Đăng cho học sinh**.
2. Học sinh mở cùng link sẽ thấy đề PDF và các ô trả lời của tuần mới. Phiếu cũ và bài đã nộp vẫn được giữ, chọn trong mục **Bài đã nộp**.

## Cách viết phiếu đáp án
Mỗi dòng một ý: `Nhãn | Đáp án | Lựa chọn`
```
# 1. Tính nhẩm
8 + 6 = | 14
11 − 8 = | 3
# 4. Giải bài toán
Phép tính: | 9+8=17;8+9=17
Đáp số: | 17
# Tiếng Việt: điền s / x
…ách vở | s | s/x
…ông nhà | s;x | s/x
Em viết câu vào vở
```
- Có lựa chọn (`s/x`) → ô chọn. Đáp án là số → ô nhập số. Còn lại → ô nhập chữ.
- Nhiều đáp án đúng ngăn cách bằng `;`. Bỏ trống đáp án → không chấm.

## Lưu ý
- Trình duyệt không tự hiểu nội dung PDF để tạo ô trả lời, nên cần dán phiếu đáp án (khoảng 2 phút). Muốn tự động hoàn toàn cần thêm dịch vụ AI đọc PDF (có chi phí).
- Mật khẩu `123456` rất dễ đoán. Nên đổi trong Supabase (Authentication → Users) thành mật khẩu dài hơn.
- Đáp án đúng nằm trong dữ liệu trang nên học sinh biết kỹ thuật có thể xem được. Chấp nhận được với bài tập về nhà.
- Email thông báo mỗi bài nộp đã bỏ. Xem bài trực tiếp trên web hoặc ở Supabase → Table Editor.
