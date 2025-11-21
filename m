Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D713D2B2;
	Fri, 21 Nov 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735016; cv=none; b=Y5wTqj37vv64VjIe7Wrdq/DZPn0yaL2XnJQO5L5RmN3R+f7URwT4Kyx2Eam+3XhEjeGhEEIK+yU7DDUahmyMK1T4qwGf+1WzZZJZXLjwjHmsvbxcm7QvJJ9+xj0pG8tIaMdh/qKXJdYFkYPX/8yrwxhEYzkCJ0s9sAyKwwLo4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735016; c=relaxed/simple;
	bh=RFyZjpBNatxBQivso0cNp/3Lx9sWRyFCzpK28LJ9vrw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9QDX8jHTOKk5EwWFjUbuft4ZQJeTN0XJyN2Yi/mZLQKpx+5PZZSss40kVioeKSo9h4+0lvKkZ+M8OtFNXDm0X4PCIHKSGoDGRfABnIVrsup7zut7ZKbx91Q2CfNr56WRkRJ4Ml62O0rKs2MCLErU4aGjSRXr/siZA3BUcRPqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OY9cznM7; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OY9cznM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763735013; x=1795271013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RFyZjpBNatxBQivso0cNp/3Lx9sWRyFCzpK28LJ9vrw=;
  b=OY9cznM7E6IUVnQHAm5+l9RIzGBZEYbvlqQKP51bhj1qZ3/s32yd+Zbs
   0AoSpFdS0Uiwu/i1nc3P7gDwUFL/Oizm1Yg/wZ41bNn+U0V5X8SVCrOip
   q+kSbpMz+dqk0DVt91krHLk2mBhGooM4CSx0kL6Exrv9FoC/yn/nTEWwU
   Kq86nvQ3pKOZ5X5wnmrxmmhFpMUhu36BAJk9TVOIiA6e3lPv+qUvmljir
   I1TZHRGgCrb6LXYXe+pwKSNHy6t8EaE7QuvXpDYYiwJovdHardBHvwxsU
   USN3w1/JJmXSbNnnAIbHxuUPA2uGGt4iQltX+WIJekLoc84JVHA4YnPEY
   Q==;
X-CSE-ConnectionGUID: 4DZCiQy3SkG8XDg7u9KRRg==
X-CSE-MsgGUID: C7mIcXaBTzWhKScVqYC/yA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="56050813"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 07:23:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 07:22:37 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 21 Nov 2025 07:22:35 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC remoteproc
Date: Fri, 21 Nov 2025 14:21:56 +0000
Message-ID: <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Microchip family of RISC-V SoCs typically have one or more application
clusters. These clusters can be configured to run in an Asymmetric
Multi Processing (AMP) mode.

Add a dt-binding for these application clusters.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../microchip,ipc-sbi-remoteproc.yaml         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
new file mode 100644
index 000000000000..348902f9a202
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IPC Remote Processor
+
+description:
+  Microchip family of RISC-V SoCs typically have one or more
+  clusters. These clusters can be configured to run in an Asymmetric
+  Multi Processing (AMP) mode where clusters are split in independent
+  software contexts.
+
+maintainers:
+  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,ipc-sbi-remoteproc
+
+  mboxes:
+    description:
+      Microchip IPC mailbox specifier. To be used for communication with
+      a remote cluster. The specifier format is as per the bindings,
+      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    maxItems: 5
+    description:
+      List of phandles to the reserved memory regions associated wih the remoteproc
+      device. This is variable and describes the memories shared with the remote cluster
+      (e.g. firmware, resource table, rpmsg vrings, etc.)
+    items:
+      anyOf:
+        - description: region used for the resource table when firmware is started by the bootloader
+        - description: region used for the remote cluster firmware image section
+        - description: virtio device (vdev) buffer
+        - description: virtqueue for sending messages to the remote cluster (vring0)
+        - description: virtqueue for receiving messages from the remote cluster (vring1)
+
+  memory-region-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      anyOf:
+        - const: rsc-table
+        - const: firmware
+        - const: buffer
+        - const: vring0
+        - const: vring1
+
+required:
+  - compatible
+  - mboxes
+  - memory-region
+  - memory-region-names
+
+additionalProperties: false
+
+examples:
+  - |
+    // Early boot mode example - firmware started by bootloader
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc {
+            compatible = "microchip,ipc-sbi-remoteproc";
+            mboxes= <&ihc 8>;
+            memory-region = <&rsctable>, <&vdev0buffer>,
+                            <&vdev0vring0>, <&vdev0vring1>;
+            memory-region-names = "rsc-table", "buffer",
+                                  "vring0", "vring1";
+        };
+    };
+
+  - |
+    // Late boot mode example - firmware started by Linux (remoteproc)
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc {
+            compatible = "microchip,ipc-sbi-remoteproc";
+            mboxes= <&ihc 8>;
+            memory-region = <&cluster_firmware>, <&vdev0buffer>,
+                            <&vdev0vring0>, <&vdev0vring1>;
+            memory-region-names = "firmware", "buffer",
+                                  "vring0", "vring1";
+        };
+    };
+...
-- 
2.34.1

