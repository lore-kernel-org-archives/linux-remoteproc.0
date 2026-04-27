Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B631F984
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320769; cv=none; b=BuRSMi45wRTJR1+UTdo1vdZv0IKt3/X1tuVsRRTlBKA72yjmh51owCVWeHU4x/kqANo15CgJoOEVYGTS6yHmKH/3AKf2tEFKp3r35x3AAtoxd/aE2GUUN5H0au9RQVjsigKZ2mTf4J6sHQSJoOHxTY6rlxeH4v1ZFT9uPbbju+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320769; c=relaxed/simple;
	bh=TFlgFJMYMQlDmZikVgnpkrUHYORzj7/QkOS9IQvUAI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J9KYUbXz7zPEuxJFWViZ0MrSf+e94H4EHRlql6LpGUkLOAuq++uZ4Pg4o1tXDssIhYexAhpEAzvPZ/Z0mShPEcecgupItfz3VCe4N9p3FMtA0Ut+JR5ZLNGR667R+WhCBlx2TFuAIy317JvkT1M0p8Q9LWILUc2qLQGOL5YKqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hfIwASiH; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hfIwASiH"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-57387f8988dso499008e0c.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320766; x=1777925566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=R6qVidvOlJ7tHSvlEeSH78PSui0VLm9iJr8u4AFr80mexdz3cQUE+j7CNG8SsQ9izW
         ZTD5UnRAQXM5oFTE9IO+jG3KrHElaXUq/XhsOoAiKDN/2349qiMp2qF1XP2fXeyxLaf/
         SxJlivuc+7htGh4tO3RxKLjcJYdzEkvJrcLpd21TtBOZihYGDwXHDKEEtmo3GmfIL9KR
         4T9GU16yJ5jNMV3ZT4uuObLttEeQeXoVS4OyI/itgT396zm9pgz+pQVXHuP4ntZoKeVc
         oo4RU3/iO2ds26GFDRMNo2ryjf+4YLuvqGaCmcKs+zXTML0vSptMNFZE2UIpcV9/nu7F
         lGZw==
X-Forwarded-Encrypted: i=1; AFNElJ/Jm0+8Rnz4Y0nllh3IqSw6QHPHxVRJGG0/KVt9/6VvkhDy3MO+7yQbdtODEVsc2nrBxN7TdpxK6LdJ6Jk9AyDg@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvE1mNmn4M9pIo7RgrO+55UcKjyZm5DfIefeQAa6RMtB+IeYK
	TN3svEvoASMbGRcYr+87O+olfQ6uf+Xu2GtTdxS577Qnz4hedAhkYxEUw+4X9eFWOo90oLcXocM
	fQgz4I8YfNRp0pB5Sm2ZWWeVCrDE3fb+ap6tSDGlmi0L4PDnDdfO0LGlbsgO1GuIdzFu5mVgfyv
	AbMcigyvMo1vyzr5D3RF5YfpbLA2WZXT+dQ7+S+R0vN9APCATn9yjk0+0TPr5/foSkPvzseTd4D
	EDMq+kEk39DNAZZ1ol6Gg==
X-Gm-Gg: AeBDieuwl8VOYV0XQf6OKFKPppwpnZGfJAFDu4di5/p1ck5roMPSIVhnI1HwHd0uY8E
	ZQ/K4ZdWzZtbtDNim5IhOUqdmvbjmibWmGnWessaQmiMGZhYC8YxSMEvhZcrMyJ/yGMbK3GppRS
	7Ccwx1Qy8ThIZzWbcHZ2sY202QOA9BhNd+XT/0hjn2qCycBjN/6+O3eJfXTMMQd4RlvPOzsUe9S
	U28ODlSLGaa1aZNdQo/2OQblue5C4yXPMVig0QIEW2tLI6w50uNn/8k8in6WFLupTUB35nbFnER
	AFZXz5+Gh960Gsb+RWF9Dbtx3TSTMpT9j4xDWszPh4uUqL/DPPZHp84DBSyPNGt0wgQ1dWlQv6V
	UjE+PZ8iWQHtHt7rCY5na02V1F/aLbu7k1cpgHOuIJjQTkAW11kIzQdFfVFnSZ3nC3bcna80oFO
	f2R7kOdRCfVZ9v
X-Received: by 2002:a05:6122:83c3:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-573a574bd4emr115594e0c.14.1777320766221;
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-573a45b880asm26304e0c.6.2026.04.27.13.12.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so28345347eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320765; x=1777925565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=hfIwASiHtV4NAfRQ5fCzQDl88T7DtlNns2NdD8maisauaLVyOYDHfHHWTB5FDTkZAj
         e1qfphJoQZPJewRxUHNgp/uOrokien3OAT+5ajPvDIzoBY67zbw7WkTTYVsK1Rv41Dmk
         Znjc42rF2mVx31tdvdAiDiw96NwtxwWjUWAdc=
X-Forwarded-Encrypted: i=1; AFNElJ87E3xEIL+ZaC1ErEvP8Rd6OUI2UJroQQtFkG+3wsE9BtSx+KmCQAMtrMDdzwvkiIjA0QbG6uuqNPR32EZFCiRg@vger.kernel.org
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207103eec.29.1777320764913;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207074eec.29.1777320764314;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:31 -0400
Message-Id: <20260427201233.380314-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
new file mode 100644
index 000000000000..552f334256b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml#
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
-- 
2.34.1

