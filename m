Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299802D5929
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342656; cv=none; b=S8hVeYgUV0Ky9/NTbBP6A4itY+fIfrqPjfuI/sTe/gIw9Pjr4Y2DGiMUFOLcGv9y9x9xhavo/yu+rBgYN5yi2Z2z+ZyBWzy8gCwwf0tOpRv/tSB8E75xu9EGHk89q9X9ST4LYZHg4N05M8m+Fg+br84T8JWl6LyAjKsNEr12e+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342656; c=relaxed/simple;
	bh=pbh0BAzdCZ5GeAnkz26ytoOKgkgpRsRjE/yqGfWQuio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbTZ5AkMCGvpHf61/z7rnr7jvruUrkSbhYXIxiXZNoa2M2qiUxuZnZUjTiUWVaCEPgsgte8R3oi8yFfL74sv7ORdt5ol4zbKEwSjmULl1Iz4TKFNWEMBKVDX8bDDvv1ygwKF1a35E8USOnZ6vxwaxTSRUKp4GcMKQnQX3pX0wTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fhftp/++; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fhftp/++"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-42861442e8eso839825ab.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342654; x=1759947454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=Ik0K1oqWVZb6hPf0A3tcUh8MgOwiShL57BpltTkmwORfNVJn9AAa6zQxs++a2LKK1W
         dDr+KkwPOkNPhGxOQYyMXD36pYc4g/uwaN81R4PyTkLOpGnoZX6hZkZOTvaKpr3TBH5t
         wls5Er7Y5eKIotRQ8/0YcLw4h003EAePb92V2trvvpi5CIuQvvmU2dQ+dhLjGlkdCpdz
         HpU7jUkxFxGtUaR2YGufjTNdGD5up15svWtfLCGSHFbGhyaCjUKpOVeNaxo4FT1wePSW
         B3x9OJ7hNOHCC9O+UJI36e9S7SbTqR1RSojRTeqYQIBuFBj02OwQhkrg12oMLDBl6bLh
         7Ufg==
X-Forwarded-Encrypted: i=1; AJvYcCXyyeVWmDKvICcfXpRPwm+zI7AgZNkYQzJG5Q7m8cObToHJrbwM5Q0klhnIBHDiRvz66SvO5PedOuutTFXSHQAS@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkmVaN/BhIgZSUMkWRlp5rPPmCTMxR2M4GxUBeEAcA+GN+eJt
	EME5FyBBPpEqCrRLJEa/onxslDC5eNzvHECMJbkHHI/6/qrfADNpCZ7qwh8DyrV/OaI97nDopuR
	ufsQUY3h7/KX3mhehqHeSIZnKMaU7jmnQw2jW/cKyFvsnCGMTfsuUXkdQccC3Nqr76TRgg8yat8
	I5/oS2Jblwf6UzQeIkqDrBGkgd18yADJn0+SQQHY2hiG7icKaS90IEYbGSquPH+jHWiM6IfIPA1
	nemFrae4s5fhhivM95Iqw==
X-Gm-Gg: ASbGncsGoRN55ysYlfninMZkxZMPdobQmiClmoTHyuFEqcsD21dKdPjrLaDN5bZoVAP
	qRnCLVFrBNSop19/1HIA3QQGfj0EpMpY/DmT7rvEduyI8OYrPbxJGXgpXvrGG63oZhvUgA1Jz3f
	VSki4jFlVjJew9gN+LQhibaGuNTEKdzrR1bp+t7tyOKUJoc2PGacrFPZHx6HmwSguKx0Sz2vyoA
	RVROjHNHbPhAseC+Zk10dmkBmAuMGfarefB2wGVIytshXBZj6xss513knqEw2DdulWcPiwhT7d1
	7YyIYA1cwz4y4kh/jBMXnHfuqBQoMumIKpDabbB3eEi/0lvttryCdVWAVYuwW/0mA+b1s58OCEC
	pu0zAAlcwMij47Iuks4wbZnRT41hQetxxVATpf0jj6BEUnOb2oGL+ysHG85DWgRBw6rAGkDNn6Y
	3VfXWb
X-Google-Smtp-Source: AGHT+IEqUHsJl7tHBmwqfNMZAGU39bujNA/B0lywKLHyMKGL4Tszgl+If9wRNliWUurnQJ3EEgW7Led8dQIs
X-Received: by 2002:a05:6e02:1546:b0:425:71bf:1148 with SMTP id e9e14a558f8ab-42d81633befmr63031545ab.30.1759342654089;
        Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5eb02709sm11191173.18.2025.10.01.11.17.33
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-87561645c1cso41060085a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342653; x=1759947453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=fhftp/++HXs0gaG3zBNC/4gWi792SCdTqPTika72fyZfqbaCbo/lwrH9emdrcVLjAu
         SZJTwty9pUTFpks4wOPu8dJ7iwfNVJ0MPyP0C9k9eGS53ctWL8Q7P/KJgz9DelYQUwOV
         9eS1/M2due8XeNCvRwzDlBEsIVOFAlDGmqBrM=
X-Forwarded-Encrypted: i=1; AJvYcCWxlPeOdQAn8GvAbh4s8Xf/ZUyBm3utT9VMqEOjS+Fly2fLFf+wSHZ9DLHoHc+nBLKCOJdIIbwf088kZACOL4M7@vger.kernel.org
X-Received: by 2002:a05:620a:4507:b0:815:dab2:1ea8 with SMTP id af79cd13be357-8737a8f483cmr563555785a.79.1759342653159;
        Wed, 01 Oct 2025 11:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:815:dab2:1ea8 with SMTP id af79cd13be357-8737a8f483cmr563551285a.79.1759342652745;
        Wed, 01 Oct 2025 11:17:32 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:32 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Wed,  1 Oct 2025 14:16:41 -0400
Message-Id: <20251001181641.1561472-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d958c945e4..21b78f468169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4972,6 +4972,14 @@ S:	Supported
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

