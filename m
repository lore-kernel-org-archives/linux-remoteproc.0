Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628533859D8;
	Mon,  2 Mar 2026 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481391; cv=fail; b=Ndh6+emkQeqV73qRrTot5WI1UrADRA27lVbhErV071esAS2Pv5dJSeTDnqD39G442ShADXC6rxaSY9VjEeov46O02vhaPHc0/M9JCX9w4vN2yfop7UHqgzJ5foTy0EKeURn9+3igua7AScEHp+RiY0NPrklTy7Me3GnER9sPSn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481391; c=relaxed/simple;
	bh=LQXpFgcbBE0IRrJwnouGw8FWwPvzsq+TRxDdmyeDZtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXeL4I7cyQVkJeCbT+xBSMN+wC7aGQPSpPNQMNaVyK7E44AMlJbj3I7Wsub9t3qrOBjUSGGBf85uY5H67v724fZbm5h2AreEPQD6yXJdvOP3OU9Sy+QMt20redA7kD7fdnGLi2XV+V++Z8cviRYCWDNo1E5DZv+M5+y3mLmp5pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sU+TtjRF; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sU+TtjRF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCCfnxraRzm/J9pRsWeQ0lv7k6zH5lL94AX+6S8+c6LExlX396PMpLSNawnTu+drb8OchjC5O4NC0HLTum7RD4vBvOO+9lkl2SvDCahchZJs7ZFth1+/MZ4H0d8Rc0vaeo2NnKpnNzT+n683hBQVLm9abE+IdZ0YcElqGxftMm6ilXGHA4leXN+H2+IP85CRwyhdGW0+nBYMhY9K/NQQiW9pJ8XqxVa3TivKvYYvvnBWzQpaUGLmTriRbMpRLrgzhjfU8l9mcKlBDrvBs0L/l+fyjoYm90CqQ4A3SvsbR53Kt9h5GusCbOZita2qJif7e8d4vWnGUidx3ehRMjSlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I5QJ6lSwpIvhKuw/Obsloq3iv2jb2i8e1LhysM02/A=;
 b=kz8IyXifAOAGDpqb+5Rwm7fk3Nsim52BYr4zOREY/85UjW8/gOdqrVeV9D2G+e6GZBhsVC8KqFXybuYNv/wOBxjKkbtvkCwv0SArfzP/d9OtKj1UPx8x9vh7QOMUHVUssuUTIWm3bsoPKlF6vaVfjqd54WtMNiOiiAmjQCAehwi+p80Azq7hzSejDVGgxlhTfeZ74KkGbEDeURZdFqFI31FxivRb8kJDhioPEB9JbK/8xzGoEGSrCrhgc4ZL+9rrn6INxJo+JWhI4kMm41/sWMOfz8Zk/uoUrPqjeQzgLbAX8VUls2rvyPiW5G5sdoSOrymuz5P8gDiiladxuyy3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I5QJ6lSwpIvhKuw/Obsloq3iv2jb2i8e1LhysM02/A=;
 b=sU+TtjRF3X7txFl+NcC0JCdmcQrwBsHnF0FYmbbUQ0o4T6ZjwwY1mPJkiRiPshLCjLXm4lr4JsAaxYc7/dfDdbP+o14JwG8+P7vgiw/qlPZ6XzeaFjpyZQmyFn+MccNAxlMwPJyv5JzXA+B7HxskLA413qaRCqhgaZkwMVrPR4c=
Received: from SJ0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:a03:39e::8)
 by SJ2PR10MB7705.namprd10.prod.outlook.com (2603:10b6:a03:57b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 19:56:23 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4c) by SJ0PR03CA0273.outlook.office365.com
 (2603:10b6:a03:39e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 19:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 19:56:23 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:19 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 13:56:19 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622JuIOb1348869;
	Mon, 2 Mar 2026 13:56:19 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH 2/3] remoteproc: da8xx: Remove unused local struct data
Date: Mon, 2 Mar 2026 13:56:15 -0600
Message-ID: <20260302195616.312378-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260302195616.312378-1-afd@ti.com>
References: <20260302195616.312378-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|SJ2PR10MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 56789436-1bf5-4886-18bf-08de7895c7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	3+2fBsbjhsUhXUdE8HMwb3h5BkGI6ITmmRGdfG1YJUG4o/QjS3U6vbe9O+D98B1Ui9OZLumNdBYn2WS5h9fgB/TdJ2mgkCwlWSpragFHFwliIyRxJXjSRxEdd6ltRPiKq3wixjJI2K0yNJOuQ+z7XJNMi4FUZRib0LNN4eQPs+sbHXFZWfltkCduq38j/1XjlwIb5/UZLeFRDYDmksxRTV2npd9/UBqsoo4wKV5chGo623mbhXjZwXl39sxsgDpM2ikLHiqdosGLthcy8UAOdlR4H9f3O4ZjoSdQ/Bhv098JNy5P/4M2dA7MX7ts/8bz/MgKzWF19/y5fB7a16LU+SV84KvuZyxv2NBuBmZL7VBGcffhTXBblu6ahufypD3FLYyl1ZhtIVkhIKYETckeCmCMtGV+377jMLBVyTBBWlmImx8Go801phWCW8VwC47R4b4/W5ks6pa/ttojJmB8ae2iRX1L3NE3fGOOz7Q0txvemPfN69kjLqaeLkISpVKn79+ola3LRjS6Rhc4swdQnM4S9jnU0tEFmfdV3K+XLylnMK4gVXWkFhwk0fuTkPc1njrpuzqEJx1xcbxm1d9muZ7IZhaSWSq0J0bwXN7z5Fr+umInKMpp9kaLtR90p0b7+QjH2ZXVwvGEaAg68h7+rlAeVdArV09vz2KHUZgdmEjaeZHh5h9VMYvN7p0i7e39bOjbyjvAkwV+FTMvMnKFedv5CXgUr466GnZWXNvTVFMg/d65hE0yqb60bI2FI0mfcWkMSQwGlL3G2Mto2vPS7VB9c/DG4cxP4OHiXaFTzgZUMnl//3aUJgDB6vdZkEfNZC9MNAXgN5/JwOZ4eyh0kg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	58bczxINVVcOj++hbr8Of+K+uW/TBLkq8q+x98pibn+uHOFs+jUb6Iw8gtcbzbbN6w7dFqnAC9TnDS4063CwaEnVlKjhTuUauQWEnQFliYYQ9QCxgwEnLdsvLBrDHtUePcK7NPA7NBUFVrgATmgkOZQPqou4fT1tKVp1bV4L75rO42e0hNXY3k0dqae6XFSij3a+VWp0RAWDlMd5Naig5HLSizDOa83y9hffssrjms9V7r0Fvf17rUchbm9eef0DHqUgMgZf7r3aGZaQ4XyVMTqJ6L8kuUJhNJm36OHzZTEi4wW/JQT1lvmmiwstih9X9lZxPej9LbVEyVAflTvi6WJAgH5/nHB6PNmh7GYI2S1nqToZM5+5qs5+gIki7p7oRcttfkV7g1dUplF7yS+x+4rfiY5UulQkGRdCJNEq3mO94sT2uOCA1CjWTaKfj8dc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:56:23.1257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56789436-1bf5-4886-18bf-08de7895c7e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7705

The member irq is never used and ack_fxn is unneeded as it
is already a part of another member irq_data. Drop those
and their struct docs. While touching the struct docs add
one for dsp_reset which was previously missing.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 41744f3f0252f..f44bee303eb5e 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -57,11 +57,10 @@ struct da8xx_rproc_mem {
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
  * @dsp_clk: placeholder for platform's DSP clk
- * @ack_fxn: chip-specific ack function for ack'ing irq
+ * @dsp_reset: control for local reset
  * @irq_data: ack_fxn function parameter
  * @chipsig: virt ptr to DSP interrupt registers (CHIPSIG & CHIPSIG_CLR)
  * @bootreg: virt ptr to DSP boot address register (HOST1CFG)
- * @irq: irq # used by this instance
  */
 struct da8xx_rproc {
 	struct rproc *rproc;
@@ -69,11 +68,9 @@ struct da8xx_rproc {
 	int num_mems;
 	struct clk *dsp_clk;
 	struct reset_control *dsp_reset;
-	void (*ack_fxn)(struct irq_data *data);
 	struct irq_data *irq_data;
 	void __iomem *chipsig;
 	void __iomem *bootreg;
-	int irq;
 };
 
 /**
@@ -122,7 +119,7 @@ static irqreturn_t da8xx_rproc_callback(int irq, void *p)
 		 * we need to ack it after taking down the level else we'll
 		 * be called again immediately after returning.
 		 */
-		drproc->ack_fxn(drproc->irq_data);
+		drproc->irq_data->chip->irq_ack(drproc->irq_data);
 
 		return IRQ_WAKE_THREAD;
 	}
@@ -320,9 +317,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	drproc->chipsig = chipsig;
 	drproc->bootreg = bootreg;
-	drproc->ack_fxn = irq_data->chip->irq_ack;
 	drproc->irq_data = irq_data;
-	drproc->irq = irq;
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
-- 
2.39.2

