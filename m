Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B88C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 12 Mar 2022 13:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiCLNat (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 12 Mar 2022 08:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiCLNaq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 08:30:46 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733A3574A1
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:30 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 347EB3F30F
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647091768;
        bh=bxeIyEILguhVZg7q4olJhqVfW5jjl8OfwGMF3r7ek6k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mW7LYnznDLV/pVTkl0DBFCNzYMxw+Z8aSZi1AwwyvByd81BjMCvQCZoMzoYch4jv9
         a2i+G9tO9k2OJqEbGQcwbg1beaR+YCEN9Wr6N1lCvNORLrFlcmhpGmLqlCNwhNCN/c
         LrvZWHHYs0ERPueBlKXDIA964QsynYi9SIrqgTKg4RAsQb+6DZS12cJOjIuAfokZqq
         0T95ze75+2M+m9pxz13v8TxnaMD0tx7XxpK83lspkumullM009DfsY7CFH3NdamfjJ
         yDH10mtRkv0OWGNrsr0uaH0acRefrk2F8HI7I5/8NvQFtt6cqOytYfUFyo1CqOenZk
         wpkNNgdtSRQSQ==
Received: by mail-wm1-f69.google.com with SMTP id 26-20020a05600c22da00b00388307f3503so4396944wmg.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxeIyEILguhVZg7q4olJhqVfW5jjl8OfwGMF3r7ek6k=;
        b=IXRg55jcCgE14bqIi/fcnHccjKZd3Hr17KNKAfMu/SUlIl+e4NSjki3a/UeM0WgiDb
         WvLgyL0qx65PkfNNqgzIRymkWQKhlDD7a7hQofY+mEvqzlB8hzRIuML0d48AjV5gq6iD
         ahrjEm4lNSj0nVyZq3Ni3jjq4Rr8hF/mTD7RirdS3xVcQCHGV4kLvAUsjCcJWFAxS0HB
         5bO1lZftRwsl0ir3tJZ1CvMIJuQN/aZK0f680yQFUIOSDtNJKaGqsshYcuC1h5fKRFKm
         aUCTXyp1NfNPTDfmtyom8eTVnGOBHxh4+Btv8oZpYYyaG2zyvoTBt5NG7M88w9PmGIRU
         SuBQ==
X-Gm-Message-State: AOAM532/F4XbGA9lCYsqm4ywOELAS1U7GrrJ3kPQMP3drawKS9Lx2x63
        wf/cOidSYTvF7WQpeCgwgvUE2XwsF6VelBvBIARNQ68o/0ebxDhyrc6YEM/E2htayZgxmoUv1HA
        NszoPeRAuTOpdt1TdWcL/b4dezYy8U64df0bnTnJI34m3JHI=
X-Received: by 2002:a7b:c250:0:b0:389:7fe5:d34c with SMTP id b16-20020a7bc250000000b003897fe5d34cmr19242470wmj.83.1647091766882;
        Sat, 12 Mar 2022 05:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz5i5+OuGUNvCz/VZC21UZB6s3lmwCMCHTfnN0kBuu25n6H5eL3kzENek+qi2xjBkf4IC46g==
X-Received: by 2002:a7b:c250:0:b0:389:7fe5:d34c with SMTP id b16-20020a7bc250000000b003897fe5d34cmr19242450wmj.83.1647091766634;
        Sat, 12 Mar 2022 05:29:26 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 05:29:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
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
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 07/11] spi: Use helper for safer setting of driver_override
Date:   Sat, 12 Mar 2022 14:28:52 +0100
Message-Id: <20220312132856.65163-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper to set driver_override to reduce amount of duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 26 ++++----------------------
 include/linux/spi/spi.h |  2 ++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6937cf2d59e0..34f311224c47 100644
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

