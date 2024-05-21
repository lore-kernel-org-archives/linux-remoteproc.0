Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8B1CD1F;
	Tue, 21 May 2024 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308666; cv=none; b=aMzOx5V0rZ5DFmunACQiwg29+SRtGUjoP1pp68l7eF8rwrADUz9gMqkeXe0gq2wFlVDVU+ZZUvkuq+z+5o82U+McwZ/xVvojgWgCcp77fBExiOV5i4V/OqO+D2JTg/dxcQ3qBOWwfqZqtrI19CzWpAB/ff5cFyEb+NOScF8/liE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308666; c=relaxed/simple;
	bh=r8UYuML328Rse1sl+1Cyo4/LmLgtLYzTHlziAkhudkQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xtj2dvzJtJI8Tn7X9igP5P9L6JgZrc3meInglfdMPxFXJvD8qGcL1YXbauZ5x0e/6oUcbstv7w4cGikH8B4KHkOnwJLs9fpdEH7Ar75kL3yfDmJXBhhjQmo6SvvYw4dw9+y4tZKfs/7R4suH+Aq6xODOdL8bMcC9AlbzBrJQD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wnmeCwMY; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wnmeCwMY"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LGIfkR011115;
	Tue, 21 May 2024 18:24:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=NqC2Z7u
	c3q/WlEKnSoaFIEs4EfwdkefIzuUpW2dO1iw=; b=wnmeCwMYjWSjSmoTbH3DOl/
	8gX81tlwXNhmKI4w6BTHwUtqNVIMf9i0jryQZAYT4nNED2JZH35WV081KDXw1vvd
	MDa8DUbZGgTzftUUhcFXeVnRxFImGyuEf2QZ0KFyxZGrn3IdKuFn3hRiQvZ+kr9M
	sUY0NPCckAC1gHwbFyAlxUHh1tsVC3S6M01j/6NoLzdgp0ZUH+mYZuvOxVlWEjZU
	MkdH6BOJMeS3/rdHGa9BmRKsO4Ob8x8ehs3LFtY4ghaSwJucila1IdIQ914d0LhU
	pSx74//U/krIrGWOdtMMN/lzrhNHXRvZ2YGieEk29nlN6ZxgD3gOy3eLvw2sM9A=
	=
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y8vqh8n6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:23:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE2174002D;
	Tue, 21 May 2024 18:23:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD1602258A8;
	Tue, 21 May 2024 18:23:31 +0200 (CEST)
Received: from localhost (10.48.86.146) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 18:23:31 +0200
From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
Subject: [PATCH] remoteproc: stm32_rproc: Fix mailbox interrupts queuing
Date: Tue, 21 May 2024 18:23:16 +0200
Message-ID: <20240521162316.156259-1-gwenael.treuveur@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01

Manage interrupt coming from coprocessor also when state is
ATTACHED.

Fixes: 35bdafda40cc ("remoteproc: stm32_rproc: Add mutex protection for workqueue")
Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 88623df7d0c3..8c7f7950b80e 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -294,7 +294,7 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
 
 	mutex_lock(&rproc->lock);
 
-	if (rproc->state != RPROC_RUNNING)
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
 		goto unlock_mutex;
 
 	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)

base-commit: 4d5ba6ead1dc9fa298d727e92db40cd98564d1ac
-- 
2.25.1

