Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C87E1CEAC5;
	Thu, 22 Aug 2024 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346615; cv=none; b=gJ7Dtj5Ya/OYOaRsXSNBpQOcydaEqFAq2uVwHPs9DTLvamdaFVFkuCx5FiF7RfRBB5ZvEo6hlbtwe/Wf4kEBswxlI0U8n+sBAqZDeH35tFQkE09WB8G+k9dZ6XbH6sd2BEUQ5Ni5vtQo6fp9ooE+j+QL2PhzwLmTSIBiVkU4r/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346615; c=relaxed/simple;
	bh=Wp0A8wfh3Dmu197tkkOnI7V2/dtUt1/KcRgBzxBMvMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hN3+EF3vrKYIEuEPlxSkkLR0YSBca98zKS5Hu+wjVm84WKPNFilvilIrdylnDwGWReDZdIj2oEwMQSfJmcUI/uOM+R8oJLx6s4K3TI4Q6wyBV6ZsRMrf2pu/UuuPpb+RT5ydz39s1VX/rT3crVV7hW0+I1w3jRVxxtyA7MB1YEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB53DA7;
	Thu, 22 Aug 2024 10:10:39 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.37.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F43C3F86F;
	Thu, 22 Aug 2024 10:10:10 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: arm: sse710: Add Host Base System Control
Date: Thu, 22 Aug 2024 18:09:48 +0100
Message-Id: <20240822170951.339492-3-abdellatif.elkhlifi@arm.com>
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

Add devicetree binding schema for the SSE-710 Host Base System Control

SSE-710 is implemented by the Corstone-1000 IoT Reference Design
Platform [1].

The Host Base System Control has registers to control the clocks, power,
and reset for SSE-710 subsystem [2]. It resides within AONTOP power domain.
The registers are mapped under the SSE-710 Host System memory map [3].

[1]: https://developer.arm.com/Processors/Corstone-1000
[2]: https://developer.arm.com/documentation/102342/latest/
[3]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../arm/arm,sse710-host-base-sysctrl.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml b/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
new file mode 100644
index 000000000000..e344a73e329d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,sse710-host-base-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSE-710 Host Base System Control
+
+maintainers:
+  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
+
+description: |+
+  The Host Base System Control has registers to control the clocks, power, and
+  reset for SSE-710 subsystem. It resides within AONTOP power domain.
+  The registers are mapped under the SSE-710 Host System memory map.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - arm,sse710-host-base-sysctrl
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^extsys[0-1]$":
+    description:
+      SSE-710 subsystem supports up to two External Systems.
+    $ref: /schemas/remoteproc/arm,sse710-extsys.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    syscon@1a010000 {
+        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
+        reg = <0x1a010000 0x1000>;
+
+        extsys0 {
+            compatible = "arm,sse710-extsys";
+            firmware-name = "es_flashfw.elf";
+            #extsys-id = <0>;
+            mbox-names = "txes0", "rxes0";
+            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
+            memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
+        };
+    };
-- 
2.25.1

