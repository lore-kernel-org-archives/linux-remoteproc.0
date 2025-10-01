Received: from mail-io1-f100.google.com (mail-io1-f100.google.com [209.85.166.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4512D46B6
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342648; cv=none; b=q4SvbQyB7yLhAz3NE6aEPUOoLzndO2EAjJzoDYTgc/EFqfRAOPHtOoq3ncvWwT8MRCSK53Jo1LjlnaUInAQES1nmBei1T13Ol0+ncD/LNZ4J3mo/klps4Z45DZbU0fWRBWlzc6YrYzQ+AK87Do64gsdiy8/AAkTunVjPppYh0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342648; c=relaxed/simple;
	bh=twWts/BBJvvdpMllhwwy0sPWeHXBhThVVr0F+f1kI8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=feyxHnt+odmxVYKSpeMVLF1Co339OarDTGdiOqSZ+/gr2orgk9UEYB//JavH2B2elWR7jyf0SczyJ/u+KWRfwDtB7saqlpNvo9ioLPDV2WTR439i7t6wsVpY1OXKmJmzRPRrko1C6A79I+YxuYRStnHVk9WnEREJ1UYNEUhi71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NM9DTKVC; arc=none smtp.client-ip=209.85.166.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NM9DTKVC"
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-887764c2868so11507939f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342645; x=1759947445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=uCIG29o+LTeRHlT50WS4IlPUaVdcG2HHfhCEUKnH/iLrTY5bI1RUPTSdtqW4LMqfDW
         0KKPV/sWs3m6wIhFOfuRYO5uCWUlB46IOdu6ENbmGJ51B1Xo4II+RnO4LtqOaj8lrQst
         agOcqz/2S6QqMe7icEf43to22uN0HhPBaWAehrX5bfvElcleqhILoI1EUM9mbD1DqtJP
         8To0nB0K1/486/yNrtPs5DosTzpnTQJgJGrLhpowOQayE8gbjHdCXtgs+48ll55twbVt
         DSTXp8nKHld/TK2sR2jt2tn27lE6mtpfjv+CwCQWYX1NZE6Znbq5ci+JmQXLuCx05UUk
         3L8w==
X-Forwarded-Encrypted: i=1; AJvYcCWx8F3je9m6YhJB1jzuI8MuqOFtBc3J6Porg6hXbMPLnwrtjNKXPUwgglA4WiaoDvyo0yVpYIa3golW/s7aWTX3@vger.kernel.org
X-Gm-Message-State: AOJu0YxBO3l5BPh1lugjCTYVw+rIb5QepA4LjOhux1uh7HkrZQPmAldH
	H7hE84nS4u9NIuZyiPcwGVpN/VdtkCMYYmRh+siWr9sd6U0Fy2mQK29SkX3xoAdm3w7dzoJthc9
	iWvmY8Man98jxRV686mVH6/p2YPpaohvKAM+bmCXNNn/eFgKXDDm3bTOdThSrC9VEixYmEyGC4a
	RGRjhcrca0yyOrGkk59E+LTo3pKDMz46VTICwP64+Nuff6pSpe4UsWRNxe80jaEJ8YxTbkKtMHy
	NtJKLBKKGk6XzA+KdaOvQ==
X-Gm-Gg: ASbGnctVRNacu6+uPJPsFCFXnoUNqFYMdVrmAjA7fIefEdFLzBjMm5DMaCnCiPLSGvS
	bZ1agpx+UhghLUNWC7QgANR6J0Ssviq4oTEqSmaCCE27yR39FSkKKjlM75DHCZth7sY/SWr/dOL
	Nu6vbABBFCfm8osdLPJxlFarOg9CKzswWumoNZmcG04lfWNhR8tx591YTuHtllg1LemQ1kBiiFm
	xJIMSioY2Hg+cIyqKKMK5iy7QVIbRnBQpfWbVvQa9yVTlYaO83Rnz1bHXELSu4R3rSD1bp2R0hx
	/Bn2A9s/P62uWAaEDO6LhDGSusEzzROowKSWTgxU36UxPke3AGqLllHUqFjeObq+OGecsQ7h9aJ
	D7FRF1od7ME8KQ2tSJ7yERw6G55y0XLB7lbOLqEQJkv8kO+3BeGVvkKo6CLOucauKbBGbecYSTf
	cJfaiV
X-Google-Smtp-Source: AGHT+IGqDYO9M0W693lxOhtjwwtuA4H0FqgKOI3XC7+6eeUSTqZEpabOu2ooErLJnYBj76fxpwFkXCAVeWHD
X-Received: by 2002:a92:cda3:0:b0:424:64c:5b5d with SMTP id e9e14a558f8ab-42d81612c16mr66941655ab.13.1759342645246;
        Wed, 01 Oct 2025 11:17:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42d8b28c227sm238655ab.31.2025.10.01.11.17.25
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a82099cfso4207081cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342644; x=1759947444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=NM9DTKVC3uORx0VjAAs4aCB9j3rmQAfnn1bZlsb1kHYVsCPf341aWBgPWSAIm2j+m/
         GPX5R8bux9KxGbyuSMzCJm/cBLsV0tdlOoi5Y/Ag4a7j4vEAKvC03ldn0mQqc49rEaKT
         KfX8k5VCZvUvkU/I8BvsUu3KaAcNjoPGHTpN0=
X-Forwarded-Encrypted: i=1; AJvYcCXJpVFjb5yAQt0FIR+Genam5r1ztux1EhmSgouK9NfZ7dzgi0qlNlF11NN8sYLW+yB0b/8JgFZPFz0LR88WyN4D@vger.kernel.org
X-Received: by 2002:a05:622a:258e:b0:4df:3960:a963 with SMTP id d75a77b69052e-4e41c923deemr68250471cf.7.1759342644369;
        Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
X-Received: by 2002:a05:622a:258e:b0:4df:3960:a963 with SMTP id d75a77b69052e-4e41c923deemr68249741cf.7.1759342643640;
        Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
Date: Wed,  1 Oct 2025 14:16:39 -0400
Message-Id: <20251001181641.1561472-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
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

