Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2161.outbound.protection.outlook.com [40.92.63.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012718ECF
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Dec 2023 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YmHl1Dk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I179UuRTMND0Egm27l0bM5bouxutIba4JeeZw3+uf29yOMAnSmg9jWyq+TNTVPTLCwt9E/bealPpr45UhRURDd404bJHQ5Oed4Xr49t1MDgUmIyyz0Vi3Yw0KkOHNCXjQcrFVkv+MBDYJV1S9uJx0rxx0p1FpTY15Vr6dqQEejYyxEC36Thq1fSeGrGeHZKh0seGrriofchnRzQUgzxw3bHC6tAkTvLHReLksAOHMA/7uTVNy+nwzcJ5Xaqc3caGk7AYiKT67pp42ZrhYVAwx145xMvnXt+URmS6ha2bk9xJBoSXhje0joITdnTL+dd6tYcsfYu2F0m6FK8Fy43UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWDrFDZ1yL0h4z3QkUHDfxu+TcpZBhyp2nUDFd/KRys=;
 b=nNAI3xZdq7oyR4/M4ghk11Oq5kHcUsB9zCX8bluTQK84IsV50g5MCSLxY79sjE4D4GE5b5oHXoWqlfqucHB2IRoz5NgjMTnQP0e3WAZk/n1jwldbzETi6V9v2t+ZJzub/LBxPP6wTkvQxwiCRkarX9uGWfYUUYw2cEIh25/WkhKh8ox+uCeb5einPFmAK4lRSE+Z7FA++gTlZKr3JK4r6MmMmhZNQq6GCtmDUjXoZGSkM1CSNnart9TwjPJkVbNIpsCj5uNeb4VuIHJVXp2kOfxTqEJs8i4HvvU6oW54Ayo47Iki4sjiydqGTjv/xinLMZhxEpP1BTsAxtRhUOUrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWDrFDZ1yL0h4z3QkUHDfxu+TcpZBhyp2nUDFd/KRys=;
 b=YmHl1Dk8XstyWmdh6epW3sCPSo7LO/P+MsaTBruL/LpP5O0Da4NeMFNbGQ6rfhglbmLz2+lbKgVE1Zbx5Sxu61hvOrThWewXYmdBO+ZSpdpKEXFqZHCjlPmUBoktMJ3Gy0cXQORTIUEE1zsxKBrtR3uH6YghZwut5eEQ89noV7fasAlSFBHfcWWfUgZzI1WSKC3+DlxoviTjcUUc/xm02nMe5scK10IzT9J5bP3O43iqWyiUtH5NrAU5ayBvAA7j2WYavX2ohmrhZz+WaJiWPNzRsGsYnRujjRoXfT207LiOKO+u5UvU19xm+f19XD6+kMcauJB0Mv6d0nIypSTjfg==
Received: from ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a0::15)
 by SY4P282MB1612.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 09:55:23 +0000
Received: from ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM
 ([fe80::8d02:a783:82a0:28c1]) by ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM
 ([fe80::8d02:a783:82a0:28c1%3]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 09:55:22 +0000
From: Ian Ding <4dark@outlook.com>
To: bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Ian Ding <4dark@outlook.com>
Subject: [PATCH] rpmsg: Fix /dev/rpmsg_ctrlx not created
Date: Wed, 27 Dec 2023 17:54:51 +0800
Message-ID:
 <ME3P282MB1779912414C37D59C4323DEE979FA@ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.41.0.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [QgujCLHy5T9li8vel8qOhsJIGsLA7ewD]
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a0::15)
X-Microsoft-Original-Message-ID: <20231227095451.1521-1-4dark@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB1779:EE_|SY4P282MB1612:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb5286e-5c82-47fc-ee0d-08dc06c1f12b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0msf+h7+75t0998fJYoair1AXwL1aZkZU4uSKrtdHlHR9FeokVDG5KvaPvwNuaRyq/v4Leu9xjftFj0vuWdOzEoeafR9RMdGYU2ttyFhA0x+r+aadUpU37L1MGhBYTlAVDobheDq4anA4+2RMy0OGcMiVxU+XIVT7REW0J3bDrffnbRy1QkLNQMXzk6e/ymHS2mlki1SUaYAVdhB+x5JVeVicJWfogWLOq4nmaWNUd7gQKVfK5s9sxnuo8iQZy8Lafuzw/RswEr06eTRKFOCL66K8P7IOg+LyRko50lDt84ucPDYLx1baZT3bXMgL7Z3j7t0DHex8WVrBXPz1OpC9iBFaLJF5TwGTCq/v3SOxbySxawGER0VW+TxdAc5KoZLUwwjuptVZHa/Ohz7m945tKpVOIkpETmMFxv3kE0s/VSIc6n67R6ipY0P6Z/ETO1KmHmGa3R8KALTM9XPrtL9cbXRwP3nKCNu2MHPuye1zas1PyXOhapIZntpaAiyrfHaga/GGq6Lw2P/c80/ghBWcs9Eo6Q5WFFDqZpHPdP8uH+3NvppwWrQKceQoZ+i8r3y6KN0+29Jj2BJ9SNSUn5bZpL93feDi10zBplHuruTqdsbT3wK5YOn1V2g3VCJu8kM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/plnksQ7fgjfFDgglxmsD2j6f15aQAnbNo0lBX0rcsVsA/ulSFw8IloUndq?=
 =?us-ascii?Q?HxqLpyXkZJ7eKp+Dv+LI3nTfH0EVTvI3zeVY+OToR0Ez81gUZlskLm4c9Gtv?=
 =?us-ascii?Q?qU80UP9npDdqbRgQyldTHblFS2cArnnymbQZ1ACmLWofdtLKrEqb6/yOr2dG?=
 =?us-ascii?Q?WR0yczKXJqEylcPVyT0jm6UIrJPEVZlkaEUnCMLFiKWAkmvaYZCE/LXZSjYm?=
 =?us-ascii?Q?JR8cJ/25EhYsJz122oWFUzriIHiS4Tqa7cx4EfSuAUDCaB6C+aVjvQj92JW8?=
 =?us-ascii?Q?iQDeyVIdQRLgMLLDK8Psyt7AuHJMPICs4Rd7ty6TdOBij8B3NuBa6WRFb0iP?=
 =?us-ascii?Q?N+mVymgXnpyDcd5nw8r08awDbOIuvw3o5Lm4wb/Hib9n4qGHCtWl2mNFW0h5?=
 =?us-ascii?Q?Q25pRXwHCjtJgpKrHmBtTjqyBisn9AMp0hn5lUAtO0L00RqO1iMtUp09ydvu?=
 =?us-ascii?Q?TTJwbN1VprJuhinhRbPHGGkdpvS7uCIhXHUa8LTVAMywDXSZ8N/dND+TJfzb?=
 =?us-ascii?Q?ooEhZVT0MeUZcowpoKtb5LdQvdC0QrzPjxyq3FM+Yf4AH7rusZWEmCzzsPwf?=
 =?us-ascii?Q?/LwrDACzRxFPCYm0t8aTtUJ7KbfSm2Mhgerbs/RxVizvKzuLGiUCdmxyIec6?=
 =?us-ascii?Q?8KjCwZOgkn6rVWjjJNvwuyil50O46KYagyYxN5fzwOpFv1O4zn/NcIOqr3+R?=
 =?us-ascii?Q?zgwvluhDbhomm2OAJ/9agL0dXQRbfXDRuVELL0DWTbUDG5Nr5Be0Fmqr0FCg?=
 =?us-ascii?Q?wIGxYOTWurWmNdnUgiTo+y92jqQB2JuAL6DW08zsBNvD5j8UbyDiwzreGp9Z?=
 =?us-ascii?Q?5cKujY0PT1yDZeZeJcRGNE45OhHMiB8/hYm107+pFue4WYPigSO7nPpD5EcM?=
 =?us-ascii?Q?iDqveJpmsFqsopIriGqbnJZEW7ljki7kerbQVTXB5LjbfUMkuqItFaN9gD11?=
 =?us-ascii?Q?F0L51+5RKjcroMBf+QJpJXluuMVX07niixwwDw9a6Cjvv+K7KKcv3ZDXHCxp?=
 =?us-ascii?Q?17tPuDLakbzrnpjnxDDZFKRP3M/NnqLtbIzPYfpvqZe59HnMtEXCbh0VYjLm?=
 =?us-ascii?Q?fEck9HMffWM8LoIgANwCpsexUfHKM6mBSnAA7Jku6pOwqVw75p1LADaa+K3+?=
 =?us-ascii?Q?rshjLUwsKcMPN2iU94fRrYMOgx2Xi9bSzrASOUq9MOYJVhe+22bj6tEy1Klo?=
 =?us-ascii?Q?gbpUQ560OCWW0PTa6mytAUq3lXSmvvXXxXRfUg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb5286e-5c82-47fc-ee0d-08dc06c1f12b
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB1779.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 09:55:22.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB1612

The driver name of rpmsg_char.c is "rpmsg_chrdev", rpmsg_dev_match() will not
match the device with driver_override == "rpmsg_ctrl".

Register rpmsg devices with driver_override == "rpmsg_chrdev".

Fixes: bfd4a664ddfb ("rpmsg: Fix calling device_lock() on non-initialized device")

Signed-off-by: Ian Ding <4dark@outlook.com>
---
 drivers/rpmsg/rpmsg_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 7985af92aa48..42ab50f385b5 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -90,7 +90,7 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
  */
 static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
 {
-	return rpmsg_register_device_override(rpdev, "rpmsg_ctrl");
+	return rpmsg_register_device_override(rpdev, "rpmsg_chrdev");
 }
 
 #endif
-- 
2.25.1

