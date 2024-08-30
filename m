Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389617DE35;
	Fri, 30 Aug 2024 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011615; cv=none; b=IKUHgsonpIdY9oAoIfwypuSMUkGDuXX2EJ2rfQKX64S4LHmhFV7oBkWgmbqQ6MNZnKnxJd6hzZLyoQv2kK0GeCnME/FGHZZNC5Z+aVY5zVVBpB/XwA1tUrAz3gxDMoZh7flCHwvyiDa9QL+w4PAJLAONI1pKofVo2Rq9FatcAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011615; c=relaxed/simple;
	bh=2YoAV9OjHhXbG5PLNQvyJ+hKffcD9usH6LSJ2Cf30Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/U9PVyRQvIidNamyH8xJ6l778Q4bVdK5oNpuVlhzQeiaxPUtkoe97vjHcqUsZVPYY4kKK6igyzSSj4P6LT43b5pQU/6U9Xv/MRnoG2ZEnknos2wDAnDdsdd8Etw5iT2MN7p5w3clQZunUoZPL1UGI0DyBQ7lTHIbYEMkNK8PEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Q7/95LtK; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Q7/95LtK"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7C7HV029757;
	Fri, 30 Aug 2024 11:53:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aYFs76N0yTB5zM5ZEnnxDZV0XB6WPdMB+wsjOCTPy5w=; b=Q7/95LtKbWHUJng7
	vyENyGTf2UD53lBuT7yrpraDYpdaeBguxn7zaU2btcd8sRp4Q+hjSw2rPsTX8NQO
	Zj50L3H9b6kh21ztP3ZJ2e3yiNFlFqndCiDy5cgSNocqitMrhLBEZk/uruQ26XxZ
	l4+vEaR7aIP+ibtfgNgX+RmIvUMUdNc0LXknZefhClc2rg0um2aW3zTFkkGlxpaL
	F9Q8Iv3oWHjVPwmDgkQOJQuU8elhDOurqp02jw/aQLf/YxFD6uIQbY8XK/EEXQCk
	Olygr7Co4+4xfQlYL8oQo8ooH7mJBSVM4Koce4a//PxZLgD5chZQ2jQMhF3cefxw
	xdXfOg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41a4y68k5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:53:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B79B40048;
	Fri, 30 Aug 2024 11:53:06 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F6DA25651C;
	Fri, 30 Aug 2024 11:52:18 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:18 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:18 +0200
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
Subject: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for firmware release
Date: Fri, 30 Aug 2024 11:51:44 +0200
Message-ID: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
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
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01

Add support for releasing remote processor firmware through
the Trusted Execution Environment (TEE) interface.

The tee_rproc_release_fw() function is called in the following cases:

- An error occurs in rproc_start() between the loading of the segments and
  the start of the remote processor.
- When rproc_release_fw is called on error or after stopping the remote
  processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7694817f25d4..32052dedc149 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -29,6 +29,7 @@
 #include <linux/debugfs.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
+#include <linux/remoteproc_tee.h>
 #include <linux/iommu.h>
 #include <linux/idr.h>
 #include <linux/elf.h>
@@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 
 static void rproc_release_fw(struct rproc *rproc)
 {
+	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
+		tee_rproc_release_fw(rproc);
+
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
@@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	if (ret) {
 		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto reset_table_ptr;
+		goto release_fw;
 	}
 
 	/* power up the remote processor */
@@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	rproc->ops->stop(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
-reset_table_ptr:
+release_fw:
+	if (rproc->tee_interface)
+		tee_rproc_release_fw(rproc);
 	rproc->table_ptr = rproc->cached_table;
 
 	return ret;
-- 
2.25.1

