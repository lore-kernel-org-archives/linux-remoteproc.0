Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C288C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Feb 2022 13:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiB0Nx3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Feb 2022 08:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiB0Nx0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:53:26 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058E2E09F
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:49 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DBA2A40608
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969963;
        bh=kn+qF0tdCo1etTHWEFOqoxtrhJ+rC4czu2ZZy5+SihI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=WlQEnPKIEePgugSx9iUYOn0DTmnQ+d7BtOIg4MGaZ+9cGE5YCqkk8Ofshq7hBm9Tr
         FLW6tnN5BgDuLs6McmJLswvsUbjdaPITe+HzA3UDzCe0JdLfeqhzLrFKlAQIX2QlmW
         D6f/l3UX0Szlk1hEA9r+jNp/m9IoLjR3gtKjVb0JP8HG6LY48++sIs7rLwjj2gVz2V
         /GQQMSU5qDA1VJM3tnsSk7LqH3riSbdq54vvrybAxGgsVpga4Sn+wmlGQ/SoCPF7hk
         uHoLl/yrkSqYCVNFYZ9UvvYPUD8jl5LWfGmD7FdK56ktalmwzFJNN2GCXWfVgoN/rs
         ZsRgk3vKodZ2A==
Received: by mail-ed1-f69.google.com with SMTP id f9-20020a0564021e8900b00412d0a6ef0dso4242811edf.11
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kn+qF0tdCo1etTHWEFOqoxtrhJ+rC4czu2ZZy5+SihI=;
        b=YeFT1GbhF8XasEGgWaJn/838guusnloGueAQy/x4DbLEbwdApd7uIYmRzh+VqsTQuK
         6C68BSHTiPJp6s1tmc1I78pbT1pKkix2dKTzFrHUgAJVeaQuJiNBIk5jtsa4P0MVgkgo
         rA2YLqsIpgNsogV8hLEXHzh2VarABkGdoo8nPMWcr98lmk4OlOx9NJY+vDBzSrdpL3KB
         n9Pbv3M54n3c22jpsqG8zRaMXoYiEmi3vDzYmtApxNLflKxOYqRcV3rLN9BA8kCVXH6+
         UdUw4q/FTi4zz6r7WF0AVltLheFf+VjgFg+5djgmKVOpWCNomnF5Ii5G4cb23RS9DY9Y
         Ap4A==
X-Gm-Message-State: AOAM532ad2mXH9cE0EwC1xiGgaTvNsBGKFNg1IVCQKJBAzZirbhH+fj4
        ylNcxkR/joJW63tcFwpt3iu5jcafsK1LrKkIDd9wNnW+5G4zsML86vvzl5yAo+I+croM5q/Hr1g
        WmfuqW/FdR13uIec/Cq8AeufM/KGBqaHtDlxpG3pcUSNdPwQ=
X-Received: by 2002:aa7:c4da:0:b0:410:bb1d:8232 with SMTP id p26-20020aa7c4da000000b00410bb1d8232mr15075918edr.333.1645969961199;
        Sun, 27 Feb 2022 05:52:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhg/i5aHofZaz+ahzc6dFTcb8xbpOjhh0OtL6Jhkm85pFdhXbdMsjLVRzYgEWWn1QmpSdqKg==
X-Received: by 2002:aa7:c4da:0:b0:410:bb1d:8232 with SMTP id p26-20020aa7c4da000000b00410bb1d8232mr15075900edr.333.1645969960978;
        Sun, 27 Feb 2022 05:52:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:40 -0800 (PST)
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
Subject: [PATCH v3 06/11] s390: cio: Use driver_set_override() instead of open-coding
Date:   Sun, 27 Feb 2022 14:52:09 +0100
Message-Id: <20220227135214.145599-7-krzysztof.kozlowski@canonical.com>
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
 drivers/s390/cio/cio.h |  7 ++++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..e110c10613e8 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,12 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index fa8293335077..913b6ddd040b 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -338,31 +338,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct subchannel *sch = to_subchannel(dev);
-	char *driver_override, *old, *cp;
-
-	/* We need to keep extra room for a newline */
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
-	device_lock(dev);
-	old = sch->driver_override;
-	if (strlen(driver_override)) {
-		sch->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		sch->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &sch->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

