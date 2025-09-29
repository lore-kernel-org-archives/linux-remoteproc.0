Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB45262FF3
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759176437; cv=none; b=bgq0SlyoUWztsra+aLMSyXpIj0D/KwolR5kw/zZphW8JlJVKFAbfK6ImF9zSDkf/CTT/9GzJHhZKD+KpYO/fsPSPBMM22diBpzq5sqxKFeNnktDoAea4TbZ7otx4jR/wAt2cMX/9F/VKNjGSpWb3NqdxPJhRhA/zhRN82N7ZDoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759176437; c=relaxed/simple;
	bh=pbh0BAzdCZ5GeAnkz26ytoOKgkgpRsRjE/yqGfWQuio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gtubNdpD+nj8RCoQtnnKMF+rjmzsgOJoBf4u5Of8wCesxNPTI8ZXEbSsLqOsiA+XtY9MvWVFmrrdxzf0EAkANKAKbqT1pL8buQD1WOKpYhhYHxYvieTmNTy2Wt+wyYhF+3lzmNoNCXqlAm5rQEYInT33OQul1S63FDJy5CEHO6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WzX+oXpA; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WzX+oXpA"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-858183680b4so690211485a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176434; x=1759781234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=MSmsqKUfYhhBH+55DS/7GqF5va4rSGdRRN89aX2CW0UW1MGquNO6THIUCz5DVx8eYw
         DlYQiYiOVFmcsu2SeWGw5IMi6//QuaZnqB8I13NecrEOtis42+sWVQCNb2IDQtJcePiE
         XAGxKpvLggHy905deyK5fIMQL1bGxdnBKOWu1VtWeGUAu8RGwU/8xZRBBUcVJneDA1aX
         c0fPzfvckSl+n5uDwDQn7dKdmesroIEQkkiTZEtua/eTnu3aJVG3F+4YMyRj4wnWs5RK
         1OREjPUcKSYGoDumE6By5I50jjJ1DJuEBegzM1ZKyDubWyQVXdD0md6nIFpViSSsnDeQ
         QXJg==
X-Gm-Message-State: AOJu0Yx6Zse1/ULGTMXGTajbTl2oI14qJgZcFzaxkLcfKxw+1NS7y5F1
	i6TBbY6PXRi9IhZcVe7UewgSAm5OHIWAWi/JyDRm3pSjjUoqWiAFyiqf/fPkUDdZIX60Oyfj+52
	aBp+lk+LXzTkGycwpC5gKgP0tmVE9sUwnqOI1Q7WShe0MGdefEhYGBCQpoW8t/GUUq4ZeP3X8G2
	jXF8HROWCPMMvjeQBJCnr+Vlck2lINio//zAJ8YLwatLpUH5lMn4gfzUF4Uc8bQK52WTUFsqv7G
	jdnYMqanohBAQFL2OywLg==
X-Gm-Gg: ASbGncuAZ7RCdI/UggB3Nh8BWs/PrqwSsmtiM6F7y0gX6Be0oOGkZpNWNcaaSepSYtn
	oH23HQeSwNMtAqyfbW5ERl0xQzcUKhyqzrcmJQQmeKSQoIh+4AOtGQ4zjOC5VDvabX1H/WOnkT9
	DNLfHvlbQBGuA5R9nMAv1z4JQihxCLF/YON4M2PPtlygP5JLVrgTzSggsESVxP8S/4QHTPdirUv
	Mv9WMGLUaqSCSZ3LHrc1C5sn2zM3JGiPSeBxyKZadD/jjzzpqwM4ly0G0mmmSLTjcLC7C3DERgU
	56sPn7jn1NwPZpC90L24CwMd5keGIFPnMVLEwMnFIgbOWpMrbLPntPrh2CkugN6om9jl474ugAK
	qnFqLUKBxc5Vz7qPx9bimsGXw3ubQcKUKOn5+99CbCvfeCt+VtDvBOBHmnJDcmDwZvyFsrPSGDK
	s=
X-Google-Smtp-Source: AGHT+IFEi9FYTXodW0RzsFPVxDe6XelYKQUrgrXrC27knaRo5JkzUWwKBGGq+1hlN+phjMVoA3ouxNVi8R4j
X-Received: by 2002:a05:620a:7187:b0:86e:5d59:1d28 with SMTP id af79cd13be357-86e5d86e74dmr243075185a.62.1759176433998;
        Mon, 29 Sep 2025 13:07:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-85c25d5cc76sm79351485a.2.2025.09.29.13.07.13
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befbbaso6097564a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176433; x=1759781233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=WzX+oXpApqNUnlyvEPrkNx8BZBB/ASewmHzBLaP/P4C0xR3216v0eHbI2BFu/VJWrm
         myXjYxsj2P5eMPyapi5B2teLblFnWxlc4Yvdwm0RcJOioqjfXFviIYIxqjg642nf2ixo
         L2ZdAcGGw+mZOpednzxDsAynlMgyQFOgpYafw=
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-3342a2c9fdemr19234048a91.24.1759176432849;
        Mon, 29 Sep 2025 13:07:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-3342a2c9fdemr19234028a91.24.1759176432436;
        Mon, 29 Sep 2025 13:07:12 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:11 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 29 Sep 2025 16:06:27 -0400
Message-Id: <20250929200628.3699525-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
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

