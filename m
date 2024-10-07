Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59521D2F4A;
	Mon,  7 Oct 2024 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307301; cv=none; b=UPSRDs/ZvER1J2SYed/15Ma0DZ6cqjKbfakKi1weWgufKmEbLH5mBP8UVNvPBznfpsGEYmQqWoImF6iyvWKJzTsP9wQ9h8ftCMv3G2ta+WvSdL+9o44SiJJznZosbCK5OGs+0O0jrv/0wEwDFrndOnN4QZMHqLt5RktKcitB4Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307301; c=relaxed/simple;
	bh=81rTs1SNJEqIZPhrNaqh78EaJOumeV7J4DPS0GYZ27k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZykNuiP19Og3Si7pJ3+CzfAt7ipJDYklXNVlkeFS2G4A3QM1DtRUNSMiUcE73FMfzOpkJgIlit9SGoO4zb/oWYy3KOfFh4n3dGAYk3re6ZqgseWndbSwWChH98ik+YCmQ5nwV5e4knSidhJ65AK2yOhK3W6qJhN+nTi/piS0jY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qoQlYFEb; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qoQlYFEb"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BJ1Bq022075;
	Mon, 7 Oct 2024 15:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZycAV1rf60jTMcB7G0HzNjk3eCOPRWa+/2XY5pxf0S0=; b=qoQlYFEbFPMJ2QmQ
	oVrGy8+fGgCroP9oMfOdZW6nlZUzflF/9LAuCO+bz7RweYOOf6PtqR/D3eiuc00t
	hJAr/fjgpaT73dy73tJ6dFmqylvQvolCcS0drKrmQsaRw+txSieYmGT2+Taq39S5
	lgHmhaMU4LNbwi5o3IG0RMrJUdNFsx7QHZ4tvVfkq9wwe370CjdDxybAc39Ke2a9
	ae3cQpH+D4I2Px++4sS5eqLpS+nVWEfDFzUlXgYTae8gZrv+YRS5O6N7knQkLk3Q
	f4+WZ4Tbu3Gtv17brtJh3tV6T+2mqzYEQbGHrIJW2gsF6nWhNKYLCtktE9UWwPjP
	YWgcOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10pc4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:21:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5CEF14004B;
	Mon,  7 Oct 2024 15:19:40 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40C5C26C073;
	Mon,  7 Oct 2024 15:16:44 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:44 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:43 +0200
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
Subject: [PATCH v10 4/7] remoteproc: Introduce release_fw optional operation
Date: Mon, 7 Oct 2024 15:16:17 +0200
Message-ID: <20241007131620.2090104-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007131620.2090104-1-arnaud.pouliquen@foss.st.com>
References: <20241007131620.2090104-1-arnaud.pouliquen@foss.st.com>
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
Update vs previous revision:
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

