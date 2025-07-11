Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F22EE610
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Jul 2025 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248567; cv=none; b=E7Dbjhp7TDlK8CNUS7HDOCPVGNrXhRScLFqRgMQsFIGmJCGYZY1+8ejX2g1olLFUKINWxdOpg0NnO7F9Rxww2pyA/mVN0gj75Grs+++u+9kBcLEQMQDUHS6VEHQO7LgaQyvNDR3sURReDjSngKQ6w/b06LbW7ZhZ9fxTOoiDkOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248567; c=relaxed/simple;
	bh=XgmSltbI8bNEECXrld3Mq03ZbDRFnMOxMcuv/b+y/l0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nOdSnTiHeHhyWrmQFYG6W8yMvcp10pmBQ3OnOtTi7Rhmp8GdfZdVvlvhdhMgs0/q1bLta0P03uMK/d/dd9VnnhCwe9QIzty2GX7T1ZrAQ4wLBabcVLkzlYcQ246SSuwrPMk3bLLaIUaATdteUc3wiW2PalTadUZhRRkWfzOStrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=haj5nf9R; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="haj5nf9R"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2206728b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Jul 2025 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248565; x=1752853365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFloaJNjPj6YhrScgdec72uo0x940nsOWxld7fstQWg=;
        b=haj5nf9R0tX0m/iuOaZu067iKeykcYAqmY6vF1o4nFuUMbwyxawG+ulQeCOsY/zipj
         E8f5PG8pb94vmtiO8hYNuRQFIWNEwMLLs0JBPJHovKc4Vbu57KKxuk54Z8li05vBt2Jy
         NW04gAXs8tDGD5rxvI0msUthH2Pf8KLh/Lzw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248565; x=1752853365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFloaJNjPj6YhrScgdec72uo0x940nsOWxld7fstQWg=;
        b=pquUi2xqpUP0eh+FKlw1nEhY3QcAIVb0QCtUKW+nlmYKMgDJPAZrklLYzviEI0lHO/
         LHw/jOBHg7yWQzaJA5Zv/mLoTmftmbt2tAG+lvZhdCBwPEdFjbVoeUDb0UGnarR5DVC4
         G0Niq2lp8a9osRjGWhwqLYQE77oTjXO7/GbYu4+yJYG9CCPyO4AkC+zTykWK1gwDOx+l
         sUd5Pj8OrVJLAk7KsvDraXHLZ4HAGduShfoiviun04D5vwypz4j5BvxwhSdnmRVujq/u
         oN6ppBuD4t+s+5Z/J901QksNH84EpBtqShp6qn2aF0glN3EXLab6Y5RbDKDDBKle73Fi
         kjnA==
X-Forwarded-Encrypted: i=1; AJvYcCUmz2H+6HxcM10UpW8xFmsKF+Y82mJw8RxRVW45ddBVrINbFo1UHc0prKpEFfQ++bPFUJ2YbibBpYxr9ybh5fx/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0/w9rIxDXpAfrmwx37Nwc3ZPYab1kOfDOzN0da85GiFnFy/F
	c3RbgPYhs0Sy9f3EaERFmitgkZPSLmEimyhQZ/JRYqHP/b6PHWJv5MijiZBIp+oZcg==
X-Gm-Gg: ASbGnct23XOI7mG0rn2X9KmqjAFtI22Wl7ELyMexqHSt9OVtk7LTuabETEqCIct+LBq
	GbG9o4/vGXUyIH6VHBktY4sC0emoG4NNPv9J1bz3qcf/Q9E8I1N4DuVGFhtmXJjO9Dr5uSUlERV
	/A4Fq1ojyFLCpWgF5CLINuoKW789XAN6ER4EGK9uFR75xa5gZYP7jJMtY00PTmievoyeesAOz5Z
	KxFxwlhPBR52e23e+VZbxBHMG31DgtNumvCWqrpjLL6HVM60V5aqOmSJHrydnoPWE4YxSoOqmMS
	ZIBZ+OhHOTDB67jsZU4EPbmjCPRYiZgWHEN+Wd3aV1JEFzTcMwJIBM4FPTLxvW5vSec1deoZ8I0
	ozKGAmC7WF3dZ+JHlHqAC6NVcmVPyBpD8nZ8dtG9xVXEaQO23VWCiGT3toScUGvDh4gDT
X-Google-Smtp-Source: AGHT+IHvtMPekpyU5nnmLW/gd6y9CDTVw2Qycx1EF3HESUhtgnvWQRje7hCswHHVti/titoD0QxbHQ==
X-Received: by 2002:a05:6a20:6f88:b0:222:c8c4:efae with SMTP id adf61e73a8af0-2311fcfce03mr5992549637.27.1752248565104;
        Fri, 11 Jul 2025 08:42:45 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:44 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH 3/4] dt-bindings: mmc: add brcmstb share register and hwlocks reference
Date: Fri, 11 Jul 2025 11:42:20 -0400
Message-Id: <20250711154221.928164-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kamal Dasu <kdasu@broadcom.com>

Adding optional controller share registers and hwspinlock reference fields
to be used by sdhci-brcmstb driver.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..fe9be7a7eca5 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -27,15 +27,20 @@ properties:
           - const: brcm,sdhci-brcmstb
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
 
   reg-names:
+    minItems: 2
     items:
       - const: host
       - const: cfg
+      - const: share       # Optional reg
+      - const: flshr_ipis0 # Optional reg
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 1
@@ -60,6 +65,9 @@ properties:
     type: boolean
     description: Specifies that controller should use auto CMD12
 
+  hwlocks:
+    maxItems: 1
+
 allOf:
   - $ref: mmc-controller.yaml#
   - if:
@@ -115,3 +123,20 @@ examples:
       clocks = <&scmi_clk 245>;
       clock-names = "sw_sdio";
     };
+  - |
+    mmc@84b1000 {
+      mmc-ddr-1_8v;
+      mmc-hs200-1_8v;
+      mmc-hs400-1_8v;
+      no-sd;
+      no-sdio;
+      non-removable;
+      bus-width = <0x8>;
+      compatible = "brcm,bcm74165b0-sdhci", "brcm,sdhci-brcmstb";
+      reg = <0x84b1000 0x260>, <0x84b1300 0x200>,  <0x84b1600 0x10>, <0x84a5404 0x4>;
+      reg-names = "host", "cfg", "share", "flshr_ipis0";
+      hwlocks = <&hw_lock 0x0>;
+      interrupts = <0x1 0x0 0x1f 0x4 0x1b 0x11>;
+      clocks = <&scmi_clk 245>;
+      clock-names = "sw_sdio";
+    };
-- 
2.34.1

