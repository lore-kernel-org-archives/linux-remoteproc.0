Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E15149E1A;
	Tue,  4 Jun 2024 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717521301; cv=none; b=WbDM8fvSFpIu5t0rUgHui6pbP7b29XkXYwahhJ0/R2YmxdbUt0gxn57axKFLnPNwUheJqTlQ1kY6Nb0JbM8UxE4ORklMhooaAAPHzfBSVGntBAIDitF24aLVGxbH21JDpf52l5IwTRguq1YCuRcNRFRASuxEoa87F1XrdqpTaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717521301; c=relaxed/simple;
	bh=gryU1d/X0GPFWbzUj9dRkMeQSfxNdzr55wMLabnRd8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b5l+nvmocsa96nxeyKL3diEVCDT07vYOcTe37TW9akIgVP5Hps+fNTgYlf6+MS7D0FllbsT3dAmT4peyJ5Y1/uDdF+KTXaUFYm3scVt5fvAsc/RFqHu123WOerayE3X4V9h8eU+uJrhzsqvr4yhlcqxeYOeQV1Y0XywU6UmOHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kWBzRrQY; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kWBzRrQY"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454HEpSP050372;
	Tue, 4 Jun 2024 12:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717521291;
	bh=i58hEfuFh9fPON97O9JHgkfTKfM+WPtWzpWCTg0ZfyM=;
	h=From:To:CC:Subject:Date;
	b=kWBzRrQYNMQJb1OlkPJXeh6UoRIXfjwwTgas4Ytm4nFJxnw1chCl2dlda2TStC3E5
	 juPTnarFs1BCP/dwvOj6xA5/E6ew5d92XImpfBPdv0g4FD6HdQzA5Of2fNsdyNDr82
	 9rXLqsA9zpWLGs0Atbj6GxPODESKAgPA/dFXwtyI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454HEpk3047931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 12:14:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 12:14:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 12:14:50 -0500
Received: from localhost ([10.249.48.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454HEomB081681;
	Tue, 4 Jun 2024 12:14:50 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <devarsht@ti.com>, <s-anna@ti.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3] dt-bindings: remoteproc: k3-dsp: correct optional sram properties for AM62A SoCs
Date: Tue, 4 Jun 2024 12:14:50 -0500
Message-ID: <20240604171450.2455-1-hnagalla@ti.com>
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
Changes in v3:
*) Use allOf keyword with separate ifs for each variant instead 
   of nested if/else conditions.

v2: https://lore.kernel.org/all/20240530164816.1051-1-hnagalla@ti.com/

 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 89 +++++++++++--------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 9768db8663eb..b51bb863d759 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -25,9 +25,6 @@ description: |
   host processor (Arm CorePac) to perform the device management of the remote
   processor and to communicate with the remote processor.
 
-allOf:
-  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -89,41 +86,57 @@ properties:
       should be defined as per the generic bindings in,
       Documentation/devicetree/bindings/sram/sram.yaml
 
-if:
-  properties:
-    compatible:
-      enum:
-        - ti,j721e-c66-dsp
-then:
-  properties:
-    reg:
-      items:
-        - description: Address and Size of the L2 SRAM internal memory region
-        - description: Address and Size of the L1 PRAM internal memory region
-        - description: Address and Size of the L1 DRAM internal memory region
-    reg-names:
-      items:
-        - const: l2sram
-        - const: l1pram
-        - const: l1dram
-else:
-  if:
-    properties:
-      compatible:
-        enum:
-          - ti,am62a-c7xv-dsp
-          - ti,j721e-c71-dsp
-          - ti,j721s2-c71-dsp
-  then:
-    properties:
-      reg:
-        items:
-          - description: Address and Size of the L2 SRAM internal memory region
-          - description: Address and Size of the L1 DRAM internal memory region
-      reg-names:
-        items:
-          - const: l2sram
-          - const: l1dram
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,j721e-c66-dsp
+    then:
+      properties:
+        reg:
+          items:
+            - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the L1 PRAM internal memory region
+            - description: Address and Size of the L1 DRAM internal memory region
+        reg-names:
+          items:
+            - const: l2sram
+            - const: l1pram
+            - const: l1dram
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,j721e-c71-dsp
+            - ti,j721s2-c71-dsp
+    then:
+      properties:
+        reg:
+          items:
+            - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the L1 DRAM internal memory region
+        reg-names:
+          items:
+            - const: l2sram
+            - const: l1dram
+
+  - if:
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
+
+  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

