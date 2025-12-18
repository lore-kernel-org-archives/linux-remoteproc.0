Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FC2C325C;
	Thu, 18 Dec 2025 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042316; cv=fail; b=la4H7SppfQ/sxqfvsEtIJwXVoZiSYR2ol0w8LBCaTVp9JSNY2aue8osslNl3M6UrabNsBpuvk0Tctt0AuO00ae3cSDVvx6F9uAQlD3C28ofwTdhCMCIu6+U/w3+ci/j2wkj7IulNdvEEMORxkR33yNo69RBSN+w7KagU7ZGfP80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042316; c=relaxed/simple;
	bh=xvekJBaZ5Dh4ELbX7q/DQlwBUhYU2kZazH7d9UFlor8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LFRBriDCpi6rBDc2IRz4QXLtpRzf7Y/OoNmbdU788CkBJgwYEQtwVk6t9wwE1fL4y61hRTqOelfOUTxezTTQH+n+HRlTtF1fm86Kvr2vG48MFh7ZTMZcoEw3bZgDdFU9bKSnNPsWYtO3ueKXmHlcDFPR7Jt/Ue9jPPUz6sfJv2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fl/6EeME; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fl/6EeME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca4+G5kijFXBIjmkxVGHgkbtG4m8KPzKdnt+1rnco99JbhFBwFvVE4Jcevq98EGUuySHlTPOZ/S2pEARXbO5AO2kUSKiAJYSZgck4f512m7Jzqf31OANr62Cu4JmKbrbjLJLjdhKGKfpWbu+PFkE4c8Q1KqKIaSXLhOileKDKfHkBo2awR/iOFGddVy5A+ZevhYDb8q2DYoIZ5hrDNKOoEvvNS8ulSYVf6jLPb79+7HgMd6H/5GBLesHeGYO8svgx5/AhDFQFDah01USoasWHUF9jPC3XAWqbiROy0xBk44U21AlY+JynZfSLvN3OvnOxmxGWrdiqm78KEBgkibn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlCdtJQ1anpazpKP4YhFIpG9WdHdsu82wr7xF3zq20I=;
 b=jFaqWEHZmmWwj6oigEZaCcYnh/SBtW5dDepyPcnitOf2uZl4ClgBga2U+cuwBMVkLcy9lbFa0bPvl9uht4f2+niS4RCOa8Hz7hPEcoZkju6Y1AhFm/D8MLUX8tXtBn8oMv5YqGE6oK1beRBuvTwiKbQhUcdsoh879OqzblpYOigXIh+L29JVpnFI08iKRB2YOfoVTU3JJQfoBMvJdv2YxflP/o5fq4ir8cA8Z/JEHh89I9Y2Y2neXI6+6sJslypfwgH3XUW//3xetyqNCiBVwtdgY/Chm38bg+Jf0fm3MbFIiDAr4F2hn//9MLDkfuFhmRqQgI9DPdq1Wg11PXLaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlCdtJQ1anpazpKP4YhFIpG9WdHdsu82wr7xF3zq20I=;
 b=Fl/6EeMEi3lMiPHKywEkpM9coyZwOKzm0ZjFK5ZL4d+TI7TNRazyzboNcFC6DDyIuozzyoehqjclCMvywgC0Q0qf+VZHe8+ZM10UXgQ2XKd7j2oDaSMwR8Rr+5Ln9CeG7zOJXqeEoy5zzF6hZgVFyebC5iiGIL7L0t+OGogkORBElgok30K/RdkOvQamrGgcLtjcYlmbQMQ2wU+48HY7QduaLfQvAJfwonAFEFik869PI9mEtk9s4LkwsRo4GUJf1mh8BMx+efHt8blokvQY6qMmFDXQi9BpxgCQlTJrD62WlqLZwzcAdusrbUTPq/gX2OGp40jWNwindH2CGZAuVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:18:29 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:18:29 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] remoteproc: imx_dsp_rproc: only reset carveout memory at RPROC_OFFLINE state
Date: Thu, 18 Dec 2025 15:17:50 +0800
Message-Id: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|AS8PR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3915b8bd-e923-4640-58b6-08de3e05a45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x49pFFAMqljMQobhLjoZ2VpJUYLJ6QZ3vkw8CHFJC2TDJOoMbhq1quQjfGBd?=
 =?us-ascii?Q?LHU3hNUh/cBxNRYvE/AHSDFlthNJRs1Jdyq3gmRep4BDnFF/SzMKBRXJgXnc?=
 =?us-ascii?Q?bEXMw5O+LjPkEqAY5fNmxEGyY8oqR9AUCSDSYbyvy6ocAlQLhyIel+WmZXau?=
 =?us-ascii?Q?ADfb7kww9+wR9rWpfMdoc/aBBm7l9B23jJb5mrCoQK3jDyw+CAKy6FLgII/O?=
 =?us-ascii?Q?ZCpmodfogjrTDuafjfXNvy27xZi5gfPGL8IXrk63GhUhfW1vhvyVxwp9+9oK?=
 =?us-ascii?Q?tVoY9oKHD39vkPaEuZyOVLC6uGR1AsHOTZtEGPbXTBkE453z9zbpnExBhSFm?=
 =?us-ascii?Q?zxVLsi+tnVLqmL8XxBR/J3StwfeRrCUKJ8+Zj6BRrSxi6JiCgO24Bf2CbN1G?=
 =?us-ascii?Q?pTWoELvtxx+jMht3Q3FlYpjAjvd0wfjRSWjf/1Q8b+rGLGOiouTlHDszSBVc?=
 =?us-ascii?Q?Y/IjMxh70rOm1lDsU2jnW/+4mb5As/Aj6oon2K97PSX6/OBvG9UHAUP8Rc0n?=
 =?us-ascii?Q?1ITL+O+APM1mblDWJEjfvckKP4mLd1ndE2ACMHxnkcfGiMKDTDUnOZduRlKk?=
 =?us-ascii?Q?n7/Ik56F+YeI5x77KJJHHhNoAoqIHNQN/yvFVpWXfI3NSRGKSd1H4YOSrKhR?=
 =?us-ascii?Q?++E1QX80Bq+VOyZN8ZedkFPpCzOkwSNA4VCKcdwIMnjdD9LIOixCUvNJ1k34?=
 =?us-ascii?Q?Ovx+XrVUEsF5tl+3uZxG2BllJ6+L5SLOcRdxp3exDI65ObiLn98dx1fpaokf?=
 =?us-ascii?Q?cwlHvAC4L001CbMYWjqFaaDuK/xZkt3TWeV1T9AbeaPcW3C+nBlmEDkPb4MN?=
 =?us-ascii?Q?dYGQrAqY80hpEzBQ3SELWeCttIzehj2+MH7ZYOwM8qGePHhXrIpHGOCotRfi?=
 =?us-ascii?Q?zKDjtTpN/xnAea6etB+zLVQYnjL6/6hhwxh2EW/rQj5nqtHhJznX/tG3jrSa?=
 =?us-ascii?Q?2ltoJk2JP7kuGWezu+Y7QntnGNWRhxRkOX765m4ie+tw+OSPllWlUsFt59D0?=
 =?us-ascii?Q?4BmdBzzZ3gzmvyvIM7Kiq/ze4e7e1kbICZyxM6S1KqyUYwuJGwtxSg7AoZCp?=
 =?us-ascii?Q?WbZVIjfSqRXWKOalWOQTfuM/BBhcf0mSJ5PPwlgevBd55F8KnGFIuAVwhtW/?=
 =?us-ascii?Q?j3LTQFH7cKHH3Xj5MlJaVOZXAehWtMFvMg4skY/wLk3TA3yDnIrpH1oextFq?=
 =?us-ascii?Q?yN1CtSOphSqpGNWIVWCNAUyIhDSxgd4RkZzjdVg5Ss0dGvwcsHJWQy4b2Dwx?=
 =?us-ascii?Q?gcqPFzIJir/6V3FBrnvwu16TlQe6VW6yk7hnxBHFr0BWCSEdPz322F98WVl+?=
 =?us-ascii?Q?7advQaE7XtypJcz7fbA5WOabtypVNkJbZKQENJ9nuz12VwUiK0KXsu5hepJ6?=
 =?us-ascii?Q?b/bLBELAA6AW58rFp5Ztiogm4RK8U7e9ANa/8sQe3XW3EBvzfiNA+xfZwlPK?=
 =?us-ascii?Q?St34A+aQ8c/0CuIX/Geg3ZzHkAs/Cr+ypZIkoqpbeHSwpNF852b1oNaTEWOB?=
 =?us-ascii?Q?cKk2BLHUQb1JCf+eQLfGbgz4NuoH5a7GjsJ818ZDa8gWpB6L0TmETerndg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3g+x4tEzXKDzLhOJKaGlUGR6QE/AY+XvQx2iq/JZ7pAp4XiEFb7kHrLETHt?=
 =?us-ascii?Q?UihtF0fV5C180aheWVoWpXwgfJXx9nz+LBwuA2c6QZNJhzmxAXLIok9T+H1G?=
 =?us-ascii?Q?awdMmUeEtjUx2QLG3die90lKZIcBwAEmtO8RDOhUcD/XmgtbBVA/sPI/WpM3?=
 =?us-ascii?Q?i4D2Z/L0euXNhChfa/8515b6nUYfL50xOP3CIsW3P3UUl4gks6Kz+WPYC3Dd?=
 =?us-ascii?Q?1vMThYs+yh5NnbZxm3ZkVXTEll6aX56TFzSqUnJQyUlyEwzM+6ys9OBhvHdn?=
 =?us-ascii?Q?CRv77Wy4jkb9YHkUpUOKndqkFevmsknjTq+ZYxIT9We22Jbvek77wi2YiV/1?=
 =?us-ascii?Q?h84b7WV+zl1YD+XNsgIEmUWg86H7lgaFUHymViWZekZL86BiXreLAsibjffr?=
 =?us-ascii?Q?ZKAMIitBXmdkZqvzjeZ574DACDT9JbFcwdoyNWZngE0N9Mus5GLVLLYfIml8?=
 =?us-ascii?Q?DebrjH3OfQq7gPo2Nt8PRC+Kv1jCRpIryt36gniWIgtNXq4jSwqI6McI2l03?=
 =?us-ascii?Q?aWmZ2l1Ax5VApmHP+ZBJ7m1Y8oI7jPcrxs4Sr2xTCDhQCUAeCWj5O7BoRMdl?=
 =?us-ascii?Q?rK7bpf4sD3sv3+MGEQ4mWIIdQgaKGB4g2BgY7oULBUVAGcn0bt5qOVnZuLCp?=
 =?us-ascii?Q?P1cf4f8glulfAMDxZRZsaX1gLtDjV+726Aw291bAsBoFhbgdWp+fF+szlRNt?=
 =?us-ascii?Q?7ePaJzyUdhAne4RLD00cM0q3OLpvccVc+qCCTPht96xeqowSW0qJCVUv26iu?=
 =?us-ascii?Q?4Qz35wogXktR2MMUXHkZUjImqsyhyZSY13D7+mhVctEJy3L7YfGkhSlqpbSC?=
 =?us-ascii?Q?O8QrG8yN5CG/TjVEygmxfESPbXRdp14Spn1Ay2KbGIao5ccabiWyTbiNpsRT?=
 =?us-ascii?Q?AGUo/sSoyNwV7SeHlEhqKFow2HUdOrsn5Vl5uqqraft3H0izNjxue5terq3L?=
 =?us-ascii?Q?t1BLjcGAu/CkyxMKg7W0SQYzJQND0kaTzu5KyR5XVY2DBr/jBJTgwZUISDPY?=
 =?us-ascii?Q?wN8ekdtEPH5S6qYo08AUpMP8a40v+/eKebF5/c2Gsy9cP7YqasSAod95hn/e?=
 =?us-ascii?Q?H6KQp4FvBhUaeF01V7r/DFFzWz6u4UjQ8/Jd/QHhC8bz0yRU6DGNDpaKV62L?=
 =?us-ascii?Q?XPOV0JOFs7HQvo6IWs+yT5JLY8hKm6lHJV1tNSPINkQw+7Ivu3BXA9Egczh6?=
 =?us-ascii?Q?SD9rQXst8YAAuQT4E18J9783edsP1IzibhXGD6J9qQWfJVd2tDSA8023pZBJ?=
 =?us-ascii?Q?wvCQQ7RPXUQmoadenSuzHLqeHVYQRxFhN5xI4fKxccP5E21Nq0YBimvSVGEk?=
 =?us-ascii?Q?24Z8TFxsqFUl8pZ3kwIFCAcRd0bwRmTdjUrASkCU+GNK4WmAXN74Fo8hv11v?=
 =?us-ascii?Q?YmOPxBhm52wqT+U+AxhRZCPNIIIMWxpqYH2JclmkVQMOBmaHUtB//gKtFby3?=
 =?us-ascii?Q?qoEH+6Rn/g/iWy+6xxJe5ajvjsAwsg4VCfqpNEswvxOo8WRLtasag1vVj+ZI?=
 =?us-ascii?Q?8+ISfIkbZnz56W1V1cWux4c31Dq8+I3+vdSPIyn/LfOuFahRBvBeYEAItshH?=
 =?us-ascii?Q?KvGlpTtAIs/ZksPMIXEKSgSSXEQWqx5PePyJwDyc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3915b8bd-e923-4640-58b6-08de3e05a45f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:18:28.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt6jJxOGrCOxdYKA6aoJmTlLqds78p5mlXLtQirQMR07fjS+OWDe5EhDbD6ziqNUWhBpnAp5z8iit8W/MvgPVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231

Do not reset memory at suspend and resume stage, because some
memory is used to save the software state for resume, if it is cleared,
the resume operation can fail.

Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
changes in v2:
- refine commit message.

 drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index d03017d6b214..ac8aa71aa56c 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	 * Clear buffers after pm rumtime for internal ocram is not
 	 * accessible if power and clock are not enabled.
 	 */
-	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		if (carveout->va)
-			memset(carveout->va, 0, carveout->len);
+	if (rproc->state == RPROC_OFFLINE) {
+		list_for_each_entry(carveout, &rproc->carveouts, node) {
+			if (carveout->va)
+				memset(carveout->va, 0, carveout->len);
+		}
 	}
 
 	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-- 
2.34.1

