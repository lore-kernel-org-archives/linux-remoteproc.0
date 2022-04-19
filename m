Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BF4C43219
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Apr 2022 11:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351552AbiDSLiM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Apr 2022 07:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351449AbiDSLhn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Apr 2022 07:37:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D8515723
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Apr 2022 04:35:00 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r13so32272827ejd.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Apr 2022 04:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TqdyAx2hKeSTzZvT1XZ7Yq5gael+ofTQxaoTtQ8gQMM=;
        b=hKtmLd1kRNuBSXB4Y7mNdjpReUDXku+irhd3zFAz4Ubd8SwaqokXDkdCB7GIdLbryC
         L5stcsj3hpBSraDpJqv7BG2O3Juzg/3EfXdjMZx8tIRDDKWLJOmn5wykqM0KVif5PYqp
         +fbosiRSyUUjDpvOJI0DDaXlJMdCEf054dEGpQoaLz8IrPX9Zzhk7Sdkp8zNYMq5cX+Z
         8lspMfQWfQIiZdDfVA4rWW44DdE2e4HYXE6T/UJCOpqm1oRwWHdeKhpVttS9B/fTWkB5
         pqEJAMzXa2pi405ICk55ytJCWuteAq9boASuNBt2ImF9uXS9tCWG8SQsjL+Xex8Ef3Lx
         WY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqdyAx2hKeSTzZvT1XZ7Yq5gael+ofTQxaoTtQ8gQMM=;
        b=rb4en7rYQQTgzLIyg8vV6761W+KUG2UNwZOYQR5BUuyFdwpG0FDxp7ELJUzbkiubwY
         yWufJdFCoSCTzh0NIBAtj19XyyK7Pm+2zUh6sQO/jePQXDk8U0GilS/2wN+zm/WT/AIe
         z47+3DhjlxeM7QnjuoFzPFAcaeQ5MPcYfXQXRkOD6EIhuwCio1Yyfyxnv7lS6zJm7G1y
         qKXatxWNGQL3tadwrUt7Vf4HqV48Jdwl5My2KJ9GP+D3yqxvLf86DlJ31K6+Q/m65MNI
         gBiqJHA9wnJvZCfTdbNmociRIW14WJQMZlkXNWoyccrczYQu85R+xsRP4N6NO6ng54SD
         yLiQ==
X-Gm-Message-State: AOAM530Z7aJ65R6Dp2rWYCYZj/2fXsj7LhK25ikigD3rAci5Iyypj+1s
        Ssi5kfxPg9w0ZhQcNsAZ+CMtYw==
X-Google-Smtp-Source: ABdhPJx88ZEAuzCMecJkvkFceLyooIkm16aVnjPesB1obT9t7K00kc35hC5MHq7VHsp1INz4DWoreQ==
X-Received: by 2002:a17:906:d555:b0:6da:ac8c:f66b with SMTP id cr21-20020a170906d55500b006daac8cf66bmr12918155ejc.107.1650368098510;
        Tue, 19 Apr 2022 04:34:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:34:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
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
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v7 07/12] spi: Use helper for safer setting of driver_override
Date:   Tue, 19 Apr 2022 13:34:30 +0200
Message-Id: <20220419113435.246203-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper to set driver_override to the reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 26 ++++----------------------
 include/linux/spi/spi.h |  2 ++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 890ff46c784a..be8f1a1e21b2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -71,29 +71,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct spi_device *spi = to_spi_device(dev);
-	const char *end = memchr(buf, '\n', count);
-	const size_t len = end ? end - buf : count;
-	const char *driver_override, *old;
-
-	/* We need to keep extra room for a newline when displaying value */
-	if (len >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, len, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
+	int ret;
 
-	device_lock(dev);
-	old = spi->driver_override;
-	if (len) {
-		spi->driver_override = driver_override;
-	} else {
-		/* Empty string, disable driver override */
-		spi->driver_override = NULL;
-		kfree(driver_override);
-	}
-	device_unlock(dev);
-	kfree(old);
+	ret = driver_set_override(dev, &spi->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 5f8c063ddff4..f0177f9b6e13 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -138,6 +138,8 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	for driver coldplugging, and in uevents used for hotplugging
  * @driver_override: If the name of a driver is written to this attribute, then
  *	the device will bind to the named driver and only the named driver.
+ *	Do not set directly, because core frees it; use driver_set_override() to
+ *	set or clear it.
  * @cs_gpiod: gpio descriptor of the chipselect line (optional, NULL when
  *	not using a GPIO line)
  * @word_delay: delay to be inserted between consecutive
-- 
2.32.0

