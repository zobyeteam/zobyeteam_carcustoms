# 🚘 zobyeteam_carcustoms
> ระบบแต่งรถที่ครบเครื่องและสมบูรณ์แบบที่สุดจาก **ZOBYETEAM**
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/9735d39d-a74c-470c-b48b-a07df37545b8" />

---

## Videos
- [วิดีโออธิบายฟีเจอร์ทั้งหมด](https://www.youtube.com/watch?v=px9sjnRGP4I)
- [วิดีโอพรีวิวเวอร์ชัน 1](https://www.youtube.com/watch?v=8XzWZokReUQ)
- [วิดีโอพรีวิวเวอร์ชัน 2](https://www.youtube.com/watch?v=X9O3nnlcDyA)

## 🌟 ฟีเจอร์หลัก (Key Features)

1. **ระบบอู่แต่งรถหลัก (Car Customs Shop)**
   - เมนูแต่งประสิทธิภาพรถ (Tuning) และตกแต่งภายนอก (Cosmetics) อย่างสมบูรณ์แบบ
   - รองรับการระบุตำแหน่งอู่แต่งรถตามตำแหน่งแผนที่ โดยระบุ Blips และ Markers
   - สามารถระบุอาชีพเฉพาะของแต่ละอู่ได้ (เช่น อู่แต่งรถสำหรับตำรวจ/หมอ)
   - มีระบบคำนวณราคาทั้งแบบคูณตามราคารถพื้นฐาน และการฟิกราคาเฉพาะชิ้นสำหรับรถเฉพาะรุ่น
   - รองรับส่วนลดตามสายอาชีพ (Job Discounts) และการคิดธรรมเนียมเพิ่มเมื่อจ่ายผ่านธนาคาร (Bank Charge)
   - หน้าตา UI (NUI) สวยงาม ทันสมัย ใช้งานง่าย

2. **ระบบแต่งทรงล้อสแตนเซอร์ (Stancer Customs)**
   - ปรับความสูงโช๊ค (Suspension Height)
   - ปรับล้อยื่น-ยุบ (Wheels Offset)
   - ปรับมุมแคมเบอร์/ล้อแบะ (Wheels Y Rotation)
   - ปรับความกว้างหน้าล้อ (Wheel Width) และขนาดล้อ (Wheel Size)
   - ซิงค์การตั้งค่าของตัวรถให้ผู้เล่นคนอื่นรอบตัวเห็นแบบ Real-time
   - บันทึกค่าฟิตเม้นท์ล้อลงฐานข้อมูลโดยตรงเมื่อแต่งเสร็จ

3. **ระบบพ่นสีรถขั้นสูง (Color Customs)**
   - รองรับการพ่นสีสไตล์ Chameleon (สีเหลือบ)
   - สามารถเลือกพ่นสีสไตล์ Matte, Metallic, Chrome และพ่นสีแบบกำหนดค่าเอง (RGB/HSV)
   - เมื่อทำการแต่งสี ระบบจะเล่นแอนิเมชันหัวพ่นสีสเปรย์และสร้างเอฟเฟกต์สีพ่นรอบตัวรถตามพิกัดอู่ที่ตั้งไว้

4. **ระบบแต่งรถด้วยไอเทม (Item Customs / Mechanic Items)**
   - อนุญาตให้ช่างจูน (หรือผู้เล่นทั่วไป) สามารถใช้ไอเทมจากในตัวเพื่อทำการแต่งชิ้นส่วนรถ หรือแต่งสีรถได้ทันทีนอกอู่
   - เมื่อใช้งานไอเทม จะมีการเรียกใช้โมเดลแม่แรงยกรถ (`prop_carjack_l2`) ขึ้นมา และแสดงแอนิเมชันขณะทำงานพร้อม Progress Bar

---

## 📦 สิ่งที่ต้องมีก่อนติดตั้ง (Dependencies)

เพื่อให้ระบบทำงานได้อย่างสมบูรณ์แบบ เซิร์ฟเวอร์ของคุณต้องมีทรัพยากรต่อไปนี้ติดตั้งอยู่ก่อน:
- **`zobyeteam_wrapper`** (ระบบ Wrapper หลักที่รองรับและแปลงการทำงานเชื่อม Framework)
- **`oxmysql`** (ระบบจัดการและสืบค้นฐานข้อมูล MySQL)
- *แนะนำเพิ่มเติม (Optional):*
  - ระบบแจ้งเตือน (Notify) และระบบป้ายข้อความช่วยเหลือ (HelpText) ของคุณเอง
  - `zobyeteam_progbar` (แถบดาวน์โหลดพ่นสี/แต่งของชิ้นส่วน)
  - ระบบระบบการาจเก็บรถ (Garage Script) เช่น `nc_garage` เพื่อใช้เก็บข้อมูลการจูนรถของผู้เล่น

---

## 🛠️ วิธีการติดตั้ง (Installation Steps)

1. **คัดลอกโฟลเดอร์ทรัพยากร**
   - นำโฟลเดอร์ `zobyeteam_carcustoms` ไปใส่ไว้ในโฟลเดอร์ `resources` ของเซิร์ฟเวอร์คุณ

2. **รันคำสั่ง SQL**
   - นำไฟล์ SQL ที่อยู่ในโฟลเดอร์ `SQL/owned_vehicles.sql` ไปเปิดรัน (Query) ในฐานข้อมูลของคุณ ซึ่งคำสั่งจะเพิ่มคอลัมน์เก็บข้อมูลค่าสแตนเซอร์ล้อ:
     ```sql
     ALTER TABLE `owned_vehicles` ADD `stancer` longtext DEFAULT NULL;
     ```

3. **ตั้งค่ารหัสสิทธิ์การใช้งาน (Auth Token)**
   - เปิดไฟล์ [config/config_auth.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/config_auth.lua)
   - นำ Token ของคุณใส่ที่ตัวแปร:
     ```lua
     Config.Token = 'YOUR_TOKEN' -- ใส่ Token ของคุณตรงนี้
     ```

4. **เรียกใช้งานใน `server.cfg`**
   - เพิ่มบรรทัดเปิดใช้งานตามลำดับดังต่อไปนี้:
     ```cfg
     ensure oxmysql
     ensure zobyeteam_wrapper
     ensure zobyeteam_carcustoms
     ```

---

## ⚙️ วิธีการตั้งค่าอย่างง่าย (Configuration Guide)

สคริปต์นี้แยกส่วนการตั้งค่าออกเป็นไฟล์ย่อยในโฟลเดอร์ `config/` เพื่อให้สามารถปรับแต่งได้ง่ายและปลอดภัย:

### 1. ไฟล์หลัก [config/config.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/config.lua)
*   **`Config.Keys`**: ตั้งค่าปุ่มกดต่าง ๆ เช่น ปุ่มเปิดเมนูแต่งรถ ปุ่มเปิดแต่งทรงล้อ ปุ่มยกเลิกแต่งไอเทม
*   **`Config.Locations`**: พิกัดอู่แต่งรถหลัก คุณสามารถระบุพิกัด ระยะตรวจสอบ จำกัดอาชีพ และสไตล์ Blip / Marker ได้ เช่น:
    ```lua
    Config.Locations = {
        {
            Coords = vector3(-211.8160, -1323.5219, 29.9904), -- พิกัดจุดแต่ง
            Radius = 3,                                       -- ระยะกดใช้งาน
            Job = nil,                                        -- กำหนดอาชีพ (ใส่ nil คือแต่งได้ทุกคน)
            Blip = { Text = 'Car Custom', Sprite = 72, Scale = 0.8, Color = 1 },
            Marker = { Show = true, Type = 27, Color = vector3(0, 255, 0), Alpha = 100 }
        }
    }
    ```
*   **`Config.Vehicles` & `Config.Menus`**:
    - ตั้งค่าราคารถเริ่มต้นที่ `Config.Vehicles` เช่น รุ่น `elegy` ราคาฐานคือ `1500`
    - เมื่อผู้เล่นซื้อชิ้นส่วนแต่งใน `Config.Menus` ราคาแต่งจะคำนวณจาก `ราคาฐานรถ * PriceMultiplier` ของชิ้นส่วนนั้น ๆ
    - **`Config.FixedPrice`**: สำหรับการตั้งราคารถแต่งชิ้นส่วนใดชิ้นส่วนหนึ่งให้มีราคา "ตายตัว" โดยไม่สนสูตรตัวคูณ (ใช้สำหรับกันไม่ให้รถบางประเภทคิดราคาแต่งโอเวอร์เกินไป)

### 2. ไฟล์สแตนเซอร์ล้อ [config/config_stancer.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/config_stancer.lua)
*   **`Config.StancerPrice`**: ตั้งราคาปรับฟิตเม้นท์ล้อ
*   **`Config.StancerLocations`**: พิกัดจุดปรับแต่งสแตนเซอร์บนแผนที่
*   **`Config.DefaultStancerRanges`**: กำหนดขีดจำกัดสูงสุดและต่ำสุดของการปรับแต่งล้อ ได้แก่:
    - `SuspensionHeight` (ความสูงโช๊ค)
    - `WheelsOffset` (ระยะความล้น/หุบของล้อ)
    - `WheelsYRotation` (มุมแคมเบอร์/ล้อแบะ)
    - `WheelWidth` (ความกว้างหน้าล้อ)
    - `WheelSize` (ขนาดล้อใหญ่/เล็ก)
*   **`Config.StancerRanges`**: ปรับแต่งค่าลิมิตการตั้งค่าเฉพาะรถบางโมเดล (เช่น ตั้งค่าให้รถ Elegy แบะได้มากกว่าคันอื่น)

### 3. ไฟล์แต่งสีรถ [config/config_color_custom.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/config_color_custom.lua)
*   **`Config.ColorCustomLocations`**: พิกัดตู้พ่นสีรถ โดยสามารถระบุตำแหน่งหัวพ่นสีรอบตัวรถได้ที่ `SprayCoords` เพื่อให้เกิดเอฟเฟกต์สีพ่นชนตัวรถขณะทำงาน
*   **`Config.ColorCustomMenus`**: ประเภทของการลงสีที่เปิดให้ทำได้ พร้อมราคาส่วนต่าง

### 4. ไฟล์ไอเทมช่างแต่งรถ [config/config_items.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/config_items.lua)
ใช้ระบุว่าเมื่อกดใช้งานไอเทมช่างจากระบบ Inventory จะอัปเกรดชิ้นส่วนชิ้นใด:
```lua
Config.Items = {
    {
        ItemName = 'buzz',               -- ชื่อไอเทมในคลังระบบ (Inventory)
        Label = 'Engine LV2',            -- ข้อความแสดงชื่อไอเทม
        ModType = 11,                    -- ประเภท Mod (11 คือเครื่องยนต์)
        ModData = 1,                     -- ระดับของแต่ง (0 = LV1, 1 = LV2, 2 = LV3, ...)
        Prop = {                         -- วัตถุที่จะจำลองมาถือตอนทำงานซ่อม
            Model = 'prop_car_engine_01',
            Rotation = vector3(0.0, 0.0, 0.0),
            Coords = vector3(0.25, 0.0, -0.5),
        }
    },
}
```

---

## 🔄 การเชื่อมโยงกับฟังก์ชันของเซิร์ฟเวอร์ (Config Callbacks)

คุณสามารถนำสคริปต์การแจ้งเตือน, แถบโหลด, หรือระบบการบันทึกการาจของเซิร์ฟเวอร์คุณมาเชื่อมต่อได้ที่โฟลเดอร์ `config/functions/`:

### 🔗 ฝั่งผู้ใช้งาน (Client-Side Callbacks)
ไฟล์: [config/functions/config_callback_client.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/functions/config_callback_client.lua)
- `Config.Callback.Notify`: แก้ไขให้เรียกตัวแจ้งเตือนหลักในเซิร์ฟเวอร์ของคุณ
- `Config.Callback.Progbar`: สำหรับเปลี่ยนแถบความคืบหน้า (Progress Bar) ที่ใช้แต่งรถ
- `Config.Callback.IsOwnedVehicle`: ตรวจสอบความเป็นเจ้าของรถ เพื่อป้องกันไม่ให้แต่งรถคนอื่นได้
- `Config.Callback.CustomsSuccess`: ฟังก์ชันทำงานหลังผู้เล่นตกแต่งรถชิ้นนั้นสำเร็จ

### 🔗 ฝั่งเซิร์ฟเวอร์ (Server-Side Callbacks)
ไฟล์: [config/functions/config_callback_server.lua](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/config/functions/config_callback_server.lua)
- `Config.Callback.PurchasedMod` / `PurchasedColorCustoms` / `PurchasedStancer`: จุดสำหรับใส่ฟังก์ชันบันทึก log เช่น การบันทึกลงไฟล์ Discord Logs เมื่อผู้เล่นชำระเงินสำเร็จ
- `Config.Callback.SavedProps`: **สำคัญมาก!** ฟังก์ชันนี้ทำหน้าที่อัปเดตข้อมูลบันทึกความเปลี่ยนแปลงของการแต่งรถเข้ากับระบบการาจเก็บรถของคุณ (เช่น `nc_garage`, `esx_garage`, หรือ `qb-garage` เพื่อให้เวลาเรียกรถออกมาใหม่แต่งรถไม่หาย)

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](file:///Users/takzobye/Developer/projects/zobyeteam/scripts/zobyeteam_carcustoms/LICENSE) file for details.
