Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191433ADA1
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 22:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970687; cv=none; b=NG0VY/zZiJBCSMErx5eo8rlsdxzNA4pkToW6ATEaosoIivZ4y9KARIld5iOD3eCPxrd+pOYQqAUzaWPKZGjQWIx9+QDCzBnR7hmSkuIV+RyPidMF43HvTj1P+Q3TDx4usf7T5K06zD8qaW4YY42IRkI7KZTEq9Ap4cpDDu/fI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970687; c=relaxed/simple;
	bh=R4/ULu962fEdVJu2ZyHiN/LTuaZxTTBv+gZJtef57ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFATgJYXAUHamX5KCQGLbDLg16Q97U/rD5YGsw9ELmgMTbto5lOuSx/PzoFv3bdgWssYDmW1xz5pLQZHAEEZq/WMeeE3fKgDmnacJFUCQ1aWCFQvd4H+Et9SDoIj2rAdd/4g5ATGr6aPKRvkV37ldaQ7F6rzJmSZxmY6Lo1uA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FRfrep2L; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FRfrep2L"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so1881131a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970686; x=1772575486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUe2/zV4rw3eAKHjqP1mXU6br5sdLAclT1ghdsXtXr4=;
        b=PHW6ci8v1RbpBHhRmEQZ/m6t0jwW4IPiDPnIY46GhmrkbOfj9T+eqeWRh/OS7KzXJ3
         zkOXKJVTdflRVZu0Pt/Ag6iSw+wVqCcz3k3nrol4nquvi5c45PfKE1+BEW/KgazDY9HD
         bb/XVr5EL1RIRGgHPrzZBHszOTz8wktU5zmGF8+D21Jlenvriz9K8lcp2Sjn51H95ajT
         SbU5LY7QRh65ofWMOF4psZWaOXBdsDLNTRIYkQUG2df4QUSuYgKAEcL//BJfnFJLbMM5
         KrMFO9yfrOzkHycnUDbiQAkaIPo89obfksK47ggK5F7BuIVKFwomZ2uwANqDQyngfFmf
         Z+5A==
X-Forwarded-Encrypted: i=1; AJvYcCWoHRZE6iO14UScBKgAnf6xglNVK+hG6bqu4O9wXMq9m3CD6XXeQgXFGKlxEa6xAuVIbvHnOywbWS0CGOxacBw6@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYNwJ33rVknI5iB0AzvrOS76/ard5fZKArz4KbSzoHhxZ6K/J
	PMUafKHnJ59vGECrfaiPtD1sHW1TjCdH6SoAAQfxD3o05FQUGhkTrsPbTng4BWLSmFnZK2xUe9l
	ANbaigNj1i+lGXoXVvPOk0et6yEKUYXtc5y/tTkGWAOAv52pXinl/XuPfwAzAc5ApA2SZhbZLjc
	p6TzMKrsmsibxwqnyhS8ZmgydfWchL23KWBOZRDp5cRgbG/7rFCfT3aqb0mbCKg1QzVVUsqKVkm
	8wpAGs/1PkQ8G91K6tZNg==
X-Gm-Gg: ATEYQzyS6LL4MNUQnzm6HIRljBiHagvrexMDZxEuFgCBPE1sexUfQNJulLjS2/EUhIN
	4HtGCF45HXBo1yaQNColPkdKYyXvEkGupRkUUXxDhpgGlbsYi9evAeqpE9I1RnRUq9LczAw3UHN
	YuGP/GLzrWN4Wmfyby4O3dCcwAfRHPy5n0ucNzCTrlpsn0+poXsQvLOTFWXsQaZbxL9niChEE1A
	/D43m7h5nRR3S9oZM6SJFA4rQ0l4JnzWUzkdBBYpflEbzR5kkJDhBvPwxqPJeoRkLlHOaMeae9B
	8P4gfNny+LNTUZYmplYBTq4/VZ2/HXkDWAT0+LgM8mWo15L/j2HbJjf3UjG4wH2chm7b1Frwxr8
	6IBd94M/DUYc9GcM9K5SDAXLMtbphUj2LA6cPD6ELuyvpGWwwTiMh16hufL/BZXPRGUaaHRP27R
	U6tKLcqHDpbYJRvG9BUm6XUR+U0HldkBWyfRh6IT/yPeMo9y8eKvjJUVT9
X-Received: by 2002:a17:90a:e7c8:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-3590f136160mr166006a91.20.1771970685736;
        Tue, 24 Feb 2026 14:04:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3590e1e5bf3sm15114a91.1.2026.02.24.14.04.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so8811558eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970684; x=1772575484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUe2/zV4rw3eAKHjqP1mXU6br5sdLAclT1ghdsXtXr4=;
        b=FRfrep2Ln4IPcRziYgGW+2G9tVXDe/7OQleqTuGJDWN5Lxyavshk7hFWSydsoYbfT7
         uXygBillPIOXZhcvuqbJDU0k9ILOj1jq/0HMRAAW0/+7z+UrJwNOMKDZJjTyT7lSGJYD
         vAISyNxobp6RauKv3jquIG+DFHE/3AXHdydsA=
X-Forwarded-Encrypted: i=1; AJvYcCU2G5Ws3lWV5OZRd379iAeVO9HZyfIvOqqbswkv2dUJlrVS9xo4A3H+WtxTyTXRDG2KdAmVzHTbpHVvmoXjsiih@vger.kernel.org
X-Received: by 2002:a05:7300:572c:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2bdc317c4famr26767eec.3.1771970683867;
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
X-Received: by 2002:a05:7300:572c:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2bdc317c4famr26749eec.3.1771970683304;
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v6 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Tue, 24 Feb 2026 17:04:07 -0500
Message-Id: <20260224220407.2351692-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Adding myself to the maintainers list for the hwspinlock
driver on broadcom settop platforms.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8d8a5c41597..cb3e653b204c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5249,6 +5249,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1

