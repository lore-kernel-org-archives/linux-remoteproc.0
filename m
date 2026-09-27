Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2358223DD4
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468451; cv=none; b=rXwJLFASylVkwIKjNYageNybLF5VBmDyo3h1BNBZFkkhPneNWD/M+K19EVEgFk81KNYr5/g6Da7BqHq9BvTUbbdZmmKFxKL0hriLXLb1Z6ztYta+wOSiWcxQwb+/5HFLN7Ta0YvnwOMF7x7fuxAGStmiSBRJGXyWLPvbNwC3KM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468451; c=relaxed/simple;
	bh=KUqMhiQcS4AgsYPuncz05+mw8gLtazXZDPzDeOszHBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEhj+L4MAnzTJUc5XV85+KwzT+7on522gDhfdKLv14fI4DvNHLrtbJoK0BF0MM0hwmHnIs5C4NKnz/F7ryNVUHtb8j0vJV0XrMt6PTphpFP8sTegrXE0yZf7sGUKcQnJLjUi/JsO20LdhSzoXZFZj/IkdecErOa1DC+d8Lv6cpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOXR9oJx; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOXR9oJx"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d811890762so216813eaf.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468448; x=1791073248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=tOXR9oJxqFC9o4A4yAh4jZbDEM7Q8+5Zf+iNSj1QyDyndH0cmcXvSRNqMuFOJT+bXM
         qmanFa6NEfXlEOz+oVYvvIUBoH2T6riRyxJ3N38BwWW/rzyB4oiWe+KrfkRCp4YG2B05
         w+D1+rNrjHuioEL4w9SwB6ilOtajvtEeefhMxpDJ6sPDXIhDsGOgAncDhpipnQEU9Mft
         xSfuGZqXi3CGjOfV5UFh1sGN80n2eeAlupGK9hBHwc/sDwCpLRzkt10K5VXZo6LBLxJD
         MhOC7RnjEWb8xVlFoyBR+32X1lTKuWwSLfPrR+e5SMB9KpLXEm6oksT6SmECfSiqTyic
         0zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468448; x=1791073248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5J3pzpTC8euWZ64R9GaI6gZQCXcNFJ4o9q8CcjL5ik=;
        b=BwZnwrQEXSUYNUDKWHOyvyNRpKRS9QsND8F1cBQoDSuqJrnketjVaq5TtDVzFx6FEH
         8blcPUuC2dHEmMG7B9c2tEY6IiSaDwch3/fshuXTkgsWNsFuewVTH8sqQQhmuhp9dSMO
         L8oXIFhGFYITOIDgs+ZFETZsxJ4CtscXwYhG+RTtWhDWKvEdctyCo3m6e447yKsJP3xz
         RAP47U4l++L6PB+PtF/YirnRQqxx9z780/8oOanAHWW/3MVhvnahTy+VwjFvCk+gYof6
         2UJz/S7UwjNWC7TfjJjlm7t2rJcYjkN55pnH9Ac5m6sQpk9Dt9Q5SK7Qxz9S5hjI8hDQ
         sxGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwduBJPSQe5CfxA0v3lwh60uLLp8cGBd9sDG9V9WJt6mHwPHRUOEBC1Tx4eiOoVb9Lhfkxd/Q08hoQpJh2nHLii@vger.kernel.org
X-Gm-Message-State: AFuF++nHM0y+/W8rg3uO16J7g2Xx696VWm44ikOlsOgT6cJ77/gkK60e
	M1vucVseUS8npEGknkQVdjPVJgGfldinv5gnWSGcLxUXCI1hSM7cEQOI
X-Gm-Gg: AYBFou2NZfQd6O6c+CoVYyv2AU39k/QhYarVPvbRP5eztccUd8uaCYY5H11Xs8ZXtaJ
	nZyFCbmsJ+1hkeXSitIbHD7MYAlzFho69BVMTOCijYrUdxaHj0ZWo88rMPeyPRMHSoHcC1EH1Pu
	4Kyi07HiA7rfDyLbfm0KQNZ19JxwYca1nx4+pUL6T1XBFxAavl8xOVA25kCgvTWTVR8DVvJpKXs
	nvotJfNVKKV5qfV7BHGJTrtpkr/cht99hwBGj3UkumNd5VdeJ9bwdXs1MNDKuf2fjUAr8mChBs/
	Azr8GamNwR3OdVHOhhsyQNDooK3gC4Ts0ope3g7FaA2/ELFVGrGLHbkVk+QDGlsTkhBlaqcYMT4
	QEwJ5jdr3sszrU9Twili/8i2QotN8h8sIoNM9BOmkIhzz/ko+hBfKYEtKWTq15Zr/EyJa4EY73Y
	D/jDeTMransc/6YeO87D0iiLgrDfMJLUw8VG6NQyp8+4tOENQno4BBVlqrhuoY3/4rnipGRQGas
	JEgAZKSKeBqx2koxucWGA==
X-Received: by 2002:a05:6820:290e:b0:6d8:6dcf:54c7 with SMTP id 006d021491bc7-6d86dcf582fmr353279eaf.82.1790468448578;
        Sat, 26 Sep 2026 17:20:48 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:47 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Sat, 26 Sep 2026 19:20:10 -0500
Message-ID: <20260927002021.797069-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner 4-port hardware
Message Box controller found on sun55i (A523, A527, T527) and
sun60i (A733) SoCs.

The message box connects the ARM Cortex-A55 host cluster to the
HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
co-processor across 12 logical channels with 8-entry hardware FIFOs.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..6b0c7ff70c9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sun55i 4-Port Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
+  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
+  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
+  and XuanTie RISC-V co-processor.
+
+  It features independent 256-byte register banks for each processor port,
+  12 logical channels on the host (4 per remote processor), and 8-entry
+  hardware FIFOs with level interrupts.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-msgbox
+      - allwinner,sun55i-t527-msgbox
+      - allwinner,sun60i-a733-msgbox
+
+  reg:
+    maxItems: 4
+    description:
+      Register banks for each of the four processor ports. Each port has
+      an independent 256-byte register bank.
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description:
+      One interrupt per processor port in port order (arm, dsp, cpus, rv).
+      The ARM host port interrupt is required; remote port interrupts are
+      optional. Use interrupt-names to identify which ports are present when
+      providing a partial list.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - arm
+        - dsp
+        - cpus
+        - rv
+
+  '#mbox-cells':
+    const: 1
+    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu 120>;
+        resets = <&ccu 45>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

