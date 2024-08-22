Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16161CEAAA;
	Thu, 22 Aug 2024 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346612; cv=none; b=LLjCUGfJEaZNUIflK+9yDF0MH/v/WaL5mT0Yob1fyg/DjZBkgJk2/dmIVvq3/jHaTCnZLXxvAjR2wFJHVM5/QBqg8LS9FvJWM3NVdcl1DKpotVOJYgFDHMrSyx4k1xDfVwgtkQIg/cv2MGI9Yi44hcDS/hSMBLx5J1ray9uZjAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346612; c=relaxed/simple;
	bh=X0W6f9O8bYoUbFIXpqrbKRr4+wfpl8fCRYJ/t85ZcTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGNrzz212N9UWjnsVomjqIAQ9JzOSE/fTdfrYbxJ7DnSoYnYefkJzjNCGwZpFpUtt8XX0g2pGr1iccYzXJvh35tDiBk2blU/cgJ3qXK/G2lDvUvDoF4dcepj0PdSgVWSxgGaUpZQ5o27FIJTT12OlCWgR6vUWG6Xy3mzrAdZEtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17BAFEC;
	Thu, 22 Aug 2024 10:10:35 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.37.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E98E3F58B;
	Thu, 22 Aug 2024 10:10:06 -0700 (PDT)
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: mathieu.poirier@linaro.org
Cc: Adam.Johnston@arm.com,
	Hugues.KambaMpiana@arm.com,
	Drew.Reed@arm.com,
	abdellatif.elkhlifi@arm.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	sudeep.holla@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External Systems remote processors
Date: Thu, 22 Aug 2024 18:09:47 +0100
Message-Id: <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding schema for the External Systems remote processors

The External Systems remote processors are provided on the Corstone-1000
IoT Reference Design Platform via the SSE-710 subsystem.

For more details about the External Systems, please see Corstone SSE-710
subsystem features [1].

[1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
new file mode 100644
index 000000000000..827ba8d962f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSE-710 External System Remote Processor
+
+maintainers:
+  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
+
+description: |
+  SSE-710 is an heterogeneous subsystem supporting up to two remote
+  processors aka the External Systems.
+
+properties:
+  compatible:
+    enum:
+      - arm,sse710-extsys
+
+  firmware-name:
+    description:
+      The default name of the firmware to load to the remote processor.
+
+  '#extsys-id':
+    description:
+      The External System ID.
+    enum: [0, 1]
+
+  mbox-names:
+    items:
+      - const: txes0
+      - const: rxes0
+
+  mboxes:
+    description:
+      The list of Message Handling Unit (MHU) channels used for bidirectional
+      communication. This property is only required if the virtio-based Rpmsg
+      messaging bus is used. For more details see the Arm MHUv2 Mailbox
+      Controller at devicetree/bindings/mailbox/arm,mhuv2.yaml
+
+    minItems: 2
+    maxItems: 2
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev
+      buffer, resource table, vring region and others used by the remote
+      processor.
+    minItems: 2
+    maxItems: 32
+
+required:
+  - compatible
+  - firmware-name
+  - '#extsys-id'
+
+additionalProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        extsys0_vring0: vdev0vring0@82001000 {
+            reg = <0 0x82001000 0 0x8000>;
+            no-map;
+        };
+
+        extsys0_vring1: vdev0vring1@82009000 {
+            reg = <0 0x82009000 0 0x8000>;
+            no-map;
+        };
+    };
+
+    syscon@1a010000 {
+        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
+        reg = <0x1a010000 0x1000>;
+
+        extsys0 {
+            compatible = "arm,sse710-extsys";
+            #extsys-id = <0>;
+            firmware-name = "es_flashfw.elf";
+            mbox-names = "txes0", "rxes0";
+            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
+            memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
+        };
+    };
-- 
2.25.1

