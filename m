Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB676049;
	Tue, 21 May 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294544; cv=none; b=P/9ui7URhxcGVoJEi4Bc8Blkq8mjhr8Zk+2sMPui6GUMJrq427aTEixmqgVzTzayJwfhkWUXpAO4UFN3Keqjcudv0bGWLqftiLz86Q7DfSasYFwujZrEYSYu2a3CuQXN9x3gJr2ZqnzIU478VdhDD3mIuqFOtae0BBR9kB2TCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294544; c=relaxed/simple;
	bh=WJAAFv9HpT7EYoeKUho7qzaL00rTB2FCdEQkiADh85I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spKiPQbeH9zN/aTqhPCMFlUyTh0e7frrtvZMig3aEruH09KLMlerSek2y7RpMjN3BSMokXRAztM3nT2foGmvalV2CyeWa+aVnfUQZGRMvPb6FQGR9uISUaQh4Y6rf/2+7/rPrGIPrhs63KksgEwkI7DO7ilvMsDLdDTAKyJOfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=s6mXvl/c; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="s6mXvl/c"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBS5R5003097;
	Tue, 21 May 2024 14:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=3mswl4/9HTAkPLEfs+kyIZ/5HHTQ7/vqhlZwBfB6tso=; b=s6
	mXvl/cifJCKdpn7QCSGJsNJxkhWmGQg1wFV5rBAWMBX2f3xwSyFPjIgDhmftl0pI
	qIbiomDXT4oHh/851MRj3S7xeOlobp9NbWA4hPt043dKYp+72KigW7rNdGaCDzrw
	WZlBh3pfEHxreKt3UYzUdNPnvizMOJA7f3/78LpInPaG2HiM4tbDLsgqFEK/RbPR
	SXAMIxxx0bn0FP6SBkmNYbP4Z0hUGX+VjT0wyekfXmgr7d4ekJnEWD72ChG9Ylcw
	BP4+ZAK3VnTD6m4cUZ1CDf4hmDbezs7mOAqj0IxFW/VFOQmuJydULefi3Lh1g5EB
	y27I2GecMzCSfBdiQfww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n6hkqvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 14:28:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1608940047;
	Tue, 21 May 2024 14:28:38 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8172A2194C7;
	Tue, 21 May 2024 14:27:47 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:47 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:47 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [RESEND PATCH v5 2/7] dt-bindings: remoteproc: Add compatibility for TEE support
Date: Tue, 21 May 2024 14:24:53 +0200
Message-ID: <20240521122458.3517054-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01

The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
where the Cortex-M4 firmware is loaded by the Trusted execution Environment
(TEE).
For instance, this compatible is used in both the Linux and OP-TEE
device-tree:
- In OP-TEE, a node is defined in the device tree with the
  st,stm32mp1-m4-tee to support signed remoteproc firmware.
  Based on DT properties, OP-TEE authenticates, loads, starts, and stops
  the firmware.
- On Linux, when the compatibility is set, the Cortex-M resets should not
  be declared in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..36ea54016b76 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -16,7 +16,12 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp1-m4
+    enum:
+      - st,stm32mp1-m4
+      - st,stm32mp1-m4-tee
+    description:
+      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
+      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
 
   reg:
     description:
@@ -142,21 +147,41 @@ properties:
 required:
   - compatible
   - reg
-  - resets
 
 allOf:
   - if:
       properties:
-        reset-names:
-          not:
-            contains:
-              const: hold_boot
+        compatible:
+          contains:
+            const: st,stm32mp1-m4
     then:
+      if:
+        properties:
+          reset-names:
+            not:
+              contains:
+                const: hold_boot
+      then:
+        required:
+          - st,syscfg-holdboot
+      else:
+        properties:
+          st,syscfg-holdboot: false
+        required:
+          - reset-names
       required:
-        - st,syscfg-holdboot
-    else:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp1-m4-tee
+    then:
       properties:
         st,syscfg-holdboot: false
+        reset-names: false
+        resets: false
 
 additionalProperties: false
 
@@ -188,5 +213,15 @@ examples:
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
+  - |
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    m4@10000000 {
+      compatible = "st,stm32mp1-m4-tee";
+      reg = <0x10000000 0x40000>,
+            <0x30000000 0x40000>,
+            <0x38000000 0x10000>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
+    };
 
 ...
-- 
2.25.1

