Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFD4EC674;
	Wed, 16 Sep 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593111; cv=pass; b=OZ6VX/XZiCcVCcf9V7OPp1zPUgoTgVhMFZAVi5eaEZAChDsRyqH4DZB598NWHHroYCIhEfTDPesKdNDhnEaiJhu0cTrSyoc+QGVfJ/tJIHb7IV4/OOcP2pvEpN+w15cMkY4NEmniQUak/3qPV2SC4raKBXoIr7VoXXb7x6jsc0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593111; c=relaxed/simple;
	bh=K0aajd5pS48LBp4SgsLFJE8s+5HK9UUUoA1f8WnnLLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIqRnKqxKfUiawzpTMbJ7uHMTvvGwpLhDQBUNd1phe4xE1I5T9lORkjdvwgMhSt9jTECOSgMzX75AcMpb/itO1i85x/4wpWr+F91e5mP6S43eyiWZdDbWF60j5T9uyFFb874pPwsQxySd6EpOmlinaMFdR7cmjch4OCQ8nf3n0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=BY5ZbPg+; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=lImYJULP; arc=pass smtp.client-ip=185.56.87.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="BY5ZbPg+";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="lImYJULP"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593098;
	 b=feb2YylhCxflxfHL4zJUPGWsAuqITYc8PQFrzmRVCZo42htZgc2JM2+RAg8XlDUvDWJ0oHI9b+
	  DvKsPjuFtxhXvfNfAphLPXo1KTh7lWqkpoPIGnd2l6EAJAxZfMKFhuUqOJmgZb61AvPBE4ibRN
	  Cb80g3UV4G7Vfj8MnXyoYz/O2St9P6gcyXvP0j5TXwUh3zw9qlQuUWWmin9JKBlD6lFWtadvL5
	  3zzrqM6u8wMlLuzxZGkvC+Jo2qdPIVBL30jKI3cy3jWnHrxFlRHAw2lpApey5ADfCXrER6joJs
	  zBniqql88qacNPON2ZszZuj6JLntiXye/ys/wbC4h/YL5A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593098;
	bh=K0aajd5pS48LBp4SgsLFJE8s+5HK9UUUoA1f8WnnLLQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=K/PiTzZtGab0XhCJ1LJm+KVRrX2KFNJWkCrn7dbsz11dWQK00SJupoHZA3vt2scYFmyl/Ta/en
	  yZd1jj0ent7zaQECO63O1h8LlDa50BewhbdfDhZJATnQj0EwKTdeAA5iVvTpYwUQ3KYD7LZnXB
	  DS5wVPG6rFLk8RTm16+L2cNh1F33vq5ADoeFFqo/NkshSkGG9YLNkDSdeCzGmgoUc0uKjWN+3R
	  O1eA5C1Ypz2s9rdrlr/og3bbilkQwvdxUzZBKiEyYaYdnq+LNSZNkTvEwvCUTBkIrPaDJZ7lh1
	  oC+/SNXGwxUjc6oXlUBFfnob0K0cVCVAHueSgpuNwUxddA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=O4gn2eTg00df8U5IdZkWMPepVAvVYYSdUxbjRaptMcA=; b=BY5ZbPg+N+UZ5lsM6FO/0lhCxC
	fARMu0iAtscpSTEBhsa9zSnUkxrbrk890SbCLDAruhDP1oqt1wA2Ne5RT/bFMZyxwUSu7hvbuFqSf
	30upfBs+mjt3W53iEqRelOKW/uFN0xt1dO5poBkOtfdBnttshy8IQbzNro2JsE4D9Qns=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuP-00000003Kvc-00EC;
	Wed, 16 Sep 2026 21:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=O4gn2eTg00df8U5IdZkWMPepVAvVYYSdUxbjRaptMcA=; b=lImYJULP606lAusNp0RIZVHM1H
	X+2IhcV4MWT1bJsGzKtI6WJJNy9MnK5IlHFu4gvLWCNpMW7byY+jYFgfU/ypI9MVic7iE/igZni1E
	Jy/VMKdw1Y4sewlhk9/OeFOlhmtjCVAYNM4k9l/e4pj2JKzUS//mokZnbxTh81JlMFoU=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuJ-0000000058P-1cbZ;
	Wed, 16 Sep 2026 21:11:07 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:49 +0200
Subject: [PATCH RFC 04/12] dma-coherent: add base and size APIs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-4-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=francesco@valla.it;
 h=from:subject:message-id; bh=K0aajd5pS48LBp4SgsLFJE8s+5HK9UUUoA1f8WnnLLQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR+3z9Go39bW/vGDvNcGNdnFXRt/XjNkVr17dU37w
 8NRCW+NOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJvOFk+CvPM9lq7Raf75ci
 0k5+zblju7Lzf0v+/oi3C5ts/SekLqxl+CuzM//dPn65SDWJBx+kt8RvlDYztNkjHfP0fE9q2jf
 53zwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e82391f0703d67c533c19bc641d73329
X-AntiAbuse: ID - e82391f0703d67c533c19bc641d73329
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuP-00000003Kvc-00EC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add two new APIs for the dma coherent memory to get the base and size of
the pool associated to a device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 include/linux/dma-map-ops.h | 10 ++++++++++
 kernel/dma/coherent.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8fae2b7deb20..580b69321d56 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -156,6 +156,8 @@ int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
 int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, size_t size, int *ret);
+size_t dma_dev_coherent_size(struct device *dev);
+dma_addr_t dma_dev_coherent_base(struct device *dev);
 #else
 static inline int dma_declare_coherent_memory(struct device *dev,
 		phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
@@ -167,6 +169,14 @@ static inline int dma_declare_coherent_memory(struct device *dev,
 #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
 #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
 static inline void dma_release_coherent_memory(struct device *dev) { }
+static inline size_t dma_dev_coherent_size(struct device *dev)
+{
+	return 0;
+}
+static inline dma_addr_t dma_dev_coherent_base(struct device *dev)
+{
+	return DMA_MAPPING_ERROR;
+}
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
 #ifdef CONFIG_DMA_GLOBAL_POOL
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 45bbae947f4b..f4aa5813604b 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -277,6 +277,40 @@ int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 	return __dma_mmap_from_coherent(mem, vma, vaddr, size, ret);
 }
 
+/**
+ * dma_dev_coherent_size() - total size of the device coherent pool
+ * @dev:	device from which we allocate memory
+ *
+ * Returns the total size of the coherent memory pool associated to the given
+ * device, or 0 in case of no pool.
+ */
+size_t dma_dev_coherent_size(struct device *dev)
+{
+	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+
+	if (!mem)
+		return 0;
+
+	return (mem->size << PAGE_SHIFT);
+}
+
+/**
+ * dma_dev_coherent_base() - base address of the device coherent pool
+ * @dev:	device from which we allocate memory
+ *
+ * Returns the base address of the coherent memory pool associated with the
+ * device, or DMA_MAPPING_ERROR in case of no pool.
+ */
+dma_addr_t dma_dev_coherent_base(struct device *dev)
+{
+	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+
+	if (!mem)
+		return DMA_MAPPING_ERROR;
+
+	return dma_get_device_base(dev, mem);
+}
+
 #ifdef CONFIG_DMA_GLOBAL_POOL
 static struct dma_coherent_mem *dma_coherent_default_memory __ro_after_init;
 

-- 
2.55.0

