Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A42EB5D4;
	Thu, 18 Dec 2025 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766036054; cv=fail; b=rwTHcspe61dbkSeOi1rLXWZgmD7+lnKZO6WiOXqVJFKrJAe9imhx0pUMYrDlZDUc2njjhFwyKR6M+V6QjuGrdY9i8mK1HEXm1+MCThydnqNEFgKThq5wHzLW90deITOph1MZNE3Yiv4kGu1VHifkSmn67vq36IgfDCfIxHSLT4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766036054; c=relaxed/simple;
	bh=5Xmz4BfV2iHqlUcnemifyq33UTzl6rpl9o4QRc9thQw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=H0TAVIwbK4afC4nyVhT3tTPCJuJeu8gSwqLVg6wk/00mPB5svzsegym7EXhwonSET+Yw9oX6McQwesQkzP4R2aaWwDVZQSNbRy7YUH0K+2iBSgfQiF4d1O+X4jhkc6E5n9oTCezTHR/wu4OHpDw6XIe2oPvebfsLyp/IrD1+wzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HoQ5ME0z; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HoQ5ME0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1ci8qDU8X+mMOaFnRyhDcLO8jynNmLtwxcw1UErAODUGzdoTTaR/RX/f7W7UZw3VU1POcnokhgOmylAooQLrbgT7Pp6xPJg8TMZ4uzRfNd5erJU4A5ec9F7VbmHHEfnPQcWrxGvFzwwb8LFk+gRQeiCUp/fGXxOx2+54UusOkyetmcEZAuN3OQpX24g64wFQ4IqaB/4Y7I5/fkKfyIul0cAPgv1nPtnHdoN0tlqEfDqx3JlyCksRBpvFbthWSii4YRiIP9ZhRkfRkRvKMy0f3o/2t4TbrjqXY1GXGtlIWVC6ztZH1zODgPY+U6GEUl8fEoHMYxn258H17yacGpvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVgG/njif9UYQSX8P+qQujNQHYINu3vdqOG7TmfSMEM=;
 b=mAWA/nZv1KjFJtLU97oMr8OZXK+TGLdAzDb76Mv/W4bbzMqdC3zFVMK6aqJwXaudPVSpxpm4LhiFkASCaloUz3eRvHVoiY4fkIWRWUVxSEPzgp12S80G6Yln6SyzPXOIohfBQA2fcZeNVKodx3PT4Tk7ALbhzgsAfGgn3Rhy0VsXz2Odk4BU3GEigu2GxnxjeAYYPQ4NAGIQUO21ovsrBcUyQzIPSkLdW3K/xjU8SPl4ssGyKHFUr0vP0pApruatUScAU2Si8aBqyKP8qmJQ+xRPxWGQfJLA3wOsBc5U/Ku2J79oY6gREENvz7uRZdciTiErWuKPyYnHjt06r2Q0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVgG/njif9UYQSX8P+qQujNQHYINu3vdqOG7TmfSMEM=;
 b=HoQ5ME0zWPe8bxNZKkGE/KXjDRnQqx1gEHwtObzLO2J6zo0exWyn+GJarF4cAG/EyoiDsvyqMfwRGq6GQnOWuVGXrldmyC71kl6JaBJAl9Wg0HRMwGXq+FYzQSCNuARKopSw8Dak3st02Pcri/EsmlwPh65heF/ANyWFFDhG99BSgFPHrw1tJeOjT3rtyqGMGHMtrnmiyKeVYgcJPKxTJ0JQbGSPW2nmt3HUlDOo9K++nhD/q5HZ4DysESh+ihOIpY69Ij8PmQvch2PgCv75xozJkMcW7gXaX3y3BEC4gYn47IGPmUL9VGaIioLCWF6KTXpZNAk79cTMv1M7FDewHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:30 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Dec 2025 13:17:39 +0800
Subject: [PATCH v5 5/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-5-b56a27d4158f@nxp.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e205f7-cbbe-47fa-2f6a-08de3df4e1a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXpnNWJTQWdQS2lhS2dZMmk0SEw3bUxycE5OcWJvRU13VWY3R0lYS3BYSmg1?=
 =?utf-8?B?NjJ5YkprM1pQbVI2ZDdJMlZ0Rk1temVOZUxLNldOUGdRMnpKcmZxdjczQm1F?=
 =?utf-8?B?MUd4Rld0dGdOL3I2N1BobEYzdDluMTRScDJmTnB2TytlSWhiUlBSblh5dmEx?=
 =?utf-8?B?ZmRUK2xmUEZPQmk2TS9odnlrK0tXZkRHL1BJVGpQb3RvK2lUSE8zVWRLN1p3?=
 =?utf-8?B?ZC9xN09lT0xkZU11RnVWdjkyWUI2aVJ5U0d1Y21USHBUejQyZDV0RlRLM25a?=
 =?utf-8?B?MUo4YXdtVXRJM24rR3ozY1A2WGNGbC95N1cwNHRDdlJOS1ZSNElKWFhTZ3M1?=
 =?utf-8?B?a1ZVT1hKakpiOHo3bDlNQ29xWWxyNXpnTEFLTzBFR05NRjJlaHJTb2g3QXgr?=
 =?utf-8?B?TjNBNXhGUFRMeFRHc0hZVCtrblYxaVBtOVlJOFFiZzJUQ2tpSkdyRVBYMWNN?=
 =?utf-8?B?ZDY3TWdNQmZianZzWXhqUVE3Z0pueG5oNU00V2pXRkxqMVNKMW1uRDFQd2lV?=
 =?utf-8?B?czlhUWEzQTN2QUdUVlBnRm4zNnNHZ1NvcU1uMjNmZVZrVjNrc3ZtYWdxb3VJ?=
 =?utf-8?B?c3BhY0ovSS8wYjhBZDBoUkNORmpLejdRUURDcFp2VnAyWEY2dFBxaHJIRHNI?=
 =?utf-8?B?Sms3U1dRajNtamxyUUgwN3pWQmxLV0hoQ1dLcVltaFpnM2tCRUdsUXhGRmVH?=
 =?utf-8?B?V0h2S2JMUmUwS1VJRE5FNFpKWjBOa0t3ajdnMnFOeFVNOXQzVmMrem1tUXN2?=
 =?utf-8?B?WmNxYzZETk4vRGlLbmVTVzdHSngvUlJJNEJhaThMdGd6ZnYxNzlxbXBRalRY?=
 =?utf-8?B?bFY2Z1ZVUmgydTI2aW53YllmV0VGWW1XcDA5QWI1ZnNnZ0wrQUlKanVBazZ6?=
 =?utf-8?B?eUpJdTE5Y0VmN1VZYlRUenlscDI2VFA4bFVTaDBiVThkZXFyOVh6ellxWjlq?=
 =?utf-8?B?ekE5em9Ea3VKNnJCVzREZW1MYkdybjhMamR0aUVlK093T09ZclhoQUZTWFNL?=
 =?utf-8?B?K2xkV3E0bDJCL2ptZ3cyOW94QmFHanhRQUJDR0UvbnF1V29MR0tjVU53MHF6?=
 =?utf-8?B?bXlUUnh4VjF6TmR6Zk93TFU0VmFEK0p6cElEWlFIRzlua3Vla1hZa1gzdS9C?=
 =?utf-8?B?bmdIMmlUeTUyTWw3YmlWOWVwemVQbGZWdkY3WmR5cEQzSW8xVUlBNFh5TmxK?=
 =?utf-8?B?YTdKS2xjL3VyQzR0OHlMeVgwbDBCNUtpOXVnekM0cFBpZUF6SGEyMTJnQnRT?=
 =?utf-8?B?YWFZdFZERWlybEN0VTFvc25iR3B0SExRa3FQREs3SVRjWnVPaWtUbkpHc0pi?=
 =?utf-8?B?eDVtM1hhWndSK1lLbHh1Ynlub2VDVVFvZ3BEQTdCdU1WTGtKRWF1YUFwMW5Z?=
 =?utf-8?B?VEpzU1N3LzB0SnlzekZqTHlVV2lZYnNqYW1CRzZXNktNb0tkZzFScGVEY0xp?=
 =?utf-8?B?RlRady9mejdNaXhDeWR6QjA3UFBEdk1odkIvdWpTSXNJYjRLTkVIdE43RnlX?=
 =?utf-8?B?SGRIQmJGMWtvNGs5R29vM3I3bVkydmdzNTZaR0l4eVN1aUVyT1NrbHlrdlVQ?=
 =?utf-8?B?dEJhb0NBRElBVXY3bXhvaFM2bXVwRndsZzhaZDY0UjBwUzdUYXlqVVhjYVIz?=
 =?utf-8?B?eEFJRWtCcExvSzlZdFREa2dPS2xYNUJwWUNVcjZ3dnVvS3p1ZmRoWGhleTZl?=
 =?utf-8?B?L0N1bjQ5VTdyWVJ1RkJKVEhraFk4bmd2Yjh2TVIxa1NDbkdrbGxEL0xQblZh?=
 =?utf-8?B?ajBqT25aV3MwaWN1TStCczNZK3IwWGhkOTd0enZlU1FzRldVVWRyNGNKZ0hs?=
 =?utf-8?B?VSsyYnd0UEdNT2ZyRjY5YXFlV2lCQkJXWTF5RUZXWnB5MXY1OGg5dE8wRDdT?=
 =?utf-8?B?c0hWdzhLUDF3Q3I5Z2dYM0ZWSTBBTnMyNGpKbnJpS3BCcDlhY0RzZzRacjY3?=
 =?utf-8?B?WHRqbzlzdG1rYVkxQ2JTUElRbDc0c3BDQjBzTVhmR0VwZGt2NzU1a0t4V1pK?=
 =?utf-8?B?RnljTHZ3SVp2RHpickIzc2pZYmR6T2U4K3cvS054RWZ1TDdyVmZnNkpTNElS?=
 =?utf-8?B?YU85eDI4RWcvZ2xWcUY2b1hTK0d0cnFaZFJnUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blh3SHdiQkRkNjVsSWhtTFRSVXQ2OFFiTytSNU1McDJLTWpXeTNYb2tzYytE?=
 =?utf-8?B?UFJSdlNvK0IvaURaaGZtZ2h4NXV4cTFTZTBxcGJhKzNvc2YyZ3ZQazRsWDdS?=
 =?utf-8?B?WWVBZFY1Uld1UTBEZ2Z2eXRoOExPb3l2VUhwSGxxNVhYUWdrZlFMZmR5b2Yy?=
 =?utf-8?B?czZzNmlJU25nVXlJemxEeW5Oci8wRkU5Y2dacHVveStzNERaV1JwWVloVEZT?=
 =?utf-8?B?b0ViWFBOVSszS3c5amRLZnBtbjhMM2UxSkFCenp6MmMzZVg1QXVjQVdkQTdu?=
 =?utf-8?B?d3lIZHVPZ1FidkZOU0ZyT1BWcDFsZ2VoSmsyWXdkOGpRS0NYaURMd1ZaV203?=
 =?utf-8?B?cXZIVlZ6K1ZlWm1JT0pHdHFuS2oxVC9YWi9INHN4bTRKMlNVeFNEYzZsVUp0?=
 =?utf-8?B?RHIwSlhVUnhwTWRPaCs0MmdCUS9OMkcxYnNweHp3SHNPdWcrTmV4QmhKRTd5?=
 =?utf-8?B?ZmdMVTdKQmp3RXhMQjVmNlU5aURvRk5yU3lHeEdZWHhEM1Z0RUdQYld1b3pE?=
 =?utf-8?B?UmJaenlIR1pUSWFJV2NPanhMRnVMZHVQRzg4WlVFL1F4eVRrZGNEeisrU1o1?=
 =?utf-8?B?NStlWXRxaStacDZUN3FycjlJeE9IaUtJOGVselRJTmJsOFYzMGltWENUdUd2?=
 =?utf-8?B?V250STN2SHIvVWkxa2tqRjQ3cDlPbGlvZU1xQVBVL0xlVStQajlMcTQrN1U1?=
 =?utf-8?B?Rm5PZkM1aExUcGlkWWJmMC95cjJNT0k4cEpaV1BGQTA5djBSalpkSHpBNFpK?=
 =?utf-8?B?N3ZuZVpVenRpVjg1cytyaGFFUityTjZ5VHZSK1J6bHFXQ0hDbmpCK0xrSzJD?=
 =?utf-8?B?Q25MQitGZzNTVjRPRjBSWDVqbi9QTm1EdjVFaEI0Sk9GTTk4QkZydVRHcVpB?=
 =?utf-8?B?Z2l1c1htaFBGZGRFZkdFaGNPV2xXRzRGWGhYc1JnVE9vY2xpT09aTERXWE1B?=
 =?utf-8?B?Tjd2NlYrWXBjanZoTE1MZGx6ZFd6NzZGN2ZPeFQzcGN6RGhoME1WMEVQREZo?=
 =?utf-8?B?cnozQXB1ZU1ud3VJZjcwL3FtbGgzcmdVT0cyak5VdE5nVmVmV01OWHRwR3cx?=
 =?utf-8?B?QXVFdXFWakVjckpERWVzcERkY1pRa3dFWjI5R3ZYekg1cWsrVVMyWE8zYTJJ?=
 =?utf-8?B?Qk9ZTE1wQUtCMWZrZWVmc1lMNXRoMFA0eFZpY3hlV25WbnpBM3hrTkQ2aEdX?=
 =?utf-8?B?YkJONDVGbEtCMjcxWXNFWkFOVDNkWWkvQ2VDbkV2U1Mrb0xNVnl5WjZzL2Vu?=
 =?utf-8?B?V3dTT0RWMmVCcno4bUpoMHRvUHh0M0t6MGZYL3VVZks4QWtBdWJhVTI1ZWpL?=
 =?utf-8?B?SzRYdFo2OEZlTjZzRm4zRkhIbjBOVGNNTWpFNmV5Qm5aR2ZKMkZmZG1MUjBs?=
 =?utf-8?B?NURnRUVYdW9KVEZKNFpCUm90c1RKTmlHdXErY2JOa3lnajN3UWJxZWN5Q0Mx?=
 =?utf-8?B?UXZ4RXVYZ1h3cmNqZ0JpZEZQRmpabTQrb2k4QTErb280Slo3L3MvazNTL3RF?=
 =?utf-8?B?Rk1wSGo3WVlsVHdzU3YrUHRSUzVVc0l2TThTN3hNc0VjQk1OVkx5UTY1REVW?=
 =?utf-8?B?a1NiSXN5U1U4dW5qZlpBNGNKSldlT3RNWmdkd0thSWtaeUZIcjUxbjhXYVhM?=
 =?utf-8?B?MDhvWFpWRU5SeWxydzArMTllS0tCd29wZXd3eEQxNW14SVk4OEY4K1Nnam5Q?=
 =?utf-8?B?UWRic1RyR0l2Nm91b3h6WWtMZmFSS0oyRGV1OFdzTmZackt2QmdtdzBkWUhY?=
 =?utf-8?B?c2FLSzNSYWdYa2Z5aGR4ZDR6MkxlOUplTjRHSEFOK1hXU0I4UyszbXVxTHQz?=
 =?utf-8?B?NWdxVWpjdDR4c2g0QVFjRlFrQWtNczA2NTg1Q2FaTCtTd3E2S0cvcEFoeW00?=
 =?utf-8?B?S1BFSzA5dkkyWWhQMnVsTCs1QXNyR3NzcmdaNFNraG96MzkwT2Fqa2tYdGMw?=
 =?utf-8?B?V1dDcm1YMkZRY2I4Ti91anFXVXpsMEh5dm8wb1dIMjJKSjBXM1hPTlR0WDR2?=
 =?utf-8?B?QzAxVG9pcFI3QkZEMG1jR09XRmpQcldTVTBHNlBpeEZiMHdnTE1xTnRjeDNB?=
 =?utf-8?B?dlBMNnFlcjJ2bFBDOFlNYklYSnFENS8yMEJDRC9yb1VMQTdpR0N1ZElFTVhy?=
 =?utf-8?Q?5dvbbKtLzhcF03G2q0n1NEQ3f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e205f7-cbbe-47fa-2f6a-08de3df4e1a5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:30.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpfTSpC9Ihd9hvCJ32iSqWcAily8nmFuYNJXHFOdg9rKcQ3QDxiVuuL9dpv9OzvNny8J11HvNWubHbZDzGPg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ae3183ad996462ad0815889a2291d320ce7a1e8f..61e3f1affee54181bf35110e4ad565edba4c7d06 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -133,6 +133,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1436,6 +1448,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	/* Must align with System Manager Firmware */
+	.cpuid		= 1, /* Use 1 as cpu id for M7 core */
+	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1450,6 +1471,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

