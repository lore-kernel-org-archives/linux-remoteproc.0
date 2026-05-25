Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB23603D1
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711617; cv=fail; b=sBZystDwxjSWgBa0b436yAvKwwKTgU2/p9mdIxCeXHsa2ONz4/uM+pkRHZE5fUhK3yyw+ddaPdmGfwG7xPYRQ3kUxZfdJkZJ1O2vr6ZANhjQ3lgu3IxOSYzqZaEB/lJpV75CPUm6aKgeBoYNCzveiJCefk+0PNliTzCoSUWUCZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711617; c=relaxed/simple;
	bh=+F2VWSbzex2wlf4uLfclOsooXWOJvhZHSpHC/aBKjSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L/sfJJ8pkJFDOk9KUDCNj0h11BAVkmiP6WbBOAaSvPvAzTSwSZF6Akrqm6FpvT6zRIYs5nJ96R40UXPuHiushL9cvLyMO5Z8Bl8X0dZo0VpzkYBzmcGFoIjZH0W6+sTldIeDBAYhibcIj+4zVWOxD9gMADtUOkXJ2tG6oPY2s1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EFLgSpYT; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EFLgSpYT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHKr/RFstdx09xhH0G0Yx0zW14kn1CdmWOWnI28qzzIdpKSDkpn82mdDJagpPGicq6iBSE7wNiYuZxo9RJmap2Hb6XfKKIDFNXlSU7zGHG4uXI+Zt0wQT3DctYlktdxIygvVVlnxjqc8QFr+vl6nKNCGySF2vYRsQO3lPI/y9aFoz9iHZ+mCNYVeN0Fd2HnjCcdk/wJ2LqdHtkja4UIsdslSprhF38DdFl2sBpQn3v19Q3bsK29YvHzQMClmsxcDJ+1Gl48WMmvi6ci49jPCciTaWBQ6DmgM3WXcRozhVmMphxYxXWNmku4CUdcxKzllZ7wI2Wu/etL+8OHMGb+phQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F2VWSbzex2wlf4uLfclOsooXWOJvhZHSpHC/aBKjSg=;
 b=WzFGFUOfOjYfhh7iNiMvCTrstytONFU6s8Yok6x5VzbwLVkeC/sjcbRjPXfrFAUtRBEnIg1eexg5Kn7KRXaC+6WB4rK/yh9ScffMYcJQwYuDEXryqq71goiFmv62sHOHYDShZifAfMWg0GlfKMV4W+dp0Nm5z2aIax9MIRvMiE189mOsSCKyCcmMDeYfcWLZ+I0N6U3rQmahtf8P2ZdnNiErxbYbohgOeB0n8WiecBmXzJf/5zFt92rXwVovSKuKDxFWk7u4Y3hnVZVSrCrwKh653IKsUN30DJq6pOE8xQaBms+rEmxMORAWg27nGRRqkvQSD4g7sKF4LX50dzb++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F2VWSbzex2wlf4uLfclOsooXWOJvhZHSpHC/aBKjSg=;
 b=EFLgSpYT4DZyURNG1FCf6lo0LJg7n6mi80v2DociqbFAyU921ss/XIIqo5szQvvoXavUWnP6E3I18ETcwBpmYJv90W3IfvpI/8J7mT9eW8Jw5XBtnvAAVOe3HOwdFVEswXBJjx9znNtKMWpdyk5zJTbcHW2BkdW8TDIe95HfaFhx6MT7weyXwfck3ufsr6Kl66Y4wfYvNlD4qUNCqxThc9ZPIKnDQPkhAc9RMb30O7V1Ybhmu3TCG2FCshVeoSQBwmNoY5npxvvYRMZ5RmAZQeRDdHgKOPtmIeV4mUQ+GPtA2uVrakYApOIWSTozqvHExjMCEGhcxQ7sM/l0ckVu8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DU4PR04MB12009.eurprd04.prod.outlook.com (2603:10a6:10:641::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 12:20:13 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 12:20:13 +0000
Date: Mon, 25 May 2026 20:23:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Message-ID: <ahQ/LIU4DrtiQERT@shlinux89>
References: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
X-ClientProxiedBy: SI3PR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:4:297::15) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DU4PR04MB12009:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c2a601-e346-4000-2240-08deba57f8a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|56012099003|38350700014|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BaII51QV9tp2b992LG4NHn+uvK9827NhHMw72on+YB3BFbDyC+Aqtf4v10G5d2AoeYFoKU7gEnpLIWbzsFhB8T+6GRMmNgDMyAe/3r6f6TrYX8ONlBi7zfYvYAIKwXiakbv/RjmFo2gyi/w6czHjZxhym05qsRbOVljEfGbEJeY+oYHYGVS0EUbEgvYGB8SM/mJtfB9DJKXt8k4yERkTVTvg1VrYnYdYS11H8oPitqSGgcwloSGRPTb40PFfBXUHmmvHqs7yMByUmDAcTDQDsANXSFomY+56TQmRMRyXdhKGR3+T+5X3xchcN5jzbVjhwd+e56iVDaOLsom2ZAHXEcqEFCwcaEunhfIAedXfRedM2ZfH1+zRyv/neeiVEBSLKQk0HInFCRSjg0Z2DR235J47rp55WfGff8Jzbixf2JKX2IKAtybECMFwzPj3x/nMBIxf+CUoYBnkvmYGKBf5zJZ263TIisHJFvYY4htOZjZXuHuX1US7TYaVlCFxfpX9AvzRgX3aR4Vv/xQt9807WFVWY8jzg/axZ7zj/gMRNLfu+0Va+Yo9LWWYZLdBGWWgOkmd/VawHbRdLVjPtefWDR7Yon3euSslW1lGqTqclDHvt8N2TXAFzAsDxlQg+H2iCkLwaY6MMvF4WQyGu+8SmcOhGoLXSL12a/TdXBoUtpCIcOs/66jrwGOJd88n502pVWNSDnlN32rRxUmoKkjSZnYlBoCpAUrtcgSPhUERhGRmcRDOZYVFhXrniUaKJMQc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(56012099003)(38350700014)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QPFotWiXI3uNy+A9uSksN4R0+9OkDazkU5cyOeyTE94BUD5MYjrkT0CYaHZw?=
 =?us-ascii?Q?SH2D91nZOgdjYB5Pe70WUODKUT2Xecl73d4VecEMZY9H1YmfFUlzlfBK33p8?=
 =?us-ascii?Q?+xP8601bFbuFAkeE5y9bCTsI0XWpRALQEp3BRuGggpsO7mnXRScQYhPCcXp9?=
 =?us-ascii?Q?Q62v/eAGMVkNlWzLU6ulSdzNRV2/BLum3wmWGEwx4OSDyTwpWa/4+1uyCSAG?=
 =?us-ascii?Q?1Bip4yWzYega498bHNUrwhaW+10WeVbTCi5YME/7jzRM57X2VBVmcZo5eta6?=
 =?us-ascii?Q?3ZnyCxOR0PuxogsEv0Lkyol+wDqw4c/n/41CDD6LDnGSS1aRloGWoGpEcwGH?=
 =?us-ascii?Q?Hs8O9/hiCM3GLR+aWOUtMqHj5J/CnYShIsfZW/khmAVyt92NnhdzWgUpivi9?=
 =?us-ascii?Q?J7TyPYpBcB+jhcVourkDxnk2iaQISkExKMMFhNut6s615iqWmAGbAhEm7aWe?=
 =?us-ascii?Q?qY5IJ9QCNu7MSPAsNm1P9w8G/mnNv67qW3BmdLwnDQKLhJxokfrbM/6bJADF?=
 =?us-ascii?Q?tsIX6TCBcEcG4OL/eo0nOCgIBy2o4EkgBCobeMTzbZflzjdKly5wy1OswdJN?=
 =?us-ascii?Q?SLS96fMVrx34WemXmDya11i+qw3jZgsdVGd01qbZetFQs9ZvnsZFjzGOelOl?=
 =?us-ascii?Q?kgQoGM9jGFxiZfU4NSuVSNPbRThT7lsBkoSP/0uVtTbCtF5BhjFDcJJpkAcf?=
 =?us-ascii?Q?jatPYmKzKN2J4KOPdUkramCtRQHkG2aNXgI7tJy6oXOTJcZ5IhcQvtSJdpvt?=
 =?us-ascii?Q?7RrDsdQgLyGKGpxmivl07C4vcvOPVi63uNOQ3k8+AstmfQGcSMGf8LijDiPs?=
 =?us-ascii?Q?oxxER9g6AyA0lokqa4efzRttlYz5wmBx35C8+l1qu301Z4UOUfS6NtXzSB9d?=
 =?us-ascii?Q?Qgwh8UJDpGzVCfkrlxQDkUThxA3EE6fWCjSi3GxpseG6Gg4vxWxp1mzNb6BF?=
 =?us-ascii?Q?pTcvTmtzjKUKKycVp05VCvhB4TdCGC9Owfq64KlBRTX3cNiznyDqhYnVYgOd?=
 =?us-ascii?Q?gBXr/QXiMRFm/YrXD8cyosQIbonmSuA8dHL+ALqn34yOeOIsjT4VRYyf4MXs?=
 =?us-ascii?Q?pmx6PoNo3U9MFsm/mlLo0BSwYHsCcicQMsQgMg/KGMHVXL7eC+v0t9CPPv1a?=
 =?us-ascii?Q?9EooEIArZPCRdRCJI0rqMHX7HfaAe0AHUiB+++UkW/6hAiOFTza2/N/+3hp6?=
 =?us-ascii?Q?F+uc8S7Pin4ZU/6sldOQlszh8LVAfqCjtfwYBgqw+nYBy/ZDWZ+h9Oy34OhG?=
 =?us-ascii?Q?0M2ef8bUykmfw9pmfQcfKvyQ1N1zwImz8RiSm6Q0VZUBAQwTrPeddzPRHIkO?=
 =?us-ascii?Q?S5Zzfo1c9KYVFreB0HGqAw+NSC4KFbcPqBunKJQRmVTH+OwLDSCtkoHkefiq?=
 =?us-ascii?Q?8QBVVeO91zY20zCP0qkrIhqdXREQhT5sieeVK7L3zvbjWDp+/BBOxokvwLEX?=
 =?us-ascii?Q?UwTTtlTPAg75QenvTigsPDfw18O56Iot+DL9WuorIkUE+wL318GomYRqsN0T?=
 =?us-ascii?Q?//3giWtVCrBcLcZGDiMCV0taubaApyoGilJusHxCJzuSP8CvN/uiB2tkoFLr?=
 =?us-ascii?Q?WVPIGrDyfdosoyRo+q8S5njEgFCfjWcYxRD4SKk6cbB2TFk62XTk1Hd0i21i?=
 =?us-ascii?Q?zVBeie4jtPmrESWCwxuUd0juBnOx6KLnGZ7/Y4vPMEAm/zsThCulwbs/OGoe?=
 =?us-ascii?Q?ozcXVOyQO0ZPIGWjeVbpSTMmfwLt86ldkRBHqb8gJ28F03VLpoOvUxtciMDY?=
 =?us-ascii?Q?w61CUKm66A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c2a601-e346-4000-2240-08deba57f8a1
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 12:20:13.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5FQBgMwnHMNPf/AvDTLB+rcmR2VR/phtkKFPKzV6/vH6RR06F5OtlVf840KbvejQdOYz/F/pxlPRheTY51Lsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12009

On Mon, May 25, 2026 at 02:20:31PM +0800, Zhiqiang Hou wrote:
>From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
>The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure)
>and 0xB0000000-0xBFFFFFFF(Secure) are both mapped to
>0xA0000000-0xAFFFFFFF in the A55 address space.
>
>These ranges are currently missing from the i.MX93 remoteproc
>address translation table, which may lead to invalid address
>translation for firmware accessing these regions.
>
>Add the missing mappings to complete the DRAM coverage.
>
>Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")
>Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
