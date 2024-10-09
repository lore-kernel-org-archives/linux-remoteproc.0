Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3817C22B;
	Wed,  9 Oct 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461037; cv=none; b=qgthv7I7vBlwG8KqVuBDF4qP7dkSZsb1Jz9RqSH5hQ/nQlaP5D87WZqsp6v7bh60AcuP/c0hq8oljCBuYS6u04rm3e+BEG21+ukBhDYZ9XJgQzyPdn7Am2yiI9XTd7dNN+giWjE3QQZ3w4PzRK9s6M1nB7tG5tWRk3aEvzUOgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461037; c=relaxed/simple;
	bh=cZnzaJ+d2Cdwso3pI9UFmQpzagHml1fL4sC49ljvOtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTDi3jKAOo6hz49xyWkSI+YV4o8Q+jUMlJk3CbU2M/S9XBxvwIep7Z7FQ5A1tZNokFM0zelWtMRD03vso9AfpXEU+Hkcgi/ISJ1/r9vj8T8D7B2t8mP4MJ+0I1t0sOaBwUpH45I3CFiLpmUGS3nCJC1EYdR/UvRzKVzqoQxBv+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MLEzDSCb; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MLEzDSCb"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994PVJL006196;
	Wed, 9 Oct 2024 10:03:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+8o58QfWGYN1snvI5Gckj/nIjQyle5J3Z/QaXy2LdgY=; b=MLEzDSCb58PYMQLW
	2ByGqMY4ra1whXVPg6+C3C+8vUNI6GhXi9TQGw3NixE6QmRyZYdyWqMSRXoHZPUx
	xQKbL/5AKRfE7DEzU/O5asx34ufwsAOKpe8tTXDbMXLXUWDh5iRSgL05/wopDz3B
	Fw77m2iRItbkqXO8UTTdpVfeg/e8sScQyK0BN95WUPSwpAVc6T6e3pj0E5eT4dQz
	qxzEIxHQnkdtuB/D8Z95T8+AbPHqdGM+lQ9xV4p0y4MB1p5/ToEQcoib1JIewVDG
	WlhKx9Wc8eY8M4Uqq8HIk6hphBWIGh2GolgMgUKbFsXsAsjW4f5wNZt8uNm/3F9c
	izu4UA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4257n8b4tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:03:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 90A5040051;
	Wed,  9 Oct 2024 10:02:15 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD9DD219BB7;
	Wed,  9 Oct 2024 10:01:26 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:26 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:26 +0200
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
Subject: [PATCH v11 4/7] remoteproc: Introduce release_fw optional operation
Date: Wed, 9 Oct 2024 10:01:05 +0200
Message-ID: <20241009080108.4170320-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
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

This patch updates the rproc_ops struct to include an optional
release_fw function.

The release_fw ops is responsible for releasing the remote processor
firmware image. The ops is called in the following cases:

 - An error occurs in rproc_start() between the loading of the segments and
      the start of the remote processor.
 - after stopping the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs v9 revision:
- New commit that preplace previous one to introduce ops->release_fw
---
 drivers/remoteproc/remoteproc_core.c | 5 +++++
 include/linux/remoteproc.h           | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7694817f25d4..46863e1ca307 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 
 static void rproc_release_fw(struct rproc *rproc)
 {
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
+
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
@@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
+	if (rproc->ops->release_fw)
+		rproc->ops->release_fw(rproc);
 	rproc->table_ptr = rproc->cached_table;
 
 	return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 73f640dd0fc0..bdf4d94a9e63 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,8 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @release_fw:	optional function to release the firmware image from ROM memories.
+ *              This function is called after stopping the process or in case of an error
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +405,7 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	void (*release_fw)(struct rproc *rproc);
 };
 
 /**
-- 
2.25.1

