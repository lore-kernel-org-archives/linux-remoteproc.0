Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011018.outbound.protection.outlook.com [40.107.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2021DF267;
	Tue, 22 Jul 2025 07:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170821; cv=fail; b=ksF9elToF5AiikkVCFX4PZGP8ROA4NlJSxF2FYDghB0MHV/CoigysqgBI3Y+Zu+uRDLoV4JmGTjfuDsqoQJBd/dyc+3o+Or0hKZJdh/Jg7sViw/UP09a5/aH8MOGJ8NHm+pxwkf6dWF8EM2UYy1184b6F8Zsj8B4F109K+dn7S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170821; c=relaxed/simple;
	bh=avcGZuhEjMrCsqPXl5GMXkpPYoS+NnsAbEuGWVr62z0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bFcJBToUm7hAUFcW+i2izn19bEMhNOwJxJd/vKOx81Zl6bS6Tl5uGG5JlOJ0owJMq2EQvSN7+1mgpyQcIaGKF9LolEKnVQGX3m31CNHACYeJbhbsSpAnnx48RST3DQtl9yvetGjKh8LU4xARZEQ44hqiSlZabi7DWxu5oLaweBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J6ijHhF2; arc=fail smtp.client-ip=40.107.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J6ijHhF2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWvGc06wqozdbx8jrWPYYG+3fulufYhb98Q49e3OmNCmjZjdb2UZNl49YZ4qRNXgcGuHqIxy24tZbNqDhKBPXUXElr517srFpZ+imuHA9OfNyHstF2UbiwyJnpqYTqQUTol48Vj+nn+iHBsV64pW+Se0SEcyMfKh+mMwuifKKYpi1uXO9quvxm87U4V/AHYBtrQ9sUOq06VU3SnFc6Dgj4w7W0qKhpEtFjStyVhH51SP3HpFZIwbFRp9b3rC1j2cWQTcJx/KUWA/0l2Haw77dm5bUzSzgAt8/SDsPy76/lkdK+/6vhdF7nlcWyk2LohO5XBBkUHSDQEhF3MgmHZ93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnNX7IVztLzXlQpL19E0Q0KTYjOYC7zs+HpaSZi/wBQ=;
 b=vL8UXNpMKqczCiEKiwBP+gvsJdoEhWZI9MwGuiyi4a7czefKN/fwqgAgHUJLzmMUUjtB25/oGyEWQ8miL23L64C0ofFjBvHKer6dewzqkT73mlmoo5kZID9fd4Tblsyfzpqjx1Dq4Izy0Z8midPdTVnou2AMcWzSijquzgxAVR1RlR8G/eSzYXfnrFawODd+mdxLjgLx/3A+OxSmKgAD3k0yO+hxufC4CN1BF0ye3NYz3w9OdOYPLZGOCPn2Rp7VEcJLfhMEDsi1PI2EIgk9JTKKLriK2rLYQ3qx8VQtG6BnCa4QnYc2Ko2SSVTY2q1/7QbZI2CaWb1OqHSscacjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnNX7IVztLzXlQpL19E0Q0KTYjOYC7zs+HpaSZi/wBQ=;
 b=J6ijHhF2B8ElRjNSdWmPA1sQ6XZ2J+XXMgND9gnikVip/dEH/dvy14ju7FRZBtaWA+Dso7jch5T8+NheSRBajBlATa1V99OoPHlqhHhEiqD6UvK6P+6yeabtJjDEDW3BKNVpzu7hMiVfxdepKDvOCg/XMUt8cL6+V64bYzkvvxtbXfCRIwZN/eLI4xYw/tlDaxPtAg/bzYaz8u4jGYJRj4JagKalVglJslFGdgKMlRTHQr8q73Erx+iODfXt73EIrlppIzBSdNOnr3dLmdIpzQVoZroyXDqEFKZ9XsI6HzoM81t2ObblZcTHUWXr2HV/ik8vXrDvnOvt/b4LDFq4UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 07:53:36 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Tue, 22 Jul 2025
 07:53:35 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and coredump process
Date: Tue, 22 Jul 2025 15:52:25 +0800
Message-Id: <20250722075225.544319-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2febbf-e181-4f6f-c6ce-08ddc8f4dc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z5ucMoyAHtn/UAYMND3Q3oQfVnHhv2ox92cNIb+5RpxcRmI+k7OK+9vsgisQ?=
 =?us-ascii?Q?bISozVqygIrbqz3iVi76tEha3pjL9WQpwLP2e8C5WqUID7GForr62gRKq1LQ?=
 =?us-ascii?Q?RSHFuw+aQzVrLi15zr7v0T9WFVEgBiJALuLcQXobSB3aLFGyphrtfOxYbzn/?=
 =?us-ascii?Q?jGnAEWzm96tnf17WIKqkTjZPgyEwmw1GWliw/pTARR9K9x0TgkzxPiamevY9?=
 =?us-ascii?Q?jISbqhdF5hvlQ4V12UjRGHZRid7aipOIQ5x3kgZO6ehhY0C3C0BhSH8Gnv6S?=
 =?us-ascii?Q?Y8VFp+enktbX6bO8nDPIiiYuAkYAsRjowhoBpGw9RX9B9SKIDKBqKm5nYvu8?=
 =?us-ascii?Q?8epbdNTQ9sGs6CzrdoQu5JlFxFvyy6hXb/oT66PQ7gAj8dnOh/5C0hFoc27l?=
 =?us-ascii?Q?tQvTGkmjiz+QOG9XlWaqu4xKMkeiZj2GgK5p8maeJ580ydJOjwNybYYlwet5?=
 =?us-ascii?Q?MIW/Jhf+IWT8wfFzB56IQBVYYdwQ2fdDNP7BrmnUfbt7fqWNC0L/VD4TQkl6?=
 =?us-ascii?Q?eGlFrsSSF4JUAL58EtRgVxvDtVIYI2OZ38FL4NOkdqxpA8k9HH+7vZctwUVt?=
 =?us-ascii?Q?hLMIbYX506DBu3PfI42Dtkat9t1vbqCu+nfUVYvdlw1mGaTeqzbTm7VxqJrB?=
 =?us-ascii?Q?0/cp0dHsvqrxBULmWcHHYu6Eu9OWKcF8hk0GOfZ3+05ABxymS2bMDGfy1aH0?=
 =?us-ascii?Q?0lMFPpXKJpwk6hAA4NYwE5TJcKQ15EJO5I2UYj7a6ZzlZbGN3f9cnzFu9/nr?=
 =?us-ascii?Q?YEilBYTqU9I7vNZP6f6N3KEpn5lG6qvKp0EdmwUdbhMUYnITqkOrEeCRWmwW?=
 =?us-ascii?Q?TFJh7ZhhZMwzjQOsUTjd5Zr1fgmRrtMQR4p+7+KGZG8t+l9MEL8DN4ziBdVF?=
 =?us-ascii?Q?73pMbwEMHsSlvmm/huRbLmZd26JDrbMwGsJuqdcUeRECy4KTmvCchkQF33i5?=
 =?us-ascii?Q?TGf+y33siWF52TQTEhMO3BS8zKdQeDevD8TiHwX4X2wcKSzUOg84pJLOdl2o?=
 =?us-ascii?Q?Q+yPilB3JKStxEFrht01Fyy2lNG43iKcBnweajUWMk6doZUO6nlGo4jLvq/W?=
 =?us-ascii?Q?RmrB+8rpyFPiqGcAAWwWn8pATCn5p+wMN1y1VhTQsC+vpEUnlI6c1zqm1G/v?=
 =?us-ascii?Q?bqCduAA2WDSVqpOGBytUlg85orxN2DygyTyb6wamPFQJmZ0k0LET0G65lHR2?=
 =?us-ascii?Q?YRAhjhBm89OQJr/Td6aVaj4PPMifzQo/NOZ3t49VevxIzbd76CsTuRe/hTnh?=
 =?us-ascii?Q?aSbk2KUF44zw3GcG+rOQA+Potu/b6SCZ+NdesbENH65xVombAVVdHEMMqPC3?=
 =?us-ascii?Q?3bXrbhSAynYa8ODWmNBCZ0rCHDbKjXf5gvvGms2PsInRVqMauqhNWQ2/BtJC?=
 =?us-ascii?Q?4DKDBqd0Sr1ITMOieRI1dJ1KvO5RSgJXvDb3qJKI6RuNFAYAQZK9DRcA0c4Q?=
 =?us-ascii?Q?91P0qu8nbZyNHMFEmpgnI0JRIcs4QP0tBD2QaBtYSwzuAKgJBAGUAHSx+tpA?=
 =?us-ascii?Q?XJ3jtyyepaCYK6k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eqS/0NJPWIOvuqXRgn1WPsQNGr10jVIUQ31A4YWlVgHaV3tVaTKuFhkjUByd?=
 =?us-ascii?Q?BqFMiC0pQVX9RvIL/3yHDrFJezq2z3zHgGqWzPcgVSkOm9vn/eaKmU/85+c5?=
 =?us-ascii?Q?79FOMTra6G2QJ2Gyi8AXCWrC0rNWXuC4OQBg7dpV2WvsF2mYvw/s3zY5y8ar?=
 =?us-ascii?Q?a8O4oBa+AvHkMYKji5Sh6cUQ0LXCO8ffCtOiTjpQD82EH0/Bt89SAow4BEVd?=
 =?us-ascii?Q?p/rznn8ry/LD5ssO0HO16L+LrL0YGvs3w45/oR266kMmaYpFmyjINRxfUpat?=
 =?us-ascii?Q?13eaCjkLuuHjHq6se13rEu4iA0KYm7XmR6NcZHLZcyWpUyN0YcO9ZChvsxJT?=
 =?us-ascii?Q?gTiDaiCBQDeWYPz0bHd/QENY4qMS/M87XIdciP+7RYhydJpfuC6omkAX3fhJ?=
 =?us-ascii?Q?fJKC/mQDjU8VVZUcjvFQpbmXMXnOEweoFUmoMVnNMvCLBC9Y9Nu04IAIS+ec?=
 =?us-ascii?Q?+6V4+P0cp626yfwRAJIBy4HW0EPm6DmKwxqVXpu9/8V3DtPmlDeL/rMXYc1i?=
 =?us-ascii?Q?q1xp3feHFvUHtrFxNtLMINjRSWKLu04cAyoRwERjLHFN/1eIexNfNr1JHMfb?=
 =?us-ascii?Q?K6YMQP0MOKQ/qTtvud50GA3YyHCoyDbZhDF660DgZrMA+zymMxyGMHZFjSqh?=
 =?us-ascii?Q?WJqYQ1YD0qKcLYVAA0xTclqOGmTB0x5Sny2npPqjhDMSlwkmSNhzMYbOqB3t?=
 =?us-ascii?Q?Rlud4+Pod38Odcek7LdffF9Cyxl46gXuAjOdCMnqBV5MeypovYKH0QghN5nQ?=
 =?us-ascii?Q?+0wooiXFttCB4Bt21IYey/Y65f0hkpJ7jod3q1vfZBveIzg03zfKCKoMX3L3?=
 =?us-ascii?Q?fu7ZqZ2OW8TCAsZ0/mwtNRcKoY3RXyqnB/duURrs67tiEcZ46pQdZ3cJ8cZK?=
 =?us-ascii?Q?ku2zWa09m2goA+98aHFvGrI3uW0puAelVT8o3xJuBerktQA+ixkH96Txmq8A?=
 =?us-ascii?Q?BxyQD0cTT4ADptLMpvuSAjLVFSIS0WLllrSiFrv7xTmwmcI9RBiH7SBEXvHy?=
 =?us-ascii?Q?5n3ZplwgxVC19CLoTf+zdHRd43aivGnC2YX2uchMdu4rR7oc+9phCzik5MS7?=
 =?us-ascii?Q?ovvMVtVcvnXVif0GlJHYAGoWJ2dNHAkUWUYyojXs/QIxsn9LVuxMYt0GiKN7?=
 =?us-ascii?Q?PCy5ophTe5NUOfTsCcoQlKjDtEMZlJcjo0gsDBlE5OBCFpbxZU8wtj0a/91e?=
 =?us-ascii?Q?hqlbm91IqrSn1mtEqnTAswPJ+OufjO0vy+Flw0qOqwU9mYpZZnafnP0HFhA/?=
 =?us-ascii?Q?hMI7k/kGrhUHxnEAnfPejTdbhTiZsN/Rqtrm1U4dFr91DxC9goIsD0ORQJvK?=
 =?us-ascii?Q?Je0F/OwUbKexgBlQotFdeZVUD4YMbj8hawwo2k6nT4+GHaH2RUkdCFxC53Ku?=
 =?us-ascii?Q?YNC9glQXSaMiF+H9iVUhZVzF8VpTjnZwBIIPO9mUOUv5qP4RWwucbabSL4Df?=
 =?us-ascii?Q?EYvgcSHU59h8RcE2fLBB5L+/hA7xvXvKGxWHoFp5BndZWdb27cr6irvinVoX?=
 =?us-ascii?Q?jnEHCJpCTgB4rGhiMYEYkG2q1f0pRHkrEGs8RqdnlW6X3s8YGflhspqILlx7?=
 =?us-ascii?Q?HElFtSY+qmKegd73hnJfcLv6Vtwnl8UhCp1t9H1T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2febbf-e181-4f6f-c6ce-08ddc8f4dc6f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:53:35.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGn0r0fge4NjleMe1YLIore3mCTCtQfhZ0wZ6/6oXfR2I+2YOAZLjcK6huAT8uejyF7kDe7S+11QhL3RTjmbzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

When enabled FW recovery, but is broken because software reset is missed
in this recovery flow. So move software reset from
imx_dsp_runtime_resume() to .load() and clear memory before loading
firmware to make recovery work.

Add call rproc_coredump_set_elf_info() to initialize the elf info for
coredump, otherwise coredump will report error "ELF class is not set".

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v3
- merge two commit together
- add fixes tag and update commit message.

changes in v2:
- move .reset() from runtime resume to .load()
- IRAM and DRAM still in the coredump scope.

 drivers/remoteproc/imx_dsp_rproc.c | 45 +++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5ee622bf5352..6e78a01755c7 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
 	struct device *dev = rproc->dev.parent;
-	struct rproc_mem_entry *carveout;
 	int ret;
 
 	ret = imx_dsp_rproc_add_carveout(priv);
@@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 
 	pm_runtime_get_sync(dev);
 
-	/*
-	 * Clear buffers after pm rumtime for internal ocram is not
-	 * accessible if power and clock are not enabled.
-	 */
-	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		if (carveout->va)
-			memset(carveout->va, 0, carveout->len);
-	}
-
 	return  0;
 }
 
@@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
 	return 0;
 }
 
+static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	struct rproc_mem_entry *carveout;
+	int ret;
+
+	/* Reset DSP if needed */
+	if (dsp_dcfg->reset)
+		dsp_dcfg->reset(priv);
+	/*
+	 * Clear buffers after pm rumtime for internal ocram is not
+	 * accessible if power and clock are not enabled.
+	 */
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		if (carveout->va)
+			memset(carveout->va, 0, carveout->len);
+	}
+
+	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct rproc_ops imx_dsp_rproc_ops = {
 	.prepare	= imx_dsp_rproc_prepare,
 	.unprepare	= imx_dsp_rproc_unprepare,
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
-	.load		= imx_dsp_rproc_elf_load_segments,
+	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
@@ -1189,6 +1205,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		goto err_detach_domains;
 	}
 
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
+
 	pm_runtime_enable(dev);
 
 	return 0;
@@ -1214,7 +1232,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	int ret;
 
 	/*
@@ -1235,10 +1252,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	/* Reset DSP if needed */
-	if (dsp_dcfg->reset)
-		dsp_dcfg->reset(priv);
-
 	return 0;
 }
 
-- 
2.34.1

