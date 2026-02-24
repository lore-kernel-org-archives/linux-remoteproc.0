Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A4248873
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771897699; cv=none; b=cCix7iUDH81TAQP7YFg+oFRmG3/OWfBm2bthRiu8/EpENFLoBcUJYmzcwAfNkAz7we0gcN50eLK+NFme4d7keI+7rloaAVu5lILG8d16fm2C+/FzLONaAxa5Zr4ED6Qgo9240aNYQUb4va+PIwaNfiq7xqYdmcq2wgNyzW4lNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771897699; c=relaxed/simple;
	bh=+B14oxUn7oR05xPGu7DidDvDnKJkZl6987HT7GLwCp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thCZGyYzM2Uo34Bn4LnZA0uGOrR1sXpvmnacz1QQDLhr0xZKWgN4gSQ207Nj0jzV8qccdbqFyPRXqUA5+pfOeek6vmJ4t5T+UWG+lKKz0WyslwTl/9flbrgCTO+jsDCtkSfFEVYYTzSc3r5nn2lL+xbAyOSGbDG5JuRJwrz6Z0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Xcfjs/qS; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Xcfjs/qS"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2aaecf9c325so31083925ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897697; x=1772502497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a34nkWKk0xxrzLr59oDck6ElSUS/E6YyWVngWLMX0No=;
        b=tlYYguVpMsL9E2E/KPnrOUmePi9Km63Qermg+EN8ipjw0APSOEALF2kDHKRW7RM+le
         RbzvOy5O1v6x2SsXlR7jDXkrX4pOxk7x87zXyUqj6OavThAbs7Da6ArlspeA6EeXf1Wp
         n4LCvDVEw2j79DlRuvBc5NkrqpQpKJeJqJSQfp75U/W1BdaUrRtsUNxnirCk2m5GRUCj
         RmmUXNRYU4KPeATiBKAlh7KbIhXql/hkpX9gHPULfAibtitwU/9M+ya1j8sBTmJSHBql
         XxXHG3lGItGlZVi14LZgNABlcW6pf0odbtrg9Ia/Fj2E9MyLHRAtlx+h/N3rh4jghyoW
         EhAg==
X-Forwarded-Encrypted: i=1; AJvYcCX+8YteLKnBeBJf0e9mKYQiS8wujLlNc9kdus739atYGnpUfac6orDOwGgEQ8oMUFX2Qoy6MZ8EQgYOwz9TAMKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EP1OAJoWzuF2VZUWZ2L+gRydNheGAKy3PLQmMtq/YCNfCIqf
	FkgqrClr1zOEvSPHyL20f0A4Ge3voHSX23tAZJ83asM/Ns5mWkNLXbQQoJ+5acK0hUBn+XwOhGL
	aZdmCxGQ16DSUZo1OE3ZQw6Zddu57IrCDAZmkHqNvHngArolfaJyyCHrCFN2jTbbM786lJMzP0n
	DgYipvgPEyFtigImqNJ8fokKZx1rNudytMrzjXOFt6jG9vSzQ4PNhwYZSK/aShDU5+DJCzXSdec
	RR/nTHdTrhVvfhY1WwW/g==
X-Gm-Gg: ATEYQzxZ+NYeoWV27Pn1pr5RJJe1RCZf1SXxJ71kmf2KV8tQLqObpl5xBkvUtwPgFe+
	SkNYBP1+0ynMeRgBZK1sYPqRqaW1JJh/vrOd+q6YMHZb3/YEHBeoCQ6CUtfZai6QchVD+mfFxm9
	1ruNUZYZWPF9VZufomETeHwIkKx2kXfljYmzjdEuoaAhOZ6hXVYXXc33rAAyxI4AKf6ITRb2uO9
	2UziASOVmyTSWz9wmlzLnwYycKs5jVI1A0yNiAeuGjrgS37t3lj9ktIS8QDzOfWTV/my2b1n9a8
	i0nb9MuxpRHQNzPWRVKB+ccjrCXoJFKy4atTrMCxqJoARLUIncXNyOS2UDyGAED8xxjG6cIwBU4
	KY+Lpwckh6qZie9HBtz0v3ijSbxpFvV/9KVKc7op1nJwzMxC/hHSfiAchKbj6Z7zw9B7iTn8LxX
	/rEpOsWAzkEE0tHsNdCx51Ny/Gck3pJKWuKqxkCzGFtemzQJnzyJxrmkgi
X-Received: by 2002:a17:903:19f0:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2ad74284322mr101211025ad.17.1771897696944;
        Mon, 23 Feb 2026 17:48:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad74e0400bsm10581515ad.8.2026.02.23.17.48.16
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270c88d3a8so4274824c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897695; x=1772502495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a34nkWKk0xxrzLr59oDck6ElSUS/E6YyWVngWLMX0No=;
        b=Xcfjs/qSyOXcA8EG8HFa6mJfZDBP2ZX0FBPBWQhZLSOQSS0zufkrSYnpWgkFBM4wMa
         2rmkt2y022UAPlr+m1nvSCiyT5WHDCoZxwTpYMnvYRDfoKtvoyfmr6eTxKfEbU4d+RTo
         iyJMfoAl0LtGCc4w/sZ7OBsRog5cRlkyQkqdc=
X-Forwarded-Encrypted: i=1; AJvYcCU2PuBJfpT78+of7EZ/murmSVW/3SvWqZ8lpEmd+S2SaHsTQdxRzvG0z3UNlCGESz66Wvru9fJrgh5JrmsJ8qse@vger.kernel.org
X-Received: by 2002:a05:7022:2529:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-1275fa9e0bemr6403270c88.14.1771897695187;
        Mon, 23 Feb 2026 17:48:15 -0800 (PST)
X-Received: by 2002:a05:7022:2529:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-1275fa9e0bemr6403264c88.14.1771897694586;
        Mon, 23 Feb 2026 17:48:14 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:14 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Mon, 23 Feb 2026 20:47:56 -0500
Message-Id: <20260224014758.2660318-2-kamal.dasu@broadcom.com>
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

The Broadcom settop SoCs have hardware semaphores as part of the
"sundry" IP block which has other controls that do not belong anywhere
else e.g. pin/mux controls, SoC identification, drive strength, reset
controls, and other misc bits are part of this block.

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
to iomap only the 16 hardware semaphore registers that are part of all
settop SoCs. The semaphore registers are based on the BCM7038 SoC
where they were first introduced in settop chips.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..416d8d2948af
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
+    const: brcm,bcm7038-sun-top-ctrl-semaphore
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
+    hwlock@404038 {
+        compatible = "brcm,bcm7038-sun-top-ctrl-semaphore";
+        reg = <0x404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1

