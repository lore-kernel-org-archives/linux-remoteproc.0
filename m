Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20262219FC;
	Wed, 11 Jun 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636196; cv=none; b=obkFageBAAT+bpZAe1E27F34P4acJVzKHFWuYw658c5U87DWM6dM9mHMsqz+1y9U2rfQ/rNSisezKukVXy9ZjmqyoD533QnyCjQqkSSuStL98ftD93TfXvsVDSic/0fSyEPXnDOhzcSosJqpgqiRw02No0A/DWmd7T7i5UnJefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636196; c=relaxed/simple;
	bh=uv6wy8a8ri8Rk6Bv9uSd6J1RWk714HaZu7i2RogwTWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JsGHsSz8AEAVw6ERBxAuhVWJxbS/0RkRpm60Ju59j4JpSrElJSe/ENoE+xTKNKpNHB8taSxyjEaPzIWfYoHcxqjANbCRZcS4SvYwxeRuiCrU9WnemTpg18A1WQjyYHoNZmMjWyGoTI4eG0F53NGPV1uqGz3MT9+5KpQKusho+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=shnj01YX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vFObAyz4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="shnj01YX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vFObAyz4"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749636193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qd1MN17pSqV3mr06IKYN/Y7X3TrqQO0v8MeldDeV3+M=;
	b=shnj01YXoMPQV/NSl2bJpQ3ml67GgyrS1YNr2tIOSC3qubw7sMbZ5UvdnqUg/yihFyXeNR
	a6Skmww9JUubnExvsxM9Cj8ijGwAZWlwdQ6HPbuj86mz94PpvMrrMQcoB8yIcF9ai05Gic
	Uem9e3kBf42drnefdWOtb/qXF5YgA5DYL6PyGANJMgHLd52EzbiZp6noK9xzAp9I5BbqHr
	cww4PS5uKPH+8lz2VQYBCRgABu+xKH+uL5vY09mw9U/Nyl/FlD3E3aipqyCekMKM3b1U6m
	8v2+jX3ULwk5c/i6Xg7BzYS8JGtQsFKtrT9aXZOua5ei59mF4XSFXC7zXjsFLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749636193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qd1MN17pSqV3mr06IKYN/Y7X3TrqQO0v8MeldDeV3+M=;
	b=vFObAyz4Eg8tJr/G0EbW88dTSIp4y6yZ8QS7ntviywmgqKIsFPkbyd/mWEHZDjLXwHASB6
	0BKsONt8X4f5jCBA==
Date: Wed, 11 Jun 2025 12:03:06 +0200
Subject: [PATCH] remoteproc: Don't use %pK through printk
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-restricted-pointers-remoteproc-v1-1-f059097ba663@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAFlUSWgC/x2NsQrDMAwFfyVorkFOnQz5ldDB2K+ththGMqUQ8
 u81He+Gu5MMKjDappMUHzGpZYC/TZTesbzgJA+mmeeFAwensK6SOrJrVUqH2nBH7Whak1vZR8Y
 asw93GpGmeMr3P9gf1/UDEBa2tnAAAAA=
X-Change-ID: 20250404-restricted-pointers-remoteproc-601a0e6ad143
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749636192; l=6773;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uv6wy8a8ri8Rk6Bv9uSd6J1RWk714HaZu7i2RogwTWk=;
 b=Az5CsUZmbkGR7nFgWHJ3zKgy5Z09s5iwgKrK7a7reGGSVlRLX409vWQY3Exoa38q5Dn8b/LbR
 A5ncYngeULGC+jmzK7RNo0weBSqqpK5I2TSi5CY5r0Y0+jjyyE5oQzT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/remoteproc/omap_remoteproc.c     | 2 +-
 drivers/remoteproc/pru_rproc.c           | 2 +-
 drivers/remoteproc/remoteproc_core.c     | 2 +-
 drivers/remoteproc/remoteproc_virtio.c   | 2 +-
 drivers/remoteproc/st_slim_rproc.c       | 2 +-
 drivers/remoteproc/ti_k3_common.c        | 4 ++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c         | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 9c7182b3b0382da49f1ed666c289628cf2bd936c..9c9e9c3cf378b00cf2720b77f69179fd4e6daaef 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1211,7 +1211,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
 		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
 		oproc->mem[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
 			data->mems[i].name, &oproc->mem[i].bus_addr,
 			oproc->mem[i].size, oproc->mem[i].cpu_addr,
 			oproc->mem[i].dev_addr);
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 4a4eb9c0b13354fee9803d38d09216fa28ad1c4e..842e4b6cc5f9fcd9654683da9ffc15e594824c78 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1055,7 +1055,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 		pru->mem_regions[i].pa = res->start;
 		pru->mem_regions[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
+		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %p\n",
 			mem_names[i], &pru->mem_regions[i].pa,
 			pru->mem_regions[i].size, pru->mem_regions[i].va);
 	}
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 81b2ccf988e852ac79cee375c7e3f118c2a4b41a..82567210052893a501e7591204af1feb07befb22 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -699,7 +699,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 		return -ENOMEM;
 	}
 
-	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%zx\n",
+	dev_dbg(dev, "carveout va %p, dma %pad, len 0x%zx\n",
 		va, &dma, mem->len);
 
 	if (mem->da != FW_RSC_ADDR_ANY && !rproc->domain) {
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 25a655f33ec0ed76b9a90dd31de244832d82c2a7..c5d46a87814905e306f6be1541f60f7a6db59e19 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -136,7 +136,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	size = vring_size(num, rvring->align);
 	memset(addr, 0, size);
 
-	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
+	dev_dbg(dev, "vring%d: va %p qsz %d notifyid %d\n",
 		id, addr, num, rvring->notifyid);
 
 	/*
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 5412beb0a69206385c1b3127ea45d0b77cd312c8..d083ecf02f5cf13d4332041cb0fada213de1f9ab 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -190,7 +190,7 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *
 		}
 	}
 
-	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%zx va = 0x%pK\n",
+	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%zx va = 0x%p\n",
 		da, len, va);
 
 	return va;
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index d5dccc81d46040e4e384e773c474af814823c1c6..d4f20900f33bdd92a59c62d0a7b166c4ad66ed16 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -450,7 +450,7 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
 		kproc->mem[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
 			data->mems[i].name, &kproc->mem[i].bus_addr,
 			kproc->mem[i].size, kproc->mem[i].cpu_addr,
 			kproc->mem[i].dev_addr);
@@ -528,7 +528,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 			return -ENOMEM;
 		}
 
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %p da 0x%x\n",
 			i + 1, &kproc->rmem[i].bus_addr,
 			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
 			kproc->rmem[i].dev_addr);
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index e34c04c135fc90354086de83ab4c648dfb77fdc4..ca5ff280d2dc2d5dd6976ec38233f586c9200bbe 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1007,7 +1007,7 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 			return -ENOMEM;
 		}
 
-		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %p da 0x%x\n",
 			i, &core->sram[i].bus_addr,
 			core->sram[i].size, core->sram[i].cpu_addr,
 			core->sram[i].dev_addr);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 4730b1c8b3228290ef0f6a8d7b70080c26315a87..484890b4a6a7442fe1e298bf43640c04202d4a56 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -901,7 +901,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 		goto vqs_del;
 	}
 
-	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
+	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
 		bufs_va, &vrp->bufs_dma);
 
 	/* half of the buffers is dedicated for RX */

---
base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
change-id: 20250404-restricted-pointers-remoteproc-601a0e6ad143

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

