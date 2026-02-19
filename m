Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577132ABF9
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771538244; cv=none; b=li7HTTYP5YurXw8brdYa1Ud+gr2ySRp2A5ei3/dFuRW945fwZeKdwAAOIvNWuKBUpxtmFevhQf/+ZFyJUNLb3uYh9QtAU+97c9VRqqBMAfJ3+PMgEISKZMGDZEUf/4V5FimgY1eXsgBpCg38djXWr/a9CV8RCEd7Rpt3FQuPygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771538244; c=relaxed/simple;
	bh=ymgJ32QMNYCUin60FKOe1Z68d7hZB5lDstBRZvKPO2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mKUwQdswssuCX6PmY7Ve2ufmTDJrY2AzGHtBffjshE/Tz2pyKyV4mvG/q/ezfWnQVHxDbpBJxtJvu/IBx7yu5J5iIcet1sKBdcLbOpMVvwggU7CQuzuK+jEyjXBlhJD3BaeS7my242MddwVkQZDTBeYAAXKx8E1ninNLyswH2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XE1Wouxz; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XE1Wouxz"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2a8fba3f769so6733885ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538241; x=1772143041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=uPFKtJ8RvcvfPSHM/0PA0BVEjT4MzfLaEgxmRHerYkYfyRoVOsifooShp+JYtatHWJ
         NfCDFVSkAWhvjmk/Ne/WkFDHfFarxbqdOhmnjr9CxvlDashczjlzpmf+72Q8eKOUkqsW
         SwTvF8eu/+cLo9l2B2D2+oFmETNYlTrHZ1+rs6jq74iuLNKKXsjTaqxtmBUVtdGSMGY+
         NHAB+w58BpCO0Q12lz+R0pNDSfKhCD0mSmJ3vkHI/n4UqusTd51yfYVOcCl3rD/FERE9
         TGxS1KYG+JXzeo612j9WOuTUJaD+qwux7ygQHaAXyMn9uWVnwouZqyvhZKCqZmNfCAEr
         Te4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCnBbPjWb/l8S69qsACAbSnV/PloPve0CtQUjV9P0EoIM1xdBy6WingPXHYXDlaM1VuFIt2hX6QozL5DVEOLI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxIw7SeFGunchdDe1yFGQOCkp9U54w6y0dzg2fa0KCbFPYeT+yJ
	RRIXbvx6GTNWto44azUhfYfTDi94nrgRdRP0uPuKvkHIg+6ipN5wGY/WW/t/PUf1iW3XuYBT4hW
	7oys4n4b0sdF2YbM/1UvjdUggCmHgZ1YcgfffrmbrXJ1rh9O75NrjQ5NGgKB67jGpA+R4Z6CPd4
	WAnZ9HlzIozXxGAi2yoI9wqHGMEZ86WJK/3QKa3nFgH7Pf/FSRWlA7iyger7wmW9TthZugVplzs
	54jqERPchcA633OzyDxnQ==
X-Gm-Gg: AZuq6aLoeRkzkIoZL9kmuhLkSUFr6TJxHySR5MXBFLnP+xHgEeXXyJaRNVmuIlkJXq3
	ZfKiVbs7jZyc48hOQxFb0il0Vye/0v1kqsqw3IxW4kukGjLszp97y9aYSOhCLBUpxxH441r9S0/
	Pir/QoVmDoHgllmtzCH6MOvxlH+HHg8IEJqFWrc7TL9aAD3NRYAGgjUkmaQQK/bgvwcdOXTThv/
	Zx5cyevEh0m2YllB7GPnzD6rwLyDlSrnhmVBMVylwNe9XJ+cojChHLv3+DO2Sd+8ldKj4YQU9eQ
	vxL7kQre2DvTZXf6stNSXp4Q2pCJo+LwMxWgc8pluxBwTdQmnRdzhcM/N0DnJCC7TZ9AkJ5Eqcd
	+ZohMLQiOKjOmVeJ1kEfMKUnme8VYTNVoFiAlkJQgERk5YVMTkef7TEZRvL021NvAaN3DTp5a8P
	BAM3zCnKG9CdkOgBOliGtrLl6waXuVrAmcQuDCD1hIbm8qqVzaRUpmsAgD
X-Received: by 2002:a17:902:f54a:b0:2aa:e6fa:2f74 with SMTP id d9443c01a7336-2ab50521f02mr209199445ad.2.1771538241331;
        Thu, 19 Feb 2026 13:57:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad1a79385asm22296395ad.30.2026.02.19.13.57.20
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a8f8c81d02so15583105ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538239; x=1772143039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=XE1Wouxz2QeaCkabK5tGvipuJgrbXUvN9nfMZwnoWwxBnReoSogj5hGAXb3dRN3Vnl
         YkgH4uO64bSbcrX7m0YzvjqO19V6m4gCbWQJz0pTijHUKaxIAGQB9TZRxQAFJfNlFGMF
         zznZ7jJSaObAFwfVdxzmmDObJZg1ga2IpGREg=
X-Forwarded-Encrypted: i=1; AJvYcCWH4eJuGRvMkZh9lHo2qBNNzags3eqY5EmWXq9jr2jSpPm7BJlWGLd4U8JMfkoP5WpqKJMrUPn1opEWRiTaH96n@vger.kernel.org
X-Received: by 2002:a17:903:1b0c:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab505628afmr204534245ad.21.1771538239703;
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
X-Received: by 2002:a17:903:1b0c:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab505628afmr204534065ad.21.1771538239253;
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
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
Subject: [PATCH v4 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Thu, 19 Feb 2026 16:57:02 -0500
Message-Id: <20260219215702.63321-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219215702.63321-1-kamal.dasu@broadcom.com>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
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
index b8d8a5c41597..c5971cbcf087 100644
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
+F:	Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1

