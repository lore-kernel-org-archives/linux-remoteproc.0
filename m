Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57342571D8
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759176429; cv=none; b=U30lspqoLkyeLAze/G+L0Fsp0Y9TlCEIUjt2wR7oObldu5iTE54Sa5ElhLC+ojv7YUiZR2FC/YXX71YBuTnrhvD8gw7vLyzzlczYwlWcs45G6E7PeCpBELQhoz6Cj3NCAzaLDx4AqtOSOfNaJG/XerJffooCFCojALFNJEE3ekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759176429; c=relaxed/simple;
	bh=twWts/BBJvvdpMllhwwy0sPWeHXBhThVVr0F+f1kI8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rG/mK3cgQrhtygega7XeQLr/8FfUxSivHZjGxhdQToJkUMAsO4W+lLey+yltEL0GceZkioHc0Rb3bxG9HH5Qm3mrRSQhbU3VcL8J9Pm23xGjwfGsoOJP4ThoG2R5nMsoDIQ2ygHHYL01+gAbEP+yXRMdz0VwJpOcvdsHpfGXPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DpIgItuA; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DpIgItuA"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-4247cfc66a3so23159675ab.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176427; x=1759781227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=HzvGxXpDx6AcUZm/epB1cNZVpJ7UjUpjllywBDNYFnSneVJGeNC1N/B39UDr49xSVX
         MQADbevjpv4scUE21WthJknKADHGGIyDdB+xndqxoxLOBT7rn25bemMhFhW0GMv1fqPt
         IFxPvJhPEJ5Hiut1iC5SzyhK14xd4u1hfhRZq3Ta8lxRRA05W+nfwp6g3sUybo2YOsjd
         ds15bCR0mmA+PUN1g2/rYGa7uClYSOVO3eCx6x/fwP/S+j8RWcKIkV7ZOOIAjzJ0Urd3
         ZVjug0s8FcPPCqP7cnzVGaFZdM2XXjh0YVcjrSiKnGXpIo16GnTxpEeqQ7nfyVYBoQQ3
         gITA==
X-Gm-Message-State: AOJu0Yy929DMdg0ZJeTT9g08w0rcr9Zt6ocg7kUxC08je8B1Ac9lbjA5
	AI9TRdVluLGGDOjFKY6FlnPfzHc/cii2THPFwrDRjeBg/dx/fYYvC/qcyHHrw+RRVNqHbW1Lo4v
	uNF6wmMLn911uZMxXo36O5h9y5dCtZaNguLH1wmM4+gDV6EtjW143qR65m36u0M1d9a/x1kVeNi
	Ji2q5pb2uzJZNY0VccCUHNoBp070yQM39HzWhncpug63FM5ndX5NgDsTrvt96VU5QF8kph7zWGd
	sr5z/+TsJKo0kSfivPlHg==
X-Gm-Gg: ASbGncs39mOqGI4E8gPCKgd9V6bvAkGChtAvnyeR5/myHdWJTZvMwMt9dRV6SYCxNI4
	iqkdcxxfXGz1UyegMD12ubrBA9V84rtOADSvO4UA/VMV5R1B7IrXjSdOAO5dfOViyh3FyJRN31D
	tyOMfTL0eWzDRLg68eXiN6upG2jibbggEYGJNEUKC3mc3rYX1pSq1mf1GdsQ1PbCIMheBbrul2A
	2ZzId476yMEaZTpV6UGaYnqfoGUsi5MuTTvmq7Ago8+VdvJsNgcwnBcxTCH2oJyzIM4oS6enHBA
	mHWoFLpdrvCmJyUfuo6PDWt93Ickn7jyngPZrEFXBc6NuZkFherKy9ixohsPAtg4Gpc3DEYjrAq
	hmcVC/V3Mo2k+CZvYJiXRul4jneh8d3jxQ4ZPVDQnbOEGfo3rX4ZJwfxPHtmq7zTeDnguSuQSbx
	w=
X-Google-Smtp-Source: AGHT+IGY4gJHYuZPVzgOb45KyqP/qN/oMIbkXRuNOA7swJdbbPvohNvkz6d/MEXtU6JQ0+H+osEx3LW6L8rG
X-Received: by 2002:a05:6e02:378b:b0:425:9500:ec46 with SMTP id e9e14a558f8ab-425955fb24emr266183645ab.14.1759176426968;
        Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-425bf6d35ccsm9188915ab.22.2025.09.29.13.07.06
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso4769513a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176425; x=1759781225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=DpIgItuA/K8nC/n9G2Y3rf47n/R8vg7U4qrfGbDMZmVlbJjiNw7uMarM4gY6rp4NG9
         zK0sPELYbsEYMJyg4yBdwavUBshzwX+1jEwRjbl39tIz6INlI28igHpSwgT08D+NOhHu
         4e0UuzmXGTnH8bLxL2M+cZ9rkQKAHs2Yna33M=
X-Received: by 2002:a17:90b:1c81:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-3342a2bf175mr20116992a91.21.1759176425639;
        Mon, 29 Sep 2025 13:07:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1c81:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-3342a2bf175mr20116976a91.21.1759176425253;
        Mon, 29 Sep 2025 13:07:05 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:04 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: hwlock: support for brcmstb-hwspinlock
Date: Mon, 29 Sep 2025 16:06:25 -0400
Message-Id: <20250929200628.3699525-3-kamal.dasu@broadcom.com>
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

