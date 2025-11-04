Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3E26CE2C;
	Tue,  4 Nov 2025 03:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226181; cv=fail; b=fkt/LBiXvV32r8Ct/JRJYYvMNi3PplCNr/+eAKx5dhVKnOrrfw7gPX7pdfuCeXBLdXRjoDVxWkmCoc4qmkJ2TbuO6G7e46QeweKNyxKtFaZc3Zroh9UpKUsXo77yG4LRMrU6k90nnPv7CT8JdFfZEYrsbYgn7nnXsdlRd/gm1j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226181; c=relaxed/simple;
	bh=nu/1VoMA6qUF8qbL/L5xH7xtjjzH3j/VFe/kG6qq4Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vu0vTCFuGNEKm68btK9bPQk2tyomM4HdO/OJZlOTypk0rJoqVakXHfuB1C9+M/oxEDLOLgW8KqQezRPK5tFZtTDe3PoagRurWeV0+GamLmTHfnSXXgBj+NYTQPAWgrk2w2l3Pa6A2MajzPwKT1OwBv3F4HF4HRNqM+RkMjkEeAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JXlwqPH3; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JXlwqPH3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md6uWhR7NLZW99KLfoE6NK/7P4cCqrSui9lXDJ9AWPJEcYieH14+k904mL0HdbYiy4xPpGv7Ykg6j3nyWR4BmWnydSHPXUxFikhdL4O2+8i/ri7SZqX2mTVtjDUUyCOHRGw3yo8tE6dzi+U+p5g+Mt2etrrL6Q1bLrsABLsSfbEkyCB8FUHJpBTmB8gQh7wVGTBeMHGNF2x7aM8Y0gBPJUOnyGuYabwcMX0ArEV5/Z95yJD2Hnm3Vi8Q8ZzsgrkuoUgoLhj+s2L32T/vY/nPiBt3XTCm0U4oWO1byS5o302AuD9Kxht5DnPMDu9Usr4Ie7Qie0OkcLLUtBdy1p/X1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTxPMgMrNe3ywFxiZ2xbG297gl4Y47WFgh/f7rSoZYA=;
 b=GBp46w4RW9rfBMderdm9W4rndJcT3JYAEZDjrTgQ/Gbhlxsu0BgTLJ5Rub7AWtGZlEmWHmt2Uh6nhdgcoSrjXZ7Z6KnsH2zeiHFuWFnVSA4ULfj20HpHiJuiZrK/SI0Mzr3T1lx/oJnTOmv/PxP0KO6DjDFMf6sd6Rsmt0aCd4wxuEAH59lxDVFjNUMv1kJA7/xWUeIOb9uhhBpMGWP4/yamqf4SD22XcjCU13P7/mIhXYSfsGdNfOA9u6p9lPyjSDh7pC4vwk/kdfzfKO9hBKpqvYtxJjRclcxvfKvxydpvyYiYBuy/FWJpIOgNjBrUx1sgVeWrEiNCZCgI44sPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTxPMgMrNe3ywFxiZ2xbG297gl4Y47WFgh/f7rSoZYA=;
 b=JXlwqPH3OG+lcb+N7UZE+jC4c/Jww6LDZbc7SbB5oj4AuMSfFzQiNHUsG7XPHfyJ6ZYZsbqINS3DrqQnN2KSfRRG2mHGcuRrMNzxFaEoIDAu2jK8Gx0gft+ScoicF4pBfoauzBNoXKxuDJ4M0y/UKEExAQm/rNl5vBu8D26zaMq4tbMCeJNmSlxiXeGCx5yOthZEqEyMrBscKqVBKcauqJpMN2MFo1Dypx+GpChaIn/fTpUDQ9LLDriALfshD8cfoTN5lufxQ/uSTObAhK8RV1tB49q0WlkADahZUgIT678tPqiNV7AB4IES5TxVvlzz357t4vtoKBHd/ygxwrQYMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:16:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:16:15 +0000
Date: Tue, 4 Nov 2025 12:28:43 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20251104042843.GC11714@nxa18884-linux.ap.freescale.net>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
 <aQUNx0SWWO7HjyL5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQUNx0SWWO7HjyL5@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 92de482d-5939-4306-ee86-08de1b5083d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOyiHstRazvFeWw6eyNDiSL/maB+zIWy33rB8NrnwuLhyAnu+fiFVnEfjFJP?=
 =?us-ascii?Q?MKhxLq3krjSOHJ5/CGsO+NeBe+L3tTWRtKwtceK6EiIu7TP/KwcWizKHje44?=
 =?us-ascii?Q?0K3WFI9P66L5AQ4YpS9qc0OlubvqU9k2flsT019yvsvZK/GxsBH67BCF7E2a?=
 =?us-ascii?Q?u7kDzhI0db4BVZyGWlHGLiR91tWdDPLIU9RMvUTQ9Y3tsIa6BrnMZDp6zxKr?=
 =?us-ascii?Q?ijWTWsU/0TFrXnoFZaQp6rzFR9NFJkCKVGWMvqRpnjZaDzEW44qyUzToapnz?=
 =?us-ascii?Q?NoATSo/tGceOiq3UoTzKVosVuJImh+/YBaAT1y9e8+EFwTvQoehul7VGXPMs?=
 =?us-ascii?Q?brmCYNbz+fARVmzzrHcA6T2wNngnHVzOvcX8jq6u2gM2k/2pTs3bkP9cZ1k7?=
 =?us-ascii?Q?53jjRkZojA6JcwUvFbq8X+NS4Ak1Sr+wDcpc7VYsRXUR/Bcnng/wfXrPhBj7?=
 =?us-ascii?Q?Lrvl4yut/bbEYwD4SjXV8ezzNrXLfAdsDBL9Ntm3aWF+Mosbb20gqnqldmX5?=
 =?us-ascii?Q?2hIvMSPiMhK5D840T2+U40NZVH1JGXzyRHdNcNse44XNWMzk82ssDxZzp7LT?=
 =?us-ascii?Q?m1je1jZ/kfqlR9Wuvs8TF+Ft8637mc2xM+JIkmd2btM+j6GR3GKUtGyvhCzv?=
 =?us-ascii?Q?3fSBv6KE7jYK92lz48kXimiDgvUMTr1aJlhx9miX8Dt88D0GTh0uwAO9UF0L?=
 =?us-ascii?Q?fmhdCTRN5A64OWu0PnRX8C0XFJM5SRds972VRaX516gRc4gyewZy/8igwA3y?=
 =?us-ascii?Q?UJwBDBdfH78AVYO9pi0v/hv3YlOlOCU/199LOP4+L2VmBFvphpWzCCQ5nzQR?=
 =?us-ascii?Q?NnfZLLbPNhxRr69jqpmzL+1hGDMpYLlPGR5zJI24rQiYv2zaF36qlUmlquJz?=
 =?us-ascii?Q?S7tTk1QdSgINIVqsUZg6lF7aOiWZPX2PuSE3gfLZDVhxD+ImHjIaWNgoQvQw?=
 =?us-ascii?Q?7hLmJ8NTX8uTtuMQZznOxHjVaa1Z2FwYuSIuNZ9WHONXLCt5jjraJPXZ1eaP?=
 =?us-ascii?Q?IjJv9X7mssv56iMDu1o7RuN9WzrDOhPEMX6aoNKgCDdMEC3VwhIcXCRDr7p2?=
 =?us-ascii?Q?vaFkdz0eEkBISZ7CQfVOVseVsVobihMIEgNEnC82jJxForJ85XD2Sp0Xq0VU?=
 =?us-ascii?Q?8RechY6n+eUAc0O9jBKJK57LOpd3vVv79LG2DtlcF110jjgYSJpkpxWaUitd?=
 =?us-ascii?Q?JmNP/NlKvbfw0gav7EAUQTXb4QrrjHNCr6WIoHN/JcIJGh++OXZJhCfLToSr?=
 =?us-ascii?Q?DWAnH5E2LxJmtP5CWrAZSeyTaGTmBdsWCvYWZH4+SxPv734IUR3JDIAUjvdP?=
 =?us-ascii?Q?t57ig/MC3+I+LnwmOSiJiwt71tjK8uHm8Rx5uQn3BqhnzvScJ8M8L1Hg+KZx?=
 =?us-ascii?Q?wRvO1ggazUR9TWcIGDIuTKyCTHro8T0tuTJuO11oQBHQDdA81q8yiZL5kTfE?=
 =?us-ascii?Q?pWX5kPeYSOeBWz/L/JuIGxcXl6XUPW6kUlOnw9jxI4BR8RSzDo7mhZd6eWxj?=
 =?us-ascii?Q?X5MXLrrw95+f4fanq3yZy+fvCF7JwgB8MZHN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlJWe0t/oNx/vaWqlA2aChNf876uWwF7gTT5Kvqj4RTZtVDdDBz1tnSJF3m5?=
 =?us-ascii?Q?mKoFLp7X/g7GFIHMHIgWUXmIOOFXZYErh2YWPtz1IMp/CV6U/4Yn/1rhxz4K?=
 =?us-ascii?Q?82g63f/Xshtn535nQzixGw/tRwMFPk9LEWmQy3cx9ZY4D1io2ooueK8IKhJ1?=
 =?us-ascii?Q?um7iz061UbKa1su6x12ftYKbIb5GFusNA/x1PK6nMbgDqy6TbPBbSlY7v8my?=
 =?us-ascii?Q?zICNCYGqiTqV6BCKeSuGxm92YpCg9ditonVGH+A9vU65bk3juCrC9TX0FVoK?=
 =?us-ascii?Q?BpG80rn/TApPp5b2XvRtuzeDk0ehKdb8B5B8pXmk+Q2nqD95bNyTIe4r2pvF?=
 =?us-ascii?Q?HVci2788xhwoR+Te1DUZ//gusl76FG1qOxMh5Ch6pJAOuifcQ9qzZTeyzoVr?=
 =?us-ascii?Q?KQAnv7pk843tHJyux18+Yv+nzPxSTh65K6niVmu/x3A/HSGy0BA2ShJk8cO8?=
 =?us-ascii?Q?kuJnlJn9OomCiulgnqyTz/VAKPY+ZTG3Msu2H+U0TVf4OaBwDZU5g2vIp4H6?=
 =?us-ascii?Q?lE00YoJPTIrwAe2LH6M7jX7j7tb9DrZKWWztmBnqIVhH1cUc/Fuv5HWOZqaL?=
 =?us-ascii?Q?mvYUeJZPhJdlqYx1IKHwVrIytabhjYXR7znNML93o2bPQTeu/GzWnn3yljQl?=
 =?us-ascii?Q?TyBaFmbBrCT/sD3K6Dn8tWhfR9e2YFUB+ARFjilfjQq5j217cW1UH45VXmbf?=
 =?us-ascii?Q?z32x6SVNZ6G65hmEYrtyezgw1YUfP1yGDiRyjlZ4HI68kEWLmguAlnajsRjX?=
 =?us-ascii?Q?/haZOJ6UE5WejRy5v8v5TItE9x2HSwgobBhbazQloCTn+y/o1gfbRKVGzlVg?=
 =?us-ascii?Q?l98QTUew8EtzTrSbLw6J6fs230w91wYGaaWTbgXM6p7HQ5wydjsQXIJxD+fg?=
 =?us-ascii?Q?6tf1rrpmkCRTFjwVuNZNAtRfUSfz2RchZjuFzUoHDV8zwCQEmPgDxzSb28Dx?=
 =?us-ascii?Q?6haUF/buCmLeKctZoZ1sSP4GN4GA7pPbv0G+tm2Q4NUwtDVD8Snw5sZBsBf/?=
 =?us-ascii?Q?kfOkkatJS4nJVTOq6T69SWY7xibNui/hFdXxm3gaY2hp6GThPcOBgwkd2K7l?=
 =?us-ascii?Q?nUI4OFsNFBkXbRceWgXMzu3of+ezh3alK6NupX1Udit0A8DM21ZjVAWfXQWm?=
 =?us-ascii?Q?8r8fu9fhGQoOPNYeg1+zBMSf8TcioeF1o/QJmZlXlVtsqB+vm0krNBRaH+Hn?=
 =?us-ascii?Q?cp0heBWp7TRz8TIRUdxMKuwDFGCyPcxomiRuvtQXbtzrotGQIPFZNuR6vRXJ?=
 =?us-ascii?Q?YytrYPLFP9WVoTKHtohFJU1T3C5kNecKQSyP201Rci6NmcC0bPkXTGgXOOQr?=
 =?us-ascii?Q?FI2Q/dMaVDZaHIe31Q1h4dpgTL++8HcHQS8+P2K/LepgdJYHT+iUsvhZ5omD?=
 =?us-ascii?Q?GStQ/Ac0ftK6JDHSIfmTJ4NOik3Vca1l++U5kihxEKa7DzBH6Xbs200+bZfk?=
 =?us-ascii?Q?5q3m0WiONuvtQV77jYJp3FLTbsKdpTML1Uz3oQO1may5M45J1aOkTWc1cuWk?=
 =?us-ascii?Q?Xp95QeltZ1SWuYtwwopAuc7LL8NaaeuvrNN6O4lvlVdNjMUU2BCn6bfLy+t7?=
 =?us-ascii?Q?3g/1zjQI7UXN/xytS4Q/d2Gp4N/h9x00bItKuDke?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92de482d-5939-4306-ee86-08de1b5083d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:16:15.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgWmXPoa2TuBBDHB2FNWHE4OZAYb6sXwbhH9DZy1T4FZoH2xnb1gelb6KaHhq28ElstFmuTVd0QBbHSpubZEdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

On Fri, Oct 31, 2025 at 03:28:07PM -0400, Frank Li wrote:
>On Fri, Oct 31, 2025 at 10:24:55AM +0800, Peng Fan wrote:
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
>>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>>    Whether using CPU or LMM protocol to start/stop, the M7 status
>>    detection could use CPU protocol to detect started or not. So
>>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>>    status of M7.
>>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>>    the M7 LM is under control of A55 LM.
>>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>>    the M7 LM to save power only when M7 LM is going to be started by
>>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>>    M7 LM is started before booting Linux.
>>
>> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
>> initialization. In future, we could add the support in Linux to decouple
>> U-Boot and Linux.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/Kconfig     |   2 +
>>  drivers/remoteproc/imx_rproc.c | 192 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/remoteproc/imx_rproc.h |   3 +
>>  3 files changed, 197 insertions(+)
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
>> index 232eb91e0b5dc2432131b1c140d6688b073fea1d..1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -8,6 +8,7 @@
>...
>> +
>> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	int ret;
>> +
>> +	/*
>> +	 * Use power on to do permission check. If rproc is in different LM,
>> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +	 */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret != 0) {
>
>	if (!ret)

Fix in next version.

>
>> +		if (ret == -EACCES) {
>> +			/* Not under Linux Control, so only do IPC between rproc and Linux */
>> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>> +			return 0;
>> +		}
>> +
>> +		dev_info(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
>
>dev_err()? because it is "... failed"

Yeah.

>
>> +		return ret;
>> +	}
>> +	is_cpu_ops = dcfg->lmid == info.lmid;
>> +
>> +	if (is_cpu_ops) {
>> +		priv->ops = &imx_rproc_ops_sm_cpu;
>> +		dev_info(dev, "Using CPU Protocol OPS\n");
>> +		return 0;
>> +	}
>
>does need else branch to set  priv->ops?

The platform default ops should be set to lmm ops, so there is no need
else branch, see patch 5.

Thanks,
Peng

>
>Frank
>> +
>> +	dev_info(dev, "Using LMM Protocol OPS\n");
>> +
>> +	return imx_rproc_sm_lmm_check(rproc, started);
>> +}
>> +
>>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>  {
>>  	/*
>> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
>> index e4b9ede656506142b260aa7515823f489a168ba4..c05bfc4528f3b7518d4f2272d15fdeab1a68c2a3 100644
>> --- a/drivers/remoteproc/imx_rproc.h
>> +++ b/drivers/remoteproc/imx_rproc.h
>> @@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
>>  	enum imx_rproc_method		method;
>>  	u32				flags;
>>  	const struct imx_rproc_plat_ops	*ops;
>> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
>> +	u32				cpuid;
>> +	u32				lmid;
>>  };
>>
>>  #endif /* _IMX_RPROC_H */
>>
>> --
>> 2.37.1
>>
