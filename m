Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91832ABDC
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 21:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771538237; cv=none; b=YgZ+N7KapEkhup/MbDkXSTSea62t8h/MT6+Z08VS1JWItm3emCrWl/sJZJ4VClsPm50dS7cCmX9nb+56Kw6ni2l5BGititilyfLfSkQWNxeBDTiNQVgD3qOGseR7enS6LwdIvzYCQg8E+nv8Grr39ZaEx1tOg+AtebGZc2CNUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771538237; c=relaxed/simple;
	bh=ZwaEEQqBBpQ9VvCQhaci+MXdObqlEzR3y2j2LYPFfB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjpsycUv4KU44LN1grWsprzqmcoqwm8f6+cqQyDj4eUGm4sQmMSGHM3zHHahMDlZjsAw9IgsB10vlKrSH5C+1kPBCPF91wZyWgpDLihiwRzUfmSm1xDfVjQ1uh6m8GjRPlBsD79H2wTAez131ZYTl3DVveBoz5h6b5HAlX69q38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ny947fNA; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ny947fNA"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5673804da95so593903e0c.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538235; x=1772143035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ1MmI1k/9HenpReSZ3vHACiJQQcYWd1RGFuc30M+ps=;
        b=mCJlCyJiGZJBKQX9FumktYiWJdBV/NdsOvel/aGEfjr8aXU8xhcnFMz1I5C7wmpsyF
         05nVTNv6enbYax83wtunto5cWW30g/ZfR+owesRK1wq/WNpYUffVY6iqi2KOKkZYfzzv
         Vz29hWGE8fShDiz1QWM5QIA+2dWup0K1fNS04cjW1Aa63QIBNoEjNoK0zUYokRXUMggG
         sANKFL1AVkHE9WwTy1njM12/N428AO52oblwJnTtu4dw8nRT67JcVMu1FH6JULytJlBL
         36JF+GdAb645Lv/FzejdVy/XYzjor7FoHe3kQ52IKJeKVdZhC8ivxPQM26QVODXz9qCY
         XvSw==
X-Forwarded-Encrypted: i=1; AJvYcCXFk1NkYT/QAaLSEsoeBlg5fdkyDFfgasvEYT44QL1Y3rUEHTyrQ84rBqpm4qIr+fkGnZuQRLpSKzMVIXWuyaav@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRDBGWbhBMVbtKFnb5/S52d6RxKLVzPeUY/W1Hox43ORqxKsz
	x0pQG0q9bsHs91Bsfic1qHII6lvO0TE7gxs5HW/b6SixUIFLmbpAFLkMG87PYjb5Y5fq4Zq89zo
	BFMvrDK9+DdIHiy44Tdz3412uvPWpN3qlwUQ3vg6xqJ0lYDzPmmHOFzbq4Ag3felhwv3Dh5UFpK
	OWF6bfX0PiRZeF+2qFnTz4AIaYTvOCXIE7npn85R0aZsHwKAAKZH2QKVDbk6ydmaCxFa+Dzqkmc
	pDhZ9ELHchwI0n0POYY3g==
X-Gm-Gg: AZuq6aIheK3F5UHKCKffLjWzAXoDss2PT4vPY+f36/yLgz2ISyc73U5uwFyCDt26pNK
	zDsWqd0rN1HjVMN6BDBODNBVY0UMqi8RUUkT1vxC9jckFCKPx4SBGk1wES4FvCA3tocFn6MFq8y
	nsOgOJaYquuS4vuc0UpiitJUtc+1fLp9WzGz7b2pOtncRFm8UxDq6LjHC5Y6CaNMcTe0I0c6jw2
	cvuGqVVoIyAUZN8ylkKX9BBnF4PkcG+192hwmDERD7HbRTzPKSh/qqL7MbzPAaT5QUmR4FvDaor
	VrKmBtaszOY/gQnREnFmzEelwEMMDWKyQ/sRoBxqSUBDy5D1Jka7ZYJP1uUM5BnMUWokn2oBtgP
	va7FIJ+sMVv2KlEnQUcIlUlUbDBmpR6bolu/HuIhsEVXvau5RNdTQld8WI34nYPRUp/5WJti6y1
	8eIwesL/4EmWynWXYPaftWz0HfUGOvgfrw3K95NPLe53oyudVZ6emVVQ==
X-Received: by 2002:a05:6122:3122:b0:567:47fc:3a9b with SMTP id 71dfb90a1353d-568bf51fcd9mr2555731e0c.5.1771538234606;
        Thu, 19 Feb 2026 13:57:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5674c1c2146sm3626408e0c.8.2026.02.19.13.57.14
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so83030895ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538233; x=1772143033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ1MmI1k/9HenpReSZ3vHACiJQQcYWd1RGFuc30M+ps=;
        b=Ny947fNAq4qo87kcSSV1zkkeUsZ2fC7JnQFdYxRo9RiSiscqZDB3OusGPp93FSd0kI
         s6djnRpwKHVYqwZ57m/yuSjwaE5l/bzykKKcJbiPveKn4hyS7l9F1+AKIlVuvax16vNb
         3P3d8Oe3Rsb9IXV/SzIqEn2xwbGukr3oSqHV4=
X-Forwarded-Encrypted: i=1; AJvYcCXFFv/qTGMu3SdcJ1jk1b8ysDuTMMGVtX57icJZL0uU/O7dAt9r6uJA70rg1rILDGmZHogs7yO8sbdGfrM0PG77@vger.kernel.org
X-Received: by 2002:a17:903:b4e:b0:2aa:e285:f231 with SMTP id d9443c01a7336-2ad50ff2374mr61212725ad.60.1771538233282;
        Thu, 19 Feb 2026 13:57:13 -0800 (PST)
X-Received: by 2002:a17:903:b4e:b0:2aa:e285:f231 with SMTP id d9443c01a7336-2ad50ff2374mr61212615ad.60.1771538232851;
        Thu, 19 Feb 2026 13:57:12 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:12 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Thu, 19 Feb 2026 16:57:00 -0500
Message-Id: <20260219215702.63321-2-kamal.dasu@broadcom.com>
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

The Broadcom settop SoCs have hardware semaphores as part of the
"sundry" IP block which has other controls that do not belong anywhere
else e.g. pin/mux controls, SoC identification, drive strength, reset
controls, and other misc bits are part of this block.

Adding brcmstb hwspinlock bindings which allows hwlock driver
to iomap 16 hardware semaphore registers that are part of all
settop SoCs. The bindings use the common
"brcm,brcmstb-sun-top-ctrl-semaphore" compatible string reflecting the
actual hardware register block name.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..0a9a1bf19fe2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Settop Sundry Block Hardware Semaphore
+
+description:
+  Broadcom settop SoCs contain 16 hardware semaphore registers
+  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
+  mutual exclusion between drivers running on the SoC.
+
+  The semaphore registers belong to the sundry hardware block. The
+  node describes the semaphore register range carved out of the larger
+  sundry block address space.
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,brcmstb-sun-top-ctrl-semaphore
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
+        compatible = "brcm,brcmstb-sun-top-ctrl-semaphore";
+        reg = <0x8404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1

