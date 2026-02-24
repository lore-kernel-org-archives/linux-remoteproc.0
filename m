Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1224BBF0
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 01:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771897705; cv=none; b=sx8DxlWx3ARroMTSW51x08KULyBxKdw/cIahZ11dT5RUXXQe496giRX9GAy7Qcv1J5MTMDWgiTZ796JqNKWt3YKL0usC7phLJzx7QqxNPPtSKIzyjuKAlgnDiz5PI6zSf9jyv83umalRNjaslnA/JLkSRDV/1naufmxebGsEOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771897705; c=relaxed/simple;
	bh=ymgJ32QMNYCUin60FKOe1Z68d7hZB5lDstBRZvKPO2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BANYbP+r9YwG3HD23/HRLEF5ftnXlnhO+O4WQCvU2xo44fUVejDcCuHcGcL9+tgcU7RL/l+6FU5pnsn68zeQ+qrXrVumN2Qfz6oKa1l30OImdBaj9bMSC79HJz4h6d61sNCIW9XzwyvIQqQvXk6yyxXq1KaaL3Y0poFT+uzUaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UXC4fXeG; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UXC4fXeG"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-8cb39f64348so428630285a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897703; x=1772502503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=if/x9dXhqwGsnWc57z1g3TcV3usoayc/ILMcQ6Kp6xpNbjKSIZYeYDRZyPjrULXxW2
         XLHtNvMi87TEb9EP1zpNh2VG/dSfRJ2IQfCWHoJzr4b3wTj3pnRnAU4vQDHwMygdNvQh
         jzc4sYo6ucXb0+6A4+b0wwOzHea0R0CkZMaDFP3sgCIB/yogK78ZP7NQxjoMQMijhGZl
         D0z/r8hYcdUVFQ8ohytz2S4pD+JvIpph5tB7WE+M9xT8W3TPsY6bKUkQoIFvLa70ShiE
         eDHjsxR7N+7dv2iZt1j9XZPVIhtYB08JI7BbMlf45yRWAU9yfevWxHxq1a2TnkWPeGxE
         6sGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1BMJ9kQieQhO1CxDsqactFFQRxEO/Z1pBipxxfDJcggjk4y9G3x8RfZt8HJtloAD91e71IHJjWNmedE7ipgz2@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXyhDoUcE2Zy4pASOEAT8+ojCrb+CJouSNwW01DtPyvGlZes5
	IviuHDh4/STXdK1tSzzn4WeFuxdQG64JteA8upUeuusirXmhGMGWOggS+fKXP+CIa+HnN1hx18e
	c/thJuL3ZCGaxsqTwsMmPrnN85ygdBf8xC6kZ5MHgVLv0oorVDpLWOLEtH9h4e04aBSkVchdq8V
	3fEwc0pH5oDZzNj8BJA4iWXO5Egh/0P8FCO/6KsilyYO1onfdLFoafD9o274a3zisuPJyqwFujp
	AQ7Bzd+Xz/aDxPgN0GYaQ==
X-Gm-Gg: AZuq6aJ51BvdUX/Sy0wtSYaAIiYtJb3d8jty7lfr7PJzFMpyjnlL7Kix2K3Xrfvjpx/
	i9x/gVSpOgHcIBEw8jyriimIViL7v/ZK4sHbZ7nJKWySBmawUZQ7Y7A0Pvt3FW3jpMaLGW0+7XX
	ulgAp+cayWazWvDrY7PlEIbpo+ZQ/5TbDj8umy4yTte+VpMHfVgGY1CpXMWfW32hDAhlwpiUcq/
	bkO8u/02YmDbrjEpTRAjYdX/Lq1cxY4S0xsoXvlp9yeg9CxhvwnOJCy2U1j3GlgakSrIqAyrfdv
	3Sxod1/mcv8yQU9ZWGjzVLD6aC0knoMEB1cGJdsBL9kFvuBMGO7k6yYWIF+6RhOlkieYgTQG9U1
	e0nHylPPdPGpguXv6i/2bvT80ldLxMZe1U07rGV3aogZXU7L6IrbLnlrI5edW99hoWWb9ht7xgR
	g3nkIhcIoE54I/Ki8Utk7R1tOFJT7XU5fRVXVzKggS8N3DQnURWxQLdrjT
X-Received: by 2002:a05:620a:1913:b0:85b:cd94:71fe with SMTP id af79cd13be357-8cb8ca03fdamr1380172285a.33.1771897702953;
        Mon, 23 Feb 2026 17:48:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-8cb8d0d4a06sm128617185a.5.2026.02.23.17.48.22
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12711967e0eso6936625c88.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897702; x=1772502502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=UXC4fXeGU3zwXk9gyYffG8/aaq0g4GLDoYLeiDwNOt5DSOSeBNqDIHI0GXj+QfsplU
         ghpj4NjiMIdTrZcsIfYt/OvtRCOor3ZpATc/ZuVwmBnQbeXAdUVtC9PsbaD1mWKnG4Mr
         487cOiS3pDCUPZPAsEiLmbgDbMvfU4+CKCRZ8=
X-Forwarded-Encrypted: i=1; AJvYcCXPdZVqmr4ltQGifctJuzckL8BSWYln8NcyWA6w/ZTA+RcZiTPbZYd3RjCELQISzqAxPwF1YAoJx6kCn9m6Q1cp@vger.kernel.org
X-Received: by 2002:a05:7022:2214:b0:11a:273c:dd98 with SMTP id a92af1059eb24-1276acc4db8mr4490761c88.20.1771897701613;
        Mon, 23 Feb 2026 17:48:21 -0800 (PST)
X-Received: by 2002:a05:7022:2214:b0:11a:273c:dd98 with SMTP id a92af1059eb24-1276acc4db8mr4490750c88.20.1771897701103;
        Mon, 23 Feb 2026 17:48:21 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:20 -0800 (PST)
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
Subject: [PATCH v5 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 23 Feb 2026 20:47:58 -0500
Message-Id: <20260224014758.2660318-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
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

