Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290CC2CCDB;
	Sat, 30 Aug 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756554067; cv=fail; b=TrSZJJ12mqQ/dz82HDGjkUxHdyaRxc/otvjTmyXT+4KxrrZ4L/qY4dCVBjphzG5JHid3hN0yATm1WuvjQNBsfNnb0mr7RMc7tpdVCGnjudEnb2waCjRMpooQTPpWSVoJk4QASkcJQYQI1ts+vOKOYq81XAVzzBmfNyHthJF62uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756554067; c=relaxed/simple;
	bh=Jx5gEJm03dvOHjuUTQtHtw3HNaQTCG/H2fBrcq9rw40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=afbM428o2nMZEaZL9oEIOKx65WjQxluR5n9MyLTciXmHo4y0FwOGBONk8Y8JoP14e/GlGeyoYQjYU02llcp9K0BXFzX6QKuVuX1V2wqYGtGtJeECy5enp1+6/amFPB+ZfbgyXu1Spo6FsJFKTWCFgWCCJaRhsrptwAoCLvJtU+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KA6EYncd; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KA6EYncd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqfY9C52rE7r+C2jebLks0HR8nsFBXEa73p6D4EYxg2B47/IruEvVYKp0JJT1tyfRO27SuYqJUiq+ziFkilcN4uuXYE1H+4AD1NOORkPNJIClYrccB6sYVynEgjfXx4Qm/JWG/+nfQfrFCbXfdFopO5vIoH0vwQZ5nzQwsLlf4TL4jpggX1MPdrlDhg/jtVbLucv7e38dMeK3xkDXjHjfiCsrn8bXYn9/hC4h/kCLN8CsilBhEaUXg39IoqZZOIUyvm1TM0wnSQJTUJ0PQNWPdJC9xMqfjawVeijE8waMwAlqmzA+YcrRPpOeR9FewxNk2o3Teapgs/o2QCKyh63Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqQ2Umz48ixo+00Wr1+77vJCQnvfnToQSB+/eDaUug=;
 b=qjTafdwj1RyW6OJIlqmvZkzKxx5gh+wd0u3WBYhgQrflcyWBCqtVKL76owmjGcl8cQqCN8JPDhhOS4C5ow3fSQT+TH6Ha8Tbh881NAfowkNon9SWpI4eb7C6DzO0zWW5kefkiCAS5wM2rwCmzjpjQQJUFGjfLrFhpmhRXnqNTYNJ5NcCJMxGJsi1u1w/NRSV/r4DgHvDnhFgtvda9RdQsuuGLKeJNJbUf9GZDWRpuknwRgramZr9Vtl96KoYFKexVHCG0VziHVP+17xoOeFfQpaN1vltQlS+wyqglw5hc417yE7eUlDSchj5SOtjjYLnMcbyeus6zE8+YCgYLUQ3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqQ2Umz48ixo+00Wr1+77vJCQnvfnToQSB+/eDaUug=;
 b=KA6EYncd760qHEVaWDxpQe/gWgJsxRU2ixoiX3n3Jrl3p5dSLss9sCVb8PvQ/Po3gMfYn1TlX15OhxK3M54GsVfjy0nPViI58BO/FCn5pOiKIPjaM0EopmGaiGvQOGRSCdU4yyRJjBPL2WKmTCLBbzguUPg2cpfYNWPJN1+uTjeegqIcGLr9l0pmecxLKqkqahjD7K4N4KOdKK+PMbwi/Nb0Wq6EhlgHzon9aytSimZkApNKclRXPam68aqVxPpHnRGdtl7Wszp2M/DPCarqWflOXE4CALYb2qt1NAuGqFN9FTvKECQIf+Pu2fK+kSoP2mNbvbZYreSZP8tHvfRikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 11:40:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9073.010; Sat, 30 Aug 2025
 11:40:59 +0000
Date: Sat, 30 Aug 2025 20:52:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20250830125208.GA22718@nxa18884-linux.ap.freescale.net>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
 <aLHOhKpAQbVCC76-@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLHOhKpAQbVCC76-@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fd7cdc-75b2-4037-f44e-08dde7ba16e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oz+Ct2uHNDdzkAfL9OyTgBdhXmCNIMC0W/Prl29StSGgmZ5eV4AGkTJoJzME?=
 =?us-ascii?Q?mDfTnPLgYeo6naJGlnV5CPlNaJnT75alF1O8yjPI5dhEeKcmEN33VtDMjaKe?=
 =?us-ascii?Q?qJFUonqze/wKyLgFpRNt6DGtjlrvipsQL2svP5Xs1OCp29lekL/KFGB0wlDz?=
 =?us-ascii?Q?iY279DNTtUNhciWUcSxMZYHiOYGoa9DUeAxTaFf0/Q7WMaSrjDXCH0PzrTll?=
 =?us-ascii?Q?oeXbL3yg/BtY7UxSUqTcdfwVMjBAriFYu/GSpN2NwRNbsb+DwE8f6kY3Xw+T?=
 =?us-ascii?Q?k9xpSD1zbZn8G9BwDmVR+VfCcjn/3tGlS6ZqryKRsLCpxpA8eNqaSDhMgrYJ?=
 =?us-ascii?Q?YrjOKY5/B7L/ttbL64LYjwFqB/nt4LiN3j+1+9+tpZCez6rxICQvPw1b/J5A?=
 =?us-ascii?Q?/imyCeYHBxeP9smq1zbUvOl4coYeJ90pgzJa6J5RdWGki8cZ5hseu/T7dTh2?=
 =?us-ascii?Q?kkON+wezhYERSyoV+flBrEiq9OOo/AtApXKXouKelmwsV3bwhJzQrL05iyWD?=
 =?us-ascii?Q?SktA0ml3bC/kMsUa8Z61DgAvu+OgZJxc1jdJ6241s9uyIoBqKl7zu1kr2TV5?=
 =?us-ascii?Q?YlBlrowEiA1HOOSUbz9Fcp/L3rPQP71aUEJKawm0aou/5r/eyBjzFLqzONGo?=
 =?us-ascii?Q?+5I+rKa+Pkxl5bfe+qabOEySWgaTiBCH1sD1yd21bEKAFrlE4AMQS7pz3tIl?=
 =?us-ascii?Q?k0HEfnNJl9fNrqBZEHG38ioa8uENLpt8GMcRUvrnbQ9Mt+63Uyz21z8Xk8TP?=
 =?us-ascii?Q?lv3UCKUWHY0hxXAyPJzqfcbAlvu2IT09MS/D4wnsBEKuIb1Z2gKTcISR7ExS?=
 =?us-ascii?Q?DB7csOVUdHVFXbLOdonExuVhSQ2AEhqHz1RYhzcA/N1tKrcyy5NpvhCVMb7p?=
 =?us-ascii?Q?U8+O0DH/cONFfDbruDkIKgCVLDlH3rAiHLRU/sNdFiroQzsCKWBrphTElQhJ?=
 =?us-ascii?Q?v9aGMBCR2tEmp+/mp7w/9QkkZ51MQIKUXK0ZVSrCt0xqUn4MTvsr4eJEMLQP?=
 =?us-ascii?Q?xnSbt1uMyKGD6JYqjyqr5DPSMVwMx61vlIJLtZQaYV6TgYQ/0LAoxG5b19Km?=
 =?us-ascii?Q?K4crL+1Wh8TvSrPb+Up62csi3A35wL8AC742Dp1n8NslWUS2DWHmoqR2eJyl?=
 =?us-ascii?Q?GCTUwS+sMKWx77HG53+znrYTWs7zBybV0kbii8QQGEfNyrXMNennhXmSEerb?=
 =?us-ascii?Q?hpLxgWtzcW5SdoGftezuopJJMsk/CCvXRE8NEjqkole7i064pmHG6s+z4AY0?=
 =?us-ascii?Q?vPa8UwSobWzyZLcq1xYB+oqhQf1qZ0watz0zbC1rhg2tgyKd55T2Yf2mqEE9?=
 =?us-ascii?Q?QwzB1I7M9/gwFY1T6wbipGnX1LNWFcdSuIIDR2Uit7gU2QcATDMB7YaYl5C2?=
 =?us-ascii?Q?K8tdvgcwIG901JSTi+6g/fuAzRI2VkqKh9eElzPlodPIsQIdu2grRBjnwdfK?=
 =?us-ascii?Q?tD29VUnanQmLhzFDiK/710yoa88lRs5ihgvCFvu9tzny5vTdT35kFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ihFS9Gtfuf/w/oQBUhTv0C1wzng8KVze6tAnldk/aXb67sIseWSAYGBc7nxp?=
 =?us-ascii?Q?/wzuLDhZJftj1emeejhBVTmtd9EazOEhzuSgXPwbcrEqHatmqTM8RP7DDfNx?=
 =?us-ascii?Q?/aoB6gAjuMxPLsAKne3/Zx9OgX0E7vPngjqNxFRL+NAu3HA3Ocl32RexUmf1?=
 =?us-ascii?Q?J2qgM/cnpNrmSkYPK8Fvza9J3xLZrG1YNIb3eaob+G3DNkjf7sbZuToH5yKM?=
 =?us-ascii?Q?4qxF35vXWvO4plnhJpscs0DPt1u/DpNBsrG2U8Dm3CfUAUBjuk+wNJEidDgs?=
 =?us-ascii?Q?GOWdCSV/rnl9fwdj68VwyE4w3NiRfpq/PZ9nndEP+zBMVw4hLEXxh4flR8Bk?=
 =?us-ascii?Q?f1QzSjrA4gSAfbgc3iV6GSCNLrZI8L+ipzvGDYrhu1buSATKHnqhl3EshE99?=
 =?us-ascii?Q?WW9WV3K9R7vRYTsQMVDYEsSab8IIRvgY14E9v015BLB8N0FN0ANAexdZ7ygO?=
 =?us-ascii?Q?A4iybdFnG7az+9yvYI+raoCUC34BtiKYBr6UT1/qge+aCppaqhjkwQbwhz6f?=
 =?us-ascii?Q?jFOmj23JKoIWXESKZH//dbmPACvYt0FDpIIvAqwqc8UlXR/6RIcTZx+qIpQp?=
 =?us-ascii?Q?RBP8aPz0msIsspboa90yr71q+wvrc4XgM2ekKXCVQZ3pWH0lrUvmvZ7UkSR8?=
 =?us-ascii?Q?ByObKzHbdsekSnhH1m6ui5ItiaQfKDKkd8vyEpU9riOUzC4eAfQo7qbwnnSy?=
 =?us-ascii?Q?qv/xEyBtCIU4WvR+4n/02AP8gXHGEY8iBrg/PRzvf7ZzpHJFI1M5YY0kC9jt?=
 =?us-ascii?Q?Fqetolj1Bazl2CPXZTg5cYcH2MUV8zxdpPymqP4HwKFr84picLzJfvKLInCm?=
 =?us-ascii?Q?d/cIcQiQWohsS0vtTwgbvR3NyuWzO3Ok21jSj29GbTv1aBIR/N2p1ivnx9jE?=
 =?us-ascii?Q?6fiS8xZAGetthqYp8Qc7YSzFCeg1wyMIOvDKXtq0H+uDxNzhkoS+Edb0Gypb?=
 =?us-ascii?Q?WsvRhyNtZAIl7wBPZS43HMRlIwqO8n8EoGl7CL5hnt5IhuucUFYqRdCtGsll?=
 =?us-ascii?Q?pnF4glaBtGQH5rXgVgo3uv8w+bqxzuA8ycY4DODyBwduMeQeqMP2O4CrqX+T?=
 =?us-ascii?Q?LETO8nlYisk+SNQaMFXB9R+ap1B080y8Wrxl1GCB5bxraFujRcqgWMzlYqGQ?=
 =?us-ascii?Q?3g79ckUDTkWcT+M4dn7ZUpAP7EkRaA0iD6ghG/hvL4oM/GBFml2L4/qJlCIt?=
 =?us-ascii?Q?BegtOxxpZBSdBxKi6SqGMK9vPAdBTajTNgetPLrr/On8hiaWPeHFtlML73G1?=
 =?us-ascii?Q?Nx3OTBodsjM5FMcuo3JYneSmOD6EzygQwTS1VuTlzI9xK15ES4njsQYl6Gft?=
 =?us-ascii?Q?d9SWFZdlJEbUYO+s22qzDjmbK+OwUqeGVUC/Rbaz+mTmAnv8F/y+j4KLftsw?=
 =?us-ascii?Q?5KLOZQffE2wSljapDKRo91AwmER1btYUfbFZlXqwZisri4kitlHreUFicob9?=
 =?us-ascii?Q?CjtRL3Vhz5QbVjCVHeePdSqxT8hLKP0BhbfKxAQ/oEUXDxa9DLVyhYiYqsLN?=
 =?us-ascii?Q?HkDWs1piukZxaCZNZlr9NIyhZP0c/P3uWUb88ThYZbnFmvSkwtWBS/zBlWDJ?=
 =?us-ascii?Q?hJ8jCYyx8Vt89PEnBqe0rkZI6+80k7yqidz8O0bJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fd7cdc-75b2-4037-f44e-08dde7ba16e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 11:40:59.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GG5LAcrcDxZ16PHF910WVRwbyN9csnggSYw59n2P1Fd8tBKj3u6Wpf/1hEDvXRDruLc6yDtwKPw09rkZbula6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628

On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
>Good day,
>
>On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
>> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>> one Cortex-M7 core. The System Control Management Interface(SCMI)
>> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>> Manager(SM) includes vendor extension protocols, Logical Machine
>> Management(LMM) protocol and CPU protocol and etc.
>> 
>> There are three cases for M7:
>>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>>  (2) M7 in a separate Logical Machine that Linux can control it using
>>      LMM protocol
>>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>>      using CPU protocol
>> 
>> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>>    has System Manager.
>>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>>    Whether using CPU or LMM protocol to start/stop, the M7 status
>>    detection could use CPU protocol to detect started or not. So
>>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>>    status of M7.
>>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>>    the M7 LM is under control of A55 LM.
>> 
>> Current setup relies on pre-Linux software(U-Boot) to do
>> M7 TCM ECC initialization. In future, we could add the support in Linux
>> to decouple U-Boot and Linux.
>> 
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/Kconfig     |   2 +
>>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/imx_rproc.h |   5 ++
>>  3 files changed, 127 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>>  	tristate "i.MX remoteproc support"
>>  	depends on ARCH_MXC
>>  	depends on HAVE_ARM_SMCCC
>> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
>> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>>  	select MAILBOX
>>  	help
>>  	  Say y here to support iMX's remote processors via the remote
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/err.h>
>>  #include <linux/firmware/imx/sci.h>
>> +#include <linux/firmware/imx/sm.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mailbox_client.h>
>> @@ -22,6 +23,7 @@
>>  #include <linux/reboot.h>
>>  #include <linux/regmap.h>
>>  #include <linux/remoteproc.h>
>> +#include <linux/scmi_imx_protocol.h>
>>  #include <linux/workqueue.h>
>>  
>>  #include "imx_rproc.h"
>> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
>>  #define ATT_CORE_MASK   0xffff
>>  #define ATT_CORE(I)     BIT((I))
>>  
>> +/* Logical Machine Operation */
>> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
>> +/* Linux has permission to handle the Logical Machine of remote cores */
>> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
>> +
>>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>>  static void imx_rproc_free_mbox(struct rproc *rproc);
>>  
>> @@ -116,6 +123,8 @@ struct imx_rproc {
>>  	u32				entry;		/* cpu start address */
>>  	u32				core_index;
>>  	struct dev_pm_domain_list	*pd_list;
>> +	/* For i.MX System Manager based systems */
>> +	u32				flags;
>>  };
>>  
>>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
>>  	case IMX_RPROC_SCU_API:
>>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>>  		break;
>> +	case IMX_RPROC_SM:
>> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
>> +				return -EACCES;
>> +
>> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
>> +			if (ret) {
>> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>> +					dcfg->lmid, dcfg->cpuid, ret);
>> +			}
>> +
>> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
>> +			if (ret)
>> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
>> +		} else {
>> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
>> +			if (ret) {
>> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
>> +					dcfg->cpuid, ret);
>> +			}
>> +
>> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
>> +		}
>> +		break;
>>  	default:
>>  		return -EOPNOTSUPP;
>>  	}
>> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>>  	case IMX_RPROC_SCU_API:
>>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>>  		break;
>> +	case IMX_RPROC_SM:
>> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
>> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> +			else
>> +				ret = -EACCES;
>> +		} else {
>> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
>> +		}
>> +		break;
>>  	default:
>>  		return -EOPNOTSUPP;
>>  	}
>> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>>  	return 0;
>>  }
>>  
>> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	int ret;
>> +
>> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
>> +		return 0;
>> +
>> +	/*
>> +	 * Power on the Logical Machine to make sure TCM is available.
>> +	 * Also serve as permission check. If in different Logical
>> +	 * Machine, and linux has permission to handle the Logical
>> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +	 */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret == 0) {
>> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
>> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>
>Why is setting this flag needed?  The check that is done on it in
>imx_rproc_{start|stop} should be done here.  If there is an error then we don't
>move forward.

The flag is to indicate M7 LM could be controlled by Linux LM(to save SCMI
calls. without this flag, heavy SCMI calls will be runs into). The reason
on why set it here:
The prepare function will be invoked in two path: rproc_attach and rproc_fw_boot.
When M7 LM works in detached state and not under control of Linux LM, rproc_stop
could still be invoked, so we need to avoid Linux runs into scmi calls to
stop M7 LM(even if scmi firmware will return -EACCESS, but with a flag, we could
save a SCMI call), so there is a check in imx_rproc_stop and this is why
we need a flag there.

The flag check in start might be redundant, but to keep safe, I still keep
it there.

>
>> +	} else if (ret == -EACCES) {
>> +		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>> +		/*
>> +		 * If remote cores boots up in detached mode, continue;
>> +		 * else linux has no permission, return -EACCES.
>> +		 */
>> +		if (priv->rproc->state != RPROC_DETACHED)
>> +			return -EACCES;
>
>The comment above scmi_imx_lmm_operation() mentions that calling
>scmi_imx_lmm_operation() is done to make sure TCMs are available.  Is there a
>point in calling scmi_imx_lmm_operation() if ->state == RPROC_DETACHED?  If not,
>can't that check be move to the beginning of imx_rproc_sm_lmm_prepare()?  

scmi_imx_lmm_operation also serves as permission check.

If ->state is RPROC_DETACHED, we still need to know M7 LM is or is not
under control of Linux LM.


>
>> +
>> +		/* work in state RPROC_DETACHED */
>> +		ret = 0;
>> +	} else if (ret) {
>> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static int imx_rproc_prepare(struct rproc *rproc)
>>  {
>>  	struct imx_rproc *priv = rproc->priv;
>>  	struct device_node *np = priv->dev->of_node;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>>  	struct of_phandle_iterator it;
>>  	struct rproc_mem_entry *mem;
>>  	struct reserved_mem *rmem;
>> @@ -593,7 +674,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>  		rproc_add_carveout(rproc, mem);
>>  	}
>>  
>> -	return  0;
>> +	if (dcfg->method == IMX_RPROC_SM)
>> +		return imx_rproc_sm_lmm_prepare(rproc);
>> +
>> +	return 0;
>>  }
>>  
>>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> @@ -927,13 +1011,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>  	struct regmap_config config = { .name = "imx-rproc" };
>>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>>  	struct device *dev = priv->dev;
>> +	struct scmi_imx_lmm_info info;
>>  	struct regmap *regmap;
>>  	struct arm_smccc_res res;
>> +	bool started = false;
>>  	int ret;
>>  	u32 val;
>>  	u8 pt;
>>  
>>  	switch (dcfg->method) {
>> +	case IMX_RPROC_SM:
>> +		/* Get current Linux Logical Machine ID */
>> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		/*
>> +		 * Check whether remote processor is in same Logical Machine as Linux.
>> +		 * If no, need use Logical Machine API to manage remote processor, and
>> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
>> +		 * If yes, use CPU protocol API to manage remote processor.
>> +		 */
>> +		if (dcfg->lmid != info.lmid) {
>> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
>> +			dev_info(dev, "Using LMM Protocol OPS\n");
>> +		} else {
>> +			dev_info(dev, "Using CPU Protocol OPS\n");
>> +		}
>> +
>> +		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
>> +		if (ret || started)
>> +			priv->rproc->state = RPROC_DETACHED;
>
>An error should be reported and the initialization process aborted if an error
>occurs rather than defaulting to the default mode.  This will lead to additional
>error conditions that will have to be handled elsewhere.

ok. I could update to
if (ret)
	return ret;
if (started)
	priv->rproc->state = RPROC_DETACHED;



Thanks,
Peng

