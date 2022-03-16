Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C82FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Mar 2022 15:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353027AbiCPPKV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Mar 2022 11:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355094AbiCPPKP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Mar 2022 11:10:15 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C3E5C644
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2F0D53F612
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443338;
        bh=yjxT3cEgNPbxxzjxaxofFiViREMV9sxUDnIsV8OP+D8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Cmp6uJo3t4EV8dt+GE0CeAkGUBfejL367A567rpTxvyB48Lk4Z1bOvskK5ZIO5Aq/
         PfRCE2gAuAM4fAuh0hhmMAslRQar2RbSyCzOOln4Ca5axhTh4tdMeRj4UZhQc94Epw
         /oKaWKIwB2Wtx1YTsCsTiZQdXJ1co69h6ZAuQbXiqrrsPzC2mT6WtaHhcK4mzgVR8B
         fBwdBVV13uI/PS+b1xFFpREKqrtRk6v2xzZtHlB4g9Ls6PAtk4QcMzsF270D0u+b4D
         39gHxV4FiLc9YYgJGFXtZ5ACXvK3xyW7KH2OAHhPQlz3KoTbX8ACAUFjfdHKCTVmEV
         lbdtUgVWLeWhw==
Received: by mail-wm1-f71.google.com with SMTP id 12-20020a05600c24cc00b0038c6caa95f7so1131196wmu.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjxT3cEgNPbxxzjxaxofFiViREMV9sxUDnIsV8OP+D8=;
        b=Y8z/SC5EtnK0B/PEkLsNrrgyKUB/4lu9lxIk1WvVJ+GyPkTOAfo/Cu+qbQ82r4I9eR
         hQK+Fztx/41hNgf76cFknMla6xXIgs/NQoLnXn2cUlxmf4kQqr/dMDaX5qBw3b1h1pPc
         PUxyZvqhoFUdw/dvM9PBSB9g3iiR6mFlJbrbRpzgxA51PBb/LKv1ctZETcGx0E9O3AF3
         Blw+LXut1AF8AzzQIgodyr/ViMx0ZReVnoHSBHXvfo0GW7B0kl22S+KVnIHttz9ThUsx
         1hiy//KhEa1tjCu7jmM4kKDUowvTATDELlETtIFCgUfyqcHwzFF9fHcQBJX80ATETy9X
         ZVdg==
X-Gm-Message-State: AOAM531571WXLTY6L6s1RwoS/3RAw2wVPA4tHuAhQE8PtMjAPFu70FU/
        51NYlQCv+x7equrmN0Kc7U5/L5oCO1AUPAnFJEUlzLyO0+FoeCELN7A/aOlEfzG4P1NU+SAwDEK
        U17v1XqRgXsT9/ZjPwsqrECTKQTiOqWeBM+PgCOg4SJcusAA=
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id bi13-20020a05600c3d8d00b0038c6f6ee61amr2475285wmb.101.1647443337715;
        Wed, 16 Mar 2022 08:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxihfOFhqnyQOV2LqVMQfkoNfvlmhYMokdGWLXgOBRd3UZepsNC84lNIG8stGIAXm3FyJnJA==
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id bi13-20020a05600c3d8d00b0038c6f6ee61amr2475269wmb.101.1647443337539;
        Wed, 16 Mar 2022 08:08:57 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:08:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 08/11] vdpa: Use helper for safer setting of driver_override
Date:   Wed, 16 Mar 2022 16:08:00 +0100
Message-Id: <20220316150803.421897-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper to set driver_override to the reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/vdpa.c  | 29 ++++-------------------------
 include/linux/vdpa.h |  4 +++-
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 1ea525433a5c..2dabed1df35c 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -77,32 +77,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct vdpa_device *vdev = dev_to_vdpa(dev);
-	const char *driver_override, *old;
-	char *cp;
+	int ret;
 
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
-	old = vdev->driver_override;
-	if (strlen(driver_override)) {
-		vdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		vdev->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &vdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 721089bb4c84..37117404660e 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -64,7 +64,9 @@ struct vdpa_mgmt_dev;
  * struct vdpa_device - representation of a vDPA device
  * @dev: underlying device
  * @dma_dev: the actual device that is performing DMA
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  * @config: the configuration ops for this device.
  * @cf_mutex: Protects get and set access to configuration layout.
  * @index: device index
-- 
2.32.0

