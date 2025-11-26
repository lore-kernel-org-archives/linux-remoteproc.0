Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595131771B;
	Wed, 26 Nov 2025 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197025; cv=fail; b=cdXZlgU7eKtbX+Shm5R9+5p6mReySMqzZd3VwFESkfG5oEc2N0nmLMsCAMifEYbgxShto2chnquqUv6CCVXdZXJhUyXVPKUNGZWP51DhhUQDAFKyUY86/Pw753bQy2odQgpaXW/YFH25eLCTEiz9RhPK1GjpKwtIwLGUQmkekxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197025; c=relaxed/simple;
	bh=89ecspcomj/EOv/VAKdS4EDNUEV0GzWMWLHJ6F0UvGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FN8qUEuWv8fPJLwti0y1kQ/hjjpMRdDs2UMqTuEt7iA8WI9Vsu1rHWPGEhJPo/pe3aDmhNfaiYWpXrKj+GhavVS6ML8PSgenzhwE39LSHjw7Um18Xkuhs6R1mJ28wuPzHj2B71JABmjUPuvQJgt0eTlO3xYUrqy0osVCbk0YClQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vht99z5L; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vht99z5L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfzfu4/7IW8OmDO84idER01W48LcLuv1vaRH9ZrBoFQWoWXN8HirZ6Iaq5WiFTXO53vPFeZytNG99uOY+tKuQJBqZfC+SKdkCK4O6hDAkfgfNnXM2b3SJNTh2yERx+FPkjvAi7IfIcCMaZUoWgCXmt/bUa81FfpSeTXJ5tyGHLYpFJ3MgubbF6/wcUs+ykGSsuKYIpBgUgR+FJ8vaU2EqbNVsiMBjcuxD2xxFqsVyAjS3PpDum0PRhi3bvWiYcMT/caWZ6oJyLtFjJKUfV//rSUKkd5usI1M/zJIZDaEDSPVTKAyubaI7WZkKK5O2JD5Dsxlh7Re+/G5FNmz4lg1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMjQjg+RJKf+BeZBmvF+z0E0+aA4D2XbRrY6ne7fYCg=;
 b=QfvlHxwspL55XVLmCWQiPpdP/igMVtxlfumg8EaBmJJ+047rBluCQ3UzoodLAcJ2HHNdWCsj1gW7K+crwzqVWnyArY5y+atQc9kQVgC8ItDWnrmjV4x3Y3AkkKkOzsb578pbad0naAkc/qz7dO97fPGxAZ6aoBGCM9K6rwgPKsXywjx1YHx6aQvY91jODcC7Vfjp0zm2mZ3/r7UhwucQ3RlCYuxVvBUOTIQsOCEKxfHmUu4JMvjd198gn4bFTyhVuWKjfSyITe7VdBIMZvQfPeh15QUnOh0q4q6y0WsAZjiUOThAF7ZxEPMPEMVkHZCLgdkKuBMoICvaU/8ZOtR4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMjQjg+RJKf+BeZBmvF+z0E0+aA4D2XbRrY6ne7fYCg=;
 b=Vht99z5LoJEb6IuwsEal+W5rBBJeMUnF5sqiIp3G4NzE2qPLkazktuUIeGaMHfdv8hA/fEf4x6Q406QzwTaBmeSSCpYsvpXzmfqhrShF1uLZEF6LanvzKWcg6KFmCMWk9xKKhoWL7qFzjdHH/MZsdolJBm3ucrXAVBL1kbu6QxRgDtplA7ruGAFEiz2lG4Ll1r4yOVZD7zG2N956/jGVx+vym1egfDM6l5KEsKSCibia5Z4IfrPv1ZR20hJ/yohArBllfFTiwSEKkmpuJQRdAyzGboSjISIH0QzKk3SRNVX66VX18tCA5NY/oFZmPYsgb4rS0SS1kKYR0MtfgzOZfQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8578.eurprd04.prod.outlook.com (2603:10a6:20b:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 22:43:39 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:43:38 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcXyYbYEZBcUEOnkejT1wasvqIlQ==
Date: Wed, 26 Nov 2025 22:43:38 +0000
Message-ID:
 <PAXPR04MB91855348A84594B68F05ECA689DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com> <aSXhtAcFBOgJoCWd@p14s>
In-Reply-To: <aSXhtAcFBOgJoCWd@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB8578:EE_
x-ms-office365-filtering-correlation-id: e9a982ed-ded4-43aa-ba8a-08de2d3d3df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zKHykcuLXWVsRK6wFPMTx+NzRmaMAngeNAWiUll1Jqg4LyZP2C8bQZeDPGu9?=
 =?us-ascii?Q?SE6+1xjqqiVceOiW11vhddfahxmfSn7m8bP6cbMPG6d16RGZC5xZjtoJl6zY?=
 =?us-ascii?Q?QE83u3B2KJWrIt/oAvBjxIfVQMwa25Fm6rQAO1sBt+xlUtin6+lfr9iIMyCu?=
 =?us-ascii?Q?MPfe8+rTkKUXYG6v69VebdctJ19pGJRh8jmfhvsCjOHGs1Pp03oyJDnZXnoB?=
 =?us-ascii?Q?gCaWTNo9Tz6SZrOLaP3/ZrszRitLNCN+98wAIZRdboK+jyaNsykOWaVbJfFY?=
 =?us-ascii?Q?5/4q+KeAU01quk9BUnES0zhLyTlqIvZ1MtkRB8dnH3q4RIe12Wgr4kbOkyRQ?=
 =?us-ascii?Q?en/1yqv+zEui7QWONtwSf7bhtQKIafZbjoNKsjv8KL8FwHFxlgNZ/gadh2au?=
 =?us-ascii?Q?E4oVE1O3YWH5i2pbCa6LUd5TBkW34v3H/DXGipGVG18pBAOj4/N3sdbToT3s?=
 =?us-ascii?Q?bm2v2Oyd0eSK8D/NwgxXodrJiFEOSocVxXoaWw7bdIhjWUyMKmwxFiLnXDRp?=
 =?us-ascii?Q?v83idi+uLjqjkIvBKjJl0aTnHa294C4lHkQBrCqtiMthekyErZnuu2pzp3p9?=
 =?us-ascii?Q?yQMZnFLR86y7s6TFawagPZ5ATaSlPWhXW0V7YYMNwMBBqdb4WXJFyhJuSzZZ?=
 =?us-ascii?Q?IYTU7f4yPol3yIlGlMUPj/i6UPvo2Faqbr/a4RosneD6F+JRyVcnDxVY8of2?=
 =?us-ascii?Q?XS8PPqdF1B5t89X09Zs+j6nKSZtPY/A2/HFIOlw4SJwOQJLacFZHR3pBFH3v?=
 =?us-ascii?Q?MLEvq6Y4vhsJ4HjzaNar4bNCqmnPi7VEyZUoeUuPirY8BetUYBhV3TclSN8k?=
 =?us-ascii?Q?IqcEoKhkpmRpgE+JRxMHe1EWVcuJIWBb3jPHASNYnWBjJdyIikzzLtwXpQg5?=
 =?us-ascii?Q?r6k2wHYqCQI/APt6Xq7OKN3b8UCbJB+60xEOX/23ll6v0WDXRLPllFOJZeww?=
 =?us-ascii?Q?FDPM7vZw6Dw23tlFTzq902M9o1HeggDEaI5Kil46CuYROOWwfP4DLwdj3LFY?=
 =?us-ascii?Q?bZ6jC6qfNpC07tYE0VblY/3I17HFQVv9Ce64PK1BOkIfWFZT9y7P2XruU90G?=
 =?us-ascii?Q?59aK1QN03qly23gO1NTxo/mv4gy1W5zGxTOO/bKkdfUni141hCWoI7WQml3z?=
 =?us-ascii?Q?t57ty5rZnHOmWbvLeFtcr4bUUekDhCrem2Tl/kDuUOEGFLHzKIi3973n6rHO?=
 =?us-ascii?Q?xQoh1qf1QCf+jcsRj20+ADIIAUwHa3d9hh0X+lANQs22e6qATYnoDVaTy+Fl?=
 =?us-ascii?Q?9izNpY4NZq3liECnecZaJE8rpWWCrtrsjJ6oqQbOkzMAamDdLqHsWpUXarNO?=
 =?us-ascii?Q?Ou//0bFApTRxe6Kn6HWM9xf83nZEgSKJ44BPKVxZ5dn9fg3LeoiDp2IZkAv+?=
 =?us-ascii?Q?1tMoicsbroW9hxawRwLU80Sk3PUxViYX9fj9ZsjHTOzmDWAIsUmff3cEu60v?=
 =?us-ascii?Q?bYExfTiniiazEWy2OHSro//bhs5DtPOZX5jSS6/JmcBUYUJmCh7U90w/itgN?=
 =?us-ascii?Q?AS00OOu7/eWeMKtXvRunx9qYJJ8lPxGNduXg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xS26TfW+P+VczqyTE+FU40bViHxvo0oS/g7WmEfuAbYoWINuEeWR3Da3muGS?=
 =?us-ascii?Q?svASQ/61NudiWliIu/gLD3QV8/JizZOZED2f7wkxBOAyWrGTqmud6BEUFtTv?=
 =?us-ascii?Q?sudoG2ty+UKttlAr2aNLnLc4gZTDvfaqwlMPW9fqboW7IsQIyQA+BXFN5tbl?=
 =?us-ascii?Q?51NXKR4cLwLrMIxQ3AT7G1gzdA1FNCuYlDQiQcU38hwVzxq/fAdP+urKvtkB?=
 =?us-ascii?Q?Z1FRkbpF+SX3EnZeJ1y5vexsZVQmpaSR8QuNOEGVw1SGjp7i37fqfIawuRBk?=
 =?us-ascii?Q?ClYoUUp8JQ2L3ugc8JlwVVvtYNOw0XU+UUtlh9ADyTM+S/9Knp2HzPZkGM22?=
 =?us-ascii?Q?FlILX3MxlOU5eOE4umOXOgeAYQ+wTipvsiAmK7rgEPTyfGTAsciAi83b/H0E?=
 =?us-ascii?Q?HBpc6NAKUi2hEvYmTldQkrNzYr/DPVPZgpsY2ahku5qebRXTabrNh5wBImID?=
 =?us-ascii?Q?L4xp0SUjZHJkTS69wSBkb2T9wIAE42mNIEKCkDqW6b9ZOkkmN6RrUxWAyokg?=
 =?us-ascii?Q?USRA3agtfJDVqp8bmJ335YPquyvuHw1LCaNtJnFY7sRJ8aXpoTRXYpcIfLXo?=
 =?us-ascii?Q?YvSsKRvVXFMM/W/FKSLjadxVPKr5HGdIiLSha9wZkNm3qMnmJDDop1LkU12q?=
 =?us-ascii?Q?WhGbGPuAZL2Unn7FwjY0BkrziEcN6cCJDrajA61+A6Ma4i4mBf9IpmA8bXJR?=
 =?us-ascii?Q?+2uskkwTc1mSPRO47DKPm1RgOobNacsRIfCLlGodDzXsndtiVQLsInZlUHva?=
 =?us-ascii?Q?UoTJSMakZVYKP7sUSqQTZ3ThYv9Vnj24NSE+OW1XVAlaPiEjrwVhaQxrGpm1?=
 =?us-ascii?Q?y9nG8Vg6r+qG/4bqrZMBVWa+8OHtwBBL78Qk69iY0ARfwCUrAVDYKEaqoh7i?=
 =?us-ascii?Q?l3qPxfqspJ0NZMKQy2HdDEWMcmBnto9jYWqs+8yGtiWZvrsLywjK418GmnKd?=
 =?us-ascii?Q?L/Uc1Jx9Ym8V87FquHDuDl9jMCn30momRuTzRkR5jhbp1xMyQ7XxDqItnbuB?=
 =?us-ascii?Q?T5gni0CgP5eqvitYbbIyZVYfsfZaQjcmR9rt5ivrL1gue4wVIClCPWmGa179?=
 =?us-ascii?Q?kJtmxn1zUeUtYkuRy1/+NUamnDVfUhlnyhnavIDtCA3009o/bTn46tMSQHbe?=
 =?us-ascii?Q?Qgm2Da+EeI91iliC7/CxpICU0QAaUkzyBY3DljhexaMUdLs03j+AGJhgLOQa?=
 =?us-ascii?Q?PMJNKXTYRLNxny9+8Ml2bTNHs/5yaAaGcFrHu2mXwvkF3TumBRaH8cKNxplH?=
 =?us-ascii?Q?7U0/Xcvs7Xy7A8K6ajMITXYvBBnY3mlHiana5Rc0KmUzMGDr5mdvnrEzT7oH?=
 =?us-ascii?Q?2EyTybB1GjrGzmKOvLeSI6ukjyCGhdzimrq+eFFs3jNMki2hcwXrzblJ8tSY?=
 =?us-ascii?Q?cTNF/g26dcHskgyignln4+XkVPWinlqqjbZNLKcgAvIUXrmtFPFGw9SQ2Gmd?=
 =?us-ascii?Q?in3Mh8LHatJ5xGPza5EaoBRLClBCMa3k+FcNPVRZ2jwTSzvMudwf3BHuccJ6?=
 =?us-ascii?Q?AKie2t231HsLqnPDqjM7HRwFZcxRRzNpa035psBlG/zJo2mE+w01jP3uji0n?=
 =?us-ascii?Q?nG1iw1oOgvdDcEbhSyU7GlfXEw9zHX6yCBpLW43r?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a982ed-ded4-43aa-ba8a-08de2d3d3df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 22:43:38.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjPPeMNs7zGiDVPoE7YV+iKvwb/D09TWXbAbe5hpLH8E25fB9WMhXz4c7LcUBduckvliJPow1gT0eOAoZqFpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8578



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Tuesday, November 25, 2025 11:05 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>=
;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutro=
nix
> Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> under "rpmsg" subnode
> > The following illustrates the expected DTS layout structure:
> >
> >       cm33: remoteproc-cm33 {
> >               compatible =3D "fsl,imx8ulp-cm33";
> >
> >               rpmsg {
> >                       rpmsg-io-channel {
> >                               gpio@0 {
> >                                       compatible =3D "fsl,imx-rpmsg-gpi=
o";
> >                                       reg =3D <0>;
> >                               };
> >
> >                               gpio@1 {
> >                                       compatible =3D "fsl,imx-rpmsg-gpi=
o";
> >                                       reg =3D <1>;
> >                               };
> >
> >                               ...
> >                       };
> >
> >                       rpmsg-i2c-channel {
> >                               i2c@0 {
> >                                       compatible =3D "fsl,imx-rpmsg-i2c=
";
> >                                       reg =3D <0>;
> >                               };
> >                       };
> >
> >                       ...
> >               };
> >       };
>=20
> 2 observations here:
>=20
> (1) Why are you trying to introduce both i2c and GPIO in the same patchse=
t?

The patch is to populate the "rpmsg" node under the remoteproc. This is a c=
ommon function for the remoteproc.
Listing two examples (GPIO and I2C) here could give us an overview of the d=
ts structure.

> (2) My first impression is that i2c, GPIO and others should be bundled wi=
th the
> platform definitions for i2c and GPIO, with a phandle to the remote proce=
ssor
> they hang off from.  My opinion may change once I have reviewed the other
> patches in this set.
>=20

The design is to let the remoteproc to populate the "rpmsg" node, and separ=
ate the rpmsg endpoint driver and its above function driver like GPIO.
Bunding the GPIO and rpdev driver together would make the driver become a m=
ulti-function driver. I am not sure if it is still suitable to put it in th=
e directory of "drivers/gpio".

> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c  | 146
> > ++++++++++++++++++++++++++++++++  include/linux/rpmsg/imx_rpmsg.h |
> > 48 +++++++++++
> >  2 files changed, 194 insertions(+)
> >  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index a6eef0080ca9..e21a7980c490
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/err.h>
> >  #include <linux/firmware/imx/sci.h>
> > +#include <linux/rpmsg/imx_rpmsg.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mailbox_client.h>
> > @@ -15,6 +16,8 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > @@ -22,6 +25,7 @@
> >  #include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/rpmsg.h>
> >  #include <linux/workqueue.h>
> >
> >  #include "imx_rproc.h"
> > @@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct
> sys_off_data *data)
> >       return NOTIFY_DONE;
> >  }
> >
> > +struct imx_rpmsg_driver {
> > +     struct rpmsg_driver rpdrv;
> > +     void *driver_data;
> > +};
> > +
> > +static char *channel_device_map[][2] =3D {
> > +     {"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
> > +     {"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"}, };
> > +
> > +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *dat=
a,
> > +                              int len, void *priv, u32 src) {
> > +     struct imx_rpmsg_driver_data *drvdata;
> > +
> > +     drvdata =3D dev_get_drvdata(&rpdev->dev);
> > +     if (drvdata && drvdata->rx_callback)
> > +             return drvdata->rx_callback(rpdev, data, len, priv,
> > + src);
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) {
> > +     of_platform_depopulate(&rpdev->dev);
> > +}
> > +
> > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
> > +     struct imx_rpmsg_driver_data *drvdata;
> > +     struct imx_rpmsg_driver *imx_rpdrv;
> > +     struct device *dev =3D &rpdev->dev;
> > +     struct of_dev_auxdata *auxdata;
> > +     struct rpmsg_driver *rpdrv;
> > +     int i;
> > +
> > +     rpdrv =3D container_of(dev->driver, struct rpmsg_driver, drv);
> > +     imx_rpdrv =3D container_of(rpdrv, struct imx_rpmsg_driver, rpdrv)=
;
> > +
> > +     if (!imx_rpdrv->driver_data)
> > +             return -EINVAL;
> > +
> > +     drvdata =3D devm_kmemdup(dev, imx_rpdrv->driver_data,
> > + sizeof(*drvdata), GFP_KERNEL);
>=20
> Something with the overall design of this feature doesn't work if you nee=
d to do
> this.
>=20

Could you elaborate further?

> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +
> > +     i =3D drvdata->map_idx;
> > +     if (i >=3D ARRAY_SIZE(channel_device_map))
> > +             return -ENODEV;
> > +
> > +     auxdata =3D devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> > +     if (!auxdata)
> > +             return -ENOMEM;
> > +
> > +     drvdata->rpdev =3D rpdev;
> > +     auxdata[0].compatible =3D channel_device_map[i][1];
> > +     auxdata[0].platform_data =3D drvdata;
> > +     dev_set_drvdata(dev, drvdata);
> > +
> > +     of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> > +     of_node_put(drvdata->channel_node);
>=20
> Why is there a need for of_node_put() when imx_of_rprmsg_node_init() is u=
sing
> for_each_child_of_node_scoped()?
>=20

You are right. This "put" should be deleted.

> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_of_rpmsg_is_in_map(const char *name) {
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(channel_device_map); i++) {
> > +             if (strcmp(name, channel_device_map[i][0]) =3D=3D 0)
> > +                     return i;
> > +     }
> > +
> > +     return -1;
>=20
> Please return a real error code.
>=20
> > +}
> > +
> > +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> > +                                       struct device *dev, int idx) {
> > +     struct imx_rpmsg_driver_data *driver_data;
> > +     struct imx_rpmsg_driver *rp_driver;
> > +     struct rpmsg_device_id *rpdev_id;
> > +
> > +     rpdev_id =3D devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL)=
;
>=20
> I had a really good time figuring out why 2 instances were needed.  Revie=
wing
> this work without a single line of comment isn't motivating.
>=20
> > +     if (!rpdev_id)
> > +             return -ENOMEM;
> > +
> > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > + RPMSG_NAME_SIZE);
> > +
> > +     rp_driver =3D devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> > +     if (!rp_driver)
> > +             return -ENOMEM;
> > +
> > +     driver_data =3D devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNE=
L);
> > +     if (!driver_data)
> > +             return -ENOMEM;
> > +
> > +     driver_data->rproc_name =3D dev->of_node->name;
> > +     driver_data->channel_node =3D channel;
> > +     driver_data->map_idx =3D idx;
>=20
> struct rpmsg_device_id already contains a @driver_data.  As with my other
> comment above, something in the design of this feature is not working if =
you need
> to do something like this.
>=20

The purpose is to use the existing driver_data pointer inside the rpmsg dri=
ver to pass the instance relating data.
If you think there is another standard method, please let me know.

> > +
> > +     rp_driver->rpdrv.drv.name =3D channel_device_map[idx][0];
> > +     rp_driver->rpdrv.id_table =3D rpdev_id;
> > +     rp_driver->rpdrv.probe =3D imx_rpmsg_endpoint_probe;
> > +     rp_driver->rpdrv.remove =3D imx_rpmsg_endpoint_remove;
> > +     rp_driver->rpdrv.callback =3D imx_rpmsg_endpoint_cb;
> > +     rp_driver->driver_data =3D driver_data;
> > +
> > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_of_rpmsg_node_init(struct platform_device *pdev) {
> > +     struct device_node *np __free(device_node);
> > +     struct device *dev =3D &pdev->dev;
> > +     int idx, ret;
> > +
> > +     np =3D of_get_child_by_name(dev->of_node, "rpmsg");
> > +     if (!np)
> > +             return 0;
> > +
> > +     for_each_child_of_node_scoped(np, child) {
> > +             idx =3D imx_of_rpmsg_is_in_map(child->name);
> > +             if (idx < 0)
> > +                     ret =3D of_platform_default_populate(child, NULL,
> > + dev);
>=20
> Why is this called?
>=20

This is to populate the rpmsg channels not in the defined map under the "rp=
msg" node in a default method.

> > +             else
> > +                     ret =3D imx_of_rpmsg_register_rpdriver(child, dev=
,
> > + idx);
> > +
> > +             if (ret < 0)
> > +                     return ret;
>=20
> In case of an error, the reference to @np is not released.

It will be released when the function returns, because it is defined as=20
	struct device_node *np __free(device_node);

Thanks,
Shenwei

>=20
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>=20
> If we were to keep the current design, all of the above should be in
> drivers/rpmsg/imx_rpmsg.c.
>=20
> >  static int imx_rproc_probe(struct platform_device *pdev)  {
> >       struct device *dev =3D &pdev->dev; @@ -1177,6 +1319,10 @@ static
> > int imx_rproc_probe(struct platform_device *pdev)
> >               goto err_put_clk;
> >       }
> >
> > +     ret =3D imx_of_rpmsg_node_init(pdev);
> > +     if (ret < 0)
> > +             dev_info(dev, "populating 'rpmsg' node failed\n");
> > +
> >       return 0;
> >
> >  err_put_clk:
> > diff --git a/include/linux/rpmsg/imx_rpmsg.h
> > b/include/linux/rpmsg/imx_rpmsg.h new file mode 100644 index
> > 000000000000..04a5ad2d4a1d
> > --- /dev/null
> > +++ b/include/linux/rpmsg/imx_rpmsg.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright 2025 NXP */
> > +
> > +/*
> > + * @file linux/imx_rpmsg.h
> > + *
> > + * @brief Global header file for iMX RPMSG
> > + *
> > + * @ingroup RPMSG
> > + */
> > +#ifndef __LINUX_IMX_RPMSG_H__
> > +#define __LINUX_IMX_RPMSG_H__
> > +
> > +/* Category define */
> > +#define IMX_RMPSG_LIFECYCLE  1
> > +#define IMX_RPMSG_PMIC               2
> > +#define IMX_RPMSG_AUDIO              3
> > +#define IMX_RPMSG_KEY                4
> > +#define IMX_RPMSG_GPIO               5
> > +#define IMX_RPMSG_RTC                6
> > +#define IMX_RPMSG_SENSOR     7
> > +
> > +/* rpmsg version */
> > +#define IMX_RMPSG_MAJOR              1
> > +#define IMX_RMPSG_MINOR              0
> > +
> > +#define MAX_DEV_PER_CHANNEL  10
> > +
> > +struct imx_rpmsg_head {
> > +     u8 cate;        /* Category */
> > +     u8 major;       /* Major version */
> > +     u8 minor;       /* Minor version */
> > +     u8 type;        /* Message type */
> > +     u8 cmd;         /* Command code */
> > +     u8 reserved[5];
> > +} __packed;
>=20
> This structure is not used in this file, please remove.
>=20
> > +
> > +struct imx_rpmsg_driver_data {
> > +     int map_idx;
> > +     const char *rproc_name;
> > +     struct rpmsg_device *rpdev;
> > +     struct device_node *channel_node;
> > +     int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> > +                        int len, void *priv, u32 src);
> > +     void *channel_devices[MAX_DEV_PER_CHANNEL];
> > +};
>=20
> For the above 2 struct, proper documentation is needed.
>=20
> Thanks,
> Mathieu
>=20
> > +
> > +#endif /* __LINUX_IMX_RPMSG_H__ */
> > --
> > 2.43.0
> >
