Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317C18F2DA;
	Tue, 26 Nov 2024 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612411; cv=none; b=K2m/jmrPyJ15xgUCOFh1FUXv5WA5tpD8ZOn+APqS2cSQFP/0gosjMh5hU5XNiA93NBs0kPXdPu5eGbN2v2xukQ7jBZyeb6nxXVcbkw3R0qpwTp1Mf7QefR/5qpNTY32boNX8oU0Yo46FSLk7KfwU17fPVR4yhnOpAX6uBkDUubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612411; c=relaxed/simple;
	bh=FrzZIV835rOf7d/aGlsTApiEMmkQ+58nU9b2ePF/+e0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXlis5H0R+TFbFcrpwVMBS2l3iZMA1BINvL4IVqUonrVbJmKiCZ7E7mKC2R0Ee6geVjz/ZkdWcXqK88yMsZllxGtw5K0QhXIKZlOT4gF1UltBjmnoJI7sxsW/Zx5Qr7pmLE/oXx+hyzxxF4r+9xe5wUK7Gph41NyKCDTeX1ahU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=16A6Kuc8; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="16A6Kuc8"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ7BODx024315;
	Tue, 26 Nov 2024 10:13:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ReO5YJNo2D7IrdzpVxvNHAheuWRLAx01DYACbeobRrs=; b=16A6Kuc8Ntpo6Rgk
	4YhhwPSWh4aJ/ZYUYaJgZJDMGMr9EQHICTo4NuSCnIhOlPFbcxf34KiTccgW+ZT4
	cC35xtMtpn1yZeGm9wrU0zGRJetmYOXsgspGMgONP+ctmRYfzHoOu2l0ZQJkVYqX
	OIfUCHG03U6UJEnqunLhNU4m4q+zkKf0nIr9uWsDRMPFSWhFal1mwpYDT+EYogUd
	oW9QqmqbJIZt21Izr6yjHX9mWJbv+Duk4gtRQs0rX4Koim7Zb71ApJFtb0/4FyWe
	S/cU4OdDlzimp743qq0PIyPsV1DndaGDGB04PzblQmOzSqGJCJIXj9G7bFqY+9Y8
	ZALGZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4336tfksts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:13:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8CC7440072;
	Tue, 26 Nov 2024 10:12:21 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DB8926B64F;
	Tue, 26 Nov 2024 10:11:15 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:15 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:14 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 5/8] remoteproc: Make load_segments and load_fw ops exclusive and optional
Date: Tue, 26 Nov 2024 10:10:36 +0100
Message-ID: <20241126091042.918144-6-arnaud.pouliquen@foss.st.com>
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

