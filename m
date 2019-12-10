Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 5/5] MAINTAINERS: Add myself as reviewer for Ingenic rproc driver
Date: Tue, 10 Dec 2019 17:40:14 +0100
Message-Id: <20191210164014.50739-5-paul@crapouillou.net>
In-Reply-To: <20191210164014.50739-1-paul@crapouillou.net>
References: <20191210164014.50739-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-ID: <linux-remoteproc@vger.kernel.org>

Add myself as the reviewer for the Ingenic VPU remoteproc driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v4: New patch

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd5847e802de..d82814ef2bee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8197,6 +8197,7 @@ F:	drivers/mtd/nand/raw/ingenic/
 F:	drivers/pinctrl/pinctrl-ingenic.c
 F:	drivers/power/supply/ingenic-battery.c
 F:	drivers/pwm/pwm-jz4740.c
+F:	drivers/remoteproc/ingenic_rproc.c
 F:	drivers/rtc/rtc-jz4740.c
 F:	drivers/tty/serial/8250/8250_ingenic.c
 F:	drivers/usb/musb/jz4740.c
-- 
2.24.0
