Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1471C7B83;
	Mon, 21 Oct 2024 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543576; cv=none; b=QfFKx+WlCYDPv2ZdrMqChnBdyaPgT60YqPNcw5/1Dt07XPZiozKPqK8t5kpTzCctUtrVckCwotQ25gV021dT6hEv6vysLZjNbnPdPjrOO6hkLT/A4QA11FvgL4108pp+xLCdwu5yqPFuIKI5axLrfF0A2s0If3vBdXaS5TYZLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543576; c=relaxed/simple;
	bh=2A4fEGoEfIoYiILSXpULcySeLaqUMSQKnGIbocIpKJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHIlSXZ6I7+kJyU9JbHbnqsEld8US/Tl55s8XqqJ/LMgsem3DwsXRoEFFU+Tk5V9JlhGOZ2VeaJd+GEkrMeYlOgbqBPwviywV7BOvKHKeE9qn143e3xYVjQ2DROf/obLV8S3s0KP9kxOehXXEU9cK0sFTc5glAXeXflU4ExixLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vmjoJNpX; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vmjoJNpX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjxIl021236;
	Mon, 21 Oct 2024 15:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729543559;
	bh=KHrThkjJbwAYf4lfszIGHS3wdIG9Oy2UVZFhABVksnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vmjoJNpX/7p3pZObw84GjQJPnajH69sx59LkB0GK09vT8rMrcBPanZPd7Pox/MdZ6
	 R39EM5qyp2EC7wXT34mFDYaQXBDV1al3tUxM49GttQjFHIJDoxC+7tGT6mYINDFMrA
	 VZTUylyuZCscV+gRCZT47WcHPYAHN6ydWeO6gaiI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjx0g008123;
	Mon, 21 Oct 2024 15:45:59 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 15:45:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 15:45:58 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjwex030965;
	Mon, 21 Oct 2024 15:45:58 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/3] remoteproc: k3-r5: Force cast from iomem address space
Date: Mon, 21 Oct 2024 15:45:56 -0500
Message-ID: <20241021204557.929823-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241021204557.929823-1-afd@ti.com>
References: <20241021204557.929823-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

These memory regions are mapped as Normal Non-Cached which on
does not have the normal IO address space limitations and so this
cast is safe. Add '__force' to explicitly specify that the cast is
intentional to remove a sparse check warning.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index e1fe85e5eba6a..6560b7954027f 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -717,7 +717,7 @@ static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
 	 * the hard-coded value suffices to support the IPC-only mode.
 	 */
 	*rsc_table_sz = 256;
-	return (struct resource_table *)kproc->rmem[0].cpu_addr;
+	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
 }
 
 /*
-- 
2.39.2

