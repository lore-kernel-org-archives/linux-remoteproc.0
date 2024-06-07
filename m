Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42684136658;
	Fri,  7 Jun 2024 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754832; cv=none; b=JW+oan3ctrndGHjvA4RIXVxeQBJTxvyhtsOesnGUifnPrK0SudrRsru298gR7l800z9Kjmw9H/43P+AL0apjfls2fDlA066qS2JcE9xTw6SKBjhSaLoBPu6OjSzru0hO/epRCoopqfrX90o8MO39tfgh1v+YKOJkOZ5gKOf3es0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754832; c=relaxed/simple;
	bh=MRLL0gcUoODV40kamoiQom/Yzkvwc9RUb3Ca/hkbUR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhw2hHYBhIVVpoH1PipeJ8mJEaDN/wZkyeXNzPGQ2Xu4JVY1bR6h1Ms1iS38XXbavtj2ap1rgLHPBJiHgnzw1cvmuYjEDfr8qN5ZsAvgnD4zB9Ko9HXoQMMg81hMIVXjhg9ECiM78rNCUo7nUzQfmZ8CYvQt/JKAELQIS8Ff848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4QTD4tOM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4QTD4tOM"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791LuJ011026;
	Fri, 7 Jun 2024 11:34:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ChbXnFWWu+u71+W2Y6I7Tnz1fwZROFht66rIs40Kmac=; b=4QTD4tOMLiAjTdvB
	sklT5tD2qxuNC7cpQ3rMghZiz3APDzByEy1nwuPVwdOWgk/9zZaQw1wJ9fqbOUXq
	RBTkKVhqw4fuJb5pZUzDvqQreuVRrJsBI2b3GJKqbOYEj5oRrmRxUKfb1HCy2OKH
	yTKLzAqezqJzp2HM+tFbelpR2F0dEp25Oa4mzl3rifQrImxjI0+9EqNNzJ4/wrrd
	KtwY7nn3R6WedGcEadDrX3oEcBy2LHTvOFdxIIEd1kRzOjzUqMzCfw9vlLCO6jtr
	rdO5Qk0waPDTtLoilRJKKzEozr3EXXukg4XG04BY85KlgtLp1j+RRQVz1cBO+D7j
	iameBw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yg7r0gts5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 11:34:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D9BB40047;
	Fri,  7 Jun 2024 11:34:54 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 527BB21452A;
	Fri,  7 Jun 2024 11:34:06 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:06 +0200
Received: from localhost (10.252.5.235) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:05 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 1/5] remoteproc: core: Introduce rproc_pa_to_va helper
Date: Fri, 7 Jun 2024 11:33:22 +0200
Message-ID: <20240607093326.369090-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
References: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01

When a resource table is loaded by an external entity such as U-boot or
OP-TEE, We not necessary get the device address(da) but the physical
address(pa).
This helper performs similar translation than the rproc_da_to_va()
but based on a physical address.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 74 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  3 ++
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..3fdec0336fd6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -230,6 +230,77 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_pa_to_va() - lookup the kernel virtual address for a physical address of a remoteproc
+ * memory
+ *
+ * @rproc: handle of a remote processor
+ * @pa: remoteproc physical address
+ * @len: length of the memory region @pa is pointing to
+ * @is_iomem: optional pointer filled in to indicate if @da is iomapped memory
+ *
+ * Some remote processors will ask us to allocate them physically contiguous
+ * memory regions (which we call "carveouts"), and map them to specific
+ * device addresses (which are hardcoded in the firmware). They may also have
+ * dedicated memory regions internal to the processors, and use them either
+ * exclusively or alongside carveouts.
+ *
+ * They may then ask us to copy objects into specific addresses (e.g.
+ * code/data sections) or expose us certain symbols in other device address
+ * (e.g. their trace buffer).
+ *
+ * This function is a helper function with which we can go over the allocated
+ * carveouts and translate specific physical addresses to kernel virtual addresses
+ * so we can access the referenced memory. This function also allows to perform
+ * translations on the internal remoteproc memory regions through a platform
+ * implementation specific pa_to_va ops, if present.
+ *
+ * Note: phys_to_virt(iommu_iova_to_phys(rproc->domain, da)) will work too,
+ * but only on kernel direct mapped RAM memory. Instead, we're just using
+ * here the output of the DMA API for the carveouts, which should be more
+ * correct.
+ *
+ * Return: a valid kernel address on success or NULL on failure
+ */
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem)
+{
+	struct rproc_mem_entry *carveout;
+	void *ptr = NULL;
+
+	if (rproc->ops->da_to_va) {
+		ptr = rproc->ops->pa_to_va(rproc, pa, len);
+		if (ptr)
+			goto out;
+	}
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		int offset = pa - carveout->dma;
+
+		/*  Verify that carveout is allocated */
+		if (!carveout->va)
+			continue;
+
+		/* try next carveout if da is too small */
+		if (offset < 0)
+			continue;
+
+		/* try next carveout if da is too large */
+		if (offset + len > carveout->len)
+			continue;
+
+		ptr = carveout->va + offset;
+
+		if (is_iomem)
+			*is_iomem = carveout->is_iomem;
+
+		break;
+	}
+
+out:
+	return ptr;
+}
+EXPORT_SYMBOL(rproc_pa_to_va);
+
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
@@ -724,8 +795,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 	 * firmware was compiled with.
 	 *
 	 * In this case, we must use the IOMMU API directly and map
-	 * the memory to the device address as expected by the remote
-	 * processor.
+	 * the memory to the device address as etable
 	 *
 	 * Obviously such remote processor devices should not be configured
 	 * to use the iommu-based DMA API: we expect 'dma' to contain the
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..28aa62a3b505 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -367,6 +367,7 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @pa_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -391,6 +392,7 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	void * (*pa_to_va)(struct rproc *rproc, phys_addr_t da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
@@ -690,6 +692,7 @@ int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem);
 
 /* from remoteproc_coredump.c */
 void rproc_coredump_cleanup(struct rproc *rproc);
-- 
2.25.1

