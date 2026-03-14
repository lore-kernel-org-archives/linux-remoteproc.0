Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731117BA6
	for <linux-remoteproc@vger.kernel.org>; Sat, 14 Mar 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486113; cv=none; b=DfTYuc08JeUOECR+kPZi+ZN9HB3vWRZn+LNG4LTB69BPsEqpqbnpUttUKycM6acK9QGrRST/y9hX3TSC/KyxqWMqZOCDIK6ydako2KStAExIsfVaIDwmtfItQ6pBdcK5lbAnXuqDAHyMOYA0TBn1X8Di08d0+qmh5Euky37mzwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486113; c=relaxed/simple;
	bh=GgiYRcNBv7L7kWMWQ3JAlzangWQCIyBWOuIXmPV0gbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oz2n6yy/4eGkfFRdfJskCEOSFrWMNv0e/yaHUBxz9vXqrlLrGQQwa0N2TphEASFHSgIBnK2Mb8rO0nwmSQM8yhQuJma0zQlCHBzn5IpvEc3RqH6NzTP+VAfqgp2Rda4WDWqGr+L15AMK077QYfHYBYc0WFtVVtqXRU8am6/JVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9MLDCcD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9MLDCcD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829781b2b01so1964557b3a.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Mar 2026 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773486112; x=1774090912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t6dzhVKDoauqQq0cPP+eStWCVbmmVBroVSXvi9WWEQ=;
        b=L9MLDCcDOtT9Ybym2xSHthXF/IN7COVB1ivcELiBNk707I/Ged8QkzywYZmCC4b0nd
         RNR6YTbbhiFnL9bI22LaQI0C10/4oRsyl9prVT4T78J82aBMsHTjT17FVfmg+vaCjVOb
         tYNyrdSCFHtn4YTThxFh+AlOzvFKAd/AIxg6Fi6bjOH+BO/cz1Bn2sGRRq77I+JGXS+3
         cMKXdtmt09mr8lN8J8QavsV5QVJHUa9D7UEvnfiyRqw5+RPmQAnTdeVxZSIBtJ06Fs4C
         h9msZHAjJW+0Pod/Ud6D2Gf3RSixyKWivQYjWqXIL84xK3pkkXfSRzDu5aq4Gfhfncqv
         BSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773486112; x=1774090912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t6dzhVKDoauqQq0cPP+eStWCVbmmVBroVSXvi9WWEQ=;
        b=iuj5Gj811P013I6c3TocMwQxvR1brv7LIgWUPoO7RFrkA2u3YmHx8x29htdsZg/YPK
         jNm40d2br4k9nSgstbWLYglWUhv5Sm84Z3OjLlcRaTtzQKrJ4h37q2jzAvLYX0XHG/46
         vuR6fQbiaDUDiqptAfmhzaH9YBm05lYndIpaCChGZbuB6wkFmo7ce9RjJsLKD74w/F17
         MenyDAGf6u1Hls3ABm5bzcOaVqBcOYwwW/b1MsLQKBW067RcIP2IXSAOxx5wAQyfWjpP
         pbLLgL01IE6Y3o4KXX4y2fvijKTjar9WwlwggQ2yO2ze6J5GtT+YVCDx0ziRX9/al/CY
         8HOQ==
X-Gm-Message-State: AOJu0YwUWuKIJpR0FWJV73xjrOgv2oCN/nzKMkm0qMai5kf8nNNrDJHp
	NtMyYfJ7Foe/4Uz5pOl2Gftapx4i94F5iz45oK209lbbm+0T6OVJKPjJ
X-Gm-Gg: ATEYQzzB+eL9HbczndbUFH00064oOVGRuQ5AheZJnsjItWpPDrGOg3HY8LnH1JvX+I3
	cUfEsuZCkfUH5Uk0hDNyi2DNO4mm2UpDxb5iB0OZq1W55J1IA2s+IGePKJh3LCa7YsYhKY0WQd0
	GBsNvEbYHvLfUat7hbQ47fxDvslMlhfm392ZA2bDt3FxrmU8sfvHiljlbP3on6aTDREaq5+26l4
	EpSzArMhEQTARBBNOEu0KXVaY6qshjxesa7VKGnsA+JjAk6uHXL2pZGVNpaBhOVQW8Efg3DwaEK
	VvIGGpgpMqy8ge3CY5q5K03ONUiw9ahkoA3z93arzv276cOrVom8JYs6V3d1UByslC51vagfyly
	79QhDjumP4KI2bYLwRRTNmQxc3C7SdIrHmSi7uDmPfQIkdZTIQtA07Uc0q965jI8BciONE3ghXw
	BmTx9TPrl81N2+FLTmZzUFTrJR
X-Received: by 2002:a05:6a20:a111:b0:398:a52d:5361 with SMTP id adf61e73a8af0-398eca524eemr5678599637.16.1773486112068;
        Sat, 14 Mar 2026 04:01:52 -0700 (PDT)
Received: from ubuntu.. ([152.58.152.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb996257sm4044705a12.9.2026.03.14.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 04:01:51 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] remoteproc: use SIZE_MAX in rproc_u64_fit_in_size_t()
Date: Sat, 14 Mar 2026 11:01:37 +0000
Message-ID: <20260314110137.178981-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch reports:

drivers/remoteproc/remoteproc_elf_loader.c:221
warn: always true condition '(val <= -1)'

The helper function rproc_u64_fit_in_size_t() compares the value
against (size_t)-1, which is equivalent to SIZE_MAX but can confuse
static analysis tools and lead to the above warning.

Replace (size_t)-1 with SIZE_MAX to make the intent explicit and
avoid the Smatch warning without changing the behavior.

Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/remoteproc/remoteproc_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0cd09e67ac14..0a5e15744b1d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -218,7 +218,7 @@ bool rproc_u64_fit_in_size_t(u64 val)
 	if (sizeof(size_t) == sizeof(u64))
 		return true;
 
-	return (val <= (size_t) -1);
+	return val <= SIZE_MAX;
 }
 
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
2.43.0

