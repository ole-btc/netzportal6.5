-- -- Set up user and schema
CREATE USER IF NOT EXISTS 'btc_np_q'@'%' IDENTIFIED WITH mysql_native_password BY 'R3place2BetTerPwd.';

CREATE DATABASE IF NOT EXISTS btc_np_q CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS btc_np_q_content CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS btc_np_q_kun CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS btc_np_q_postcd CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS btc_np_q_powersupply CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

GRANT ALL ON btc_np_q.* TO 'btc_np_q'@'%';
GRANT ALL ON `btc_np_q_%`.* TO 'btc_np_q'@'%';

FLUSH PRIVILEGES;