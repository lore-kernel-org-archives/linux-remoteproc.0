Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D61AD517;
	Fri, 18 Jul 2025 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822671; cv=fail; b=s3HQ1gXnVLuImW6oY8b6P8/daSEHfxRgww2Va5FyuUv/aLMGBEJYvD77AeTO5l4QQpRnDI5iozSzG3k9jcb29iiYwG2wtM+rPDug96+Arv4gbxWC6dpCCuFjGdZI2Pdynm4wKEGzUhEnP0ltxnHYPXEWBD5aLZNa5+vOTu10HdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822671; c=relaxed/simple;
	bh=o+so1/ngPoEqE5Y2yEX8Lt7sbDsw2ZAFOMqFp4Qmzoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uo0K5cINGtAR/VcbVhG1poidMFAvwG1CbLNuBTEl+fWBkmNofqeM/3pCzMDkMK8fhQqk6hBLW4N8g/LJSrNVJMYsowPYOzNBdd8ObKIScdN7w6mthAs1uVdWr2tqHDQI1aaqCcQjHQVitTFoOAIwGQRZ6kz2E+7ag97MBtwpNtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pUCg3lP1; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pUCg3lP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ek7tq0RnXgJPVCC22GavMMldHUJl1nONBiAFiLysf69iH/gtfj6yWel0/uvRBdyT/2q4CUAm9LQZ9rxrlIGlX1FGWY+iQEcYL4u/W8ThlL5GrrIxUIQJAceDd4qougsdjuWyBklFbH/jVbq8dG14wsLEltQ7voffHlcaEyPtCZDZCdKAU8gz5ZzK1p/E9SRfTuYN+FbnpA3bXlgQzIIRtxeptF9uhEx3mHhXKqWejnxK+sNAqQ21AjJUs7Tia382nY3Eidbe1YY/8JCboExPZfZ7XYYYn3sUNm/7/lpChwyjda2qAJSDwHXH9FF4pGPlVjZsScL0DD+C+nWu2G5vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJyhAQIcn+drmk7BokhZ5ejaSs097KEqwa0IDxxkGbI=;
 b=Cqb4eShmr4jd5DVHx74DjzaXr0vfh0E8yrKaA4V6Xin/FPH1E4/3M2dZBZKehfO5w9gEteWm91TqvCmDjXtrvoakYH+fLFfE+A59EE1KoOwNflHcjfPbqEJMi0stKbweElfFDWhHOvU24YaqcQB2lAYX+5ePga9CMS5I7MKjV61aidOasehghMZ1o49rlSs0/r1p5nU2cGr/cm7x0SjKO/SOLwt5Y4GLHoFnaZid+DU35qiKEsU7/rm4N7pl6YQ8JLdctBE8qxR82RUoGfsaWAHwuOhXBLJX1MgvosCobk6EVellkNJWhCR1ecjYDLouvk3/OnKErGo2eDMMin2Bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJyhAQIcn+drmk7BokhZ5ejaSs097KEqwa0IDxxkGbI=;
 b=pUCg3lP1MXOif/euJdk+V+S2O9RSP6ixMd5RarE3DXV9wnfudW6GK1vS9JFLxYCO0DkVyYw1md46qbofqqYDMfmXZG5pw+cTBqUm0XMYpJCjtb5yEB9wlbc+SD4su7Zxi7JB24TvINeEQWuS/PbQ8XX/gWPcNIxAYpuY0n5FZZ8ppJXii7rb2DYGH1RViy/NfyNN5oFYPyiErJAxkmMtuavFvbPGQYR+bG9f2KxQhH6FnOjiStaVPOJr6fVPqtTMgTw4IsYKxXPiwKJSfVzI8FofdOnucN43veCA5HMbxVupYStF9KFU308PHPcmapiwgoWLLdzuhMfUUwJixwCGqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 07:11:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:11:05 +0000
Date: Fri, 18 Jul 2025 16:20:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <20250718082033.GA25126@nxa18884-linux>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHkNS51jgV5ulsNB@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b7aebb-8f95-4c95-f3f3-08ddc5ca42b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JyJD4e2iuWSu1ec/J76ksxSE8jB40Sx2JfAHhd8dkjOImgNIETXYRrr3gpAc?=
 =?us-ascii?Q?8fikcLc01bMxbXUYJSPYlWdqgwWbdffeAtXduJiYreItrOfeW2BLK4TBIUUw?=
 =?us-ascii?Q?JwcWaxxoz57QiTs7PHTnov+UJrfgfp33rTQ4wZBTrqN9MiVmRd477BXn6ZVm?=
 =?us-ascii?Q?tCRqUZKPCs9y5Cx57x0tBOw4NIo/EkuxpS5FuvBPR/9kgbiGg7bu5+LSptTp?=
 =?us-ascii?Q?9NgQS3DCUqKtJGnCBYRRqnRBaOxQZEonhqWZqWEMPftnvx0K5+BLZnDW6k9E?=
 =?us-ascii?Q?xbx4xCHL8J+rDu0Gb+dfNuxjKuBUQjn7fntwTXzjQw6SjPUjQY6HPFYU4QI4?=
 =?us-ascii?Q?Q/tDBWNHQQEy7iQGevlGJCtSUIV7V83eZL8lIi1e6nJr8ItfhVgbWISaEpB2?=
 =?us-ascii?Q?n5IvpERnNyu4EIOW2ZMnhOOSsRwDi+maCpRLVkMRif9CNePNuPv/GXvhTEqi?=
 =?us-ascii?Q?0ZDXNbZSDq01Ec2IWh23fKFltyF48lJf60oj0nhRWEkAR1wFEPDiwtlNu9Fx?=
 =?us-ascii?Q?mcb+yXu7s0FO1qwzMF7wVAKcRy61fkr1r8kFLOIo6GRoL96mwazsQnuFxFwA?=
 =?us-ascii?Q?+SCzhQP+M1Fs8+0lvToGR8lg5aYcRQtiqgZf1/7Gpyadw5zk/s36Hpi3K1+H?=
 =?us-ascii?Q?V8k3HCRVi5XAghF2uB58AD+HmiFHaIxbkEHuncygxZNeLp9VXVokRGb5QCLu?=
 =?us-ascii?Q?PgqCco8CHHufKP3dP+UD5ZfuC2pn3TIm2s22QEpT9gaJBxy5LrHi+eDoVO5/?=
 =?us-ascii?Q?MhXtJyF38ixseirANy2T/YN8mvOGAa3vvL9Sj9+GNe8P2m5ULlFeZ1LZ4p/h?=
 =?us-ascii?Q?p6FQfYONiHu+qDoZ+WO9d2b99IAiPx31aeuOAD0rxez/M7U7RPIIpY73eYh3?=
 =?us-ascii?Q?dI5sEC6tv6TdRAm+HsXiuGPIu8iUsq42Q9uzAMRu0cZyxRUYZp10/ZY3ijG8?=
 =?us-ascii?Q?qsfgtSL9R0/ZCVUDsGLIOX0oU9DJs9v0Bv/+7awcQggI7W0IQ50BcXKi0oet?=
 =?us-ascii?Q?wmRhF5XaizsAqL2RyHmAnCzO07029yx+Rlk6V3dOduueL5b78UyG475cPvXm?=
 =?us-ascii?Q?zDGV8eiFLlV9K82oXKy4gsecg9ASdxzAOLwOQL2xmoQCnTVOez8kvCUxitfW?=
 =?us-ascii?Q?Lf/JAkF7+VF76E5b7wwAhW6ifdHWYeLsgFIPIq6qr8yM49cMx6UeTHFj3QQ+?=
 =?us-ascii?Q?lE6v1EPcEmSmxi04XkHKvD5OsHURy3bRCFWusxovQD/SCa2lLdx0q6AGQltB?=
 =?us-ascii?Q?/jrpH/tIrwIKEPyuzWx8rB7AfrP9dJAS1wJNvLLtVXHr+97/jh4344ujzSAa?=
 =?us-ascii?Q?Ml50V8reUMdVAgkSX1ZH7dxyN8x5ragFz1/THWOLPioc97NN8xZ8L7nNjhs/?=
 =?us-ascii?Q?ugrc/EOdHW01La8CfuSRF5pjuBRBLcCMjN5vzIXl/kMjT43cXPSfnMyVICzb?=
 =?us-ascii?Q?XQOpPJUWBqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kInfMB+vXA0QhLkc4pN639Ck+ZP9mHKXv4J0m11BGT/paJ75l2jMrVffoE2Q?=
 =?us-ascii?Q?/mJA3J37WiD5H+1KSbnKRd3Uie1AduBKOIn3V/Uslfmtej+QSyaq4CLDPfbR?=
 =?us-ascii?Q?Avmm3QCwv9fQFRwMNYtZ19F6cqHFKEqAG7/oo/CYnYLRz0Nqfnj5hkTcyD+V?=
 =?us-ascii?Q?a1/GVEBqthIUYVN49q48x8crp3FwRJxU94YkR9ncTSJHyud22/UBSCzRwbLk?=
 =?us-ascii?Q?R8apuH7gMJNBIoLKGTyOvHZviK8gjn8BwihIBQNdWBPrBwjd6nUo9mYESmTG?=
 =?us-ascii?Q?KZR7Z6oLn9yZ8tdCup5QV7pJnW7U6Hf3ymlAyYFInoGucYWZnjmvZ3+3Ivu6?=
 =?us-ascii?Q?Cd+AVJKbtbvkEfXxYCXIg6IK8VV8IU0VVX8irsI5lu+2Nir62Efx0mr2qZaU?=
 =?us-ascii?Q?L2s9hcZi7bbi34OBPcqyBxnyGlo//AlUAlSzMZlY2A9nKsGVwT5nRGptl4De?=
 =?us-ascii?Q?DSgG3hb7ko9A+pEhJThu9TWyxs6JpIu2ry6vjiNiLaZlTasvYbwXCZ6tS3Qi?=
 =?us-ascii?Q?vWEMKMAam3A+AnltyJFAI2FIuZShgcYLUGUZUFr/lQ+juvSGm83Gkip1cmB9?=
 =?us-ascii?Q?dp7oIS/MEbNEUN03QTXfyjqkPnAwUlbF/CASqC/53lMrDIHVlf11ts2/UeUZ?=
 =?us-ascii?Q?bkFiWzRVQNNTUuFyoo4S6VvPuPpcqGMdDCUD2jGcC3QaAepCp9n4MHXDcPC6?=
 =?us-ascii?Q?ENBsRhIIMWijpiF4fIwqf84HHJxEeQ8pRpSahBkO6Ha/nGVCAL/HfS5RaFyI?=
 =?us-ascii?Q?D9jULlEr3NEWa6lhswXGG16a1Y80nj8dAreAafuCke6FLvLjm5TtL3Z4Re3G?=
 =?us-ascii?Q?n8GzazQRHwL4lRpBvRpG8bdTKo4yGdKFYBm18FI7r0FtDqXtp1Iy2qV1ux0o?=
 =?us-ascii?Q?P5wpOQJwhFA3UdTDtt9YBOzdTrELSxB4IyzmfovovM5rImS8aXDym6+eW1o+?=
 =?us-ascii?Q?du/AMIlYp+8CCp0tUh1xVVI/YAn/5iXXKKi8yjhxHV/OJWgNBV265I2xreTZ?=
 =?us-ascii?Q?k5blQeuMu0kqt9E1+xdHPeP5GrzxF4aAWDZKYH/hS8tXqIkHAr5cB+z3g5go?=
 =?us-ascii?Q?4YKPV7N6MsGOSO25J7er0Mk2fUvDGGxmd0USsmuMKMHDdagPwsmp4NZsIgE+?=
 =?us-ascii?Q?YhE6PcSF/tAZk+q1ThXrw6xxwRz83kIeew4C23z0TupyUSh7P1oSt2kgLLGg?=
 =?us-ascii?Q?JLs4cYStAzxMQexpY4yjKJdzdVVYy0opluORxMVGoxS5zsY4jpKRPKWtQQS+?=
 =?us-ascii?Q?BqX+oVURUEbG3nZMLl41mYAr6eWFo5MwFgG5Z/7azfg+6DtG5gLvIvgrJuM6?=
 =?us-ascii?Q?ulfmYlCSFa1g8i5TJCFGZD8tVVR4OorF3317n2jDTfY2flyxEvq4SnzDwYnF?=
 =?us-ascii?Q?W1bHWrPJ5MqECiRCeAAKHQFjllq2UB/m6fXwaGroXKMmF+McZ/XPSWgDQfKY?=
 =?us-ascii?Q?QOu+D06QgKczaMkIrUyEx8YdoLfz+X+3W0N7XXlHvG6hM2MShyeD2zoidCc0?=
 =?us-ascii?Q?KMqv+2obnhuIqRxkK2/dWylSsuNecUKZCza2nhRm1MIAjkuGuUiWj+vy1kdL?=
 =?us-ascii?Q?mPY0I7osG7ykmFf3Z4NoU0yddkOYTKj3iarY8FM3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b7aebb-8f95-4c95-f3f3-08ddc5ca42b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:11:05.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhESLtMMO8+5LbWPO8m3aeG9FXhTPYn+7fzrUE2YsTlE0fmSgkx+rHw4pGMIkLBMCwmp7EDaAlmsEFJ29Zoaeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131

On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
>On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
>> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
>> > 
>> [...] 
>> > New warnings running 'make CHECK_DTBS=y for
>> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
>> > a7123e857dfb@nxp.com:
>> > 
>> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
>> > scmi (arm,scmi): Unevaluated properties are not allowed
>> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
>> > unexpected)
>> 
>> Same as replied in v3.
>> This is because [1] is still not picked, not because of my patchset.
>
>I won't move on this patchset until this is resolved.
>

Not understand why hold on this patchset. I suppose you may not
understand what the error means. The warning is totally irrelevant
to this patchset, there is no dependency.

Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
&scmi_bbm {
        linux,code = <KEY_POWER>;
};
But this "linux,code" property not landed(missed to be picked up) to DT binding.

This patchset does not touch scmi_bbm. I could help address the warning
in the other patch, but I do not see why "linux,code" under scmi_bbm node
could block this patchset.

Please help clarify if you still think to hold on this patchset.

BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
what I should do with this patchset.

[1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u

Thanks,
Peng
