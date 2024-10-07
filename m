Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58F11D2F46;
	Mon,  7 Oct 2024 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307300; cv=none; b=klK9SSe3WpbqOMkekasMgkS/Ge4TAtIQ99WNVMfMnqISdGJMqa3zgbBydoc0zIqUQrZpXDi++oVLmj3DbyYT5kHQdxeyYtldUdRCAIgqKH3FpQ8nhp1ky/7jr9glmloSDkSFutgUiPgZ+4FxhYNzjdpYjm3VjNMNE/YDzRHX40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307300; c=relaxed/simple;
	bh=3Vv3On2cJcwzUZZ9aNlrSbueotMcHLSQp2Hd3JyzBek=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt/T2FOYvysZ2EK0K3tY7181HgCqXySOQZI8hPntX2yqw61VdBsr33MfVqNxBGCMi3d8he8PrdKh9MnlPc2HhOXSj3bZiDN7wD7E2qlxqd//zURGKGllxDfBGW3s+EittoLgy5MF/4EAf5/K8ZFiZTp+zmXP0cYgjc9FQ8BvCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VLJMmHnM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VLJMmHnM"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4979nXvd017178;
	Mon, 7 Oct 2024 15:21:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/mE2OLRaqk8Gl6dCN9ELFxqbr+yTJdM1DCJG3QOGXsI=; b=VLJMmHnMJeCBt1p7
	IM8EeHkWfzx5cIHRgtmoilV5xcHYt/JJ8vw5w7FHCF5quR8mu5vYhWzi2bUfvj1V
	93ZFU8QrYNfJOU0vHdlIx52KoWKa7QBrOnWSxiJyZ3SSdvcZGg+SiNGNOkWnCivD
	RSCscVVzjf+r2Kqz5gr97krXfIY8UlAEbmcD2G6W5ZVlsLUtGSWZ3OpBoKKKl7Z2
	waWxn60WJDufjc6VnQCf4NN3fiT2nx1t21eOeJSZbjfkEMhYOY6sr0e6GmKNEx3r
	i/nkSymMFK5cC7Gry5/EJK/rBUOQXOYy5cfRJE0Wi3Abm4eKN+NiF2jqlkQGvoJq
	GEbeVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv713fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:21:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4EF8740049;
	Mon,  7 Oct 2024 15:19:40 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C590269E1F;
	Mon,  7 Oct 2024 15:16:43 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:43 +0200
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
Subject: [PATCH v10 3/7] remoteproc: core: Refactor resource table cleanup into rproc_release_fw
Date: Mon, 7 Oct 2024 15:16:16 +0200
Message-ID: <20241007131620.2090104-4-arnaud.pouliquen@foss.st.com>
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

This patch centralizing the cleanup of the resource table into a new
helper function rproc_release_fw().

More than just factorizing the code into a common function, it is the
first step to integrate the release of the firmware image loaded by the
OP-TEE remoteproc framework.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs previous revision:
- add justification of the patch in the commit message
---
 drivers/remoteproc/remoteproc_core.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ace11ea17097..7694817f25d4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1256,6 +1256,13 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	return 0;
 }
 
+static void rproc_release_fw(struct rproc *rproc)
+{
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+}
 
 /**
  * rproc_resource_cleanup() - clean up and free all acquired resources
@@ -1485,9 +1492,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 unprepare_rproc:
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
@@ -2067,10 +2072,7 @@ int rproc_shutdown(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
-	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -2133,10 +2135,7 @@ int rproc_detach(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
-	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
-	rproc->table_ptr = NULL;
+	rproc_release_fw(rproc);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.25.1

