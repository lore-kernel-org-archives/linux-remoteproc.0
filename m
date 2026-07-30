Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4E037F014;
	Thu, 30 Jul 2026 03:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785380959; cv=fail; b=kR95YXyYfwrff2ekV2jToH/pXRy1U4aUa8bZ73vWntX5pNO/vd3VxnyrJ0Lq/uM59v8hrt1xuOfv4ZceKpRBxTcJC9/p2UD4etIYcNhLfzitYEi10kMrTQIf/uEqIGeockgpSAt92UZs+OLZ0zZQCiroQs8pxSq22pEh1Rsb7t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785380959; c=relaxed/simple;
	bh=fCJ69DKvUR2cV17FgeB3kAd7c/e8apCEK2fehJtuB5c=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=lSLGrFNfjUe42aU7uzUlvEtXTi6ZRJAwZmfD2i1sTvH4Vh34zyQR5u11ApO57V+PNzjKgDvrSogN5X8N4DtS7O5QPhXbo1Awcbtzm3/TD/aYme3JNDY9oyujR3b/nVv7WAHSS3UdLtxEtRHdS7RHyscaGui3EFWhFbUABbw8jiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LiwhVkpD; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LiwhVkpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDw0ZSmV0l5QHxjwwrJ5xL57ygXaP/HNr9TCu4Rpiy4Y8+vYG45wpVW3ofNZ2Z2OtaIxi+Lm43tsOd0plVh4lTz0mD3nNj3xa/10Nv8kSILQglktcvPqDbvg6562BSxVekQt2iQHNoqw6IFeLBr6Rqd2qJJrTmPESlZz6kVrCATQFaL6kiZTkqirNrasXAaA7TP6JNNVvKJ+ffsSzFtCK88zCnMMvsnk9tHHg7rCrEwZZhZQNoiULpFVSvFq8Jrhkxvn9vWtsfHR740DtV3RzUnB8aNnwnEVh1Nr4YLkvhCpuwCkBJiiXu45wCRoDtbM7K038akg/Bf5VfRpUukQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MZdjECYFcLHN6bbEqrI4BAJDSY68wnyPMKCJhUBGk4=;
 b=wPXYPMdhk56jYK82UMBX9JxjgNT6LRnkgLzoB6m6DTNucT4CD03nmLQDzX6xqAbifBPxhHxICASyYZn2x9fPVJKLziPp4NvAC6ETrmd9ZwlJqeWos5OzJ084EYjK2ohb2hBFetjCrzF3JBP6H9JkXeFYUiaqaMbsvQsVFymCb59DO1Z7ev5WoB6MHBBCK7groPIlsnUQsezIx2BYnuAl1oTj5U3Pr2LU1EE6NuH2qcOPcePcWeyg3CGysn9SnngJwMRsvNal/Q3V8OzKyDYawz3ubWlHSJSE87fnERurlJ+BnpDlQ0ngAEmfCuju0hNjLOR8RvDJDK+oLXFW6UyZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MZdjECYFcLHN6bbEqrI4BAJDSY68wnyPMKCJhUBGk4=;
 b=LiwhVkpDCV4qwmu9FymRDMUD/897OSBUzCzLQMbx40kJIO/fcQlbZ3exotWGSurtxMVhcW4PEzIFAkIwJp6FIn0rAklWVWoSFwBHUWNaQwVvzaNVcbiEJRlr+yYCWlGqvL502Wc6iY2JZUtdTEYBsGa8ssadtAZdQfbC72YWAmsWcTbvCVW3XyZu6wXqXCHihmi/vER6ZNiMjp4ahZ3OmoLdJjYXU+0I+l4Xcy6vwOAOWeJHfSePoOiy9nEGZY0h4OpWtNotWDUH/EFYcgxupmancjwDqrXmVEfKuYvpxouyuM+QUFHuGWZ3byGd9gZaGukgS0xx4By42gr6odxz9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12605.eurprd04.prod.outlook.com (2603:10a6:150:36f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 03:09:10 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Thu, 30 Jul 2026
 03:09:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 30 Jul 2026 11:12:49 +0800
Subject: [PATCH] remoteproc: imx_rproc: Fix off-by-one in address
 translation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-rproc-range-v1-1-97c9ca7a5658@nxp.com>
X-B4-Tracking: v=1; b=H4sIADDBamoC/yXMyw5AMBCF4VdpZq0Jrbi9ilhQU0aCZopIxLsrl
 l9Ozn+BRyb0UIkLGA/ytC4BSSTAjO0yoKQ+GFSssjhXpaT5lOx4NZK/OdOFznXaWpuWEF6O0dL
 5Fevmt9+7Cc32ZuC+H5qpe7ZzAAAA
X-Change-ID: 20260729-imx-rproc-range-6383734aff49
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12605:EE_
X-MS-Office365-Filtering-Correlation-Id: 143dfc88-f06d-4397-22b5-08deede7eca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xJcz2xzPz6/CkEPCzUBOerICto1MBOkU7UkIAhhnz+65Wkl35aQWxZFUzfvUtpX9ttyDhhC0ehfqdmdOMnttJHbFYhwIwmnqeM+wi9qrAyvKF/Ukv1GWa++RTUN4YGniGR7E5Sj86ycFSaj7dB7YvNLuSIB/Fqf2ZgHyF+dHNODY7a28KNnFOGH8ofz0MGuxtkVo+J7/cVSVh5qB/UV80mlr8anHYRD1H8ePqcHzvO85G7b5P6nbwEWXYTUnao+gUkjRwsEcsSI/qY0ikEWxkeO+rdSRKmfZv6Yg7qex7ow6bbryYy6++LPp8ZAgUWfYRfKnaSmG7ZHyJv77C9seMzDAljoiHBGhWMBG1oJv6RvArpHGDK2sEaJcmHRn4Qugd0NRAbBMZ9mWorfuKdE5AcePSZifxAjk+yiDCWlrbP0YqZFQ/vks0S8nR0gHnpWIIIv4yocMBYPIzbhsTdc1tn2gQe/05v19xZi8Fn/8KDuDg4uT/uhUllOdFIffe5f3GqohbXLzke7Sux2S78rXDFoOZJWWHuKCg4K0lbZiNA+WCuhuuIY+G1sFUfzhFhEKDl5YhKOxAWlHVnq/ig7sj0D32jopkTrQUSsD2N9a7CWfyXbC3wKaSXVwIhKUHDp9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0d5TVJVWVJXUCtuaHpadEF3SFUydEVPSXlKWndtcXpWcStpRjVUQVVwZCsz?=
 =?utf-8?B?bHNDalIzckVpVTJHbWNYTmUweTRFQWtZWVVNbm40aXhucmY4SHNVM0VjK2dY?=
 =?utf-8?B?aWpGNXBLRXZIT2N1SXJicmdIeVE1WmdEVkVBdTdqR2VkL0dTYVBTeUtPWkNs?=
 =?utf-8?B?c3FCZTVGV0crVC8ra2RWbXU3d1JBVEdCZnc1YldIdm0xVWsraVlHSkJYdE5q?=
 =?utf-8?B?aEliMlR6RzBNMHhld2N6SisyNnFBOWlWNjRNSnloL3JDaGMwNGRLTWlLRFV5?=
 =?utf-8?B?aXdvMGJBa1VLWEZzKzJKbHlvYWdBeXBYeTFXV3BuMmhob04vanpYL1BZL09X?=
 =?utf-8?B?Z080ajdyelMwZmxUVkRBTE5NWVVxVDdTUHVlNUR5WVpUSWpJbGg3cE40VmJh?=
 =?utf-8?B?WEZGeGFBYzVrOHNnL2ZyQ211WVBVeEVTMkc3c3E4eTNyeCt6ODZhbk5JL2xs?=
 =?utf-8?B?Y1pCM2tqOXoyZlN2VTJhZmllMzhkaWRoWnhnZG5EZUtyOVNsTFNOUU9ldnRh?=
 =?utf-8?B?UCszN2psUC9QMFJaS3RPOU1FVVAvZUlETmJtdkV3Z011bUxoOTl2Z0hnK1Bw?=
 =?utf-8?B?MVhtVWkrbXRHUjVmVjFsYW5UejZNTmFGUFJWT0tnMjZqRXJzck5Td2JvYjRE?=
 =?utf-8?B?UzFJVlI2UE1jVzAvWkl4Tmt4WkJpM1JaSjh1MHNKeXZBVndMaFZNUldtQjB5?=
 =?utf-8?B?OEs0MnEzZ0ZuK3RWQmpGdmFDTUxQV3dBajRUbHdldkwvbU9paUZ0WjZUYllY?=
 =?utf-8?B?WDc2TkoxeFZGaVRjNWRGSmFjVlVZb0VmZU5Ja1M3clJ5SXk2MDhDbXRFZjZz?=
 =?utf-8?B?YjlDNGFKY1FIaWFmTGVSRUNzRWV5dWNMY2VRSVhURkZQUHJ5aU1zMUhOQmJS?=
 =?utf-8?B?YXJwK1lVb0x0Sk84WGVLbENsSG92akxjY0xoQkxsTXRGM3JkWmdVVUNFMzRB?=
 =?utf-8?B?elZrakNpQ3J3L2dvTlhTQ0NYYktTRW9PWmpzVW0vSjRCTVpYVDNLaTdrTU5i?=
 =?utf-8?B?M29LNm9icUtoTDNYQmpKY1dEYUV0dSt5Umt3U1FtWVU3SnY0RkxnN2ZCMjZ3?=
 =?utf-8?B?Q21iSHl3NDBBQkpvUTNlemdEZDEweVdQMm9QdnNWTmlzMFMzb2JqYmJEZXIy?=
 =?utf-8?B?dFI1Wkcxd21VRVlqYW1PQ1Vsc01kaTB6TWQwV0k4RmIrMytNOGFnd0NYdmdk?=
 =?utf-8?B?c243c0psZFBReFNjOVpFWVE1TG1keTUxL1o4SGtmOU5mNkh6T0RFRTJBbHBJ?=
 =?utf-8?B?K3NYRTIwdlBlK0JJdGlRTHZLN2dFd3lhdDA0bzZYdDY5M2FxYzRKQ3NqYUth?=
 =?utf-8?B?UG5DZnBEdlhub0RiUi9CL204ZnJBSUFvV09GdVlNSEdCU2tCSVdReDVZQm5q?=
 =?utf-8?B?QnhBc21mNCtaL2lFNmV6eUhSU0FHSU9aaHlwSlY2MzU2dkl3d0djZnV6N1Vn?=
 =?utf-8?B?SFNBdDFhR0FGOVBDaERNUUR2LzlMUVJLcE9zK3lyTWgvR2tqM1M2cHhnZUJy?=
 =?utf-8?B?RDd2MzlQVlYrYTNYNjBQNGhVbE90b3J6MmhIb3hBNVVoT3FkV0hTK0dyZHdS?=
 =?utf-8?B?Zzl4cXltUnRScnJiT0lzNmJqWmJGdzZRYnh2VE83OXhGcW9aS2srYW1kMUlr?=
 =?utf-8?B?eE13c2hrOVlUcVNxZURUeUZqY0xFUnB2eGdwaDAxcmlqQ2NQK0xLMktPaWRE?=
 =?utf-8?B?YjI4MmNLdWFxeEQvNk8zNWFBdnFoYXBvZGhocnZHV0xYckZRN2RrYzJVUXJX?=
 =?utf-8?B?RVEzRHFtSkNCQXB5M1pPblZJd1h6QjhmWWlhUTN4WU1ORGdYZndhZ2g4VGRT?=
 =?utf-8?B?ZHIxMWtnOFRId2dCU3ZBeXVZUW41eGpXSGQwRm55ZkxGQTZGMkc0bEJIZVFW?=
 =?utf-8?B?d0RTV3RydXRCWVZnYnZqTk5QUDAvcWd2WHVQblFpZEsrUU5sdDh0TldUZkFl?=
 =?utf-8?B?VWZsbFVYeFo2emhQRnZieExjNlJxN1lCenpydTF3d0tTYnQ2cVBSYlJHMFpz?=
 =?utf-8?B?amlSNGV6MFl0Y2pYenhENHhtNnc3eTRkakhEbGQ3a3lUdkY0K2dIWVdMdkJG?=
 =?utf-8?B?cVcrYjhOTHBZV0xVOXFKMldESWh3ZDVmZTBwZzVZQ0NxUEphK1pVd2ZyTzF3?=
 =?utf-8?B?M2hGUGFLYi9ueXp3b1VHZkwrNndIOXhxNjZrZlZZeXhNLzRkNURNaGVDd1d0?=
 =?utf-8?B?cllncm1xc0JKdUxHcTNCcUx6SlF5ZU5rMWR6S3NpSnBQdVgwTjJiemhuZWRK?=
 =?utf-8?B?UnRaV3pKaEZwSnh2dTV6VFpYNzZSSDRhcWo0NkN3SEhHTWJYWTc3Q3Q3UVVZ?=
 =?utf-8?B?MGN2eVkxN0hNaWNoaEx0ZldJdXRsSGxWbmh0Q0xwOGRTcjhmc3ZtbFpkT2ho?=
 =?utf-8?Q?r//kFqHVcX7pOCa4u7kVSyb6IP8o01PruRQsU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143dfc88-f06d-4397-22b5-08deede7eca1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 03:09:09.8099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IquDN3YLg/TlVpoQsiOVhYntKiK+DLbNKw1kLP3f31/KAF+HuMnpz2tIg8DHPIkZ8Y1jYA8QazbRgaAFy/JK0QGju5YiM9hQa9ewCRfXVkByNu2LnBskBTsWHv+e8tA2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12605

From: Peng Fan <peng.fan@nxp.com>

In imx_rproc_da_to_sys(), a firmware segment that exactly fills the
remainder of a memory region (da + len == att->da + att->size) is
wrongly rejected due to a strict less-than comparison. Use <= to
accept this valid boundary case.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260729013506.584321F000E9@smtp.kernel.org/
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd8226..9af0aa26ce9b7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -552,7 +552,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 				continue;
 		}
 
-		if (da >= att->da && da + len < att->da + att->size) {
+		if (da >= att->da && da + len <= att->da + att->size) {
 			unsigned int offset = da - att->da;
 
 			*sys = att->sa + offset;

---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260729-imx-rproc-range-6383734aff49

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

