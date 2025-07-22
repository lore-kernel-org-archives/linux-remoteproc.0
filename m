Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C713D8A4;
	Tue, 22 Jul 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753148038; cv=fail; b=IVEvEYsuMBUZP8Pr1XPHWo47QkL6QSGYyGtaVE+k2p4Sj20ru4883JS9+aCHmkr1V7CneFX2DbD9yo6q12YB90QUZ54eOxhmeSNVp8hRFZX4sB6cv3wt3iYVwWszOYZP5YyTlC1RSlKhIsMroRDd6SKIFgF/ZSYcKiupyhOFtgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753148038; c=relaxed/simple;
	bh=49yxw/ISj94fSAuY9LTiCCuYgMyONW9TUFyr2n/JbHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N+d6m0eQWIZbkX3zfid5ARGgL4frSkAR2iIp/CGZ6kslGO8FCkr4b4El/+TmdxnNJA7g9TGqKA2lFiU+eT2Ii0nRXtbSca60CExiWc778iK2DVitFbUPPQuiOGRnMOyQ5EPOCVusv19LGMg7+Li44Bk/2uc0KfBwUB6xSoXtOko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qn1WnlQ3; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qn1WnlQ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubamCOAAHNbwzc+GoBIz5oRI5BvRLBef9YswK8dRyOCF5HnRxdmpiL7hFBzjujVc5e7Q1XnOu28tdiC6iKPDul7IbqfzkBNN9WrjkOpgIjyufItrwrkIrmKXyoVTTNmb5EZYlviY1TYd6Ds8rI9KRz/FBL8h3Wlnlunhe+t22efJcuVUJtP5M39R7RYe14JZqkA0KQbHoIoI1DlCSagYaxxyP/kRYRitaFaqGDhvoqlqSMdxvwHQ5hrfNix8nQ6e1+huWBoNksiZQwM6b3FuGJMHkN43RozJsiL4tPggKMPtaj9AMVtRBLuODH3c2UuswGekL97jzOPjkGA/rkW2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMaA81rDgxPq8so74Puxj9z5EX9BSXN4J+31eBa79a4=;
 b=irWKakBfjrKAH5hFKNoNqe9wzfs48uTYe1y/EDMVqOdDl1A7zbBmWJp5bSCa5NtId4tqzIYMQnFnQTflL2AsV1Z9oLlyCl7SfB+iZt1srBF92CyxB/J6nevs+HePwIbFMXA5+B3TC9KQ2VnTcoMzpP6fjSC78zNUlB+WbfaKiQdBntouaFTNaxBG51d3qol9yO13FCzPd0ifcTgr6kicbQ/zwp/GKyI04JdqhXve6yswwt9SmGnSSd3US6944a5fag0ZV2DYuGWiPWAigNvggkB42Pk3FSJVkwl8R162EH+4xCJkO7RFkrvdI5O5VH/CLJQICqtypitUW7FKTHQwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMaA81rDgxPq8so74Puxj9z5EX9BSXN4J+31eBa79a4=;
 b=qn1WnlQ3gsalCceSEEGdJ2j8I/2t6PLdkoOOi84t5JwZPRGjXbTelczBzb4hEQQ5EcuadPY/YBjwJIyGYnmaO+lYYL/XIp30QSZVcbMq/XvhkV6JGnes6Xn9gXdz8NZASyX4MEZiHHCR8FavufZqwB/3upfpkeVK/bIJy8aT8/du6pmBt5Hj5qAHuxTnEs5iFVhU5BMbcEfz8+lfTXXW15U5AqE9rWsWE203QdohYgwTklgSB0bSpbeOkb2tNEKn406008EzL9pWlRy+u+kLL1Ms7mI+eEOPawr8os7uq+s9sgeBJUM8bT60OveyYfKFGihhOQ9R6ko1yOgQS7+Ceg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 01:33:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 01:33:50 +0000
Date: Tue, 22 Jul 2025 10:44:12 +0800
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
Message-ID: <20250722024412.GA11182@nxa18884-linux.ap.freescale.net>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s>
 <20250718082033.GA25126@nxa18884-linux>
 <aHp-_BRk7Iz81OFp@p14s>
 <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
 <CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bda1915-082d-4e0c-23c2-08ddc8bfcf2c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KW5ONRaM7E5B5QehQGJsPGvKsGZqkRZ+SssEpsLPtHpdpX+0z4YbgHyiM4Ix?=
 =?us-ascii?Q?kEk8wl2veY273Py478hy+K8z9nZ4ZbdnuTNLXd6rhbENNH8Q+i7tAO/ZzTWw?=
 =?us-ascii?Q?iOjqlt25UkK1rAaSxuCeQY+OyT7t0CEKG+aasJ6vu9vgUQ9d70YGdB7To/db?=
 =?us-ascii?Q?4ehUHTD1HBoI20nSGMkJ0syzCUAcVoqPATJALu142CtTEBLcAu5gLD8tj0nU?=
 =?us-ascii?Q?Vq0ekQWtpBhBUP8RFRjCWLN7xtT3nvP/QoRyE6Xj7S5eYzuxDrG/VTLkWPKJ?=
 =?us-ascii?Q?vT3tbYDRia9MxdcRPIJmu7Upwo1QrjDdXnck+BrDRuf7oSrSHCo5XAekwGt9?=
 =?us-ascii?Q?9lrQ1hhdIR8Ic/AdWDAiaP1v1xwhrsbsjsPPBaCbtWBAV2EZR+53mFUcdyiR?=
 =?us-ascii?Q?HilarCy3bnYz5MXGC1R6WpAZmewIgIO/S9AeZBtrXv5eWhIR2uKjpSpB0uDI?=
 =?us-ascii?Q?p2+cBHqqQQtVN4xwl2XslQAaGbN3w9jEQvBNOsQgmoc3q663g3A4fPHZDVvp?=
 =?us-ascii?Q?3n0yNsYSpYPJ8fcz+nsJjVnUahakPHoJYJZXiD4l585i2gQRRXYRjfmyzg0A?=
 =?us-ascii?Q?6rusjSbRAwix7Ci3Ozz9sBZ2P9b71F6gTYY3aoo9TTPouREw+0TihfrmkPa0?=
 =?us-ascii?Q?STbHCOaU02LkpGZIbVXyc5VVHDeLSQBIPbjARtYiVNDpRHuBjcNLL1271vhB?=
 =?us-ascii?Q?7GXukRzA1kKRK6BtXu7zJikHHqmPYJcYIJ0dVxcZBdHmRrxCfe6DFimGYhE3?=
 =?us-ascii?Q?xwRv07JHzixAeMSnPFFkGtmq5jG5FhKyPHJGjLgG0gcaXDmdXpDcu/9tGg1C?=
 =?us-ascii?Q?QnbdFrXF7UQiqaq4sGXapX7f77dE7sGFMoiu+xq0r4EvSoDBKafS+j6ChyFG?=
 =?us-ascii?Q?GeYE3yeutFw1BppuYp+ZxW33fDxD18Z01QTJTlUOzjXakEbWkO0n7QYg1Z7Z?=
 =?us-ascii?Q?Ytd4vT/5Pu4395YH064iaQB+1Rx59h4Ed2cJttZFfd0BHjRXAG7eQWyJA4EV?=
 =?us-ascii?Q?CF+WmiW/2FeuxXQ7hKrhduLgnjqVli/koOdtPC56TCcBg92ym7B3QWV6j5C7?=
 =?us-ascii?Q?z4CpUnKxfDCFRr+e8LXC+qjKD1r3XjtwWZ94BTqXBlyeiL8z08ofxHN69nSW?=
 =?us-ascii?Q?OT/GE+GggEghMFQkBIWGQIBDAP/3EetQ/iALHAxkVCX9ivU4TsA552xPSFHL?=
 =?us-ascii?Q?YtfcC807aDeECOyQECF4W9LoRRzLajtSU0pPZvoKzNAb0CO5aHBMZlff873w?=
 =?us-ascii?Q?nTCWUbv6Wtv1Gel4atvWjOkraJvURMm9Z3uwLBJsZmRyOM/ttWG3NVVhQcCA?=
 =?us-ascii?Q?2EMMsU5Fb1wduIuqIQz8izRQphmgFT7wtu4BrIdHj/VgCChqxtjNpAQGBy6f?=
 =?us-ascii?Q?UAGNPh0wIZKzSFOns8TJ2vf8lv/8oI6xmzd/aFxVqcX7ITkmxlMJT6dYz4Jz?=
 =?us-ascii?Q?oRohRreIcQjk7Vi0hptWdIqWjZdVuciPLNGSTbRmTLwefEr6VJpBv3pKvJ1J?=
 =?us-ascii?Q?Ikun41M6tc6jPMI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6vFf5LHSMax6P1GX9hMRzlTvaFE3SUFlv9qQD13cgeNKBF7Dm9bERMq5XEGX?=
 =?us-ascii?Q?jYI9Rv6uzIr8QlwZbFK4tYcMnbRez80KEb702LcQNNl29c/QVb72DpD+yzq7?=
 =?us-ascii?Q?rPUDadEm8aPfRgBWGk+bFQFo4rlV8YtfXhluSyUbHC0akw3RMZ0aMNfzmuW/?=
 =?us-ascii?Q?qDYMm6xW9HYCno+vLQwsStclkrJjIscizflz+SM9rB/l890ucKBMUYyhwlR8?=
 =?us-ascii?Q?TlbWm5y1TMdSmqFOYUhgaDgEwaGF15OIhp1N3gtmtdPCbOScCNqYTkwgkBkc?=
 =?us-ascii?Q?WJj5eopYSh3Jd00bMUwGzXwhGhWGhaJy9WxB7+E6GXi0Y/Hr/B2NxolPkXSC?=
 =?us-ascii?Q?IFY8LIvgiWyT7rohVB7i/NCXGARJv7ENq28YNuUViwTnQoGeUCGBm61+4iXR?=
 =?us-ascii?Q?4ObE8z40TxTJ04M8X2cjGPiRQsjVzjlOCj8Z7DutUoaXGgLdYf2WAw9Szt3Z?=
 =?us-ascii?Q?Ud3Sud9KPsK4gchP5/ADsHCG/2EX1ai4lH2kvWFpeUm3V8aPxT4n/3ce/4Iv?=
 =?us-ascii?Q?t049LWwhQf0PS5aLPY5qrTAU69Dix6n2eMKWK0QDdF/Um0OqhWYdICSEXgDB?=
 =?us-ascii?Q?MHNTOwAUMhV8HmdpSpEBzDCqDNhP+WHYOzn8k/0jkvLP6G2LRCUh1QtOG9QL?=
 =?us-ascii?Q?x0Sn903w4VjWtd9a4pWe7n3n4EslOI41o7laRGM7H5+a8dsZL7HxnhttNHgH?=
 =?us-ascii?Q?i25sY8NpbcQG9SxFnNL4axfUPt307Stnvu46xdlikt1wp34VKOXIrEODE+sd?=
 =?us-ascii?Q?qA+WGRJ4QUC1WTZSIu2sM4GnqMDwu6/0Nyol5MHz9OrkCaL7qxivi0L4ed6E?=
 =?us-ascii?Q?OCqyTdImIu2SH6hU1BBJrQCfzyJhTBG8ByYlYisCFp7SlSjcfBk9PSjv2VEF?=
 =?us-ascii?Q?X9Uz5mxwCozexjC/AmDFJNM0ak5WYchC+0bkQzGYL6SKrxRthMzZ/8hWhGgd?=
 =?us-ascii?Q?nTSi6p0ZXfXvyohqKLps4pYQgO6RJzW539W7YarQZ80TCHKQsq2KALNlR+kr?=
 =?us-ascii?Q?JvaRNqNx6B41njQrjwSlZ7MnmehHp8nkTUq0tKJ5lUbAW3dfT2mUfmdeaS7b?=
 =?us-ascii?Q?0S4isPXTWJYNMJouM4Bbd2vAM67EcN5eqN2F8QDvPQipBVzeraEm/esBSrQt?=
 =?us-ascii?Q?Nha9d2FaKRu8LhPxM3Fi9ChaqlyiyXKlCMsGVP2YhdWHquzXeTP+vX1HC/tF?=
 =?us-ascii?Q?Cin7UOyL2XcUtSvfB85/XXwgUsQWYyQXpWBRZSgjG7OFFvwpPH/oJpmEQax+?=
 =?us-ascii?Q?dx0lirNEE6iZ5k4x8w1MRDccPb6mn3mwQh7hLlmOAu98E3CTFgB7Qm6i1vNh?=
 =?us-ascii?Q?HwKD+VnEUKjWelPwzvKjSkc1ysXhJzUfS3MJcARVXyp+paeY77r6k3OLFNnk?=
 =?us-ascii?Q?d0Q+VDNbnMm/TNsz1AVWl2sAwEsONY/6Ubf41Hxc2vOgIeromZSzs69iuQnO?=
 =?us-ascii?Q?aYAF8+K0OTkGUUU7G7icKuT731D9UAL2Yfr99IzX1IAH4Px0arS7P5pWBvBe?=
 =?us-ascii?Q?A2kb3tCrVcq4PX70eWG2FZurb+Y4+CKdOYbeBdSHIp0w5GEcO9sBmVautbq/?=
 =?us-ascii?Q?TM7SI1E29pLamn8OCValYX3zfv2czxmuchqfIb8l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bda1915-082d-4e0c-23c2-08ddc8bfcf2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 01:33:50.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqhJ1xeCuGtGQbliwakLPFR70xrvH66GlgQSU87GJfLAh8e+RnPhwOi/9QT1mzdlm6BUfDK+gMupRnQ1ZZxkYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9738

On Mon, Jul 21, 2025 at 08:23:42AM -0600, Mathieu Poirier wrote:
>On Sun, 20 Jul 2025 at 21:08, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
>> On Fri, Jul 18, 2025 at 11:06:04AM -0600, Mathieu Poirier wrote:
>> >On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
>> >> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
>> >> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
>> >> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
>> >> >> >
>> >> >> [...]
>> >> >> > New warnings running 'make CHECK_DTBS=y for
>> >> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
>> >> >> > a7123e857dfb@nxp.com:
>> >> >> >
>> >> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
>> >> >> > scmi (arm,scmi): Unevaluated properties are not allowed
>> >> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
>> >> >> > unexpected)
>> >> >>
>> >> >> Same as replied in v3.
>> >> >> This is because [1] is still not picked, not because of my patchset.
>> >> >
>> >> >I won't move on this patchset until this is resolved.
>> >> >
>> >>
>> >> Not understand why hold on this patchset. I suppose you may not
>> >> understand what the error means. The warning is totally irrelevant
>> >> to this patchset, there is no dependency.
>> >>
>> >> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
>> >> &scmi_bbm {
>> >>         linux,code = <KEY_POWER>;
>> >> };
>> >> But this "linux,code" property not landed(missed to be picked up) to DT binding.
>> >>
>> >> This patchset does not touch scmi_bbm. I could help address the warning
>> >> in the other patch, but I do not see why "linux,code" under scmi_bbm node
>> >> could block this patchset.
>> >>
>> >> Please help clarify if you still think to hold on this patchset.
>> >>
>> >> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
>> >> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
>> >> what I should do with this patchset.
>> >>
>> >
>> >I was afraid of that.  The best way forward with this work is to wait for the
>> >"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
>> >he, or anyone else, picks it up for the next merge window.  If that happens
>>
>>
>> I respect you as maintainer, but there is no reason to block this patch
>> because of "linux,code" property. It is totally irrelevant.
>>
>> Even if I help to resubmit that "linux,code" patch, there is no chance to
>> land into 6.17-rc1, both Sudeep and Shawn sent their PR to arm-soc earlier
>> before your comments. You could raise in V3.. which there was time left.
>>
>
>I don't know what you mean by V3.

Patch version 3 got same CHECK_DTBS warning.
https://lore.kernel.org/all/20250626035602.GA13855@nxa18884-linux/

Anyway, it doesn't matter now.

Thanks,
Peng

