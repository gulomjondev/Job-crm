# 🎯 API Endpoints Summary for Swagger

Swagger-da barcha API-lar quyidagicha tashkil qilingan:

---

## Authentication Endpoints

\`\`\`
POST /api/auth/login/
   └─ Foydalanuvchi login qilish
\`\`\`

---

## SuperAdmin Endpoints

\`\`\`
/api/centers/
├─ GET    - Barcha markazlarni ro'yxat (List)
├─ POST   - Yangi markaz qo'shish (Create)
├─ GET    - Bir markazni olish (Retrieve by ID)
├─ PUT    - Markazni o'zgarrish (Full Update)
├─ PATCH  - Markazni qisman o'zgarrish (Partial Update)
├─ DELETE - Markazni o'chirish (Delete)
├─ POST   - activate - Markazni faollashtirish
└─ POST   - deactivate - Markazni deaktivlashtirish

/api/directors/
├─ GET    - Barcha direktorlarni ro'yxat
├─ POST   - Yangi direktor yaratish
├─ GET    - Bir direktorni olish
├─ PUT    - Direktorni o'zgarrish
├─ PATCH  - Direktorni qisman o'zgarrish
└─ DELETE - Direktorni o'chirish
\`\`\`

---

## Director/Manager Endpoints

\`\`\`
/api/branches/
├─ GET    - Barcha filiallarni ro'yxat
├─ POST   - Yangi filial ochish
├─ GET    - Bir filialni olish
├─ PUT    - Filialni o'zgarrish
├─ PATCH  - Filialni qisman o'zgarrish
├─ DELETE - Filialni o'chirish
├─ POST   - open - Filialni ochish
└─ POST   - close - Filialni yopish

/api/subjects/
├─ GET    - Barcha fanlarni ro'yxat
├─ POST   - Yangi fan qo'shish
├─ GET    - Bir fanni olish
├─ PUT    - Fanni o'zgarrish
├─ PATCH  - Fanni qisman o'zgarrish
└─ DELETE - Fanni o'chirish

/api/groups/
├─ GET       - Barcha guruhlarni ro'yxat
├─ POST      - Yangi guruh yaratish
├─ GET       - Bir guruhni olish
├─ PUT       - Guruhni o'zgarrish
├─ PATCH     - Guruhni qisman o'zgarrish
├─ DELETE    - Guruhni o'chirish
├─ GET       - statistics - Guruh statistikasi
└─ GET       - attendance-report - Davomati hisoboti
\`\`\`

---

## User Management Endpoints

\`\`\`
/api/students/
├─ GET                  - Barcha talabalarni ro'yxat
├─ POST                 - Yangi talaba qo'shish
├─ GET                  - Bir talabani olish
├─ PUT                  - Talabani o'zgarrish
├─ PATCH                - Talabani qisman o'zgarrish
├─ DELETE               - Talabani o'chirish
├─ POST   - block - Talabani bloklash
├─ POST   - assign-group - Talabani guruhga birikish
├─ GET    - attendance-history - Davomati tarixi
└─ GET    - payment-history - To'lov tarixi

/api/teachers/
├─ GET              - Barcha o'qituvchilarni ro'yxat
├─ POST             - Yangi o'qituvchi qo'shish
├─ GET              - Bir o'qituvchini olish
├─ PUT              - O'qituvchini o'zgarrish
├─ PATCH            - O'qituvchini qisman o'zgarrish
├─ DELETE           - O'qituvchini o'chirish
├─ POST  - rate - O'qituvchini baholash
├─ GET   - schedule - O'qituvchining jadvali
└─ GET   - performance - Faoliyat ko'rsatkichlari
\`\`\`

---

## Academic Endpoints

\`\`\`
/api/lessons/
├─ GET                   - Barcha darslarni ro'yxat
├─ POST                  - Yangi dars yaratish
├─ GET                   - Bir darsni olish
├─ PUT                   - Darsni o'zgarrish
├─ PATCH                 - Darsni qisman o'zgarrish
├─ DELETE                - Darsni o'chirish
├─ POST  - cancel - Darsni bekor qilish
└─ POST  - generate-online-link - Onlayn link generatsiya

/api/attendance/
├─ GET             - Barcha davomatlarni ro'yxat
├─ POST            - Davomat qo'yish
├─ GET             - Bir davomatni olish
├─ PUT             - Davomatni o'zgarrish
├─ PATCH           - Davomatni qisman o'zgarrish
├─ DELETE          - Davomatni o'chirish
└─ POST  - bulk-mark - Ommaviy davomat qo'yish

/api/assignments/
├─ GET    - Barcha uy vazifalarni ro'yxat
├─ POST   - Yangi uy vazifasi yaratish
├─ GET    - Bir uy vazifasini olish
├─ PUT    - Uy vazifasini o'zgarrish
├─ PATCH  - Uy vazifasini qisman o'zgarrish
└─ DELETE - Uy vazifasini o'chirish

/api/submissions/
├─ GET    - Barcha topshiriqlarni ro'yxat
├─ POST   - Uy vazifasini yuborish
├─ GET    - Bir topshiriqni olish
├─ PUT    - Topshiriqni o'zgarrish
├─ PATCH  - Topshiriqni qisman o'zgarrish
└─ DELETE - Topshiriqni o'chirish

/api/exams/
├─ GET             - Barcha imtihonlarni ro'yxat
├─ POST            - Yangi imtihon yaratish
├─ GET             - Bir imtihonni olish
├─ PUT             - Imtihonni o'zgarrish
├─ PATCH           - Imtihonni qisman o'zgarrish
├─ DELETE          - Imtihonni o'chirish
└─ GET  - results - Imtihon natijalari

/api/exam-results/
├─ GET    - Barcha natijalari ro'yxat
├─ POST   - Imtihon natijasini kiritish
├─ GET    - Bir natijani olish
├─ PUT    - Natijani o'zgarrish
├─ PATCH  - Natijani qisman o'zgarrish
└─ DELETE - Natijani o'chirish
\`\`\`

---

## Financial Endpoints

\`\`\`
/api/payments/
├─ GET              - Barcha to'lovlarni ro'yxat
├─ POST             - Yangi to'lov qo'shish
├─ GET              - Bir to'lovni olish
├─ PUT              - To'lovni o'zgarrish
├─ PATCH            - To'lovni qisman o'zgarrish
├─ DELETE           - To'lovni o'chirish
├─ GET  - debtors - Qarzdor talabalar
└─ GET  - statistics - To'lov statistikasi

/api/payroll/
├─ GET             - Barcha oyliklar ro'yxat
├─ POST            - Yangi oylik yaratish
├─ GET             - Bir oylikni olish
├─ PUT             - Oylikni o'zgarrish
├─ PATCH           - Oylikni qisman o'zgarrish
├─ DELETE          - Oylikni o'chirish
└─ POST  - mark-paid - Oylikni to'lanadi deb belgilash
\`\`\`

---

## Operations Endpoints

\`\`\`
/api/rooms/
├─ GET                     - Barcha xonalarni ro'yxat
├─ POST                    - Yangi xona qo'shish
├─ GET                     - Bir xonani olish
├─ PUT                     - Xonani o'zgarrish
├─ PATCH                   - Xonani qisman o'zgarrish
├─ DELETE                  - Xonani o'chirish
└─ POST  - toggle-availability - Xonaning mavjudligini o'zgarrish

/api/contracts/
├─ GET        - Barcha shartnomalarni ro'yxat
├─ POST       - Yangi shartnoma yaratish
├─ GET        - Bir shartnomani olish
├─ PUT        - Shartnomani o'zgarrish
├─ PATCH      - Shartnomani qisman o'zgarrish
├─ DELETE     - Shartnomani o'chirish
└─ POST  - verify - Shartnomani tasdiqlash

/api/leads/
├─ GET                      - Barcha leadlarni ro'yxat
├─ POST                     - Yangi lead yaratish
├─ GET                      - Bir leadni olish
├─ PUT                      - Leadni o'zgarrish
├─ PATCH                    - Leadni qisman o'zgarrish
├─ DELETE                   - Leadni o'chirish
├─ POST  - convert-to-student - Leadni talabaga aylantirish
└─ GET   - statistics - Lead statistikasi
\`\`\`

---

## User Endpoints

\`\`\`
/api/notifications/
├─ GET                   - Barcha xabarnomalarni ro'yxat
├─ POST                  - Yangi xabarnoma yaratish
├─ GET                   - Bir xabarnomani olish
├─ PUT                   - Xabarnomani o'zgarrish
├─ PATCH                 - Xabarnomani qisman o'zgarrish
├─ DELETE                - Xabarnomani o'chirish
└─ POST  - mark-all-read - Barcha xabarnomalarni o'qilganlik belgilash
\`\`\`

---

## HTTP METHODS EXPLANATION

### GET (Olish)
- **List**: `/api/course/` - Barcha kurslarni olish
- **Retrieve**: `/api/course/1/` - ID bo'yicha bir kursni olish

### POST (Yaratish/Yuborish)
- **Create**: `/api/course/` - Yangi kurs yaratish
- **Custom Action**: `/api/course/1/activate/` - Kurs faollashtirish

### PUT (To'liq yangilash)
- **Update**: `/api/course/1/` - Butun kursni yangilash (barcha maydonlar)

### PATCH (Qisman yangilash)
- **Partial Update**: `/api/course/1/` - Faqat kerakli maydonlarni yangilash

### DELETE (O'chirish)
- **Delete**: `/api/course/1/` - Kursni o'chirish

---

## RESPONSE STATUS CODES

| Status | Meaning |
|--------|---------|
| 200 | OK - So'rov muvaffaqiyatli bajarildi |
| 201 | Created - Yangi resurs yaratildi |
| 204 | No Content - Muvaffaqiyatli, javob yo'q (DELETE) |
| 400 | Bad Request - Noto'g'ri ma'lumot |
| 401 | Unauthorized - Autentifikatsiya shart |
| 403 | Forbidden - Ruxsatnoma yo'q |
| 404 | Not Found - Resurs topilmadi |
| 500 | Server Error - Server xatosi |

---

**Bu hujjat Swagger-da to'g'ri ko'rinish uchun tayyorlandi!**
