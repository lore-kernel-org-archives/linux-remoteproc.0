Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C6C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Feb 2022 13:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbiB0Nxp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Feb 2022 08:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiB0Nxg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:53:36 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9454E09F
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:53 -0800 (PST)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9CA5441273
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969967;
        bh=lHEHPtP6JAM6zCrRNeDTlRy/WZxSvWGZvNHgREr2xAI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BddtnmlhtW0yc8uxzOxEKoC5UbmYRRVe65EIYowMdSJ1/yEdOzc01mJTayNtJOg/B
         g1okumschZUbP8Rx2cEMt6GQZlNkvZggCRim12RA2wpqM1ENlzlqv3AjXUNdZLYn4K
         eBGIeLnt1/PD+qgcmacUWduYJFsmbfUMEbHu11vSnCkkT1VX9uhpnuS7QDdPEjJ761
         VSguCWJ58LVZYl8nyl0YGodaXmfCausJXCJ7NqIte9A6kRIVSQ7LveHc/LRPPIzb/Z
         v/f0lfgiqhnktGFkDD06D8EUjfMChY2m6n9FHd5HUQpVKjpqIq78nZ3tTRVMjw9YXp
         e8eSBaDPfbk1Q==
Received: by mail-lf1-f69.google.com with SMTP id a5-20020ac25205000000b00443a34a9472so1393884lfl.15
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lHEHPtP6JAM6zCrRNeDTlRy/WZxSvWGZvNHgREr2xAI=;
        b=cvyyJHVqKwqtfqHWxQY5jBbnspwk0CmxooIVwgbffexvB9b15k84nDfKW3YJVlT/4C
         O+KAB9EUroD59zp0xxxOCSG1jAU94BKaLgOtnuX2ZvIsvlgx/STLP0RFN0v69T864Jgr
         jBcRQGAQI6j4HQ6hWpPpVu3KZjiBySHg6FYGAN2oHu1AmvmG7m/NRp8gbexDEK6GAI9v
         qUHeZ5s5B3MARn5wPr9h0lCKiE2MV7RfBfbphqTJ/ltRFBgaYAc0XxT9XvvQUvwaJ+WF
         IXUTimBt0lkxN+FHvZN2EbKs7V8P95Agr57EZn096Ygiv38XvN57tiUOOpUhkujCj1we
         Sh5g==
X-Gm-Message-State: AOAM532ffLegTG4B3yzZfueTu/GWHdgEEMMZhTZCnSaSL+/ZnUqkfZuo
        z58dURheob34QtMy4yAcH1DV/j0u4qSkDD0WxkAQOat1P9EciiLS7YtvaG8QgLkgRGo7pOpR7tw
        Xcf3zID0ryZpuRsqcgpccHTzyrrbHA3Yx9A5DO81+xIfZD10=
X-Received: by 2002:a17:906:d10c:b0:6cd:4aa2:cd62 with SMTP id b12-20020a170906d10c00b006cd4aa2cd62mr12751224ejz.229.1645969956021;
        Sun, 27 Feb 2022 05:52:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXq+ZARVgwx9GQqR/xqmr4FidvI0jbXs/SPWVteyhvLCXz3Udlc0TuaU2TzyIf2JoyZYkY6w==
X-Received: by 2002:a17:906:d10c:b0:6cd:4aa2:cd62 with SMTP id b12-20020a170906d10c00b006cd4aa2cd62mr12751178ejz.229.1645969955744;
        Sun, 27 Feb 2022 05:52:35 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 03/11] fsl-mc: Use driver_set_override() instead of open-coding
Date:   Sun, 27 Feb 2022 14:52:06 +0100
Message-Id: <20220227135214.145599-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper for seting driver_override to reduce amount of duplicated
code. Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 ++++---------------------
 include/linux/fsl/mc.h          |  6 ++++--
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 8fd4a356a86e..ba01c7f4de92 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -166,31 +166,14 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	char *driver_override, *old = mc_dev->driver_override;
-	char *cp;
+	int ret;
 
 	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
 		return -EINVAL;
 
-	if (count >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	if (strlen(driver_override)) {
-		mc_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		mc_dev->driver_override = NULL;
-	}
-
-	kfree(old);
+	ret = driver_set_override(dev, &mc_dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 7b6c42bfb660..7a87ab9eba99 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -170,7 +170,9 @@ struct fsl_mc_obj_desc {
  * @regions: pointer to array of MMIO region entries
  * @irqs: pointer to array of pointers to interrupts allocated to this device
  * @resource: generic resource associated with this MC object device, if any.
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  *
  * Generic device object for MC object devices that are "attached" to a
  * MC bus.
@@ -204,7 +206,7 @@ struct fsl_mc_device {
 	struct fsl_mc_device_irq **irqs;
 	struct fsl_mc_resource *resource;
 	struct device_link *consumer_link;
-	char   *driver_override;
+	const char *driver_override;
 };
 
 #define to_fsl_mc_device(_dev) \
-- 
2.32.0

