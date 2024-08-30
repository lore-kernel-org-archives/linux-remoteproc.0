Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C917ADF6;
	Fri, 30 Aug 2024 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011616; cv=none; b=FcQuv1I/BbGAg/UxHcC3lYwaPCCALI2VWVyoVSUt3Am8ZzpNL1yyIO5sZ1v3n/sFn1SxKAP/Inn0QukqXsCQ0Bui52IFUtLlWHXmgSKNW+EPt1FiPGHISfKnt/DgLAMqi7xdAi+ayWCS7m9W325SPn8ZywP3Qu+xxMOeF2S9yP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011616; c=relaxed/simple;
	bh=699mAr6Yt5PRa2nYw8ifQjNcb/EqfCTTECG68YUlgIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOw4PoA5vqCWF0KwQXdatStfXflhcl19zcKrkocJ1uUqHNIfaWd7xDYz7/8YhmxccBgeCoUEKeCer9UlUWcBmUuSkycN4c0RxhLTJmRGvAEDa36ZvT4Zau0yCcrEw0WN0IDqCNdJMmTnYa1TQQwvndVA0F+lLhuFsjztODiYTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XHyn1gCe; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XHyn1gCe"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7T05s005594;
	Fri, 30 Aug 2024 11:53:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0DlUTkUaPavTozbvsNzJHph9lUJ8rhMJbIvd+RFIDXU=; b=XHyn1gCeEcu6GMeE
	Tnfw5YP8LI/TAMks9Mo0CCENu6SyrHuhfgzyLBxIV//EPQFgYmmPMtf9SCE/z28T
	UJ4eKObCmPrMhmIFs4O45WzbUScfx5AO/Jqd8t9KHdI8lfrin+z/m7Tr0eQRkt2W
	k23+rrEAWBYWetFRCnd8SwelykdqqLADbf/nLLI0dnnlGouk5tkoZCNPLqrSF32O
	860j75F1a+tyiqUis9YKDgMk7b887tFT09uTSnfuHwCXUFqIxqzJhi2r6D59dadr
	DDUmMeAXM4wUkE9gqBjc616inTaPM6/LkhrLIUrOsoB90PITu75Md5dxK/ZOclDQ
	iJhOUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14tabey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:53:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5902A4004B;
	Fri, 30 Aug 2024 11:53:06 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC31A256519;
	Fri, 30 Aug 2024 11:52:17 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:17 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:17 +0200
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
Subject: [PATCH v9 3/7] remoteproc: core: Refactor resource table cleanup into rproc_release_fw
Date: Fri, 30 Aug 2024 11:51:43 +0200
Message-ID: <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>
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

This patch centralizing the cleanup of the resource table into a new
helper function rproc_release_fw().

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

