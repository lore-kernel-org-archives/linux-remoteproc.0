Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F18244662
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759176423; cv=none; b=AZdw4GrCB0movewcAFhL2/6L+Kdj71NQj9Au9oyTGuYT3MxDwgiqKv18kMWcnDhtU8uum2SaPSGx3QU5AQOYeNLPkU3hYlQINmTW/i3Dx0rp+UJyondwmDDHDgAWl0lo+BH8NFfiCVuLYX9UZFl/Q83dVhnQJ0RTwNHAvtMq32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759176423; c=relaxed/simple;
	bh=twWts/BBJvvdpMllhwwy0sPWeHXBhThVVr0F+f1kI8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KiML3TK1luTvgK/z/gvCjgh5f1nPMCqsBU3uhvjz/CSp7VXodoEg3ZP90vMgD2sXAOG9FnDlpvz4pN15/Wg0seQOaJvocZzCmtnwXph05oJ+WwSajcHrwi3AziKpDlZkkO2nckI2bLh9F8LG7xNVuQCTBKtpPliOOw1oaqhaQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AcWX30Sb; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AcWX30Sb"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-858183680b4so690181785a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176420; x=1759781220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=K0C6amfmEBS8GUg3e9FsibNdsxblu0xbbeMBUc+e0nMp08Dm+dlXGIEyT0g7WXXQKZ
         /qwLhhe06hZej9gVdx4P9IOZCxvEQZmJIb3st8r7sRQ65BZlOL0qar8N0BduxGQVmikp
         gtBBgARYOv3hmMlfdi2V9iRUtvGIqSptcjCOa1qSYmyAUakk1fnkB1dFvqSsNqk72+Ud
         cnjseLCJCINOURy+qnS+EYJXL6uzkQnDj5QioD8jekT7yEgosugEL4FLPd2HmZX+pfny
         bun5ACPFxfGemG+56ZPv4OjdRUHh7Adq4UZ653QXSRLWTxItPfCvJT131pDeIc2qf28J
         mXzw==
X-Gm-Message-State: AOJu0Yy+H+RcHHsaVWbrCds6F6/63/hLLML2HEUucURf3Yd9yM7ujN6y
	9cjc3fPOWtM21CNV7ilur078LE7LtE6B/Hw9PtPPSRwTnh6SgpnZLws5Wt5gNqA3puK52O6aeBD
	iJAikb7yF528azeU1yj/rIfHG1wDjucF3p/0k5tbs5e3K7Pk1JniDxoM2qnM6CqZA4td9nbUOBw
	BrfFiR+/9eixv0gt/GAzd0Lv9iS2BgG4OPg2TJH7JTYkcoifrgWJqGjIy85080FGKsC2qZ64e4W
	KLGlBqVlgAzQUxykQ+tiA==
X-Gm-Gg: ASbGnctBk63Iv/SEHt8WkPRStcefDNbz03RElRVgIAniffSQ/wvL1k8DJR5xdVNpq6A
	wtlmeOI0HRaU+JrDqng/0FYsE2dlyKCoqSOtrM4Y3gHCYyNEDep6/iK4+3GuEAkygKdadfgqXYv
	Zvte04kMY/dDyW6yysmsnELVFyaBNXK8lNE/WuoKJda+SnUnvqNeP4F1f9dLiIT7JO2kj5O8f2V
	/v5NTv/FVY2EfUjhHLME2SZ4NyW1TLn5Yt1tvqFt60/Y2Xkfn/grpsdDFLBEPZUBXhjQiQ8GYxA
	2IBKvvxrksEhw+aZGaJAM40KX7lSGZfEssY7UmOR+C1irQnlUUzl3z0LkKQW7NDOhScM1K0FAzL
	0GzFXX4c2hom8I5Z8rhcgHs/erhp1fiPUajDldJogEZSdtj1aUr7LluR2l8xP1Yiq4VmDmRYha4
	M=
X-Google-Smtp-Source: AGHT+IGH/6CjmRpaIFv+Bb7ReOfhenqufkvccN54qhV1Xbwlunu8JvzTi1qX5zmGRhw14CyUNDzLTA+cZVB9
X-Received: by 2002:a05:6214:5091:b0:80d:366e:50a2 with SMTP id 6a1803df08f44-80d366e5523mr220330906d6.63.1759176419728;
        Mon, 29 Sep 2025 13:06:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8016193d071sm8659666d6.25.2025.09.29.13.06.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:06:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so4776409a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176418; x=1759781218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=AcWX30Sb4MixKf5OPVH/ouwOz4I4lTpb4NnocywYzKUhQyJQ/SSIS8aQ5RX2l1lVyC
         g7e2MtAjqusqGGih9sup9aMg8wmZ8NtsZ9WEhTZ3pUxSQF4rq28sWjb9F5+UYPBr17/E
         h6KT6MvOdDyGfC0kdGgVf6OvmRuOtHPxmaVU8=
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr11368275a91.15.1759176418530;
        Mon, 29 Sep 2025 13:06:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr11368259a91.15.1759176418122;
        Mon, 29 Sep 2025 13:06:58 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:06:57 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
Date: Mon, 29 Sep 2025 16:06:24 -0400
Message-Id: <20250929200628.3699525-2-kamal.dasu@broadcom.com>
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

Adding brcmstb-hwspinlock bindings.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..f45399b4fe0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom settop Hardware Spinlock
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,brcmstb-hwspinlock
+
+  "#hwlock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@8404038 {
+        compatible = "brcm,brcmstb-hwspinlock";
+        reg = <0x8404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1

