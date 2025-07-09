Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEF239594;
	Wed,  9 Jul 2025 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752047548; cv=fail; b=c999bzzJpAPPWwc/GkpnfQOJjaCsrMFu6pdXhkcRR+83qv+cZZkZ38SHvTaI6F2dRyxhAQjoYhj1VOiNJv91DFOCkEJqvUQeGo5ROXXJBT+8yI9NT4Uuvhamd13nw/IZ4BYjY/8fFkrFeWQfa1bxX5se6iA5k5qsljDf6zVrA6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752047548; c=relaxed/simple;
	bh=kG0+SAod22jx1MRfp7/1eI5jGt8TAJYBi4uZOdvG2dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OE0HweiWlsP1UYZI+mS1kXNikc6RSJbaCdKIIHFqXvew3fzvnZmW5o4cfXHbEm6GxL066eaLcpu0YGbvPUJ/7jrnhbkiCwsHtaF1V0JhcRUwuKLVBWUgAwSpLhmovu9/IYFhU2ZIr104O+QzBOtBy86ntLwKPYErPJjU6rezy6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cdNzx+uA; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cdNzx+uA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGTQpC7hnUK2+E00u6ud83PeWEL1tj6n2To/M7zhgfiYKTPuBe9Bvn47AXA7oGqfJiNVWaikE+ypCCh7neiBPsr5PHmMhztA14cPJHAGqaWvOcyY5yQ1gLh/OhD9vayOkw+PEcVHvaNlj3LXRvCfY/Tv5l3OOs76i156e04yUo7a1fQ1TIcuS5Z4eddiZhuKuY4yHtHYzbBMC2Rs3dBZ3gxFHL0YQGDmYY4U5bgfMwL9JyLJkdGK4l+i6fmUOfmOw76MjXXTeoqox20dZeDIgSj2DoxMTgoHIMrTHad9ELoRzS9VaBD3YNV1TSxYhrzIFL19HAfgJDY3GPWb5TaO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvT31bl+A7lDCvyTBcji2v2o9vBTz1J0hTc90n3Nan4=;
 b=RfahomWJZxXM5iiEfNDOzqxsdTc09Njw3WsJjM3fugYJv9LDD09G4p0A9gDaOEb16zLpVTULDPwaXD6viZtUKCx+V4D07DKBDV6oYDwqlYnza2oSJPOWffvgyOc+n8YdyxdOt5x7J1ELICLjZCS63fMQIXIyXGUakVTh96pans0anOWQlLeDg8Lqey2+ftHbiUM2XdbbGIqKAjgxYMeoCb4WOIMWqy9ChTCL13GOCFMGtfOHdvNQ6Al95Ou6gITQaTx97SgtAEqUcvnaHAApwufscvdn1CzK8bkZ6zgDYR1FbS8BUa84cFVWVH7cc6kG/LinJogLA4wX7K4FLHW+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvT31bl+A7lDCvyTBcji2v2o9vBTz1J0hTc90n3Nan4=;
 b=cdNzx+uADqA4ML7Y7aaZCDmuzLpR7Gy0iDvAld1F2uSBpUK+lGBKY8QL5ARV0NgwsBJK5Ao1U8HsRzhAeTdno0UVRT3cvRhA1HaFt6E8HZvqzm9Eg6xB0s/oedql8wTTB8872zUJ5SIjLwEFgP7WuJrzGL3RbwMqJY/+u5fydiGc8TueBZ9DDcYF9uPgrNu88kkBCX0kAaeGqI4/QQARw3akTYvSX+0JCCmT2nzqCWY0FavQxUU6wqiHdJxXiCP//oX7h3NH5fzGtrvPnZeivH93DfU2s1abrVRDxr+Re1NMNciRF8qoif3tOraXH2fquhgGxmaa0FtypZNPb5qQfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 07:52:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 07:52:22 +0000
Date: Wed, 9 Jul 2025 17:02:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20250709090231.GB14535@nxa18884-linux>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
 <aG1IIk42q8OmGsQH@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG1IIk42q8OmGsQH@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: a3fe83aa-feb5-469d-908d-08ddbebd8941
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OtGjSRIdd38nzRAGKN8XEtKCmK9yyn4wJ4Vw/207eo6aDZXB6H4Av5tDVqXo?=
 =?us-ascii?Q?XLHVnKrAcVndr5I9HmC/A0QFXvfBZsYmlRR2EKMOBtER+b+6kcwCgWi/MfHC?=
 =?us-ascii?Q?N4uGgD04PnF4qYrT8oxVnUT40woqHUQryFRFTSNgaLeHbchPpoHd/238uN+n?=
 =?us-ascii?Q?kzJOP/pLYll6Mkl2lSpu0b0e9bFv9XV3d9bKhl3tB+FUGzT2bBmsYPEhIcb5?=
 =?us-ascii?Q?uJ/uFauLH/5ZXJpnEs+FPHq+e+aw4RUyj6NybF+Iff/wZymI0NsWTaNT5kXq?=
 =?us-ascii?Q?ovabuJPSdIQThlwANFqwnRBvLOV2smthYH0ZRiSg5f6tbCxeCk8MoCEEeI5x?=
 =?us-ascii?Q?xqxEIr19kqd0GbWUeSiOuohsoyc8l5JzvoQFZKBlIVUflzAQwxofUjGAPrQE?=
 =?us-ascii?Q?Ve6oeMPKmpgkMX4F3WiiAl/2Kz75nzoaomEOXL/EQHtS3BlgDrN+cv6Y8Tn0?=
 =?us-ascii?Q?CAlkFLvqCExBR808VIliQGJWo7WDySaDCMkZSqK/DtWYQXtxlr+MOMQ2qsjW?=
 =?us-ascii?Q?e1NNXmAMTzM8BBlAgP2IPA8k5harqlONiclJ0zzRUftIVIUmwqEt3R691bYR?=
 =?us-ascii?Q?ZtAlHEpfSyHf4g0TWcjINR4PCEBYYTlY4zyzf/GRBj0PqetyxohDpUzHppfC?=
 =?us-ascii?Q?raXSWQqpdElEtPhb1L/7Y4JnKVTozfaB8l7D/fPM44OFcF5ARkKAvEcWDiK6?=
 =?us-ascii?Q?Ld8MfmT8wU2CbItdnN7FOSiN+XegkORri60LQmDgubFV2hYoeXYEcvjZpWXU?=
 =?us-ascii?Q?kkZx5IZqJCqKuhcVF10HK4R75yPDP7hqlBd90KCyoVBYqKUchAhU1GQuxae7?=
 =?us-ascii?Q?WAOY9zICl6WfjKUo/gsqFPnIPT6NxakiDojmcg27r6Y/ZqBFmmFglUcgqR1N?=
 =?us-ascii?Q?prveOTsu08yqqXoZyRRmce7Yp+otF6KE5aZOcvCJ0p5BqCI4qVu8xaZad8gD?=
 =?us-ascii?Q?+3rxLe9TB7hV9n+zLIyc45L9h/PiJyUW1/8SDGtl9A2sPY/CSIb+auLC8CbB?=
 =?us-ascii?Q?olsIWPpLW9zbTnOPG0N6s3uVIPA6fWcBBRF+13clw0DkO7iooodryRe/GMSk?=
 =?us-ascii?Q?ZbLiQRLUfVATSnkeniqY6+2Tm8X6SaYJibOO37u+LzHQVmGjLSWiv7/zNVlE?=
 =?us-ascii?Q?pWVg/d5V/n+2BFwBeEBzRVb5Kpb3AFkqT6483kHh3/GeDpl2g8oOSUHr9Dtz?=
 =?us-ascii?Q?TaIaMwroqHR8VWnD6+UDndZlgDfgWchNVTFGODeXxTrq+3/aMOnLAGjKsqlL?=
 =?us-ascii?Q?8vuYMg78Zwds6xB9L5teK4nhSGaxkn3EI5cVgZ4Y7nsWDBRsPrI50XoJxYHW?=
 =?us-ascii?Q?thQWoxq4TxzqmY9yj6ZdEHWeVMRVOnvbmV39Uc7vqgdAlV+c1/OE0zPrGMGv?=
 =?us-ascii?Q?U8f+zH7YYhAah98ti1Vj1lvrI4VDy5/m6PPEheueNou2Pb/Qvaq62gHpm+xz?=
 =?us-ascii?Q?QUXZI98EFzUeheadosiBurquGdn9n3KIhEVH1sztG69waofjNu4Clw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wbk8INWweMLyum/FeUTyzFJ6kSBDLI+3Xjh2s+lzH+vfTa3wPwfV+fhJ1s4+?=
 =?us-ascii?Q?GgnQc7TjY/yoKH+0xSzS1umLEYNf2esWzQR3rwcG7ZNlNHTDblakOKKdmAp6?=
 =?us-ascii?Q?QEiLr4Z/P2bnZTDBKRXBukiU5bIngGfjqWymMuEKeiUYeFxWOXdOIgzThgES?=
 =?us-ascii?Q?0Tbuc4R+hfnMizRUA8HTDVPaWkN9Md62A3wpcbB2uSL4YZIFPeLB44qJkxL2?=
 =?us-ascii?Q?I3+M2kF+n107LbMbPPJj3zL21vVOtLMVB2OHG5RM8yjm8XYjTuBkyrcIpWpn?=
 =?us-ascii?Q?Qj5HwZsO03OreTeICHuMkR3+RLXHiDxmHYgb5zdLJFXVr3kUIdzDXtzc4EDo?=
 =?us-ascii?Q?9f4pwXIBhvUt3ViRThOl2ZMV5W32h/prMBhK1DlufY+1eX6Aq2ydmmebQb/I?=
 =?us-ascii?Q?ZHRv6ux2rzXumrEuv9mKbBScYu5Omb+ObmcZf7r55ZcTrwl4DFVS1AbDxXjG?=
 =?us-ascii?Q?xG93PoTOANNtfq6f4468nPJ1lczwxlQ6T3xuvFjc/sL+7IKZJFKssmLGGv0Q?=
 =?us-ascii?Q?kgA3Qbqp0/ZVmcXNkWEw/0sOxBBwmA/AGIRyAst56obiYD4aNyMEL8gNJpLv?=
 =?us-ascii?Q?ws1w63BEWq4xL9W9NL/uEN/+USMhrZDjr3366oLKRB3Gj/d47f16+72oteu5?=
 =?us-ascii?Q?fdHPsReOvFIcFvZpeC7l64aEm+P/hWQ4qIswhDcoZGbHwF8ls60Pays1LBHm?=
 =?us-ascii?Q?r7KNMqfZU3lNHqIeXYKCR3w8J994I4yJFZHGh4lWZLKcpK2J4kio+gDTcTCo?=
 =?us-ascii?Q?JpWxgcp2zdM/nFZu0+eyUQNNUSNC0JUpeu8byBM7KEZ0SAiEwLG7gbO/K4LX?=
 =?us-ascii?Q?Bl6SthyPU5MT9HQogdJzP2xK1WO/tbrowASEHVIl4XtJTy5fFXuRZG0Ys+8B?=
 =?us-ascii?Q?z3xz3Zyd7nePO2eUAeYRlBHV9r48mJov4Y1LJOb3BO2pqXagvC+VgZ6J6yjH?=
 =?us-ascii?Q?sm4FGZICnV9GsxwnlWubpsg7BeV6a+xklxfJd8Xzl0NCO/r1yiu1UwR/u+xM?=
 =?us-ascii?Q?WOKlMpAM+XpmqYSWrv6brl1iZ/FoYajT91tv31pf9YoP0nLPih1mnc+j43Qj?=
 =?us-ascii?Q?x8dt1uiSb76JUy6nzpCTuLOunp5rEZIzbLErAY0hi2QD3CXNRsoZoQ2Q6eMR?=
 =?us-ascii?Q?ABUulKO3h1igsRHJPxHVoeRty3EvNJSRHiHppfn1FogGuTHwWWMXVihzdk1n?=
 =?us-ascii?Q?s31djcNts2AySkAJQG5nHN8Jdo/JC3adEHnJWaNJvf6pRwxzn4nnZ6pbA3qN?=
 =?us-ascii?Q?2fq2HJY8TDJKkvqaUigvYdJ72/0yNyDpxI6AHcd03Bo5yLSHw9L47xGxivKl?=
 =?us-ascii?Q?jIw0f+0GHBRb+JGtQpEkiD6YBvyYcHoVqfWTG7ET8nQML6pqCSVl/RdJLsiC?=
 =?us-ascii?Q?wKx4rOC19yhsh1tbNbx3S8iD/ojHdh0A5U6Yzg4w3+nc79z7s2Prl+SQ2tqo?=
 =?us-ascii?Q?O1RFqUMOa9izlva9Lg0AJtOOKYtu1UxlOpqujoOgVdqKuAfBAeeH0sO5Y5Bd?=
 =?us-ascii?Q?5UpNWlndYrKXpxYGh5/3KJhhJZFN0GdDqEX4tY2JURv5DDh4GwkcjSQ44rzd?=
 =?us-ascii?Q?/SseLyY0QXaelcwdRUsJaJ15QyFmKlS/GhvZN31p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fe83aa-feb5-469d-908d-08ddbebd8941
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 07:52:22.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt1+zeo/OoLG9kI3+wwYOjxvS2hr55T+VMCdHsEX5pz3bB/F57xMfAWLoCiCMKyabh6GVktEt5Hi1NnDbRwbPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

Hi Mathieu,

On Tue, Jul 08, 2025 at 10:32:34AM -0600, Mathieu Poirier wrote:
>Good day,

Thanks, good day.

>
>On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
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
>
>Thanks for the context, it really helps.

Glad that helps.

>

[....]

>> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>  		rproc_add_carveout(rproc, mem);
>>  	}
>>  
>> +	switch (dcfg->method) {
>> +	case IMX_RPROC_SM:
>> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
>> +			break;
>> +		/*
>> +		 * Power on the Logical Machine to make sure TCM is available.
>> +		 * Also serve as permission check. If in different Logical
>> +		 * Machine, and linux has permission to handle the Logical
>> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +		 */
>> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +		if (ret == 0) {
>> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
>> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>
>This is set all the time imx_rproc_prepare() is called - isn't there a way to
>set it once at initialisation time?

Yeah. Moving this to probe path should be ok, such as in imx_rproc_detect_mode.
The drawback is M7 logical machine will be left in powered up state if
moving to probe path before user starts M7 LM. Leaving in here means M7 logcal
machine will be only powered up when user does
"echo start > /xx/remoteproc-y/state", but needs to set
IMX_RPROC_FLAGS_SM_LMM_AVAIL flags each time do preparing.

If you prefer moving this logic to probe, I could give a try to move
to imx_rproc_detect_mode which is probe path.

How do you think?

>
>> +		} else if (ret == -EACCES) {
>> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>> +			/*
>> +			 * If remote cores boots up in detached mode, continue;
>> +			 * else linux has no permission, return -EACCES.
>> +			 */
>> +			if (priv->rproc->state != RPROC_DETACHED)
>> +				return -EACCES;
>> +		} else if (ret) {
>> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
>> +			return ret;
>> +		}
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	};
>> +
>
>Please put this in a function and get rid of the switch{}.

ok. Fix in v4

>
>>  	return  0;
>>  }
>>  
>> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
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
>> +		scmi_imx_cpu_started(dcfg->cpuid, &started);
>
>Function scmi_imx_cpu_started() returns a value that is not taken into account.
>
>> +		if (started)

I will update to "if (started || ret)" in v4, with ret assigned the return
value of scmi_imx_cpu_started.

Thanks,
Peng
