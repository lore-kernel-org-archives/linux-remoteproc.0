Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946838A72B
	for <linux-remoteproc@vger.kernel.org>; Mon, 10 Aug 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339161; cv=none; b=Y9aou7Lr9zEVRIn5oiLD5rOld3uCkbEL+QGLXaljVJZHZUkSTrf1QU2Xerc3zn2m9W6mZy4syxXP643i6PNCM9pG2R2QWZlgfHRs05tCi3JCCs91UtzKuO9l/M9Am5jf7qUshO6ycclhGqFln6uMar59vhGp9z8WM7UXaVdn+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339161; c=relaxed/simple;
	bh=F1pNE1VrvpE7Tz6k4xh7UkByI5J615ZHetHbWSXP4ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pe1ekohRpGpQyu4perDbREnxOr+xvo8sXmyKLBbhjAfIX6MyehVL4NBXntkH5uWqulo804Gi460WLviXEmCLLyfI8aiMhf/oVXh3O44awwkXBb6UbIHxOyWstSG84gOqcvXFT+GxZzWF3GecETz8l2AhTAO7nPKcmow34oyNo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tD7Pgv/O; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tD7Pgv/O"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1483252a12.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 22:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339159; x=1786943959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI9faRZSTIszr47oobd68OEMax5S7fpjoTSXLtSJlgU=;
        b=tD7Pgv/ONXRWVDUE0Ke4OXKPK3X+TMF9DrNf1SG0VvTNsD07ERzsZslrUTwZBqxBqn
         +kEVjCWO2XEdGVxiwrEicgFod56wmrzBuMGvGPkEC40vHH8frjYPh9z8e8bv1dE0LTTa
         XnQ40XJw9dzq/+OFyNPriiSfPygOQOxCEo8Pn4C66rtG9x0F2X/eKAh/Eza8ne/BMB+t
         PwvWIyjD+O0ovqwxJ7ZHVnHeyfASVIMzNcJNHSaXa5q94zQuO6NPTcsaM4Y1Bs3DXntX
         WVlPTNnwur9Ewj0W+7ya1grkjiPDdEc9UNb38HHqgzSULdIYzkxSEdcwX5dg8p4B0kEx
         Y1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339159; x=1786943959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI9faRZSTIszr47oobd68OEMax5S7fpjoTSXLtSJlgU=;
        b=lF3XLnuzP8sePtVej6eeLvVNygxJp7+hoOQYOoX+U2IMZK3CR6S1G9TSnWC1BtbbFM
         UNvfxQvHwCcvNd2JLweNCdktrJ4rjRyA8YJKwod0/zSnwgteTSkMNxkaq3aopgqCPgk1
         P/MfnHHXSdzi95F2G/xrHRRimKDAu4OPMyEtNVwtAfwVypbpHSYZbv8YUh4Xc0GgMHEO
         zzte0gQ3zVaJUDltBwl7PqLXHotzMP0Gaa1mJfFP8Qv1jOXo4sr3+3m2aDnPnN8zCSlA
         PXgxksICJhKZ1hlNfQ7HYOzBe6Qz4PRvF0dyRs89XafmYWrwHf0dsaKFEIOzYLliO/kQ
         1BjQ==
X-Gm-Message-State: AOJu0Yw2tHJEtd9BLPrtuk5RpGHvJJEwa83gHwxFUZv/B1KNQ1c5ri7l
	w7BdccBFk1rv9SiHYYvrKKm/vNlIwwzslO9jwtaEjjv5GZCZ+OgJGlvg
X-Gm-Gg: AR+sD13OADMiVeeOFbwAQOYUI0F6Cg1WFENflHXQTdGLSUeb+28h/76xU8xiRH9+s/q
	9NX/lt+Jj2t+A4vsDSAggoG22Bq54Sp7QZJvcuvas39nQIYL77QIk2pFGeE1OY7QItbXavRmQ8R
	eEEl5YKFd8OkHHa1C772ACz8Rl7yZbKUrlW1/tXwI8+OVqxu/lNW0pqv5O1IlJ8/FjXglNEhzaV
	4U4G7ueLVrta3kWtuMcSUDBFWqxVKn7o4pqMgNCSRp6YZDdv7i9Hn+CdERgBOE7WBFwsXZI7l8N
	iCrolMVXMFKoMtSnlngrkVddYlx0llsF7A7Vh8I2pGM6yvkSPJrZjdAP+/1OAJko8EyhiuHQ6E1
	16RFg6UbDjD+QP9sXcSCTKwvxI3VCN84CK5PxQV4KP0pN4MRiLzq+iyU0GNn4jfPUTkLxV/i3LU
	GZo5YDVsrX25QZGvb6Clg2c04gw71vwHhfb6WIqhtnhsd+mUxvIwR08Cjp283DHdKS+yfJml8+u
	rAzguCrIh9/EpAvheE2VdpQLNPH/s5/06vGhRS5OmLQ4g+QL+eTDqhOoA/nRTtWtNo1xWLv5FsU
	RGe4
X-Received: by 2002:a05:6a00:14ca:b0:845:3fea:96c with SMTP id d2e1a72fcca58-84f2e017155mr42784063b3a.21.1786339159406;
        Sun, 09 Aug 2026 22:19:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51f429sm3175508b3a.34.2026.08.09.22.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:19:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:19:07 +0700
Message-ID: <20260810051907.27136-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 632614013dc6..9301e1dab830 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -705,7 +705,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	int err, irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	if (irq > 0) {
-- 
2.43.0

