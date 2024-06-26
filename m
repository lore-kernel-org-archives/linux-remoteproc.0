Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29118EFE4;
	Wed, 26 Jun 2024 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418951; cv=fail; b=Lp3nRbRvJtMJ7BMcHGjIde2aRUwNJWh2OJRCIrBEjeXvr34nFqbLtyf2WdAmSdpkIPrs0IS2CRLOTMGEmnTs9l5uPkdHsnKc9OLX4FVYFB2jqoBZTDbxI9Nnm4dSswb+SJJIt+Fwpoq2HchE1MEh0itvL0ncfMF6Zz1gkwJtrNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418951; c=relaxed/simple;
	bh=bOro1hIjNHINYAcxIK2Gze0HZhEsLkpLBHyHH7fKN0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MTI0Dp1+SN3XLCa76luyRMHAg/hXA/3GgoapUpuazSTJQcnvsWBtZ5LNkWobeKgwazuSZ7S4PJoRNxE/eXh1Ryk8YKXTcrzKMfiUDENx1HFwJyowlbH8AQP/XsXIVLh4TlaNXBPch2LmlLWti86Rpg9nEccq1ZRNjVgUSlwaNUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b=gf/tc57s; arc=fail smtp.client-ip=40.107.94.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b="gf/tc57s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmbPTLZoDyh222X/yn4hIQFhkixo5cjoiPr3KbvQdQf4SJcGDh/cvoYElBAH5Vksn031KzQTtDLBFf4fH2jP9jIboHWo7dpGhJYvK/1eGGt4iPs20QIXLxCSq0ZV/N+0oydETossn3hogvvIhyoLDJDfUOqKY4KmYFQNYEzagG5UbcgC41moGuzZB/qghR7ORtQGrM/nvayMwGBVY3jr8uoBmGcnXXQGb1YzbioIqODM71r5RfLFtvxPuMk7Ax7FvRnqXtOVQR942WGicCEtBU7Eo/L2ZfXeb9yhB9CZw0YpwClWU2BIT8JVTcEM+L0ymGvlScCWqDw2gb3+vir9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPrf+dLEOmfkGex5atRoKlk9BbGRaT+gHbLQTxSKrmk=;
 b=Yjh/Up+y20y4nqYXHWSTjq2kNGCNm5OTs63SvEPQqKJDPHjWtrVAeecCL6HGkfzU0dKwVrJUL+27jd+/qw/VZyuSfsFpjsu/z7+ULk9buqK1sJtIZqs6MnadzFDH8CXCSEtvIeScr95ifPKldp0Y3PKl5ToQ6UjLAFGlsY/V/Wy2nMLtgVMCGd0Pejy71LsOSTw3M2uKe62De84rqC7KMwUt09PVsTPT1itMOcSNZC/KeIG0jiOm0FsNkxXmZsq5uoBvZltye1dnA7mNWVirG33kzby2DuvEPTKbrSqtZXGx8e7Srsyq++R8sbZ3E/NFQUfbYqXihgFmNMaG8S61vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPrf+dLEOmfkGex5atRoKlk9BbGRaT+gHbLQTxSKrmk=;
 b=gf/tc57s7NtjT/cRW4ROxc/HCUcAJ87MrKBEYAbH8blFBpc56bkmtuJYZS4L2KmWaRvm0GCm1Zj2vAALJjouAZGqTSFIlRnGlVMV5d3MvEt3Z29v8p9qLvS8zrkOY0pQp9W+eLDsM9NiTJFSgsrB6pBAjYwlkh2N9VzliqK0zxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by MN0PR22MB5638.namprd22.prod.outlook.com (2603:10b6:208:4a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 16:22:15 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:22:15 +0000
From: Garrett Giordano <ggiordano@phytec.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	w.egorov@phytec.de
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] remoteproc: k3-dsp: Fix log levels where appropriate
Date: Wed, 26 Jun 2024 09:22:02 -0700
Message-Id: <20240626162203.3484272-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0006.namprd12.prod.outlook.com
 (2603:10b6:610:57::16) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|MN0PR22MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 883acc58-d716-4b72-2e98-08dc95fc23fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RRfVjrwaYybBbVWf9k1liNpjyr5EWpnN27CGaDoSbDFKL5rhQ22RGi2ck8QD?=
 =?us-ascii?Q?i8rs6ThEBvTE//XKWjiRxqF/JaP+3VcccRT6L7dahj8kO+lVtsKoULeoTmd3?=
 =?us-ascii?Q?/JifgO14nGaL8ndHgorpxm/fagpSgW6RZL3bfBRUS+SBu5oAU9MtkG8xZwWw?=
 =?us-ascii?Q?ndt5pV+ZLIdNzVswjV37vIUma4ZJ6xlpdv+ixOVyUBGuXc+EBL53dM6bAooI?=
 =?us-ascii?Q?S5RlyoylXH30iQisptj62xjMfu9ywatsLf3aR/DU/9nw9m7Dlq84Z49LOsXy?=
 =?us-ascii?Q?IeTMVyUw52P8VSEpcNp9bSboU0jjErcQ8yedDspt/Unk+N/zeO4dWwu5zNft?=
 =?us-ascii?Q?mSfsGY/ig/hrGHmpVEXrnnUUWL1OGbkgssb5pwQQ+z/wJJHhITzZX3XfsbVy?=
 =?us-ascii?Q?qGqylWFoYp+EbOKsTyY4NBpcOqXdVdBF2rJTrhhJ/MeCqU5+dNPUGjyLwHz/?=
 =?us-ascii?Q?k1THCGZCIulLuDPshihStZg1JqKjAQ0gsPkGEar6OB0S3uD0xDPqKUIfefA0?=
 =?us-ascii?Q?IrmtMPEmqx/S8yKoYBKAnicOi1LRz7FxkemdLTpevi0K3G8iLJ+Nh9prGP+R?=
 =?us-ascii?Q?IyyzYd4WsCAtVExS8Hh23UyruMrRed1BThaKlMPvsmUctpIAskVGy0uvZIke?=
 =?us-ascii?Q?s+cKibFlH15FSXeBDGS8CrYM/45q0YlIHo8L0+0AllL8hmaM29GDDSfkJxbj?=
 =?us-ascii?Q?GS0PYcZQ8qOLEBKLo/4XKfvU3rhmS8utQEJm+1klvlFLY6Isg81wKAxnN9jk?=
 =?us-ascii?Q?r4IDiHuk98oZDdsORTSxbchzevRwVabAIYI9X/DH9VSQntEFYiS1oStzieGk?=
 =?us-ascii?Q?THBF/fu0UsLml/HycfNINU+aQ1hui6OnXPW/T2t4P3emhIJWx+x4IzirkViT?=
 =?us-ascii?Q?n0XGI9EroGrivtcHCK+xceO3l2UJies4MfBW7pzSAJIPKUr43WM/dMgpaPgu?=
 =?us-ascii?Q?RO9MRrvZ7K+WCgwhe7m+XijkFBcJNZK5OoyEVRNFHjCm3j/DjZU3d2XBFIhs?=
 =?us-ascii?Q?mtyj4p1QBtbM2aWYYD7PZ5wFf8x+mF0zgVZI6C0haF0jrNFf7ZCPNdJdWrcO?=
 =?us-ascii?Q?+3A7tzrGuvstocXsXwUgC6G5JyeBEpuKyHX3VbSCHxiVAuTqDDkGNJfCyCwB?=
 =?us-ascii?Q?a4T0zCQj/GLTRYNLJJDkfHOmx2l85k5jVexP/65+MYIVIzEbj7+cgEBKmOVq?=
 =?us-ascii?Q?m+1gAqI1QzFaw0EprCCn1nyoTZqR/3YLpfPEXuJYUC9x2Kmm7upwt1kNSFDz?=
 =?us-ascii?Q?7KFfUYCON+/i1OaO2bbjpD9CFqAaI4stle+FmBf44oBq55FTizQRIEn0jh4P?=
 =?us-ascii?Q?u2e5Xb2d2A/Ukcner0HC+f7GKzApGlvkIEY/XcszXYjSGfexPZvZuulN0TgF?=
 =?us-ascii?Q?suRIElI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/pDk0E4tq+eSREZOOLe4J2Jqle5ujMgxoZn9zwWV1V109ZCcIT5I2EohQ9Z?=
 =?us-ascii?Q?dyw7DD/X+lJahSuafB2j9BKUxJlgiL//j52v/13dKyKowsFRpkpZlphxx00i?=
 =?us-ascii?Q?zPOPEILkp/c1arHFgZJ7ZS2yBGZkYIKGiRp5q4KgIdtu5R/BGGplQJ4H1uEj?=
 =?us-ascii?Q?z6a6FV2NsTGhMZXMjL0wUXIbYATxS1FyE40RbWu5RgQYEMMOta1UiRuBf36A?=
 =?us-ascii?Q?q7FE/Qe+8ajnsrDrBOpkMBISZN9bTcHyUH615zIT4AlClfNRif6YTUToxMXe?=
 =?us-ascii?Q?8vqIuTBilvsG9QeTmOb8QCAJQ6mfIKOh2vjK12spkjEIw0N0cTd/CN6ITZvP?=
 =?us-ascii?Q?B++3gnFy59zFXSNvuGjZZNwkBjWQ4N24tlDAsw5Zqcju1PLyAnF34h/2O63o?=
 =?us-ascii?Q?4ZCSr01H0wVgI2Grn8wwreS7UzokRy8wHgbdqjMVZxGXROJ/MUHN7qbenryE?=
 =?us-ascii?Q?yoWGM/BnhF+oJWgL51He9QiAYw0Iy24ERwR9M9Ka9oLkAPnlTS+hMW9rof09?=
 =?us-ascii?Q?an/2WJfWoQ7UzWRyRHqAr/PrEC84JJ+aqWo/x+VYFi6if+dfBUmrOn5mM7FD?=
 =?us-ascii?Q?IDhq4NqnAwf3y+UPUG44Ywitky360rX+CTV71lweHsYlSL5SB0CmYfurhiSN?=
 =?us-ascii?Q?AM2szlLbOBjs73/kDa7tuaLhkGBSpTxxHTyNT++dNj8NHoquo5FGAUN9EPed?=
 =?us-ascii?Q?lwLsKRVTSM2KpDZ9v5EKF8i8yE7y6BWpv+FyOtInnyXjFuZDQb0fWIUUwxPy?=
 =?us-ascii?Q?dgJE5XBcNjxwPS9bTl84+ENTU3aW005yteEr0O98SrPM2afAwQ1zOfOXrn60?=
 =?us-ascii?Q?uws2a0VcrmqYssJjW4n0/QcGa8wvqn8c0ctsgbPy7JS+Dsov4LBVRI+ft1tj?=
 =?us-ascii?Q?fZtoLQQED8DJLV1CjgFM6pX8/qhkS4Ahgnt6kwXGg7E/tEwo3kKlkf/W+d2v?=
 =?us-ascii?Q?m5q0gMTilS5OYaMuH1CwRkXluj8vmG+XdFrAlHhFogISYtHOObwioHwXIW5L?=
 =?us-ascii?Q?a+GtIb99LQsupv//m43sqDWnOgK5JlVf/iZrADAvirflSRHdD/kiW0d3L6lp?=
 =?us-ascii?Q?UnJLPMJqrY2PkayvAKXpEGeOGhiSuk2cLusLd0tdGquoN7zcUi87qBOHazmr?=
 =?us-ascii?Q?nuaRbo4yoF5ER6VMvLSMcx4kDsmeLIwz3bP8/pUu9R0DTyEWb8bgPdCS82y8?=
 =?us-ascii?Q?Bdypz1UXxl1KmM6np9QpWNKFfhuaUV/uZoACZ6/2eyloArhUWnEpxo4ndn0W?=
 =?us-ascii?Q?k+MQEM8gWPjRPifXD7KA9dFcwQiegcrbV9t8vHAZDYGWn02mxduNq/7w4JW5?=
 =?us-ascii?Q?06Qq9aFKHn7o/GpE/FMGQcUNnfZ7Bjw1WG85NREjG7tbDlO+RmlcykMrPwly?=
 =?us-ascii?Q?wkP0YlNIy5xZfn0ujMtgNOhPc5v1Hkew7PHDm+9hwxIXc59n4P6u6bTZl8CQ?=
 =?us-ascii?Q?I6rG+HQ8gJTKJH5UZLsUFhBeYh7uFzyOj8yxQ3Uv/f2FGnO1mU5B/XPjMNTb?=
 =?us-ascii?Q?DCNOGWMBwo+qL7JQzsb4fA8FmtRCG6FqmDNXcNuwpJGogeLNKfqiPN6lfzwf?=
 =?us-ascii?Q?ZT3OHDFRGIzsVktPo+++e7dznKG4X2dG8DHKCrtb?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883acc58-d716-4b72-2e98-08dc95fc23fb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 16:22:14.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaCUWaKdLJrdSvOOLUh1NSz8T0ApAmlyd4T0q6UH28oGubgZp+z57/9EUPTOiIztsvAXo5fxkIjs0XZZDpYSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR22MB5638

Driver was logging information as errors. Changed dev_err to dev_info
where appropriate.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 3555b535b168..57d21f8ae3b7 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -327,7 +327,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 		goto put_mbox;
 	}
 
-	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
+	dev_info(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
 	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
 	if (ret)
 		goto put_mbox;
-- 
2.25.1

