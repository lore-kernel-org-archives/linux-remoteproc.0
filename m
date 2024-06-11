Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B506172BAF;
	Tue, 11 Jun 2024 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091630; cv=none; b=XBkXTpwSxAibA+ltGQkqMSKRy6VgHRtuKkW3q10yoNzwn6J1IsDfopTHqoc6zf6LNyCT01oHOAZAKeCKlD4fncyOwgSyHbyByrQ/iraFDVj/tG+JQcq4sVIx8nVKdAyrVkZIWD5QzycFeQ+MzK6i+7kU68Svzg+q/sf0KmcrLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091630; c=relaxed/simple;
	bh=UY54/S8Wg6EyvftXPSxbmL65Q5WeIoe1mX/PiLnFcTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ss6uLmjHHPlmn12qTJrExTudtyL95KZWd21A9LPtoaK4mI7Wp1hiIBD4cJJyJRulAMbcHYA0Q7U4P6i4nAZ3yKt1CjOEAF/1m/WfSOgTClG19/Vv7UFM/+AUMhq6abEUuvRNpEmXcmockk8jZlzmVoci5IR6ZJYwJDIFFCinOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hsl1ec4l; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hsl1ec4l"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B01eJY012090;
	Tue, 11 Jun 2024 09:40:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wJ/ukfx8G1zXYyqPlQIqP22RtNYrc/ObgdDJIC3tqxc=; b=hsl1ec4lQkf9td5S
	FD/ofNaeilCxV6ee1l9USCvx5w2vdnMjmXd0RV76UkmZ3NeIoHOxVCmua3VsYIhV
	DlB89Iz7cA0FjK+RcLH4Mzm9DTh2L/wUbv9LN+UG5ffXgCWi3u5IVxKhXpHCDylZ
	dDu8fuuuKo0XIAUkv7F0bjkFjnBQAsQQMHhz7gGZis3jrfdXu4ercie/KpP3ZXtc
	OrQiMGiRyYFwiQ+/2svXLqzJ4VjoiNcdM+SB4lKBmg3Py5SgxJ58akb8ZsvfWLeQ
	y9Lm838PcFt8VO9dd/Fj/vV75jbPxEMUSbVY+WkD/kHXztZEO85zwBRQHyjwDiRR
	sJkVGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp3sfdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:40:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8E2140044;
	Tue, 11 Jun 2024 09:39:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D690420FA2D;
	Tue, 11 Jun 2024 09:39:09 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:09 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:09 +0200
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
Subject: [PATCH v7 1/5] remoteproc: core: Introduce rproc_pa_to_va helper
Date: Tue, 11 Jun 2024 09:39:00 +0200
Message-ID: <20240611073904.475019-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
References: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_03,2024-06-11_01,2024-05-17_01

When a resource table is loaded by an external entity such as U-boot or
OP-TEE, we do not necessary get the device address(da) but the physical
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

