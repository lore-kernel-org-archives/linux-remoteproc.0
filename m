Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614757;
	b=AQ5/r8UuzrdRWEZGskyEw8otsYZR2WoNzfPqdhrbT6ZedtMYIh4vhWpT+WnsNjbkGGqS
	 89pELL7kzdu/umczaRkLR4zfgO5/X5mxlHyYi4oU6A9eO/LzoGMpCUS+gr8dXmiVpbgbp
	 T211Q4KU9H6AyIULkIvr51b+i8NyFyI2aNDEgfZ0kHYfeYXnYEExmfxV2CRz8f2lqBIdX
	 luyASMGDJftchJZit9C+nM4nYffvI2Agq/Y6CjWV862aVL9zr8FLntf3FzfLWN5ZeRzot
	 Lz+rJD0+Rq6fD6K9Mc41RELxIZsBMesFznOAFt7C2mePZosrLI9xK0CkOA9MCOYOUeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
	b=c2hywM95mWYxMriXPlvMrtKp73CHkYsVNPU0Ax4YxMBWQsW7Omw8fOMIwA8aFLwRhLCy
	 EahgymNcZ6YYlMm9jAsMGYmDQFkQeqbZExFnN86uCokgMQ1Rln8WkxW53Qj9uhYSRYtdm
	 kVRDfDL7EimHih8FdRaXLJ72URrFOZ6obk3p/TCUEgBkJDuh/mPdhCiBp2BefAz0iKcdW
	 lvtOxUB9I4IcdeNXpRNusSC0ZnbyhgCAJ9TS4ALAmLTAhclUBqEsrfPcXCNGBbrNREUgV
	 gTcAHdeZMr2x34pQ7KrcS4zyaO01ZJDmXaBven07Zxz/z8hzGnjEo4e7NNtEWsqnIiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tKeXOprt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8987606A321
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8987606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tKeXOprt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so53944515e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795614754; x=1796219554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=tKeXOprtx1Ujd8UMEBf52l6al9otGYsbPqjznhOI+j3/ue+g+XVC/7nZ8tFEEC4Zr9
         HhRroojYXR80WrVwcGEqn7c2VSHArfIfjph8d3g1i0hFcEkAbEhZgV7cfz4vyjbuJIIf
         FrEF1FartKqXLYXjdkQmaQesuPGyvRsOrRPUW2un6brYPuAmJ2xemdNBwdYspKuKysGw
         Q3d4b6jVFJjtcDxL/AstQbZ5vpu85viWt4a0EVCJ2M2pcPy6mKkAAd23Zg7FRNpUKSGf
         16q+ljEG4vCu5YmFIICJW07N7ypoX23TwM0NGIBZZqjRjMb7G9i7Ooe/oijCHnxfM2rq
         H18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614754; x=1796219554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=vTXh9PxckXGo5BVlQ5jvZZSOBflK3Bg4+88DcCU6qUigym42e3pCqIzqReGHVWrudd
         vEnLy+gHdBqNf2cWp6uJSzTNFwc/wBP56NgtSFmxd6kmAlHocZZMhX9XupZd6dMWNxhM
         iVaX/smFoYDAfRCaUTM6K+COSDGs2QHTvwJ1tLML81haLvKDAZ2fkntA6VqmNSC41zu5
         Z7vpTs1GMaK17vLuGcxr/+/5QFBtwwQ7Vr1Jv08tNtu1YcA7r39jJ9lAhS4XbbMAHOvM
         CwC2opRXWVi1nkHEZ3qG4icDec+bn94v/WEfNRMNcX1YIDQ/bBOWB+yyhMfKUoBq2rVG
         lZhg==
X-Forwarded-Encrypted: i=1; AL+hErFkHkxolzpyurWLU66gmasCJ9HbFM2TzuanhXRSjgaexRhHeZ+XIHdFckOCG7k3MauEKt2ksMMcesU0vaco8ah+@vger.kernel.org
X-Gm-Message-State: APuU4Z8dxGAe6QlUKtoJiRBLEyarC/xEpGLyti9cjSg3j0mLcMqyo9vA
	K7d+c4pMFwagG3vOaMxqlkiSotbM+d3hvho7EfQbh7lN+xlrRvb3cV5UcUWBRqLjr+c=
X-Gm-Gg: AZFdTZdGBk/yfbW1tXcaZrKLk1qpfOX2oXfL7qHtaPl1sZjRCwF7fhKGow8JC5iEm1y
	SaHW6GuQm3ZYxjOcSXxeCzuxNPGjlYcpe1Vz1t0CW7ppJpcvvrCZ07hSd7SPA40PVMo+gZGAaVh
	tPItz0bwIWRH7KoGPtsW+mdhtlNyFRXpEUIQ9iYXlNw7MXbM16rUDBSqj6is5SyZrPIVecZC22p
	QponsXULdCqWGOPj/PsWXmKW79Ei80PeEgzYBLApOKi5koyYbt5pY9WrNKBHogLOBr4/P5NxfwV
	aCGPjDbyHmLUij3Nop7ZBBi3QCP1Vj3bgN/FutM5Bz3g+uFwwI6OKHZsSMMcLrU8JU1tEX0Pik9
	no0BBHFaWDhA55NYtRzhR5i73/63P+b8CBpYVfGCMX/estZc3zvMPtLA03vqoLqzYnlyXVftEMz
	b9/V6U0uYoKifM/drb70mJxnvetuXjrPf5vqhtaGhwoH84P6LEDeyrdQE/AAAf1D1VBvBYyQnne
	wH3JAz3DGZd0sZNDLVQ86S4vkjTRsNKsFDgihYimD+8t6R95O2A5aNDErOtkaEgMzmZmuLgP1Rj
	8NmRN8KFYpddXMrONPUC1WoVRf15uAov/h97dUgpGJLUl3yr3szzlXZ7Vph7+hwMrQRKWyPWe7W
	tqf9ZNbva6alm
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr367951945e9.18.1795614753817;
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm469009105e9.9.2026.11.25.05.52.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: hwlock: st,stm32-hwspinlock: add mailbox cells and interrupt
Date: Wed, 25 Nov 2026 14:52:31 +0100
Message-ID: <20261125135231.98914-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides locking, releasing a hardware semaphore raises the interrupt of
each core that enabled it for that semaphore. On multi-core parts
without an IPCC, such as the STM32H745/H747/H755/H757 (Cortex-M7 and
Cortex-M4), this is how the cores signal each other, each semaphore
serving as a doorbell.

Allow '#mbox-cells', its cell being the semaphore, and the interrupt of
the semaphores. Each core has an interrupt of its own (HSEM1 for the
Cortex-M7, HSEM2 for the Cortex-M4 on STM32H747), so a description
gives the one of the CPU it is for.

PebbleOS, whose STM32H747 port uses the semaphores as doorbells between
its two cores, describes and uses these.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
index 829d1fdf4c67..3b8d872b7c21 100644
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
@@ -9,16 +9,30 @@ title: STMicroelectronics STM32 Hardware Spinlock
 maintainers:
   - Fabien Dessenne <fabien.dessenne@foss.st.com>
 
+description: |
+  Hardware semaphores, which also ring doorbells between the cores of a
+  multi-core part: releasing a semaphore raises the interrupt of each core
+  that enabled it, and the core taking the doorbell clears it in its
+  interrupt status.
+
 properties:
   "#hwlock-cells":
     const: 1
 
+  "#mbox-cells":
+    const: 1
+    description: The semaphore ringing the doorbell.
+
   compatible:
     const: st,stm32-hwspinlock
 
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: The interrupt of the semaphores for the CPU the description is for.
+
   clocks:
     maxItems: 1
 
-- 
2.45.2

