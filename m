Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFE204866;
	Wed, 18 Jun 2025 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228131; cv=fail; b=rIVnD6Ffll6w9Q2p/ljogT/k1pGgT3c+Uxo+OsMKuiwp72gbTeSrUT7NmSA7Ypg9CimYvuHE03jEq1nLU7gB7dbrOeiou0Yendlpb65OncDJtiyh0LfIFbp4OCxmaXijSVoHaJtlFEV+ovqiDhxbhddSYS9TlCoK/09f2oXUQ90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228131; c=relaxed/simple;
	bh=khdEc746mThEsXQk4qirLhin4kgtmOStNqyRXYk14gs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sMO7njoVS46h9PX1GhewsMM/ZahDDBlVRd8sUzR7w5n07ndoPdqhN+IQDZcueFx9hwU4UlqOKbXT/nd4hUKoiP5niqn55p9/Y34HbdhJFuFoLfllsUfmKO2tRJH1bjVT4/NpckHaG8vFsahqrNOs8wzv1gfWC6XbNW26qZpnqtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UUvG6S7g; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UUvG6S7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5NM2W3tKqlfjdQl816iAPYiEuKrMIK1StyrxHxSxnQVecDVqaqzGUeByzhiRwsunLzHY8/tQ4VGQQ9TfVcs+qN3q6eCTIktcddzYUHIEXUUM9GNj3Nt2Og49jmoJQobb0r09ieEuMYXJWZ190CCla9d8xDO8C4lDYbuAIXNiwDGabs/M0LUmqzPpNOzyMR/Ov7zR2LOi/3ekqHS6O3p+DczCAs+QnZwNns08GAG7YE1qUKyjjJ3SNCW/8zV2CtOzGXVRE+5+c7ABRB8GHopnPfzDi3g1qVC7+F01JUi7G49g6ovn9mrmEpw2v1eZu9W7F3J7oSS/Sr38ma4lgUBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opbfuq6/lVVqHC8qWI6RaLWJhjciHt6t+0u0M9rfx90=;
 b=DwPmPp+jgD7wkivm32mOK4UhfOUTxHYg4HlxQJOEPIJ8bIz5R0/5isyvsYC1mbr+qNQuMJjU0TG3+BgLMN91UhFIrL43blXzAq+pELsRMzafrA5kch13U/YwSOR8+JauUFzaVmMlMmaJLu1oNYPp5doQnJN8KUNZ4zYhTnqUyHTLV5awd644QzIQYObPz06Ym85PETpIsTOLc2XKG4v+GcxLxXlQBT3OQw1jEZXrDFl9IX6kBvDvdLyhtB06XQPseY/IvmMNa+mpA4Q5z0vIKanwQardmclIAHfUyiRH2Q67y9OT0huG4/JgGM3u8+gEuBOw5qIrGAbYkraNd/jJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opbfuq6/lVVqHC8qWI6RaLWJhjciHt6t+0u0M9rfx90=;
 b=UUvG6S7gagxhLDV3G1F8bilhDf0JrShd+xpsd6/skxLvjDQAB3a+hWcoTknvoRjechVAiyCoJ5GM7qfwu8n1+hD8YBxMlE4CCuuQT3OIMW3mD9EcjXHBSKTgf1tSKp3BpdUEQbLZZIWesB+wvnnhu6vYbtHKNbb6rqAFgKu0izzSI/3NsvoMXml1w5L20AmzoyVU78Cle9hekDW7lTgwiB/v9MOEEGuDWceFP94Gke9gM4vq2kAgnH7lMZ4/vNkqqJMtzpljLQBEkKhayZjy8leZLhlZ8Qh3Lrm2q4ZtmzMIUD3Y4pFc8hkqrn6EgTa/MzmcevKZU8mE6gK4K8qEYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PR3PR04MB7356.eurprd04.prod.outlook.com (2603:10a6:102:8d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 18 Jun
 2025 06:28:47 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%4]) with mapi id 15.20.8835.030; Wed, 18 Jun 2025
 06:28:47 +0000
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
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Date: Wed, 18 Jun 2025 14:26:44 +0800
Message-Id: <20250618062644.3895785-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PR3PR04MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1685a1-8b9b-4ed3-5d29-08ddae31614e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ncFS6ucJxzEQ2E+IwMgWI7Qne33iEQm8Tvf3CvDAHLFsT2pwGjjGFr5U7aDH?=
 =?us-ascii?Q?oIwbL3cwRkYHm6j+tzFcrPk9kWeoSZOUZZB3RChylz8bQ5HFXK100Oeasvkh?=
 =?us-ascii?Q?gSjoUOCGJEIOrjr1bTKfIeGdwFU6bpLRVlEaJ6JphcLpPySZTHTYe4RJKZYl?=
 =?us-ascii?Q?eApVefqFFWkCOvn0imX6hQs1EkSDzopaV5V8Ye7nxAsK0WrWgDPDlZ7pfONl?=
 =?us-ascii?Q?Kjc9ub6yKVg7OOPDZf9hMgiSHbTp67nz7eNA/+szXn0SmG/6Yhp7a88XOzSS?=
 =?us-ascii?Q?7LM5eGd+FEiJN5GvOINryvdiSnzurOVKDtASLHf2wbAwi6Y+eMwr6ILWroNw?=
 =?us-ascii?Q?L5ihAhQon4+4eZJO5jwsrT+q4CeJ6kcMukg+PrZF8SeMPS5dVMBr+PyAkHYd?=
 =?us-ascii?Q?kvHMPuLk2pD22qNsMzN0GvAnDh98CHteHs2W8bv5dea6FxKmR3wUVapFL1Nb?=
 =?us-ascii?Q?JifsTwVHEIcgAn5fovxYH9ef2RKgW1bjn9fDAgHWEqu9Ei+TrZa7aJuBMxXp?=
 =?us-ascii?Q?1vuoGc7sqUWJ4Dq9pz7DmeVm7z+HMEhT2rrG8g/3DuWD9hE1ATOraPjJ3z3G?=
 =?us-ascii?Q?jZJV7EEosI7RRFrgom7EI+VP3pn8brGUNae0vZnLMAama4bwR84Ls9ejtJYm?=
 =?us-ascii?Q?qbDAam/QmKuc5QOU0KiQuqLBWgdcSjNvuUk9C12B5glIwQfRxDAY9f0/56bN?=
 =?us-ascii?Q?yXTUGrTQJOcRfnqeFt/9ihNc75Sp02ux27mbse0RdgkRrK2TEIkXxEihi/2F?=
 =?us-ascii?Q?CaBkRVIKh3mYqhTTa4X36eQPj5unvPb6QirUceG68qOuQoIn1STP8ozZ5Dku?=
 =?us-ascii?Q?SIoRfuNmZO3lnRKXutEufbpWhOifZ0oUMwXHu1BbQmmKmyLm1E/ME1QPXU+z?=
 =?us-ascii?Q?/PgXDCMcSB7a0BxFaMI2Q5bB1R8XCDzm39tFhmhsPFuj1loSCiw+JeW39ydM?=
 =?us-ascii?Q?BSBEu4PvfpE5qaPcluhd6mJTi8DOqn7nqbYslv9Io95FN9mFdwvv5lsdJ1/z?=
 =?us-ascii?Q?Y+essyJc1qB5CG94ZcXzsygx2kxwR3/QbK8mvoJgLcJYOUxcoHnkxayi5wUB?=
 =?us-ascii?Q?WDpEX7RiQd7ut1mNNtIqa+bAn2YFqVzFcDyr90AORCWUu8kArR656Gaw27Cn?=
 =?us-ascii?Q?2uGLMDuBqmuo00nQr+RPYS/zV5xX0faKcSg54yJl2FiT+MWo9E6t7u5fPmUx?=
 =?us-ascii?Q?AsPuuQEmqB9W2cZLxd4+chXs30e0+uqsSUvggEPL11qelPlV68qGDBaGyjON?=
 =?us-ascii?Q?ij1GSoI0+s81elXcEqvJ+5eIzRFzyYgblfpKJ0L+bAE+3b+WPhwv/nSbz7wr?=
 =?us-ascii?Q?OXfmWBGIH2/6QRMSQWhf0ECWqMjkgLlXUd3Xdsd9xjKyM57Blm9gW1fYpCVv?=
 =?us-ascii?Q?wfEdx3+Y8gS0EMrlMapuyXLJps6kpOlx9l8g/WBbq/D67BrphQnJgrtnrU5i?=
 =?us-ascii?Q?sC9B4xxuWRca+bytxkaTGiLHO60XI/h8y8Q22P/qzZ0gERRhfTzqpQKV5EtN?=
 =?us-ascii?Q?dzCvYYgkg2/tsjY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s8+3Pil5UagAkNLgAzhVEnAbp+MxWkNSe0WqIMx9k7c7GPXKEpxN0Dmn63sD?=
 =?us-ascii?Q?5wet1wxRGMBCwmHFILSwQOuP7MkwyHXnAXraMw+YZ+dO4VcwsjfQpc8fvoVK?=
 =?us-ascii?Q?A80CH/sbX7d3udCZ6IUVPWsll24zKgQJpZQsgIftZpVDgKhqeTBsyi7s4JqZ?=
 =?us-ascii?Q?5Uer5pW9iy/iyKdS43jKBVN6HRuLlwTgNqK7V9opziCCAW7/C6ei0/7yEjbz?=
 =?us-ascii?Q?BywhJJNMeHHA/jGP9Y+ZAsI2hf3+UXfQBFJYgOt+N+Tu7Z7uJV6uUezMIvkx?=
 =?us-ascii?Q?V8BxivhPqMcCTykIGOfLqHdMUOxjfBeA0I724N8kgsJTaN5AE6G6KN0BhwJ0?=
 =?us-ascii?Q?C8Acj90HHLCMdrqpy871DhuNp+KIdVVW3qKoCcTSI9DiPEjgP1jzXwfaDw7Y?=
 =?us-ascii?Q?WGf63j0UZ2usBRBb8SXecfvWXwDsMrrcEqvnfSkxcjLq+f12q4qv/dFKptnM?=
 =?us-ascii?Q?gOw/DDEMr5VBbRyVVWrGiOOdSw9KpIv7e+DOESZJGxeuxan1JMwWLXGIT+lu?=
 =?us-ascii?Q?84ZydzTdyJnXgAf6QTqtLW2c+Pd+KpPEzUJ32G5Wtus0hifyqWHWLWAbmWb5?=
 =?us-ascii?Q?Q8oUwvRzeISS87jWzADANJb0RX7WApspjag4gVukOkBw2ugAdRZ1ubfICESx?=
 =?us-ascii?Q?P+7fRQLLj+wGmJnIlfVTQC8rBqCWXtznoKARtbLiscbdzI10BOroYjtPYNoG?=
 =?us-ascii?Q?ZYtdHN37p9qjJ1hZgfDgSAqIXgN35v8gjDS9SnnZRiyDMROnahVQVQF5h7KG?=
 =?us-ascii?Q?z4lvy4HDFJCHH4pW6Sh2LAhj10UGSkp29yA9s8QI6+yBQhYpI9cH7xoKom2k?=
 =?us-ascii?Q?TsQrxMEVVN/gKyClr74Wf8aHcPGflZRQD2nrSuhNFaMUdrl9D50uYtpqDgKj?=
 =?us-ascii?Q?a/TMOM+TCSpe71bBf48i8BhDeEcAmAlsC2oa9bP5GyAHZNRR0xycSekrxw77?=
 =?us-ascii?Q?NFqPwwSXeYnoJcdGInHnxoRZk44ylYYG2WXr5Ni04lxb2pnUt2caHcIqOBCl?=
 =?us-ascii?Q?T/B3XjmSQuefPFbDNqdJGza3/J/SMmAJ1oeFq5S6VjgRjwpJtqpil4EgxkP/?=
 =?us-ascii?Q?hb+aCdyaiqYR33Dmm6jWpzRzHuHU/wrgwXntBlc+rBOqfabTNfTdxk/H0Psu?=
 =?us-ascii?Q?rhsmQB3ErebyLU19jMA27MWTOuG+MiEDeOZZ9Kog7GujjNy1gdtWgGp45QgF?=
 =?us-ascii?Q?hpgPf2v+/9Yhs4mGXvVxlEGGxlYkjBuYmfwatDXhrJ70a13ULtqiYFaxytW4?=
 =?us-ascii?Q?4ScBpjldlON/3vT3d82d6GCc11b1AgEPcdho8evN2OVl+GUUPLCRcWjlo9U6?=
 =?us-ascii?Q?7WDokzcVKp0+b74sGJ5uXkWlV1ZiD/1Ea+mOQP0+hNrse7iDE2hrzbwMt/A6?=
 =?us-ascii?Q?oOt9On5fyRyHpR176uLmKrCY/xiyo+CMR+oI402JuxmuJttIGTkgiwDN0A5b?=
 =?us-ascii?Q?U+LlLSzgGO1yCV0RIV/E4vg4Z0sdbDLDDerEVGvnV050b0JQdFE/CndLixpM?=
 =?us-ascii?Q?92ue4X9QhQKoXTbFuWgSfZdAzHaQlacHw0k+5x7HnP2rd8xbWCzHojyyTKPq?=
 =?us-ascii?Q?TDkn3Clno1n/mBhIKT1L6Azx8/meBB/K4kPQ71ic?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1685a1-8b9b-4ed3-5d29-08ddae31614e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:28:47.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+7m9leBsCRwaPez3OiGI/vDpvQ+piTYQZCePZDSyIU2CIbCa9r3lggldgDjoWwnXrtPmdy6DuKxA5lY1Wxr6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7356

Add call rproc_coredump_set_elf_info() to initialize the elf info for
coredump, otherwise coredump will report an error "ELF class is not set".

Remove the DSP IRAM and DRAM segment in coredump list, because after
stop, DSP power is disabled, the IRAM and DRAM can't be accessed.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 9b9cddb224b0..9e7efb77b6e5 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
 					   att->size, da, NULL, NULL, "dsp_mem");
 
-		if (mem)
-			rproc_coredump_add_segment(rproc, da, att->size);
-		else
+		if (!mem)
 			return -ENOMEM;
 
 		rproc_add_carveout(rproc, mem);
@@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		goto err_detach_domains;
 	}
 
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
+
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.34.1

