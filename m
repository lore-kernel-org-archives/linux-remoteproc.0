Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5A433CF;
	Thu, 30 May 2024 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717087719; cv=none; b=kAenUTECrbIgWQD7dpvxo9q1LLR6l2wAUzD4iKfuNGPcytrc4UDOyCsgrxj/2tnQh3lsuOsMY/qTTAx4k0JozhTkMhzC+rBy6smwsBEaDZnxsVJbH4VmcXBBHhJY3Ubg36awSlMMqRQCKYeFtJ0ZEqMapPnGNUCmCvVOur+peWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717087719; c=relaxed/simple;
	bh=lKmuvfoDXNFbZiOdAiMbS+d+/u1RFye+dboYMhfASQg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KwrNzxVeM3JdwFFJROTy7v+EyMGQZp9eUZDF0eMhWhlVeAeY4wRnz+062+oX8KGpEDHT2DuW5/flQ4CaF15U1fABgpKsS5UEnjl+yQK6Zo/hGfqmHkktAnngw0LqXXgan87Vdah6VwzpwE1OUMAXaPG1Ojwiu2HOBAB4jkuVRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iy6cmJFa; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iy6cmJFa"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UGmHME017905;
	Thu, 30 May 2024 11:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717087697;
	bh=TVOKGmL0tsMajVJ5Xw6oawFrNFyiSxePpnSzJ0r1fxE=;
	h=From:To:CC:Subject:Date;
	b=iy6cmJFayMLPE2OkEm+eATEtzgwSh+3yR2PoaHQSU/oFuxpJLUhuF4QC68d+xf1kf
	 UDYn31/Cg/s4nt9az3lz3XnSe+aSMcT9B/cY9a8BGqwNfLYtrgex4QZGWHb18SgOWb
	 Q0Zbz6GAoNuaKY0rC0MHbX1GfYk/EhLDosYLeoAc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UGmHHJ060715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 11:48:17 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 11:48:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 11:48:16 -0500
Received: from localhost ([10.249.48.175])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UGmG4w018652;
	Thu, 30 May 2024 11:48:16 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <devarsht@ti.com>, <s-anna@ti.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2] dt-bindings: remoteproc: k3-dsp: correct optional sram properties for AM62A SoCs
Date: Thu, 30 May 2024 11:48:16 -0500
Message-ID: <20240530164816.1051-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The C7xv-dsp on AM62A have 32KB L1 I-cache and a 64KB L1 D-cache. It
does not have an addressable l1dram . So, remove this optional sram
property from the bindings to fix device tree build warnings.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
Changes from v1 to v2:
*) Kept back memory-regions property, as it is unrelated to this patch
   correcting the sram property for AM62A C7xv-dsp nodes.

DT binding check log:
https://paste.sr.ht/~hnagalla/cb26237560a572a17c0874b687353e00b400285a

v1: https://lore.kernel.org/all/20230810110545.11644-1-hnagalla@ti.com/

 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 9768db8663eb..771cfceb5458 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -111,7 +111,6 @@ else:
     properties:
       compatible:
         enum:
-          - ti,am62a-c7xv-dsp
           - ti,j721e-c71-dsp
           - ti,j721s2-c71-dsp
   then:
@@ -124,6 +123,20 @@ else:
         items:
           - const: l2sram
           - const: l1dram
+  else:
+    if:
+      properties:
+        compatible:
+          enum:
+            - ti,am62a-c7xv-dsp
+    then:
+      properties:
+        reg:
+          items:
+            - description: Address and Size of the L2 SRAM internal memory region
+        reg-names:
+          items:
+            - const: l2sram
 
 required:
   - compatible
-- 
2.34.1

