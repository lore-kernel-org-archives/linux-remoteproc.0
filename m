Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC70E14EC65;
	Wed, 26 Jun 2024 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429301; cv=fail; b=AurfwwRDgS0BN9BwFcWTOzAqJjSFvMe9PBVs57oI0scun0Dn1naULOQPnw04ecJAw41k1Rl+ShAUzIloFdhgjl7+s6RGwUPTl125fY3/GJCxoWdkCHUKFslmMggQtFlYa3IHAxHusw3+PK8KFWmnZTrMagNFbgZ48q6s3NVHYTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429301; c=relaxed/simple;
	bh=Kw/zAHArZvM8p+N2UEG5fmKexM9rOJ46/41ODN17mDc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uj6JaU+6aob/tS6F2FC8HiB0GXYaWuUjfPikUMxMphDz57Pc9a5HfpRf1C3I/MX7Mflaq1wbL3GIrrOC1FJjsvQh/EpFWyRAtunvbToC5tOK8Mo1BdLAMog8R/KiwGyR18SQu+7dOXW/rIbccYaZdt2z6+x7oEySaUIiWMPv9FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b=kzX6Xh8G; arc=fail smtp.client-ip=40.107.220.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.com header.i=@phytec.com header.b="kzX6Xh8G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8RloQD8IdIa/ndDwj3QheVtqW1JsYAxEnuXATbW2yEzbho9iSQiSWbltbWimQ7A6vOW8KAVX9dM/exty8tt1u1uPU/+9manmH+i1SnehFECpYMu3eX+WeXFLUBoqhG1r5qXHXlBI3/dC7fn7gQp386IWAPlCZCpabjgDw48XkpguVPf7rqHhcNMdYMuSm8Y13zasPQn1imwxC1mNIFraQV45xUeQ2JFLPyt/P+mZvQ8yUolFIHZloESFVPyYwOTAQucjfqrLqtzM3ZWjvhGRGUhmZY1B2MUagLiheq0zTPlCxAGXoVOErrGiIZ0i4AVBTXRz9xYbUP/gu6qj8bArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ie/MTr5Gm0fQk9mvWew8KJoKPKQuoFPgqQ8KyIARLA=;
 b=NTMIAc4gc4dGKN3kI4rkQgaioP4jVjsXsrc3HiZbmGM/WMnELZyVNcflDRPB0D+Rlx0/8B+9xgUEY16DJ1WvPC/QTXTe1qP6SNXRvI+4XchxdEGWzCx+Dd1oinz1UwOUOqX91LwINeTDZwhf8NNYNIJACmuEFStQyaIHg/qxdouTLy6vpSb0iCLcLREJhsXhtM+JjXRrdACjGkAR25eafxkAJqHUFM3EKUgX0XDMfXq49A7AioVOEJrU+Pbj5qIj/VJW2uOQfWWyVB3uaox1PX54p1w0tbwjwahCcrQwKMP4Uh2FquO45xoN4p5zSzTjypMQqXz6EmyjT42xfCnW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ie/MTr5Gm0fQk9mvWew8KJoKPKQuoFPgqQ8KyIARLA=;
 b=kzX6Xh8Gp/zUEodnfTi7RdVearLob+vtrerl80lbc6Bh2jrSisLxAKw0NrYGKEmGb9shkeOEDaar7HKfNAd7qbBNS45l6k8A6Xe4pRSa1X/XEC2hN1eiqMoYSnGOmaTO+KCOc51VqmXYQ9nH1GX++Z6RKLaEMm8mpotBCVlX+qU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by LV8PR22MB5616.namprd22.prod.outlook.com (2603:10b6:408:233::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Wed, 26 Jun
 2024 19:14:55 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 19:14:53 +0000
From: Garrett Giordano <ggiordano@phytec.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	w.egorov@phytec.de
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2] remoteproc: k3-dsp: Fix log levels where appropriate
Date: Wed, 26 Jun 2024 12:14:38 -0700
Message-Id: <20240626191438.490524-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:610:53::26) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|LV8PR22MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d7d258-3ee5-4f16-1f8a-08dc961441ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|1800799022|366014|52116012|376012|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2qZIikFFzLRP/wo1sgBlhuQj2AJRyVDjoMNgUw7s68n7thm3l8T/WZLJDlVY?=
 =?us-ascii?Q?6Q+gyN+ApXyzQAEG935rOw0p1gD7MbPIGQqS40eA5tIgvgAseZVLzc0f6e+8?=
 =?us-ascii?Q?4umWk+g58+5TG3m7iTKZVo2aLmqcB33NceIqBPbAgBTQDUZtqdhJ8rCChboL?=
 =?us-ascii?Q?2ifgQ31QIfn5tpqNsVv6jkfijJhQKXvcuaQqZnD/EgqG7kLlbwglECnRflQX?=
 =?us-ascii?Q?jzSEJexIuSh1MwOCl+IguhXqufh75GyG+ViNb0uvLKCSbfov6LyHJg+/bNFF?=
 =?us-ascii?Q?en675oXy/+10vCXCCej8gPS5504ITZahOYNZ5vbPQXKQbdBqX/TS0ae4FToa?=
 =?us-ascii?Q?cb6PwOfoNfde0HgbnBBJq/AT24b//nin1OT+Ep6LjJrYhszyAeEHcS0/mHFj?=
 =?us-ascii?Q?d45GNDLdYLN+hitFO4eSoGeylF33lrmz5Lb40TtBXKPaIyAxLoFah7nlYO7D?=
 =?us-ascii?Q?lIjIRnVTyhMsSjVxLPWBH28RpGnkxO3nSAi1Hlh9/8Zovad8GbpZ7XfZSA+k?=
 =?us-ascii?Q?AaInOqmDdwLsaTVgRytC/nuvyW6NU70Av7CUC6AaUg3GG4k5h/7yeuIIdTt+?=
 =?us-ascii?Q?RStLEfX/etbu4GlhUTMadxpduroKBmcv7BO8nckmlbRGTk10xRRmQYdsieOK?=
 =?us-ascii?Q?A1jBJvwz1M1S9U4662idg2Yp7RYTPNbVFnpBakzwO+OAhKv2Tj370GK6oxSY?=
 =?us-ascii?Q?JwcdV5VKahkurGg5RXO27S4B3+Nuklpg1yaWjiiaL3mLkVuCs/TZOt7FEZUA?=
 =?us-ascii?Q?zupJvxLfsSZczVGSqYZFAQTCtv7rf8BLYniKXzhMbD2sea3PNUk0N8+LtfBv?=
 =?us-ascii?Q?2FUVGclZs0SS7fh0+6mBfX/n4S7qtZFKj/JlSCBWAUkabhCMiGtKewvIfi31?=
 =?us-ascii?Q?u5WuHyRylLnwzPzbfxHTP9jhxX8PaZEagCgsu4PdhpOcREVg3M6Nj/A/C6gv?=
 =?us-ascii?Q?+SMEEiBiP9Z+hvlwyzCzVntNnnyc4WEz554tfcoGo2btcUlFpArhbXBb8egm?=
 =?us-ascii?Q?3NSzWA3f3Mb2Fv0LtYeBSI+agZ8yBuiBxnYZYYZx7Mtv+YDtofOipjHv9VLn?=
 =?us-ascii?Q?rIKbzB5smTjnbUCuIRfNDJEBOT1kMhbnabUFkNoLm/7sp4gbIbTKM8SmPuzj?=
 =?us-ascii?Q?/ootGkHxxP17n3VdFd9xhWGKqlCp13piNzTwzAEaKzSVqrLGeNyo5T31GDsr?=
 =?us-ascii?Q?JPhi2ahYnAd15JV/17g+eFageker+hKx2rcKPy1QEkyTrNazPnZyKJcV5B+q?=
 =?us-ascii?Q?VAq7lIprbplfKe/u4ilFU0Z1NfsC4aUV0g3hm4HBtBzS5iYfxQafm6vmRrtR?=
 =?us-ascii?Q?Tdp7uFniP2BwT0rQS87crE0cmHeFU3sz21x7BIAqvZ8YETqFw1kBCd2jcbq/?=
 =?us-ascii?Q?l+iOrjA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(52116012)(376012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Rn5wUia6o4cVFP4eU8uHiaOsoNOCuWF8INeW/X9R9Tj1maY0rBtjLiMHFDZ?=
 =?us-ascii?Q?JWEWnU8KODVVP/Y2JUyHpOE7RFQKcX9wC7Ck4fK7MgwHDwEEvCIsob+ZvDD/?=
 =?us-ascii?Q?7G9lqTmi3+eJS9Rp3PgtuQ1V62nsonce2VViarRkUKpIFQYafHdRwnajMQqe?=
 =?us-ascii?Q?hmAU7CGRE6Qtkx7f1lq+tqhPv5P4mxtJ8zUfHiWm/qoit+i1EdjAhK0MS/QG?=
 =?us-ascii?Q?FAcJHWMHTtbW3sDzHSJztA6SV/S3WNH72QYo1eJt25e8DqDPel/3ou6XaaM1?=
 =?us-ascii?Q?wWBhdp26i2dzin2m59jXrjMOv2GYKx/OOnCWCkeAjgpgVU5sP3S4Jzwbn31l?=
 =?us-ascii?Q?lrJuVaej6xZ/NI9+Hb6n3QDbjIEyUgsM7UdjjFrxebDOfVkUouDAG4un+LRk?=
 =?us-ascii?Q?tfjBGRKeQ1F7BjrxVVeJhYRHzt7fUPjuFnjTdfP8c0/yFkfYl8OzAGDs3p/J?=
 =?us-ascii?Q?z82mskltHnqsqRO5M+A2607Gw7ybQxP2wJQgabXXlMfB4rQF7jlBQqS3ihSc?=
 =?us-ascii?Q?GAmx4HMKfRRAQ0Axt3OnUxooGMucm056zdb6Y0hr9KCuh7MTnKqr9+XKGFyz?=
 =?us-ascii?Q?n+Svv+0r/DpAiamjhgbqPJ2piLIzb9aHtefVC38PmLMXXsUn0dYBZ0SXNS8Z?=
 =?us-ascii?Q?aofg6T79W8r66nSUn0t7PVCPTbR+8RDAEqzxcTTBn7IhW1mzVlXior3fNNui?=
 =?us-ascii?Q?lkrang0Jn520UhdHCdS2czGQPgkK8mOW8MT/ilLZ73M7VqjzvXmq/Tc24EU2?=
 =?us-ascii?Q?JszcNwrUFI9MkUbVa0YVOms9kE2hsJSsltqABQp6zn/71smO2Kho0LiKhAcv?=
 =?us-ascii?Q?/dHgN5Ib1WIIKD0iLaa+wEmrsLlIRzUe6pOlqFa3yxmIpFwaSnh6R1tJLq5i?=
 =?us-ascii?Q?hSgdUe0R0A1fPzKMXHJJKZw11lONlHyB0nGg9mb1Nba65CM1e0RSubzlGNZO?=
 =?us-ascii?Q?EgW2BEtusnILN29Qly8Xhar9iDnWe/18wMPfLtT8K/512A3iNP2ao4Dm3hK8?=
 =?us-ascii?Q?WSPuujI5yJ/wVPaOtWX+ATBtL+EonCq55tSVhGB+cGTzahNt5/eXO1FR9oa9?=
 =?us-ascii?Q?68y8TsoVL5X2VxXAlHrKF9f4pE0jJ7BBuqQiBd/uBILwfRopv40QZ/Fpxkz/?=
 =?us-ascii?Q?ibhvLRqt/+hWEhbJLvkWWJPnSrc/+pejLV7sQY2FcbIA47I09mEGYngA/cF5?=
 =?us-ascii?Q?2LUKkFe6/kKb3rBtqnhDVZMOIGMcpY78OPl5NLmyBzUvZAnpSnogcDxEQRwj?=
 =?us-ascii?Q?Jn8QJTWcXWyd7skhd4uo6iEnyWh9Fw9bvVBZdRZTkqHLOZUvtxUgGAle+jWS?=
 =?us-ascii?Q?cpxZhw+4/txVESKagNKfV7KlqFX11YPV54B8E9pc6jDKH4jk5lMXzs4Z72AQ?=
 =?us-ascii?Q?KruCkfmK09xJoUI/FEyFqWlHzqPDO9ej2YYMg9IoCkRMT1gf8m33qyf7KZJX?=
 =?us-ascii?Q?R6/suyR+z5mKytPbK7ao1hXZFi5uUAQBEpPpjVqtvIy+IsXytqjJP+G1WR57?=
 =?us-ascii?Q?MDrejvm+n3FOwBGTPvY8oV/wOdBM7T4a9zokrvKP1kctAripvYhiz5H5bRPj?=
 =?us-ascii?Q?ruVgL/rh1/dL9vnzZIwH7AsqTzphY3qBF0z+S6P0?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d7d258-3ee5-4f16-1f8a-08dc961441ca
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 19:14:52.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P02UfntaOwilYSeddTW7WmrHzXrhgLKYwu8/HlnSD/1zAY+3UfgNlGWp6O3b47UXMMH7nqMpxA7CvfnQNz359Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5616

Driver was logging information as errors. Changed dev_err to dev_dbg
where appropriate.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
-v2
  - Change from dev_info to dev_dbg
  - Drop k3-r5 PATCH
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 3555b535b168..a22d41689a7d 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -327,7 +327,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 		goto put_mbox;
 	}

-	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
+	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
 	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
 	if (ret)
 		goto put_mbox;
--
2.25.1

