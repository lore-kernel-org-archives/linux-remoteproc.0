Return-Path: <jdelvare@suse.de>
Date: Thu, 1 Dec 2016 09:49:55 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: remoteproc/ste: Hide config option by default
Message-ID: <20161201094955.4c4eefe3@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Back in July 2014 I asked around what was the intended target
platform for the STE Modem remoteproc driver, so that I could add the
proper hardware dependency to its config option. The answer I got was
that there was no known publicly available hardware needing it and it
was unlikely that there ever would.

Still there were objections to deleting the driver, which I do not
really understand, but I do respect. But as there is no point in
presenting the config option by default, let's hide it unless
build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
Cc: Suman Anna <s-anna@ti.com>
---
As suggested by Linus Walleij over 2 years ago, sorry for not
following up back then:
  https://lkml.org/lkml/2014/7/25/218

The driver could also be moved to staging/.

 drivers/remoteproc/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-4.9-rc7.orig/drivers/remoteproc/Kconfig	2016-11-08 15:01:12.247924911 +0100
+++ linux-4.9-rc7/drivers/remoteproc/Kconfig	2016-12-01 09:23:57.379218183 +0100
@@ -34,11 +34,12 @@ config OMAP_REMOTEPROC
 config STE_MODEM_RPROC
 	tristate "STE-Modem remoteproc support"
 	depends on HAS_DMA
+	depends on COMPILE_TEST
 	select REMOTEPROC
 	default n
 	help
 	  Say y or m here to support STE-Modem shared memory driver.
-	  This can be either built-in or a loadable module.
+	  Note that there is no known available system needing this driver.
 	  If unsure say N.
 
 config WKUP_M3_RPROC


-- 
Jean Delvare
SUSE L3 Support
