Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905328134F
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Oct 2025 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760044840; cv=none; b=Am0kj+NRL4x0avRGok/sxEMHSVXqU9opYrS319AgFFL9CVA1Qj3yMzbEwdFIqTbPqifVflOwIiJCsGt2MxgtiV+0sSNegq+IEUGKWREhiRtSYEc1jf2mclONTg/c8BIWQPKPOqgEnxO3zonhaibomtsKyGhSOicVOFbiHwEGOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760044840; c=relaxed/simple;
	bh=9uEjTfrGnmGkJo/3RuxVzKWei7JsAvyM/X7u5LLvmQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWIDqgn5nz8a669iKWr17cK0jNvs8vtPmEgw00KDApfEj+QarXq/dPlAHiFzNXNbg5+ngtZO/z5NvUKUj+9AaALiwDdX0mdfbjB74JAOVuFr6zxsggpCkS7FbwhxglZrTtefoKQQLI6nttVA3WKvFv/rPrmPFQHmb2Ilad9wfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ji/MK2/C; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ji/MK2/C"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3383ac4d130so1353017a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044837; x=1760649637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNCBeBBdkJ6krQ6n6YSc9TV1L3hgIbHKEJb0ek4nU4k=;
        b=CjXIc/5McncKOWQxxN1FNuS+UrprIDlknrw75fwyk31ytCT3Pav38PuUbiTL90viQ+
         IWJEhrBHaqxviwlExGMPbgSkoK6ce5oCnZ+mUg/svBebeF3kygdPkRDtnhmtn03kB6QB
         fYH5eNkEkSQrfR41GX5JlnSrUgmBianxGQGDe0OjVKYsIY+TD/Yl8nECM7OcgksbgDCl
         Dn+5rJh4l4AftvLROKtSbbWVEW7XRCUrYvBOcAg3rFdxvVmIKu26EN4Hk/uL/8vraZv/
         fyIRUs+4O6UQbykHPj96HJF74itGgumWHjIYvbfGQn0O8aioiRwVjsK1gdrU36gT85Lm
         82IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsPWToW6Oc4iCEeH5pADO/FSeO1rWhps+Vy+Ws4ffJuHx/UmxlrvAujTHJk1MQWqvlCcYR9D++L1dPiZQiRM9o@vger.kernel.org
X-Gm-Message-State: AOJu0YwFznKe0uG1RqtLo2fV6nwZws5tBgJ3OnED9Pd+SM8fpP8Po0yU
	NYR/soMFwFJFnbENuvoXeP/olkgTMQOFIlopNOEILvJ8SP1+5KLkoUn8rZ1a6b39ZvSKECOonER
	N0i5Dg0+SVVGTKYKsxH8uJYSOXFSnSyXEXxI8il16v/eU1/RStfpyJz6mz2exM6RcsVAF8YWj4x
	NY/iTD0O8Z44UqSU8+uwN9/5SJ3eV4g3IvUh0oRtwcTFg2YQMsrQwqg30HtmY4b2quTo+qSgXB3
	AAVbdYSuCyQtyVJNFsN8Q==
X-Gm-Gg: ASbGncvR36W7UmOof8gTpP/xzc1koLMRcUOq1nfce6ocVlSGWDeQpTE0XTs4qyn2zhx
	H46yItG0qP087v2rtt09BycqkfZ8YuapTspcUiQ550SDG+vVfRUnCAdJTx3etFCu+CaXrjkL5Sq
	25iFbN0AljTYo0kMgzHZNcNSskFtCJjKGnTfa2j2SJokA1G3BnqLUkoPsAwsA22zIoJJ3NzHSSq
	CXdiknU8KXtedGxJYV0cstMoXKvHMFiMzvejhF65C1Sz2QA93MD6nSHmUknyf/OOX3LvINopo0I
	SvwbtdvF3uJWJ+z1ggsZTVmg8hllHlDhQXQ9AeauIE9R1cZWd+7wAtGr8VB3fq30O5AnHXDlE9Z
	hpkrwxHVMaPlAYDQP7nQVY4AjuQ2CXE3XWpQOurQQvUcnieXUwrUTFVAu6RSVM0S7g6vMXnk2yf
	o=
X-Google-Smtp-Source: AGHT+IG6xKakDNOGAh7lWnuBHEkVc9+WUYsAbfgMT5pilB4h1S1nPHHuFAUhaELA4aSn5sodXQF6SDZtjDpC
X-Received: by 2002:a17:90b:4c81:b0:32d:ea1c:a4e5 with SMTP id 98e67ed59e1d1-33b510ff5b1mr12033573a91.1.1760044837160;
        Thu, 09 Oct 2025 14:20:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-33b626eab8asm50264a91.8.2025.10.09.14.20.36
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-87ae13cc97cso573846085a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044836; x=1760649636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNCBeBBdkJ6krQ6n6YSc9TV1L3hgIbHKEJb0ek4nU4k=;
        b=Ji/MK2/C/bXTrPERNnUWrhYhRnb+LTvOh08Ir49ZtaNI2sT7M56FZEANne3cL43daE
         c+ujDAgkILPxKTGsMGdqP3MblZN/lBLVOb9XNAh8Sxb/aIcFBliDrwIF2ads9hy3NkYX
         lNtKGlsovgM9qLqEjSjg6nF4Gu/ckE7fVHUqs=
X-Forwarded-Encrypted: i=1; AJvYcCWdjDAL9GBTWRkWOIZ8HYhIYkcX4h9ObRi7aMh4SEpy2SStVgkJF4THEmvuZghxtlbks5M9Gn/SVR/qYKFTekHA@vger.kernel.org
X-Received: by 2002:a05:620a:462c:b0:85d:aabb:47b4 with SMTP id af79cd13be357-8834ff8dd75mr1273446885a.12.1760044835648;
        Thu, 09 Oct 2025 14:20:35 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:85d:aabb:47b4 with SMTP id af79cd13be357-8834ff8dd75mr1273442585a.12.1760044835103;
        Thu, 09 Oct 2025 14:20:35 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:34 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Thu,  9 Oct 2025 17:20:01 -0400
Message-Id: <20251009212003.2714447-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The broadcom settop SoCs have hardware semaphores as part of "sundry"
IP block which has other controls that do not belong anywhere else.
e.g. pin/mux controls, SoC identification, drive strength, reset controls,
and other misc bits are part of this block.

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver to
iomap only the 16 hardware semaphore registers that are part of all settop
SoCs. Hence the bindings shall use the common "brcm,brcmstb-hwspinlock"
compatibility string.

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

