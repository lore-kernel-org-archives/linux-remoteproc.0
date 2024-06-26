Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2127.outbound.protection.outlook.com [40.107.244.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D91849EF;
	Wed, 26 Jun 2024 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418944; cv=fail; b=EOW1BYqTh0lcILIuPKkOcToLk5HZzorYe1+7OUjpkzJZRprlNcqXTGE2J1BV3Rjn5EOY7BT2WOYKckent1HjWBiyc/O6YqyRQdQvZXM0QIVh6AJJjZF10emANbkcBvd+Gm1uJR+kSbHTRDxSnyOWOAZ4qOHoV7DWH7ethdj1c30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418944; c=relaxed/simple;
	bh=Bak0zlkDn8FPkqHf4rNdApiNhw3/vMnnxF4GjL7Kh1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B3BWWEvTXM+IKhjZVDnLpEYsvOKezmF09OWtTYuGODRkjobJFUdn9Zfk7Wn//0ggLzWcFAFYeW7VMCPnJqPoeqa1AaoUjRddHCZT8OBuqnKN1j/bWXc+VXgIKpOroujNbYneiEeMfbx+tl0y7EFYKJWiopm90qq+MZJPWTueO+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b=HAh63XRB; arc=fail smtp.client-ip=40.107.244.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b="HAh63XRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dd6+hLO9mxP3kSpGR9FNexgpCW5drkELBHRY0+8gNkd6+zoh6gxcq1oCiqdcpqLlXnm/GVka3Sf0HxsfpJKQ+FJ9YYYUglwvQUSHo/cA+XradtuIAmAhzRJV+qvduARKffaqAP7rmdAvWZH/8aiSPjBPcTfluTKwoU/0U3VCTYjmpS1RPNsdw6v78P968d2De5sBXVTdt4YRSnraLOJ23OBMxY9om38sGd61l26p6zCGlhKZGvhXP8Iqp1VFGrCJ25HcL4XKSJrmOqavkPXvT4oxdToHjAzcO+eehbI/pAMFswSpsneONrFNLUxb65Ta9vAlBmXyzhDg8FwR/VhmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZjssxEVn6q4SNr5w78/aAEAj9Fyr2FldiJFNdQo2dU=;
 b=kS+fsz3LQzhy7D+c2BDqdoO98qVNrQ5tKE9st4NaI5jYcA4+IkhjH/L+cMEb7Wh1vQPnv7Cu0exkCnwtN5aEaYoWk9Ox5sdjI8ZfGkUhDWjZPqWoRPXyMmcfOw2Z/+mwX+nlD8x3huDsc92n9CsZSYgieoTT9Iq3qSx49SHUCmUYr5CHcsNX8tMDn9sESOaXOvNKDSrJ18d9tPBfyfzsN5wKllSB6r1e9YthiEVrdz5JTQH4bzv6dE5SqiyOVaofZo/5mqUqvKBNJLYWEDDpFUFKxIvunkTeeGbgE5dfmUUlwl0yYtzOkQeld9Qjp523wIb5ac7LIWowEwyjR5la+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZjssxEVn6q4SNr5w78/aAEAj9Fyr2FldiJFNdQo2dU=;
 b=HAh63XRB4i9u/CYw+kCtNoV95BYBDvfEFMIPGLxXqQlLH5AOPCvdhuwuS5wSN/GSvDxN2YugXqjB4rdtHEUgjkSbydodcxJN3VybMr1Ahwx9+ugCd0qnnHuiAIkjs1whI5qMlTcNzz1KKgvNOuVUsfDU0ScsgjwkzwZwHywU3p4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by SJ0PR22MB3166.namprd22.prod.outlook.com (2603:10b6:a03:3ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 16:22:19 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:22:19 +0000
From: Garrett Giordano <ggiordano@phytec.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	w.egorov@phytec.de
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] remoteproc: k3-r5: Fix log levels where appropriate
Date: Wed, 26 Jun 2024 09:22:03 -0700
Message-Id: <20240626162203.3484272-2-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626162203.3484272-1-ggiordano@phytec.com>
References: <20240626162203.3484272-1-ggiordano@phytec.com>
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
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|SJ0PR22MB3166:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ca82e7-9a41-410e-6e54-08dc95fc24ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|52116012|376012|1800799022|366014|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U8HiccCVwyin1ZYGVD0WGhBvA0/isFHxVtICgnGkWmwbV5xfJ9ByxIzbu+Y0?=
 =?us-ascii?Q?i8uJPIa9kmB1QohpRA4tWQv3fqWFUk3CBD3aoIYSi4idbJcFNcji7j7D7UuF?=
 =?us-ascii?Q?tqgp0M3ts30XUSAapqt17mtwG7WsES9ymIqlkISVQ7exXcrY9NNgrMgGCpIO?=
 =?us-ascii?Q?zP0B8VCkrhJZevoWqV9g78RKZYLqF9ahfMr2zIppoteju8idgVI4GT3FscS8?=
 =?us-ascii?Q?450mPOyrYUrXTwtPjnWJcI37WBBXfDZNKhvY9SBNEG7+v8QcIx6ubEPhGNA9?=
 =?us-ascii?Q?/CsFpI1v3iENkAtOPqm94tkxqDOkNFERWrsVFaAIfqT0y8VAajVAcxgCGfjP?=
 =?us-ascii?Q?mkcDc4IiKg6axAQFkofnGlHbiRGLGKg4qcQ6/ekotRY9cx/sByMvtusk+nbq?=
 =?us-ascii?Q?jzP3ABJtxp5Tdige12E99JLkJE8EXIN4yDbm/J7FsC4Y9+EVr2MK7tUcGtZJ?=
 =?us-ascii?Q?akxD/gTCeiEhG8pD02Yw89GlDFoA3K7ICaS8Lh7TWEEMLUu32wYVVeSZ5KhF?=
 =?us-ascii?Q?zgHRIGImqryzD98MursNYWWMOsrfX3j6JK1LoFTHCGzuVmPeq5n1oaMjJinz?=
 =?us-ascii?Q?mWBbnx0ogqhDTSP7qGrzOp87mMnoHS7l1E41Q8XQKgzMT74PO20tNTJIwo/o?=
 =?us-ascii?Q?98bQXbAt3SyxD4XkERY5JqYscqTPsmInC7bDRy8im1zEegONcfyIimSADjXH?=
 =?us-ascii?Q?lzKBfJyRbLsMrIg3DRIqlntlwnPw532GSEqRmQMUMoaTcZFrf+KydYt+QMAN?=
 =?us-ascii?Q?pcP6mlkU/sUGoPL86hu4yev7ISkYN3Aw4ya7FXGIooXrdIVk2GSe710h+PYA?=
 =?us-ascii?Q?Oi8T66dKg0ThPbRtqzuczLqw2xVhin+WuHtFeSPBM5mDA81PJ7MMvb/UpwiC?=
 =?us-ascii?Q?Wgchl9lofWTQhTQgS58MFwENyZXaVTvSJif7mK2Itnlwgk8nsoyIR7+oqDMx?=
 =?us-ascii?Q?fLTFjD9gmOavdTBl9ccAKdxvbq+5TVNBpAeVzm2DN+R5uFm949fWLdc1BQ9S?=
 =?us-ascii?Q?WlgU1zPZFvTfQkyyVlMAiFRq29E9H/EZ+QQ4ydlImr3JgNMTPOzl8iFZ9Tsq?=
 =?us-ascii?Q?NbBe4NOIpDR2CSSHuKQJw7stMWPJWezQAvCOqDZgCRbAVW5zSdlxaz4LQa51?=
 =?us-ascii?Q?RrIcAN06PkvjV/cttJGL7VNpE1EfG/YFZ6csnqWhaByNLeHX02SxbjiP8gYb?=
 =?us-ascii?Q?3gofUfS/QCSPFIeg+O/s+yxsxCrtkOopwkoGogYdIrPvJvJM76yiOl2yY7mR?=
 =?us-ascii?Q?CgWhTIu0/ScWprBHhmwa3dK1r2FHj+QGKfbooHReNN1QU7xq2L/VggVvS4Pu?=
 =?us-ascii?Q?59TTaQCcrDRvXNV2j+W/mgjVKyo/m+/PNt1fTogj34lWj6zhp53iEgdk4Vql?=
 =?us-ascii?Q?zKh3EXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(52116012)(376012)(1800799022)(366014)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXXP8ytUBOke8LzjFPGrzyX0jFeN2ib4uIek43yjuK4a7ktJQBQfs6Xldh87?=
 =?us-ascii?Q?Z5SXahU0tramsUczsywuOyDIsQsA47gYSAfvbbKtYG3JsaykM35HhF6UbdUl?=
 =?us-ascii?Q?+OIa3dqvs7b8IpTqtbxc1C+L6UnBihA35eHN1QJBqI/9mMTzClwgn/tr/CBR?=
 =?us-ascii?Q?jVqdAU/ApMM7uhuwZ+Nk1Do7ExPcYALiKehAXs/hK3SYCpYajowHu/MmCBaM?=
 =?us-ascii?Q?Bkqv7ih9tZZ0QiyB2SRzV/PyfECDc0RwA+Pv6ya3XMzUw/EZGpKwk2iRIQ9r?=
 =?us-ascii?Q?bKab2yfaRg2digqPsFWd4S8q6J36Vgdsv81NZtN2vluVNd3FdPnUMBCIvgYS?=
 =?us-ascii?Q?1+Ul6roKBaP5xKcUqOjKYlBKUHCOUL7LGzivOuztRSCQ+hhmoL1Ysz+4jT5q?=
 =?us-ascii?Q?zep41bbq9DQc24MJsHJ2w5eUMMjN/A3OX2ruy0UEq+knxJXJFanD9Kf6PWdT?=
 =?us-ascii?Q?TjtOXnCTx52NSrQyIAoYGFuoxPiWrUGUd17h7N/vncCgCLDC3lfu1+4LAX73?=
 =?us-ascii?Q?09Iqvam23Pl9/HCjOWBYcO4BJ4o+w3iBNR2Nk9caf1ykKgCwAF3s8234vTUJ?=
 =?us-ascii?Q?lQM5HOcesb9NplpqulMvM98pBcKgrI8UvQk36VNHoe/V6NiwaEMp3aZztrDj?=
 =?us-ascii?Q?D3y2+AQCFU8SZSNxZtbMhWEZT7YWCDvON3wEvyW9ORktT5FvzeDiwKewybZX?=
 =?us-ascii?Q?gmWbrItR37YSV8QHa4pFyOGPkmjEWxfUKZ8Jh7JQqns5NdNMz5bIYFOoJ++u?=
 =?us-ascii?Q?kzaQhiyLPj2tbJ0Pv7iKJfP/Y6SnF0SgHxXBqqbkQXiRT2uI3d1fj67Li9uz?=
 =?us-ascii?Q?aQ8A5xQARFV8rvcxX0vGOeXVdFhU2mqyWDEXq3PagbwKLwpnrlNpBNyr6CHZ?=
 =?us-ascii?Q?UY+MCo0znKeLjZip7CPSTpQFvZ28BcPMWlaiAr01GOJbkKx8txrK2JRh8lwp?=
 =?us-ascii?Q?UtVWtlGB6478JJCUnstwIWiN3H/22IxE9TBZgevsl2NMQ9cgis5XbdnGdSrS?=
 =?us-ascii?Q?FGeXC0D4hN6vOL/5u29G/XKSL9TbaBm6wD2+BLIqMIltdUPXmZvY37PPnhy5?=
 =?us-ascii?Q?ae0kaF2eQccxVk4zUVSyhnIWGrPZysGL7BmbEF8mM0bdMcHtQo3bMdYsjffc?=
 =?us-ascii?Q?HvmxTsi2qN0SPKTkk70uWQlLR8ONIPmKCmIc3pW+AsM2dSkXeIoGgt0Q6SLB?=
 =?us-ascii?Q?dWxTm6z9oQT2aU6Mus/+25L7Aw1/y6U/6WE9SHjuN57o46JoA4tW9DZ3Y1Bp?=
 =?us-ascii?Q?08M5gIwIhM14VXHtsi8XPQhjJx0CdnOpt3it8cDNqcexy8BX1buKyzdNGI31?=
 =?us-ascii?Q?+jPo5EBqm6wn4hepWCiQzs5iaL06dA0Rpc9s+TLc9A5v0xBpZ/YLF8pCYjjC?=
 =?us-ascii?Q?/pamei04RjLe1JS6LeBlPGeRSTqkQneTLFHa8xTFIH8WJqQ7TpaULGEUK7Bq?=
 =?us-ascii?Q?ZeP1TlYWrt5ZYG62pyjUPLhzXBGjnTgW6JecZm6/D4eKzc8H4ixCtqDaVzqi?=
 =?us-ascii?Q?hVu14eMEeRpobBIGNG0V0Y91Yha1Ldm+M9SnzPPA7vNgcdImmGdFhktG7vxD?=
 =?us-ascii?Q?ys0SDfBaBz18Xi6b0Q3qMovalxwE4VGtRlYwzWkD?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ca82e7-9a41-410e-6e54-08dc95fc24ba
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 16:22:16.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C33ErOPNl5cNHJywTS91wnt2QPcn/CVKWf/YZQDUqeLYnJDdIymNBWz1PeMClK6mFT+WkvMbxuz7y8IH4/9IVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3166

Driver was logging information as debug. Changed dev_dbg to dev_info
where appropriate.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 50e486bcfa10..5821b6517063 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -558,7 +558,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 
 	boot_addr = rproc->bootaddr;
 	/* TODO: add boot_addr sanity checking */
-	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
+	dev_info(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
 
 	/* boot vector need not be programmed for Core1 in LockStep mode */
 	core = kproc->core;
-- 
2.25.1

