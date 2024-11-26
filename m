Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A721B0F26;
	Tue, 26 Nov 2024 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612411; cv=none; b=PyDPTQOtZj2FSyesXmTaD7MvgH7yHzKZ9+QCQpCARQTE9lrY7OJlgKYHthMm9HOZIVDjQwjKOqfA+LtHrzIvwIVbI3OLuZyZ/EWyXsKmL7Cm72g/E84ltMJ6A+uoHYL8/F9LvHwgmDLnzLjlia4NedACXgLOcDnOHZs0VqnnnHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612411; c=relaxed/simple;
	bh=MjLDhva9ihNERJEiYb3ppznzZfLb4Id5y78WoAk1000=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEvaOHirhSeE4afN6B4/HvAbVx+hKskqibDLAxvL6EckV2ieFOblAATU31oCyFweR7ew8u2YVMGi/P5apABkUAt/G3GINednBGo1cr2i4n8QTgn3FLEhyaQsAj+vUISJtm5utsNJ0jLv2I8NNSnhVttm9WEhUjQL28tA68z0oRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hETJrqhx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hETJrqhx"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ3bWpf013828;
	Tue, 26 Nov 2024 10:13:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	g0lTgg7O/c42Vw2gvzMzOeAzWuUnj5z0drLIk2bZ1dw=; b=hETJrqhxQMtP7445
	Un2Ghge68SC2/lkN/j1KrXEhG/isWgWV7LtZM9OXKAifMoQStNRdDgRExM7g4JOw
	6689koWJ18+H8XnoHaYirWFmmFdGP17wYV15gG8kP292ZPNFmWtI11mchs8D0r5L
	fAyw3Vu3TnfW7zVbOz0NBle/Me8t9TG04/f5MTb1MT/1mfJbfMRinixzJ1/nqiBq
	4HbJrMD/1z9KFcHlmM5txBp2TA1b14WZTdceVHarLJZ8HTLQHrlm3ctImhX4WSpV
	MdH0IiNp6ht35hzdWL7k9Nv1UmxhIARdnQJ7s8sTDWvhzPB2i7iURy6iyoUKy8xh
	3wuWaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 433sg49j7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:13:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68ADC40071;
	Tue, 26 Nov 2024 10:12:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34B5026B64C;
	Tue, 26 Nov 2024 10:11:11 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:11 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:10 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 3/8] remoteproc: Introduce load_fw and release_fw optional operation
Date: Tue, 26 Nov 2024 10:10:34 +0100
Message-ID: <20241126091042.918144-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126091042.918144-1-arnaud.pouliquen@foss.st.com>
References: <20241126091042.918144-1-arnaud.pouliquen@foss.st.com>
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

This patch updates the rproc_ops structures to include two new optional
operations.

- The load_fw() op is responsible for loading the remote processor
non-ELF firmware image before starting the boot sequence. This ops will
be used, for instance, to call OP-TEE to  authenticate an load the firmware
image before accessing to its resources (a.e the resource table)

- The release_fw op is responsible for releasing the remote processor
firmware image. For instance to clean memories.
The ops is called in the following cases:
 - An error occurs between the loading of the firmware image and the
   start of the remote processor.
 - after stopping the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs previous revision:
- Rework the commit to introduce load_fw() op.
- remove rproc_release_fw() call from  rproc_start() as called in
  rproc_boot() and rproc_boot_recovery() in case of error.
- create rproc_load_fw() and rproc_release_fw() internal functions.
---
 drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
 drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
 include/linux/remoteproc.h               |  6 ++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ace11ea17097..8df4b2c59bb6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 unprepare_rproc:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
@@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = rproc_load_fw(rproc, firmware_p);
+	if (ret)
+		return ret;
+
 	/* boot the remote processor up again */
 	ret = rproc_start(rproc, firmware_p);
+	if (ret)
+		rproc_release_fw(rproc);
 
 	release_firmware(firmware_p);
 
@@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
 			goto downref_rproc;
 		}
 
+		ret = rproc_load_fw(rproc, firmware_p);
+		if (ret)
+			goto downref_rproc;
+
 		ret = rproc_fw_boot(rproc, firmware_p);
+		if (ret)
+			rproc_release_fw(rproc);
 
 		release_firmware(firmware_p);
 	}
@@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	if (!rproc->ops->coredump)
 		rproc->ops->coredump = rproc_coredump;
 
-	if (rproc->ops->load)
+	if (rproc->ops->load || rproc->ops->load_fw)
 		return 0;
 
 	/* Default to ELF loader if no load function is specified */
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0cd09e67ac14..2104ca449178 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
 	return (val <= (size_t) -1);
 }
 
+static inline void rproc_release_fw(struct rproc *rproc)
+{
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
+}
+
+static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	if (rproc->ops->load_fw)
+		return rproc->ops->load_fw(rproc, fw);
+
+	return 0;
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2e0ddcb2d792..ba6fd560f7ba 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,10 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
+ *		processor expects to find it.
+ * @release_fw:	optional function to release the firmware image from memories.
+ *		This function is called after stopping the remote processor or in case of error
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +407,8 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
+	void (*release_fw)(struct rproc *rproc);
 };
 
 /**
-- 
2.25.1

