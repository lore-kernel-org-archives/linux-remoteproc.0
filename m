Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA707202963;
	Fri,  4 Jul 2025 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606878; cv=fail; b=SkCRZ121Ji7q9g5bS5FJwOgJoZD1aAsVfcYjrNzBzfQFNkBzQuJVgO5QDbIc1eUdc5U81tWebLztnFCuRdotmgAxTJKhOT9T2Hrhxs/IbcDe8sEO2Zq7OMnxwP/V1KfGQfzn/2H1CSVgztXFWLqhXGyNKjZELOaLWQ7E1rNmWpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606878; c=relaxed/simple;
	bh=fXiXVsnvq/CU70B1wAZ5kdT7XWnKRI9LjrxrLKxPeuk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GiKwYxtbiO2uurp5S4DivHUKh3w/sUnMK/k63G1VfQurUhlPjFBdhOSb+JoMhHvlcpw0PstVzMnn6eageOWVWZ5DqhL5kqojfLAfbXlVg3Z4t4t5Gxls+AdCeWwc1GZSOz08QsT4P7Mt5K/s3HuJBf1a5WYEQpiVRb3PT1dnpHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xcjo5tln; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xcjo5tln"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOZshyAv3q4SqojQer97ZBH0jPvJUaNUG9ckzgXgXEHhzSiswlJI0xvavgWYiR/0MnDlogG7hqxGTfw+lD2mRN1iqirmH+doaIy2AZNMnIKT3ArI+NRryBT7WAvIlrlMKpIYVgFriBuMKM3ipHPXL4jlf69GdQ+ClAbFp/lY24SwXnPjptuifWZxRbFP42s9QpVzDku+qcGHxJ4y7rW/czWr/eQqH57JVeiLEEngj/oDiPID7hde5DBAIIRO472X5ZDVCga3hJz6pLeuzJ6FRWAKqSLC96jOwEAZ86XBuFDy1eJa2jwks3KWgdteSe2HEhjWYdGnYrvOmzSDWApJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ptf8nBobc68PqQ8Inod7r4sdx7jVFCUMci4k4ILV1vo=;
 b=yMhEGgX0s+6+6gloApfnXwSBZjEY5jtalb8H5ZIqLNzTjI7z50kmUIpqH29JHLHhQzuXzl8JDXI1rI1ARDucq+BywKP6AItRYpR6D7e0PuKGYyMeQFGcvm4TAiPG3Fr3pAbmhi2Z+W0UE5R73YmgnlQIaHNPObevsgiuPkH3W9U2X/YIj2M4SG9u1oFOeotV2Mlbu7LUkKV1rP8dAv3JLDlPIOd1/8cJGeSv6wg3OmvGyOINmBBUh/4zZg6iphXs2WPKEmVHW21lmlLQ2p0yal8dYJ3z6CUbXSmQZIp4ZBYwUQa7r5ZrrR2fj/bnqH10Jnf3Q1hGALyIpWGGfF3C3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptf8nBobc68PqQ8Inod7r4sdx7jVFCUMci4k4ILV1vo=;
 b=Xcjo5tlnGzNOx2XhDTo3aOPfozvWw+GGPpgVDSVHL8+VFVYEPHK4ZyujVLkuJEmHDSKSQE2GLitYXtPC8hHYquSYnWt1KaSUPgE9Klw9lB4ZKzf6lNYctARazdCXwNAOMTsG9l4pKxiwZepjs+KREpCvuV+kdusG/OozpTye4AAV38rjuE+GJKb2Xs/u0ljxjT2byX/s7D5+9ocuta4RHyqJ3Ufx4nyA3G9wvaiMSJFLcOlGISlFOy5IED5ha/uhRd57U/VPgdCapg1typ82qve7cfonNP1ramXcGJeywBO7vIkXqB7+guVytw3ngqrLClRMKfE1njT4mtBsA4Bohg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11197.eurprd04.prod.outlook.com (2603:10a6:d10:170::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 05:27:54 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:27:54 +0000
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
Subject: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Date: Fri,  4 Jul 2025 13:25:29 +0800
Message-Id: <20250704052529.1040602-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b62f7d-bd37-4786-9bac-08ddbabb8727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Dc0WIRwUZvv1+J1cvmD0L4Hns8plyegJ39YPSI9ybAAEgr6Bha17DncYvP1?=
 =?us-ascii?Q?aVpb8LGs3Hvyo5+dhh7VSdutPPZr4D4bFOC7ECmdAXqMzLF9SNOlPK2211vp?=
 =?us-ascii?Q?7UCBxNDJ/6GoiKAsRJDhDQzPn5UWOanIBmyBbCI7BHIEu/Hlv4UGBmEXB5uY?=
 =?us-ascii?Q?UU4+dy+PFlFdrZTrQmHk3SGO+yW3cMjd6o/vpTCnUIWGVd7lduvk4EhEzjsy?=
 =?us-ascii?Q?s+In8dlD0FIK581YLKc7DKdSCk8yjhOMwGXarm3A3subObvp83MT7SY3Bt9g?=
 =?us-ascii?Q?+gt22BfuIGphAR5ukCASbtGVlUwG4BuEnvgarfONVGhwX/lSmXSwK0/tNP/F?=
 =?us-ascii?Q?LibK509EdShAM5hNoM6Y77c8RXxhPBKymJyDBUQsk/jjWQ3C852oAWvpxMp3?=
 =?us-ascii?Q?osoIcUJLAnh3QRf2MjEdbmYhkkBi07kJ+Ou7vuniZ6taCbCTy1PHT7weOILb?=
 =?us-ascii?Q?oFKlBfR/TakJBINrIta/ouY3fXMkXDwkA3ksItV9JvRSE1LtioNaWfXGqEmK?=
 =?us-ascii?Q?12bbn2rlA8XMx/NE7qy+3aOHOqVbm6i6Lo4zieduHLoxr26MNihLdL/TMiUV?=
 =?us-ascii?Q?jUwyPuRj80k4ufClUIFDhBcqR8cFL/nsI+rUMgOffzODGNGz9EEHWhGz1/lZ?=
 =?us-ascii?Q?4FlTczfmc2YAKrbQ4Z67aZUh6h4d/q+G7vkdVUXgEh5kYoeIAWTl7Y+7M20z?=
 =?us-ascii?Q?acIp15Y9wruYNFqPeeAqxwNKsisWsTUSMuv+GSK7XZouawRCzCxEEzu0Be2d?=
 =?us-ascii?Q?LEt8PmVbSdTAZEgEbUVZ/VMIlD0fHMn1rWc8PCDsz8Nymkgq3fcZNeI97yZB?=
 =?us-ascii?Q?1vUDaC/qjOne9eOzzK3vJu9T13KTBEZ6uCM+T+nY88jijL8ymFtStA71qr76?=
 =?us-ascii?Q?KNaTXsndkReJXtE+4QaYwOHXzvRLCuFgEuSM79mk57Igb1o63JNt4+NGWc7t?=
 =?us-ascii?Q?8Aq4twV+Veh+HvJ2yt1TzDBHl928dCncR9N/6ISrvk3+HrHZdRjC4Xrt9OnQ?=
 =?us-ascii?Q?omlaQbRGaZLdlwynOcdV3YPkfC1hHAkQXkMXJJ5c5ac5hdwSGvRJykuMA3Fe?=
 =?us-ascii?Q?Oqg5/vwUO3WzjeFY8X+dPSNZnbpe0MSFl0/aVxBjnR2PGtx3+HVYs+rSf5xO?=
 =?us-ascii?Q?IvzmEaVizyVheUg8o4IcTkYpy7S4Qll0h/nET7unaNfpNALMPQt/LzaDReaW?=
 =?us-ascii?Q?0OtgDeo4SMh/u1DZR2QvTpHsPQ0s5N58Y7c45k5lHm23Z+iZ/6Isn4nGUP7U?=
 =?us-ascii?Q?WPW1P9B3Zk31dPHOanhYRNld2ftR5dvTurxtgxOy7PaeesMZd1X6pChYGSXr?=
 =?us-ascii?Q?tc1LioNclsoGqV3dT0SlEasilUuOzwku7LIbOCehgsrjrgvnc+ooKjLWXGKc?=
 =?us-ascii?Q?9tudyj/AQ78Uf68BGZ6RdzDFoExbeMqu+yLyvTvLT1fkP+IAreAQy5OX3xjQ?=
 =?us-ascii?Q?htKQKwEhK+gT1G8aldrxmawcdCnzF4KDgAW8kOR5KC/6I4yug1OTMDBZXAd+?=
 =?us-ascii?Q?j4atKVy7CPXY3M8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t/OQQO92OmMI/T3i5yMQsN8KyzthEkqPNacZmndRIeioPJIImvZzhYe5HroS?=
 =?us-ascii?Q?bd9oCqWnBdQSHiQI9mjxSSGjrtUcwckVJgeuJKmwbvKOobQEv4LALJG6qhB3?=
 =?us-ascii?Q?kh5H45AnN7Sfd3I/eHNmz0glWSov48LlMk/ZOgjTmQle8spgMiuYp6Tv4DC5?=
 =?us-ascii?Q?h+aryiV4iPxhCuIYj7nYeOX7TpsfIBPn6wuOdMNtx6AFeRP69bxZHYfvc6fD?=
 =?us-ascii?Q?NpTm8GPuIfFj9Hv4VvPWTVAQUbUV8GWsRYOFYQBbvNBoWKKlF7uGoZnJBWT2?=
 =?us-ascii?Q?4UDy7gGM35fLRF4waq9fotfKlp+sPyGBkOKj90rBZ1pwD6zpCFID5yGIj46Y?=
 =?us-ascii?Q?ezFeZBYYPNpooNfw69hmItnjG+RCUMqmY5okbPg06tjdtWyy4nE/fXc4DXKp?=
 =?us-ascii?Q?++5wh0lJapnGdTZKGLDL/qxLbn4cJBTTcl0Ptwbn+4qj+55w7GH4IJ8GhdRT?=
 =?us-ascii?Q?jG9s1YF5Npjlm1zhgfUFsB6nalegigkVNqHvdACpjFQIQFnpwKy1Xt7Cyo7P?=
 =?us-ascii?Q?g7OBVTYWGAVwZoIjBc2obT7N8gz1O/dDZe+WXzBB6LTzEBCkCE2DY8rhgH8F?=
 =?us-ascii?Q?ubQ0YNro8I1HqMawc7u7s3UtrxIJkNn6eksNFn8B0R+EgiltOu3Ip4oyF41S?=
 =?us-ascii?Q?+oaMIB4GaqtbCTnB3cI3VjfI1Ff9fInnEjvabTdUiejjPr7LHWAW+sqGDE1H?=
 =?us-ascii?Q?fw/h0GNglbl96wVpvtvR7Zeq+iaQcA4ew/ClF32mP7YhjDkgl+z7owr6Yu5c?=
 =?us-ascii?Q?829QKcjNnw9FuDgE6xK9p37HrmWHJ3fk8qGG6VSsWzlHNv5qS10vQD1WcdvF?=
 =?us-ascii?Q?nMSll6dd8VM5S9Izx3X5VwGs7V0Sms2h/WIt3HjU1CEHKZpRPNW69cfm1qjP?=
 =?us-ascii?Q?0SN76stUeaFqNK1rQNlrrBUiw++BJia7kD0dFVAatW4T/RT6ZmtMti5SAH2r?=
 =?us-ascii?Q?wM6zPttfm8VfRttwO1aZ7q7iDFX5pBxOGSDzP2BA+RHC1j61WlkpeXS80ENh?=
 =?us-ascii?Q?gwgODevIY6gJx1AWqUAj87xBQO/tUEp2UTMQeXp5i10zmwG0oKJATizYMw4v?=
 =?us-ascii?Q?xKBichaL38JyVbMDGUR47oJn75b4VrwXiWKThGf2v5w8sWqzHamz4LSnHW8b?=
 =?us-ascii?Q?AZE8mx46gcLtXNnlh8oumBttCVQ8/761H+lGi+ItIuoI4Q0/bXRR9w95apE6?=
 =?us-ascii?Q?WeuTfnQlukW8akjGkaZyCKmlLz3Ea2V8EySL5xoNS8IZ8O3xmWI8xtHEkEXl?=
 =?us-ascii?Q?qJuFgqjyQD2q2itK+ojVbQcPET//LwcM0xUS4ZzYs2s8d34QpaybBTaYAYGc?=
 =?us-ascii?Q?G/r3ccz3prLzcJir6ni7qxxPosIwxj2fOg+AwznTCNKrwDmhZkh4KGD+maT4?=
 =?us-ascii?Q?XNdB+cBQhpPs2H69vXbXx7zWJ8SI2V7Xu0MehdEEtLFFsFEyUrWnoU0n2xD9?=
 =?us-ascii?Q?ght1vv6h0SOCmazKgKbtymh8QoHXAxrj79tG6LrSLeArZ3eOBIXu+h8HYgzH?=
 =?us-ascii?Q?eGzf/5fuwXIm+rylHLBSVoZ7UPpxSOd4eVSETe0OXxHDeQLKeC+NSzihdLK3?=
 =?us-ascii?Q?jjL3QgQw0rpNH8irx/S80UGlMvkr0W07eKDHZZU0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b62f7d-bd37-4786-9bac-08ddbabb8727
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:27:54.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYCmKNyMwj6tjoELwwEACKWPuMeZLFrjP71MPxyyZgSWU8aM5EXkxpTiNxGGVn4KHrU0L0yUiCXJ452mNd8pNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11197

Add call rproc_coredump_set_elf_info() to initialize the elf info for
coredump, otherwise coredump will report error "ELF class is not set".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index ba764fc55686..6e78a01755c7 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1205,6 +1205,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		goto err_detach_domains;
 	}
 
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
+
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.34.1

