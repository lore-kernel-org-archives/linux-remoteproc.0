Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208D34CFCC;
	Thu,  6 Nov 2025 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448439; cv=fail; b=AuaOxgST/u0+5TGYPLiMadM9BfVaRBu+ILvycRPL5GYflI6epJunOIrULNU/QY0/xfSs+StIg5En8JFYCO7/zhcMcRGLBhKDrHvVl0hppK9mYql+G8k/huB2YozEZDUN6oBwXMK7DyjPF+WYU04regjHhgU6jzIZSPRtFtHxwtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448439; c=relaxed/simple;
	bh=CRpcr3N8Z1mDPtKqM/oPyd5PioKmfj8YZBK5FbltJA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XDlUuDeGZpKsubw9oXw2uBGMESg4zMhCyQvP1Qy/DNFB8p7TlZLkCMUnh1mIkBERVjGrjAFThrW4lMMtxEd+PGptG1paVpzyXSZ8udvCfKDxPPZdZlTeaul86uBcDJYrRinGjJv09SQq52gw44WermdQx+YsMFsESMxHLUu9fck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jVJPeNGF; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jVJPeNGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUylteZ8GPzYor/qMEPcLD2n4yTjsRALp1qaSpFG49HIQ2mLS6KUFIG+I92J2tguoi0vivYDEMBftAnU9jNgemRLP/l3pQRAaZBxvDuD5FethOQ56F0Q4zug/BN8zhvuZbyhCmzG8vbZ1ILo1dFmneb47n0tlk5zZk3O0Wnga+0rFVIcju1n7OEcfmOyf5AZV4IsWJtWiqXrI0Y1rylhOlSk7h+MdaoZxoLDw1avmBWbJwV7JLwt3nYGDm6d4YifUpZw3RQ0A/hzRjUKp5UJ7Hni4UTrbTupBk+PkMMs43KZF6woO0kU8qsNkrFRInSchasCPmpC1vVRxGGjqZkp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hifd9pUGaw/N+2GbrgW9qm17Z1LrfspGV92bZ2NtDI0=;
 b=LpUyjQVlfFyQxAOjuaxdwxL6SYvf5gNbUx40LMBaHw6+9Vo4+d4evZVqh49jpgM0G1sPw8k1t9P0cADBhjVBfLT7Pq4DondMfTtpvJdipwQq/spFBEBH/1tmqm6GzhvRwx/4ypbtXlSfFUHrnmts3UE8dmImgrqPYvkfVI5crKsR7OsD5EevoKxHXOSaT/YXzZcmPqTc5wW53HKytr7blKcnctthAlSwJAAaYLt6fXewR2+F8fXiTJ2Sy17YSIuKH3ilYp+/mSRcHn/sZxl/Vm12wSjJLLlXZedTUZxQMT16N6B4FGC+jIUUE87enuWj5SaBkyMaeC2wMfCXHgiFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hifd9pUGaw/N+2GbrgW9qm17Z1LrfspGV92bZ2NtDI0=;
 b=jVJPeNGFUXPWuQJImvRbf4N7Y+wMaHB0tOqlAguBMV9lO1mtDIsbAYegMLvShb71tRcCk4RDUhVZ+M/U9HQ9rbjdGBT/lKFh89Or9rkNoMCf1kbrxuPLNRHUK8j4UGthomfMUfiGq1EgYoqR4jVRhCb1+K3HnI2UPsg05F60vEfRVkrME/7K64CQpvDwYadBbJSjUubX+X12gW1S6DnxqOIeWd2T39SmDp5HJNLoLAN1iOmBDNc91sCXUBLx4g/CpVPiGR4aXY8JjUJTZlZBd0uq/1/bjQqOGvjN+qP96kZmGZpyVbvLqxzHqYx/az0gPW5EtGwBgm+tOlsvJC1neA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8723.eurprd04.prod.outlook.com (2603:10a6:20b:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 17:00:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:00:32 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Andrew Lunn
	<andrew@lunn.ch>
Subject: Re: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcTz7cDuq5hf2mvUKbSH2MzToHSQ==
Date: Thu, 6 Nov 2025 17:00:32 +0000
Message-ID:
 <PAXPR04MB9185D2680B5738134243045589C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-5-shenwei.wang@nxp.com>
 <d28a3fa6-f092-4186-afd7-8005aecbfc38@oss.qualcomm.com>
In-Reply-To: <d28a3fa6-f092-4186-afd7-8005aecbfc38@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB8723:EE_
x-ms-office365-filtering-correlation-id: 83911bfe-1a23-42ef-1c85-08de1d55ff78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|19092799006|921020|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AS/ewvTB9Fkktv177p3QhhWO+6BpbJ6xGqm7yx1r8Q76I9V8i3pt4PcQEVqq?=
 =?us-ascii?Q?TJSc9sBEuZO0k+Ipk1MKq0nuZ9bVLkp0jOCy8lzxxjvFSs8K44WdqF/Rwaox?=
 =?us-ascii?Q?S1zy1mkZNO2A/JX6MZaqhAQq3DkLbQmlFz2EPXWASgYfL2eIss73ws7SpPYA?=
 =?us-ascii?Q?wotM1ODWypX0xql5ONnQKBuqGWATLVdbkgWJg3t3OUm/v8rxMUfl6e4fN0Fa?=
 =?us-ascii?Q?tDbwPfkWrnZ98ilYZ4AMuQp7xZGvyF5I3r4Y26YsES/DcF2nZOa6OkrAmiwu?=
 =?us-ascii?Q?cf5lvCHD7k3WdovAfY9wulHwJKn6FWPuMDWN/bctw5lSlwrZdeb2mpQQWWgo?=
 =?us-ascii?Q?9Q8O/a7kwOO0EJBzH+BFkWnqFsCEkk9Dx28AgvR25FH0cwT2nmBqTnbur5PO?=
 =?us-ascii?Q?SLIslAsxWVHo/AIC1PtDty+DnSs6iJIVuQQTtvhtfFYdpMa8aPUkVoanE5GP?=
 =?us-ascii?Q?rTXfCGASt7iJN05NmWDDhtLVpu3Cb8NWul1NAj1VqgyBiYWZwQ9lEuZ6Jfol?=
 =?us-ascii?Q?b6diS26At0S2fYSioQBQVfHDymqgBoSaloR5yHuCLA8UtcYO3dYdekqdEh85?=
 =?us-ascii?Q?Oh2y8Oine6atGQ37oql28gU7fjEfiX6+DB1RG3w8YuWrSq8vvP/ocOAtKf/8?=
 =?us-ascii?Q?sXTzSCKqUBcFWdtWNzyx2gOn8tdH+7K69Dsv8i4m6Hsa0X7FNV9D3vd+CbOD?=
 =?us-ascii?Q?N2gL+YwF8HwozD0fPgsgmCviGutDpYyE4Uku30CrsRsnALPI900hV21fN5+i?=
 =?us-ascii?Q?yS5AlzUpDjD+lwdmTr6G4Uf6eRmgVCLhHCMPKBtOp7AkKFcS9TCyH4Gs82bL?=
 =?us-ascii?Q?nHnKlfWknDslEp7ddRxUMwzKya0bxwoqR2tqmKlWyA3SYMLuU5TZ2QISO7UI?=
 =?us-ascii?Q?054VmP9aCXKVtyYfxY6XdcafWNod0fxviNeky5mZ7tP+s2RSnrQMd6OIThiU?=
 =?us-ascii?Q?xE72Ef0pSYnSHtnSucEpHGtOGMi1mWEJfk43H67tQrOzWCfgp/jd/gjNTcR1?=
 =?us-ascii?Q?XDJtZsJeTwi87KptR1I6ZriSYsxQ4i4WHcqSf669290UdgJe0OuhwBbOg3Vn?=
 =?us-ascii?Q?4s2iOXi1GV8BTfcH5H/9I9fBv/yU2WgUuJXuAhPJC3eJhIARPPxLIkGEoq8+?=
 =?us-ascii?Q?cfsfasi2h3LgHeLIvxueBqQwANHbkg77SXfg8TlQhif6kcZ2KtmKHXNxG8Jr?=
 =?us-ascii?Q?zQkVHry1Nj/ajN5HOK91byhhGQ6oYgPBMWQ6fVYuyW98M3g6rkw/MeILfMo3?=
 =?us-ascii?Q?adduBhDXhOpCS6s0+a7rIjGyD4C6gTu0tILpLX1PApV4MUGvpRZNFXbi4lGA?=
 =?us-ascii?Q?kBLk459aVxpV4MmBfs94uSOqITrjZqFuZX1oQwQzEy5gq+VPb5OcpYk0rjtN?=
 =?us-ascii?Q?TaHw1b0DKQG5pPsrliMA5yabrj4+pzOb5MQzAT3Fs6wvWq8+IZevfCN5OGR9?=
 =?us-ascii?Q?TWAsWydldGDvp6p+6+++WxLS90QsrpgkVWqyfRMDan9BcgMXzE81fSrwqjl5?=
 =?us-ascii?Q?wBRIObO0cH8Jra54xjKKtPgZUag6xnA/aiadNzBfJRvBRJtlxPy5l2K3Iw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(19092799006)(921020)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1xl6+GAx0MzEwqrjRy4ieKAcUDIAx54Bo4xmnM+UNEL7nnbzftOFBOlYadp1?=
 =?us-ascii?Q?ATg4KID5V5S8qanyAaXutfW8/OQz+3Ole3VMMdDOfLFWC+bCRYq89L35kdHl?=
 =?us-ascii?Q?LbZwshJ0D0X12h8mU9g/BpNZzMpgnPa+Hikt/jICscUbdOy9tzTJHxNLAGRM?=
 =?us-ascii?Q?zI3l8VzIkSx5KCzapm1eGEpy0CH8Dz1md7aT/K4S8ZMK9eAqFtel9LzoXRCz?=
 =?us-ascii?Q?xCwjev7H7/IGfTcI5v+SIbmdUjkhP+9gURvp/kgjLvJ1KsaS37mqIijVbTyY?=
 =?us-ascii?Q?AjzGMVUucDZVSRUMstQ0PuqY3NAxuXY5vWHVx8hMdBkcbdAVFAXpcR5h+R2c?=
 =?us-ascii?Q?5ko+bN88guG0+28vRBONQhS7m1rgEzyiE4x0T3DomCmPy4iqtnpgRkNZlgqM?=
 =?us-ascii?Q?gTw5M8I+PmSgHAO3sXlm9mSeiTynZX+IOr0yOS2oTDCzcdXXKXY9YqRIblej?=
 =?us-ascii?Q?4lRBvSCEEuD1nbjXolsbgZlv2bKA2z0YjvF/XwzEQiiLxb1vU4JeqPEMxa1m?=
 =?us-ascii?Q?UuUooVG50Aa44MnLVkyXNeGUAiry7oECjB19Gn9KW1QmAiUYZq0SGjNgahFv?=
 =?us-ascii?Q?FBsTfSjhSk9yznV8M5Ir5vFnycxtuyJQALXU3DJaNGODW0P1uisI2Yw/HOeF?=
 =?us-ascii?Q?bJomGQq4w3LKxkFeJ/ygoK0RkNqMt9fVwdp1vIwClTFJ0Y5pfekMiwc1MO+k?=
 =?us-ascii?Q?lwm7wdqYGxLgYE9ajP25tsZHnzCKMAQDqqFAclMxM5cMQvlRThwc0DIhsLDI?=
 =?us-ascii?Q?sdBEdKCOJ4h3+Aiw1o3CPNsOTGa2jnyg3eHXlygbAP4hPZjFKlc8miiNrQKH?=
 =?us-ascii?Q?l0XJsNmyuEurXqAt8+vV/BPsRJ9JV/F7tXZ6FPnOkcfuE5rRDnnJeMOntsZF?=
 =?us-ascii?Q?otBSjcGJx+yq+XijWxHoFebXCSdymsLWeRy6s5YIagUlXWnFhusAHtDfu+uv?=
 =?us-ascii?Q?LJvmDLSe+p/eni/7/lqdRGbDM+RYgmhlbvYOD95KwSJgW5cw0TNz1hLL7bId?=
 =?us-ascii?Q?teyWU3wb14/3vZkJ8Q+v20FOYanRStSFd0e/rDRSOui71zNfi0l1pmfmXxHJ?=
 =?us-ascii?Q?FyxRO62YCTxNtQ/Ald8tyd3CrUpnCHC29FTqOhTXAatgckTK+4sRZx2SNtm2?=
 =?us-ascii?Q?5+mKAcDgF4DdI7+vsLiBDqxO1LWcJ5ZAumeX8T8rZ7mcE05w0X1I3oNG337E?=
 =?us-ascii?Q?hgW8ANXOXzwVZZ8Y+wXMAHAQlnc87aMJrYDnPmW3SL6iKoi0niCHx7lV1Pa1?=
 =?us-ascii?Q?nPxWHslsWL6FoLbZT3o+OorXcVEXYpwwmk1xVU33T8OO8bwJXYztw07WK/6r?=
 =?us-ascii?Q?UVE6FNKBB16f81cy2lhv+qP/qiHHJr2PbGCUY21PhA1CrrHCVvXYc7N24e+M?=
 =?us-ascii?Q?Pf9O/NEJqu3VCcE17rYPfnnw57S/MA24sxoPVeumaCWuG/6+jHzGTtKOBef9?=
 =?us-ascii?Q?7c2eQqJ9zAO2vnD4w87n06LtYIa/eGgOI2Ozf+qagwmbHJj3l55woG2m6iek?=
 =?us-ascii?Q?xpLWDOZio5I/eOnZr76+jtSaQfTSqf2dauXc4Jzt6/UC0w8+1HIpVTVPOGEv?=
 =?us-ascii?Q?3/3DLSp7N9jMkM3wWyQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83911bfe-1a23-42ef-1c85-08de1d55ff78
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 17:00:32.8078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmgDe6E0eJVPwzVayyR/g/pTOQr619ucyGAqZ7oafZwpFbuDf/d1++DNhEfcpgxHKd811UeKnOxVcRU/wsdVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8723



> -----Original Message-----
> From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> Sent: Thursday, November 6, 2025 6:31 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux=
-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Andrew Lunn
> <andrew@lunn.ch>; zhongqiu.han@oss.qualcomm.com
> Subject: [EXT] Re: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> On 11/5/2025 4:33 AM, Shenwei Wang wrote:
> > On i.MX SoCs, the system may include two processors:
> >       - An MCU running an RTOS
> >       - An MPU running Linux
> >
> > +
> > +struct imx_rpmsg_gpio_port {
> > +     struct gpio_chip gc;
> > +     struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
> > +     struct imx_gpio_rpmsg_info info;
> > +     int idx;
> > +};
> > +
>=20
> Hello Shenwei,
> I'd like to go over a few aspects of this patch.
>=20

Hi Zhongqiu,

Thank you for the review. I'll address the two issues you reported below in=
 the next revision.

Thanks,
Shenwei

>=20
> > +static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
> > +                          struct gpio_rpmsg_data *msg,
> > +                          bool sync)
> > +{
> > +     struct imx_gpio_rpmsg_info *info =3D &port->info;
> > +     int err;
> > +
> > +     if (!info->rpdev) {
> > +             dev_dbg(&info->rpdev->dev,
>=20
> 1.NULL pointer dereference here.
>=20
> > +                     "rpmsg channel doesn't exist, is remote core read=
y?\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     reinit_completion(&info->cmd_complete);
> > +     err =3D rpmsg_send(info->rpdev->ept, (void *)msg,
> > +                      sizeof(struct gpio_rpmsg_data));
> > +static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d) {
> > +     struct imx_rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d=
);
> > +     struct gpio_rpmsg_data *msg =3D NULL;
> > +     u32 gpio_idx =3D d->hwirq;
> > +
> > +     if (port =3D=3D NULL) {
> > +             mutex_unlock(&port->info.lock);
> > +             return;
> > +     }
> > +
>=20
> 2.Unlocking port->info.lock when port is NULL will crash due to a NULL
> pointer dereference. Please fix the logic as well.> +   /*
> > +      * For mask irq, do nothing here.
> > +      * M core will mask interrupt after a interrupt occurred, and the=
n
> > +      * sends a notify to A core.
> > +      * After A core dealt with the notify, A core will send a rpmsg t=
o
> > +      * M core to unmask this interrupt again.
> > +      */
> > +
> > +     if (port->gpio_pins[gpio_idx].irq_mask && !port-
> >gpio_pins[gpio_idx].irq_unmask) {
> > +             port->gpio_pins[gpio_idx].irq_mask =3D 0;
> > +             mutex_unlock(&port->info.lock);
> > +             return;
> > +     }
> > +
> > +
> > +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> > +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >
> >
>=20
>=20
> --
> Thx and BRs,
> Zhongqiu Han
