Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2E4071D2;
	Mon,  8 Jun 2026 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895011; cv=fail; b=u+8KOCMAyoZJapAISQ2ElrDmb/RKvO1bIGC8ET+iTwCasaFVvRt6+5FYyu0E+7S0DcO15QSTMNz9D/IvZv2SET8HNyA6x48P301KEM/4vPoKF+GCBHPkd/B07VvDJdXp034HTi17Fw4i39lUV1YAS/1H7fMx9O1lA9LTfcls7Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895011; c=relaxed/simple;
	bh=5Wf+O+z6WgucM9teMOLFE5drAaDOBUyGr6l7cyGjOmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DGExmvpQDxW33GStyOxMJgCbquhawNbF0xrogCRw9yPZyiNkXedmfeXA6Z3zhgRbNu71o4F654E37h7pYz8ergTfJfLKuoUkW43bDlOCxvVQ4qqSS7KS4jO1uUlwTDnYEz/uvWlTCbjhvc/N5SJeRw2cNXMEW1Max+m5Oyl0YOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CcdGfAzN; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CcdGfAzN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZuH1550mbrEt1ab/gWR7Hv0OoJ9ja9wlkSWL7/HOTADMCgkWBkKPGyeHD6ekwewuoMUZzZC9t7wKxUYmindh9Oox2IyaLwt3S1V27e77ujd2MLJoC6mJzi/QpBA1TJzhiNbWQCjp6BaT3juq/ZjSPSOCVJm5TC7ckXxsvXSiDLLeCN40Ld5CRmdBMn1H9XZou6jAJ+rH7oKjU5CyWKXmOjzV9xWNDkMaw7wicbil9iq+5a247s9ru7hAQFMJaq3WJZWSavD4CUQh+ReXr7vJTALDFThdrsTDWLQ7CkCZSrpBUdlxVBrmzXnWKSB+yFZ5NZj9ZPQ1uKecGAFgezKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wf+O+z6WgucM9teMOLFE5drAaDOBUyGr6l7cyGjOmE=;
 b=rguLZr/zeOjuo4wqWPSbADHoiP9pzzcf903wZFpkUco/XKj5A05SszX5AP20S1KpRDcMO8jQ9eQzLqqIaNo7C0HPM7AHZBN/XSFL9hROrEKG7hJcuaGiLt1lHH6wC0GixoARKQuP0HRpiMkS+49Qvy+HTHhs7vhjtYAgj4kSxjXAXERGK8BmPYRb346tTlV5ajBpalgTwRarsU+Lv6I719iuxKeZsd3lzdi993QQqv+vUtZmvIV69WTJoiC5qSZjsUYK8AE9XY5bF5AsgG3rr93UkWVotiu3ZjaMnLoHrhT6zGp5/dQqBh41RKZdPbhaGHKP09y8/ccxZUmXwraVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wf+O+z6WgucM9teMOLFE5drAaDOBUyGr6l7cyGjOmE=;
 b=CcdGfAzNBgv7C9o4PHfYMem2RtQxxDDQ1hOdtxdnnHduDfRSuqxKEtihPPHEXIwJq6LBujlYXB5MK8Yp2Daga23nGi83283mrlOpzb4HFh1HZIM8Eb92UOa8/wUScswmLD8ROjtXt3zJmZcFTHRfu3cj7cJ1MZfzNDF+/jESWQi/CpPGr3hNsV13WJKjXECM/t75H+S/FAg0/AFw0UGxVSYMmm+9MQQ16fZG29M/TWsnxpq702RI5WQkzqHITxaKbfiPiWVgl2WQ1Vc15IhYNl8gASE+UtFRBl360gTZUbsmWypotOEUHGGZKIVG8DpujLWX93pLbWRPjJxLUFbVtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 05:03:26 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:03:25 +0000
Date: Mon, 8 Jun 2026 13:06:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 2/9] mailbox: imx: Use devm_pm_runtime_enable()
Message-ID: <aiZN1+riOG0URnS5@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad9c16-8aaf-425f-5af8-08dec51b453b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|22082099003|18002099003|38350700014|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/NihZFejTg2Wg1rLvj1Siilysiijh0K3oWWxYiCmmj+KhWHrSAYheTL0FSoSeUehiK38hoSKrIXzjI++cYX6TgjAafpavpad8xmzLpksML/mjrrwzWuuOrOLCgGsIYvs2y0RJ11yrz4ULDfNr3hbXtsV8fff0eXiL/AgMixruqf0Qwdv8PDV3gJJqhgQEoKKNgtf7TPe6woFL4f1NeOKEBYK5bW3kGO20NGnqtcQ5f8WYzDshASVWla27GVow/0q5xdKPdSm/97gkq0P1x9+Pa3KwlH3ub4jwnizRnEhUQoE2rJ0z6T+R8EoJBFkzd8ve9By0OXKWIBSb1m4KcV5KzEv/Ji51q3aT/uVRpg3oXuC053Kii3psrB3PTqQebgSQUiBv9jUWzI+U1Yc4F9JlZCITKhuEiOER8XufV1dxO8R2AvtfnkMBkuSyA3SbhCjFEBmNT5F6gM9QDUHY0Tadr5/7WSvarYF0mqEFG4NKbPsmBQ/hd9g8O5LkRgTzOorr1tItA9vst1t4CVTYfEInZdUj68F7ZLVGs85lg6h/1+I7kpPPNUadhe9t1CNJBT2nK71uhQ26L28biy3wkD7F3YRkrPrEmcbNMXyQ1V9kOFsQs1Bh4h3AOuIpgx89Va8qMBfaLOvekToEOIMphj03XS0LWB8JziExVbpphHbU9TMPJ0TLxU7J6Dy4JdkKh3l95KM7SRivPqGDEaf4Z7arTN9rTK2n7ktLiMKdHa2EuuLFuKy61Rzx5Hd6MIZ5Tmy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YiKDixgsHmNv8ICxOUvXAjNR0RCkbt2HG54vnyJ6lnfbR42ctwLUBKZ/0k1x?=
 =?us-ascii?Q?3+qsvKWQyaxM+F9kM+K8LqcZa8gbrMR7raA9BgpY1FvVx9BshI0P0S9ik1+i?=
 =?us-ascii?Q?ujbEJEmQmywL8SaVYH7TG6X6EgnQyO6/0JNZ8cliHL936pN67Sd8742ASI9U?=
 =?us-ascii?Q?A2T55cw0EeL1vZlxIuo43JMTT/bNcaGqSNYron2fniqrqNfR/jBcZMVs1Q8L?=
 =?us-ascii?Q?PhdVoJ9YxpfiebeRPC/s/kdftlkZNzuEBJ6uht2109K9vYvA7jYsF7iXt3H0?=
 =?us-ascii?Q?n9KWwMSzFUaCdAcNA1+7rZNXQ1OJU2af3ZVBg3hT7khhTu25lbxRJLHAbBtS?=
 =?us-ascii?Q?sV5cEq3fak7On9xkADvLeGGPPF+mnHq6oAs9H8sj3F2NL0dhV1NZjLButRCL?=
 =?us-ascii?Q?ZA52jYSZZqPTf/FIZ4sf0JJucbOoo5dJgBxX9DKfKIUH7yDNC3mwj3xk50Pa?=
 =?us-ascii?Q?fBQzX0t3muRQb9HzP0V7jq7q8DXWyJ5nFKRs7DvqXxiYCQtC4haeJy/03b6z?=
 =?us-ascii?Q?fF5tuW9KhN1iESqwo+/cZYXMDUbmiolthcK66wn9o7LdY+aONYSTzKgXHdiS?=
 =?us-ascii?Q?iMk+Kbgd+/xVCFlFEPPGwjljD8eX0pTps5bfG9MIlHIjQGII2hrZ1zQ6QTNM?=
 =?us-ascii?Q?uceSfwUjyi53s3Fv4Eg+wZ3OF24f4aqSQBtI7y++qUUj6FdXa0/7+YCxNlaf?=
 =?us-ascii?Q?TNBPRg2MZCMRyLSvhSBbDGJTC8QMmMkMJEefYdTsUl5capYn3F3MLg6mohK/?=
 =?us-ascii?Q?ECuQ7Gqml8OjNM/SjzpGRs6eo0Cn0ruyTL15JRUCE/2k9L4Fahs+FWAq/THl?=
 =?us-ascii?Q?tIuCLDcshXNtAXNcLMB5ZXBHIl6TsEllWgfoKjjkRKr/NEe0JNYUB4k1rSID?=
 =?us-ascii?Q?6SY05El5lk2cE+hS9gdq03wOnOw3SnT3yp9vKXdJIu4gauI5tFI1okcuKoeI?=
 =?us-ascii?Q?ke2yZa9Ft63BjanD7EUQ0yT5p64jFy1v1zyLmuqqcRuv7VmbLgslPTw4s3gI?=
 =?us-ascii?Q?jL6fAMKl2sK2SpsI24EQ41DzXsH6gtF8+e67A9WFJKmwqYcLojCdEx3hLTPC?=
 =?us-ascii?Q?0Wv+Nr8ocB1x4i/ZN1e1f5/Y8+L8K09shFYdnWZiG/i0I1LU+rZAg95xYJpQ?=
 =?us-ascii?Q?3wpvyxM9fXTaycyXzw95JK40upMVznKJa10OqZJfTqhVlecCs4/AJKuMkMjW?=
 =?us-ascii?Q?dOgUWbzXt6GN0L4ijig2y406qmk3TBv/r+OOsrDCB20e/MuFdvN4XprDUxPB?=
 =?us-ascii?Q?UPHMX5PAMqqDEMgo2urXr+CUYIuo2BoXk4hwIJi5F+yWaVTxVaoBWHPpdYrw?=
 =?us-ascii?Q?j+I/MniZH7vICmea2xIkCj+0ZyLmzgGQGK/3eUsgMdmHSo9nsR1H2q731wX9?=
 =?us-ascii?Q?zQxzwn2GiG/I6EH1cg2ZW9oCQe6lcAEceVP+87wnEI5GnkY3c7NDphwykFAg?=
 =?us-ascii?Q?+L1Alc2XJiQaNv1MYzUHYYOMQiVaJk+qiWb6FnlnaJn0IeM2yuIB+v3xp5IS?=
 =?us-ascii?Q?knVd8pnPYJ7KE4zz5X/mYpRwdK8Ke6t5vKHhxl/uD8QNLA6l1IjgVauNhTJF?=
 =?us-ascii?Q?3iFzBhiYacQjy61CDpzOOaw41qtrVArtQq5yyI7ZZCeh89T/6nAvuF0BInUP?=
 =?us-ascii?Q?B5sz01VdfuvFmOD1fq59+EYN7JYRuuWMK1/UCplcUhj03sLI01x0PQf5PW2L?=
 =?us-ascii?Q?+dg2sCSv2rFoEvfMedMPgq/aUg92ay+gDOY4SLkEuSZjILQCcaMgJQqtewzG?=
 =?us-ascii?Q?3TaTmOzfYQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad9c16-8aaf-425f-5af8-08dec51b453b
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:03:25.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RItOpx0YWsxnxYGKukXVKmdfzWFFsD0USnArubnR4nru4RN4PFRNehyjay614VbwEQZCZcSdBcaU7H7LdGyV0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883

On Wed, Jun 03, 2026 at 03:05:05PM +0200, Sebastian Andrzej Siewior wrote:
>sashiko complained about early usage of the device while probe isn't
>completed. This can be mitigated by delaying the pm_runtime_enable()
>into the removal path instead doing it early. This ensures that in an
>error case the device is removed (and imx_mu_shutdown()) before
>pm_runtime_disable() so we don't have to do this manually.
>
>For the order to work, lets move devm_mbox_controller_register() until
>after the pm-runtime part. So the reverse order will be mbox-controller
>removal followed by disabling pm runtime.
>
>Use devm_pm_runtime_enable(), remove manual pm_runtime_disable()
>invocations and move the pm_runtime handling in probe before
>devm_mbox_controller_register().
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
