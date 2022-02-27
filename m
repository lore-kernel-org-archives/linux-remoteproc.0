Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B377C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Feb 2022 13:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiB0Nxh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Feb 2022 08:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiB0Nxa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:53:30 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B9F13F40
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:52 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 313D9402DD
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969970;
        bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=fN2t5/EE2yhwXd0uArW+F/K+cHueu8APZJPBMtBVxrSBENxOvTULI4qFYk82aWCCO
         RwF9mhHhUtr7RoOqNoXxdDAOzRpNF3+zgIYyHBVEsZuJ4tqDRbdb15GjJV2Jx2USRZ
         fr7V489qhuLTKsO+/Z3M5XWyXDqDNVqpd7yyPIlWm2N2rT4busKiowhLeo3fkF1Xdl
         15gDTK6fxcKMkVY+8BdJsqeIDYRsIaIimLpuV8qWBgCG46oY2Jqy0vhDys/p7oTbVj
         wMETxWlEsvzi7+DUhi8ZHuQbd7aa7+pDDaf1HZzygG0DuUOy/mrrvRex/RKXo6IqH+
         psweF0VmAgKCg==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4234957edt.20
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
        b=YF476oohFrCA5ufRtPL2y9i54J7pjhXyfte1Wcrs+Zw9SNXgmj2eWhfqx7unlxzLmv
         oQvKxS/0lnq4TgeIflvHnKQ89Zm6aZ+oSwNWmFAOsgeVrxhxz4IU1QB5QG+H5uXN3ORe
         VT8qtcaOdrjG/sEt0AXGkUE1cNdBgWaNXrhJDkziBMMXong/X098D0pIyLqnLKJt1Ixx
         PuL2QXN6hpDpbnW6deV9qKahY5F+tn++DHdVfkz8n+zKw4jSFEqr7vvQOZo0IlcdHE22
         uV6AoGgm7oVyZGDZUN8R9E9zIDo0WCRgxplOaySFTlzUpzRFhoQu0dXGovoCliW/M3En
         bugg==
X-Gm-Message-State: AOAM530Lu1vAlWLLkMRsaETq2dD9PRB1QR42CpwUFJOumhOIMCaWJvtG
        aVEs5c2KDKOzBRQZW2kPpO/8BQJ5RE2KJAPCoSR1Lr2BWVBSk+pJ4Djp1pwWaGzRwtds8T+I2IY
        n7LEvuT7IzWtsvGCOgfxHgdDAuKLai31wjNS/tpHwBgFs89s=
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr11873369ejy.236.1645969959551;
        Sun, 27 Feb 2022 05:52:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaPeLTnbLCXr36eOWjnDy8E4LI71/jJS3zMt9CSPHhfhuyTLYqyLKvSg58uZ5j7Z3tq7CVSw==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr11873353ejy.236.1645969959366;
        Sun, 27 Feb 2022 05:52:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:38 -0800 (PST)
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
Subject: [PATCH v3 05/11] PCI: Use driver_set_override() instead of open-coding
Date:   Sun, 27 Feb 2022 14:52:08 +0100
Message-Id: <20220227135214.145599-6-krzysztof.kozlowski@canonical.com>
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
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..5c42965c32c2 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
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
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..5c00a8aebdf9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,12 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

