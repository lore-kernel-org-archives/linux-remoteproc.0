Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8DAC3526F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Apr 2022 11:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349921AbiDSLiJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Apr 2022 07:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351423AbiDSLhk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Apr 2022 07:37:40 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E925DED5
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Apr 2022 04:34:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i27so32244956ejd.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Apr 2022 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mHITSW/sgmw/Csyhuirx5ijnYnrGvi4Rk0KXIhii9OU=;
        b=RnhwUSNPSlsDsHGPitwMc/StYqoJqak4SKMxZbfS2eb8LtGLb63EvbePNBmDHLltnr
         a95QDWP3DSxLY6QLGPjfmuL6tPXJGC7TYPqcPniVL9iZgwlT3Rp6PxuuP/hHZOROpblY
         4xSqkC1UhzTftf64Pmfucom7rA2Be++fNWm4OyhtZFTtY74JnIyzObWJz5rtFh5ybYsH
         gtsw9Mpgs+Y6wXCa9TfpK2EwMMzg2ejUgOgTwTN0Svrls8LBuQSnqM9jsPd58NbbXscC
         Sopr0DYbonlMU/RRIFHcBUzsXdrFy3z5QLa5yDOoeuXh955iaImcAPyBngHbSKOF9aOa
         dXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHITSW/sgmw/Csyhuirx5ijnYnrGvi4Rk0KXIhii9OU=;
        b=T7aUTtIJLtmOgqcN5eNFYlD3IG8WkFQxhQeULB4SonhkQWlj7Im5i3UHLNTRHnKApg
         1AKl+NKt2xqwi6SkBFEojrA830Xl9n5pmgrO357sEaqgkkVAA4WnUvU5rUn4OcLwJO1p
         c90PEKbk2A7XrteI4xXHIJCMfvVcdcT6/Atd289yGwrxMcfWzs7ZENZonoIf4kJu/d+f
         XWX259cRJIsN785tisS9j0tXrxk3nFwjnquz0j2z2UyM0w88KA+NN+F+XEW4fN+Obq8A
         evm/fg0vmuCUH2wI/MAYFuGKWEYbvcFjOptdNxvMew6/WxPsNJn2wVMAYWrz1+HJjFD0
         1zmg==
X-Gm-Message-State: AOAM533AlZ7O4sB9E+HGseQ84pXaP+YEyBg/XwBNWfFTz3Y3V/EgVN9Y
        vAFgFyI7L5xX20ltZLFOk6uV+w==
X-Google-Smtp-Source: ABdhPJz05wDzulDX1uvC/c0sYcGCEPyff/Cn9Wz9PTsBlv3egJ1Qqj70FmLi/yekmWxgOyyFheLI5Q==
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id nd41-20020a17090762a900b006da79534df0mr12923778ejc.316.1650368095428;
        Tue, 19 Apr 2022 04:34:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:34:55 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 05/12] PCI: Use driver_set_override() instead of open-coding
Date:   Tue, 19 Apr 2022 13:34:28 +0200
Message-Id: <20220419113435.246203-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper to set driver_override to the reduce amount of duplicated
code.  Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index c263ffc5884a..fc804e08e3cb 100644
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
index 60adf42460ab..844d38f589cf 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,11 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

