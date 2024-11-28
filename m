Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894EB149DF7;
	Thu, 28 Nov 2024 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783746; cv=none; b=dttPCcZlGDEpSvuYzfaaWMZvDf2kcNP5QH/tR2a9aoALZvO1GL4ocvvTIUfWJvzf2Pzf60zUsmWtvrb3Q/TGc3fte1+/wM9gPbgvsIB+GpmPkvuUVDwuE2eUxoh9zO2kvNSlOlD4Pakfq4mxCiB/Um0LQkGOv8ht31DCSHUlTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783746; c=relaxed/simple;
	bh=FrzZIV835rOf7d/aGlsTApiEMmkQ+58nU9b2ePF/+e0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZ7FiC5Leehrk7H1h+BhW3XQy8DxeTh81UYQnGBLn4hAj6+1C9Ey28CZJF0alM7HxnQtCLhMEmpKuNfiiTV33/RVg4qdeq49Khxckz788Zuwk5Y43K5apU0AZxwRe06aJV/+2nMc27RY0iD02sZ3G7IlRVBfcIilKGZjzcs5Rfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qhIlSP43; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qhIlSP43"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS20iJl019679;
	Thu, 28 Nov 2024 09:48:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ReO5YJNo2D7IrdzpVxvNHAheuWRLAx01DYACbeobRrs=; b=qhIlSP43CbM0DbRw
	xNsbtPndSdXwkMqvSLmMIrmpnsS/EaZ4FZO3K8GeiqolRbb/70tpzKQOkop6zWqN
	jMicCq1ifxXFoAcrEkXT9zyS/XftXpRuL81xQFL6LfyWnxyFm3gMa5pGfIa8XX6u
	CNL3ffY2MhfuPFn35lw6khpz+d6KAe3Jp7Y/oBYT2srfcBjr8S44LJwKDN7BvDyh
	cSRsv5kFYvh9vVAx3tEMuHPZLhzW2Yus33ChDOM98xylbM3pa9vPkGnX4PYf54Bp
	xoNc1gT2Zm0f7F3gpEGygduW9IrTZ8na/9FMzDzNkM7xzVf4+zY5V8axI/33igLw
	TaHrZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43671au5j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:48:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E1814005F;
	Thu, 28 Nov 2024 09:47:26 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A23F269617;
	Thu, 28 Nov 2024 09:43:03 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:43:02 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:43:02 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 5/8] remoteproc: Make load_segments and load_fw ops exclusive and optional
Date: Thu, 28 Nov 2024 09:42:12 +0100
Message-ID: <20241128084219.2159197-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The two methods to load the firmware to memory should be exclusive.

- make load_segments optional returning 0 if not set in
  rproc_load_segments(),
- ensure that load_segments() and load_fw() are not both set,
- do not set default rproc::ops fields if load_fw() is set.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 4 ++++
 drivers/remoteproc/remoteproc_internal.h | 2 +-
 include/linux/remoteproc.h               | 7 +++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e4ad024efcda..deadec0f3474 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2477,6 +2477,10 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 
 static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 {
+	/* A processor with a load_segments() and a load_fw() functions makes no sense. */
+	if (ops->load_segments && ops->load_fw)
+		return -EINVAL;
+
 	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
 	if (!rproc->ops)
 		return -ENOMEM;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index b898494600cf..3a4161eaf291 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -170,7 +170,7 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 	if (rproc->ops->load_segments)
 		return rproc->ops->load_segments(rproc, fw);
 
-	return -EINVAL;
+	return 0;
 }
 
 static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 55c20424a99f..4f4c65ce74af 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -374,8 +374,9 @@ enum rsc_handling_status {
  * @find_loaded_rsc_table: find the loaded resource table from firmware image
  * @get_loaded_rsc_table: get resource table installed in memory
  *			  by external entity
- * @load_segments:	load firmware ELF segment to memory, where the remote processor
- *			expects to find it
+ * @load_segments:	optional load firmware ELF segments to memory, where the remote processor
+ *			expects to find it.
+ *			This operation is exclusive with the load_fw()
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
  * @panic:	optional callback to react to system panic, core will delay
@@ -383,8 +384,10 @@ enum rsc_handling_status {
  * @coredump:	  collect firmware dump after the subsystem is shutdown
  * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
  *		processor expects to find it.
+ *		This operation is exclusive with the load_segments()
  * @release_fw:	optional function to release the firmware image from memories.
  *		This function is called after stopping the remote processor or in case of error
+ *
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
-- 
2.25.1

