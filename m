Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E13725C6F1
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Aug 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289639; cv=none; b=TfI9XtKJkEMZyCk8ZtsjysYidL+kwUb7a6MFgpIbGYuFG4grOBeTV/Z85e9LgszwnzpCgRgJXWqUfX25DnrD5oJDZ92chMwNvZfcxJaREQPQVXVYPkoO8XQE5cyB21JNB6wEJT/OO3jS7yQBbkc0IrEmIGxpAZ2BlSg6AXmIWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289639; c=relaxed/simple;
	bh=7zvrItd6lF7DhWRHMFACpJHxtADzo3yZV9OaBF0xCkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTZc8VQKaBxpwYQ4s/1KDU+uEWWPQdbBMOwtKw8HSDIdGJDVS7WLcx34mP6kdRDREGh8hQIMaoc1LKH3f0N86gOJB7aViaSTVBOqI4O91BLypSLtfyO/B8+bdOHhuQWWQIhWQCmU3XuHC3jEWS4fieI1jHk7pxjuboEXzDVW0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XGKDRchi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XGKDRchi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso57965885e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Aug 2025 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756289636; x=1756894436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFHfv4BgFFf6UjrjZCzlbsHb0+jz7Jlyk/zxyT76xO4=;
        b=XGKDRchiy2N7qzjFIJSPjgHAUVf/aKOnuZFiZvpRpwuLrz79bOgFcFRqGHdG/g0lE+
         hj1iDsRZk5p5TzFZiV2EwLAbqIJAXcilODWYDoqhnoqNe5Dv1F2Q9duXMhN9oOJEZvrE
         1WI8biYKr0T8SPwESI/I8WOhxRy5r1UwkJdTvFFC7hI7wSRFerDfk0R2ceMIWSqAOcMS
         DxcZnGuoT81slK811cugw1xPoePaldpOKG00gvcXXMjHcn7YSuM3TI2Z7ki6Yi8zNu7G
         7UzyIDzQfCg1Zl0LVLLmDg8HDMMASnkDUR8V0p8VDGJfGI0yTXR8qwOYQvIalmm3ULwj
         juzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289636; x=1756894436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFHfv4BgFFf6UjrjZCzlbsHb0+jz7Jlyk/zxyT76xO4=;
        b=AZ9C/3/iJwnBq48mXT+iMut0qXedJ0cBEMJ9OIgCMzeocT26dcmeZirQOIOMga8/0E
         CUIPy0Ci4tf6pzO/FgqiHbFrbCC/veMo0kqsXDxGRZKQJfBY3Lm6vDWvAdYLwcCmyRt1
         VZEl7KS3Y2R3UBTat2zkbXwoficBm7JwlqzVjw8g7LfEEgSaYjoK/mwYMiN+8+/G99j2
         5J4anrG2vT5DP8OmcZ2Qi40S9vpC0ccFekdFCXnW7ydbpdpoaDVr2IOGhtmdQGyDUp/I
         0vgUXRM8Z2cpvSFnQ+ThDapxtFi0Sekxca0hCRpgbHPZ8M3NlZMnG5VRPugYmviYKbo+
         AREA==
X-Forwarded-Encrypted: i=1; AJvYcCVE10d/eigyzbdi4bN3BICsLYRdYEcXjLBBzY+In/1D1wg/hnoUxybXsediMNKlPGCXhvmt199gpqYdFJb9nFwk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyal35WaU7jHgkUefV60wTVmKmYo7h7B9LsPZB25tk2h2GOt7uz
	im4CggsrKPpKA/z9vyAoHSiMjncDS9Uk9d0jmrd8kWlKJhSZAlo/DcGdpeLKeOMZXn8=
X-Gm-Gg: ASbGnctSnnV8JBHNDZjrNQKv3W4pbnFgkDYyRLuI9tcfVGFXNrd7z5wwpWMQagQVrsq
	jpv5gtdB9wF6zRST5WppM4W4KmdW405Z1ah6bcts/N2xmlLT9evQBIRn3BotaCipaR2gYO+7c9L
	2HpIfSlnPgBg9bb1gjg2JTBP4nwk+Tb8cPT0g6tGNBvkjgogAczretTtjTHtmjMPEvUzOQJ9fQw
	jVzduCxHsdMMxfcPlUFXfvqKgQP8/Pk+X1NA/tY/lBiY4ciQlZGhqeBgM9ULeuslUonnZ4XpZ05
	wGGWzgqyH6qCOBpB/zkfkwICIRhq1pOtluEfQ+yKdTlYdsp43TQqyZoq3kAJDn63V59leOKya+J
	kNUWRL3d+PtRkskTeXsIJ+R8/+/ntFYViMnCipCz4LS1DRM9HrA9CLla8hy5gvEw//tlPVl5nJt
	MxPPI8jOaHB6ObxRwu
X-Google-Smtp-Source: AGHT+IHpy82kDFbawOUYQ7LQKwjjk9cJ9CSb6+MrqfxOmu2ab2pw0XNrTRDxvK7P/73HdRFHaFAj9g==
X-Received: by 2002:a05:600c:1f83:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-45b517ad803mr163924265e9.10.1756289636196;
        Wed, 27 Aug 2025 03:13:56 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6103:4200:a5a4:15e6:5b6a:a96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm2700425f8f.52.2025.08.27.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:13:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	ulf.hansson@linaro.org,
	rafael@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] rpmsg: core: Drop dev_pm_domain_detach() call
Date: Wed, 27 Aug 2025 13:13:52 +0300
Message-ID: <20250827101352.927542-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Starting with commit f99508074e78 ("PM: domains: Detach on
device_unbind_cleanup()"), there is no longer a need to call
dev_pm_domain_detach() in the bus remove function. The
device_unbind_cleanup() function now handles this to avoid
invoking devres cleanup handlers while the PM domain is
powered off, which could otherwise lead to failures as
described in the above-mentioned commit.

Drop the explicit dev_pm_domain_detach() call and rely instead
on the flags passed to dev_pm_domain_attach() to power off the
domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/rpmsg/rpmsg_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bece5e635ee9..5d661681a9b6 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -479,7 +479,8 @@ static int rpmsg_dev_probe(struct device *dev)
 	struct rpmsg_endpoint *ept = NULL;
 	int err;
 
-	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
+	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON |
+					PD_FLAG_DETACH_POWER_OFF);
 	if (err)
 		goto out;
 
@@ -538,8 +539,6 @@ static void rpmsg_dev_remove(struct device *dev)
 	if (rpdrv->remove)
 		rpdrv->remove(rpdev);
 
-	dev_pm_domain_detach(dev, true);
-
 	if (rpdev->ept)
 		rpmsg_destroy_ept(rpdev->ept);
 }
-- 
2.43.0

