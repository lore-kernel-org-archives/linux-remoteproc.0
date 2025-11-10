Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EEB18A956;
	Mon, 10 Nov 2025 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788287; cv=fail; b=NGFbjw6oAqi6zLdAJv/kTzW00wreyoGfk5w49vFjyxC6toIcRlK9ThjcS+GBW4QBh1pQv+IjOLPiPbTeHJAl0rHTQ9Rf4mOPJsFFjJp6wdi7pTnQDnCFSD11zKef2vV8RddhzAgsF0R++fei2kUHU4TVyiq0+jkvaNMy100jRaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788287; c=relaxed/simple;
	bh=brjeZEoF0UD9OiqllHIeY05jGbIfUVB8Xkt3/lVsJS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d2M5Lznf59R8QRGhDNFLekSnUJo1WADfhN03jHyCISQD9f6R1EHipxZYNwlndPYSMX3C6C2JPlI9+qc8457EZGYzfoqv/Ww3VI1g+yfbLvMf4nlzER0VxG5r5pFFapXZPQEMMNnk5jQW1HZUN9Kwehf3yClYq7/dJV0IwmpVmLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YUso6aI4; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YUso6aI4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaiWAyPGGb8/PqB8H+LVD/ACwBHT5zTd2luyyN0DvuvV2rMW3YbwNoSlIIzD3BZIeoCm+3tFQfqjJL+w7clynJD3TACGadkm2OkCb58T6GYHnnndQ3ZHdaR05eT85qHPgbTALY9uzJimijWLC0P9i/p45WmZeb1P2LztWEBev8xuCCDRYvfBsxNkeSObi2u/K91TFCynA8sz4FQgk0hgxP/nDnemLIegnR5Cv87wJ99JXuIje6m4+GXAefP3AABxLkjhzNkO1Cq6balzQMs2dP1R9m2CStnOshwPAQnnG0pJ+cHFNzXlAfwOJIGrrcbxv7h36oFpRYlpEnKOZ7IKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFNJ0nH6/hBmwEM8q7d4CFogxooEbxoWKWVTNVfJcM=;
 b=mcTZySh+Pzl7xyNxYqo/UBklvkFRlM40BHqEMCyooIHcA/fGavqFmGQqvn3K3J9bto+qIHQ/09OqsVGPnrYy8ZRtv6oHjPApkF6LyNQABdpNjxH7fkie4htAKqcpcIe7Nj7h4/6kc4T8nSaCND0dPBFKffkT2MMOHspPi9GkAlUjV78WelxK6XgQHLdAQIW13YCxqs2qWn/5tjHGzLQo+pxlmaM02Jd7qhO7e/XNG7uhYEIsNJfwnUekEH3XQxSigNJDW5hMOEMlkVYSLR5RXEbfLfaqQfDmXpZsDV5cxDy/8VfSBHMdpQVVfS3BsArMI66fH25nR8uCQJZtiLZWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFFNJ0nH6/hBmwEM8q7d4CFogxooEbxoWKWVTNVfJcM=;
 b=YUso6aI4fzq2AkQAOhYNSwxI5wabws4su6xRxsg5HvwxJOTN9ll4hAS+MyQnmnag+Y3MvIvBQkjeOTCA+Wlq1GkQsp0mnFO5SdPolvv+ozcRPEhf1H9AvslViWw3C55nyRPytVGigMtXEZK6V5eusS+DmS2PzKazIkAuc712NV1n5kV1niqVcXEM6X6YsaH3ZIhv/6am9GShPlyS15wENC9UbwpGLtMZkBltbgc1tmqFqK5JXRiQvx2BQD253m2nS+H6MKaNld4VhBkt9GqQ/h712V/GmMtaTpUgfdz7NyYbEwN9gnAP14IQbuj2jCCaV724UXGSycM7LJm2CckJqg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:24:38 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:24:37 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcUlYgayo1NnMZmk6eyAf+eIIoLA==
Date: Mon, 10 Nov 2025 15:24:37 +0000
Message-ID:
 <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
 <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
In-Reply-To: <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GVXPR04MB10045:EE_
x-ms-office365-filtering-correlation-id: 936ed992-952b-4180-bc38-08de206d42e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gxdi7YBuw3nIudfrKdNWvT1JLjsWD4xgKaoQGVlBcH+QwdLtnmMCDAeirsCo?=
 =?us-ascii?Q?KY7YLROB02iINpPPnOb/6ky9YDDMiEkcNLo++sj8In9Zsp2XJK6o+RDtrZ4H?=
 =?us-ascii?Q?BRs2Sf3WfCyaMx2SOekd/ThesnJzp0fHGAsQwj64YWAEPv34WpA33Dl9L62q?=
 =?us-ascii?Q?7HCt5cfG29ERhUY5B+lSWsAjGNE+frwCdNJAY1D8q3GOxB+cpUFe9BBKuDFg?=
 =?us-ascii?Q?pFe64W4seNZ82GQQuqXL+Atq7H3ayXYsKSOdmPFCHymAs0K2XggyU/N5PBxK?=
 =?us-ascii?Q?u+1YXlhyRLX1ZJJC5FX2D8JmTnX13bdLDaJ3idiF3cOr+l2YjnZVWTDLE0z/?=
 =?us-ascii?Q?NFM3mlN7BwUt9U3s6MvKM0Tjq6CIJg2cu8GL+0qChiEnEGDb6B6z8vm8ucLF?=
 =?us-ascii?Q?/rrvUcLs1/9uWKDBQIwmGWsLRdyqVyGSu9U9R3Aff2PyUAHv9ktcrIMeJ+Hp?=
 =?us-ascii?Q?0HezqqpBSDI48heJckw3D8Gk2K6C/UIObL3J5egXvtaRGSnNm6pzyJa/cedg?=
 =?us-ascii?Q?QghBNgATWUGgejcnVmX87eYWbGcACmvwUzsV62sE8/nEkFVcXua9tCsbnGz9?=
 =?us-ascii?Q?yXAvW6fGUpkrkOZltjEzBR0rM3TB4moTbBLIsgYPqXrTtGNpFSMccpS3DMx3?=
 =?us-ascii?Q?O7zOfyZKJ0ye+0jUgpp2uOHWIop0cn5IHvuMPsUwWxmF0SyWyEfF/90cC+aq?=
 =?us-ascii?Q?Nse+LoNIgoxpXblIyj+UDnQxsac2ZTx4b7Km/Dm7p7z9Fs774H0gw/CCpkPn?=
 =?us-ascii?Q?dONgcGnarppkU+Yj1dq9gvKjkLLL5oBTw2H4VstojpNZcgJZ5XNOwgWkTeiO?=
 =?us-ascii?Q?k5Ro/GA6IH2Y8OVDsajKndWo6aVzzcJUfJaN/+nvlzEzlGhutcnvzAHKzBV7?=
 =?us-ascii?Q?M5ue6VSV7lJnrjOXU07XHLWlbkRwWWj27XXGbCwhayWBywaIVOgUaKucqdtx?=
 =?us-ascii?Q?uUpyTQaOTTfUuaqRXaRDP8zk4CbV0C2Mb5+V1ZxTFs9MhZf9ox32U9DY/C2l?=
 =?us-ascii?Q?mgknkBCZqSivCLeP1rm13g/RuY8Tja+9LBQOx41b8Wu4tsHKwKch8g6jYMUf?=
 =?us-ascii?Q?LSihBfBZbklaBBUnBvESv3nXEv74T0IyDCXG4l0urw3zr8J6mITsl05ojA4d?=
 =?us-ascii?Q?IyHWM/fRTLnP4DyXwGovLVuOCnTdeF++LogSGI52tnw5KdPjvc8V/iCbhhf5?=
 =?us-ascii?Q?OiIZFAmV7dnxuSPu6LwIm0UtnFLOA+EddAP899jMow8GMm0AItXne96+yY7W?=
 =?us-ascii?Q?QMymVepGhmIuQFqvd/G4VCvnzrq9eHiF5iAfzRpgsNLLieg/euzMxgfgNJ8B?=
 =?us-ascii?Q?WSnUQQ3YaOKXQd11SvyvLGd3P4NjbgeTEqN3e78E4uWD5enNTB7Paa5vNSwP?=
 =?us-ascii?Q?AOGJR8XxZvML+Ft54yY1vl2TymuzUZOajkY7+PzbeyBtGLrYrA3/85G3QZu7?=
 =?us-ascii?Q?kkd9qbXq6XKo1TpV/7PHy08brTbh63tvxeY7lWEnxjNW3MMGoA2IY+Jx/MWC?=
 =?us-ascii?Q?nfZ7cMN+Uaf+aL+DS9h5UcuQwV8BasroIUrx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dfpjbHNg37Wj8e/u/d25bhLvrIor9LoAlkrftRV2OyxLVW3cyaXLpGRDowyG?=
 =?us-ascii?Q?xHaEYYmVQG7a4p3BcGI/1s2b1avZQPBXVwsSdTujfW5vIrlKeY/8qTc+m74h?=
 =?us-ascii?Q?x4RW+ZJLeaMdySDpJoMvPc04hEKoTsA3dbq+mLlWwK9uwJnaIGaGXsEMzG7G?=
 =?us-ascii?Q?asqk0UkpiUx99ML+86BSsnUsYM6sK3c07/kjZVdygva7mxxRBxAH1ovzFUki?=
 =?us-ascii?Q?WhGH+JFz/zunqxSJC77mqENkDI26JOuMmW0erzHfmbKRN0VNBzjNCL1j2U3q?=
 =?us-ascii?Q?xZKkY+hLui8z3IfGdxavsFfHAUpJfLiB3SuKsODVfc1mm/kj+2W6o2l8C3MC?=
 =?us-ascii?Q?/njJ6utxJJeC+dBgI9mj9hag0vpfXXsBuHD1DQlAgpDZrrsiMVfUmdv7KlzB?=
 =?us-ascii?Q?CpmqhRFGVG/9QQMbpkMGfk4hR47zxUZommM2nTKz8DuuM1botTwmxyiT7q22?=
 =?us-ascii?Q?NKW8Nkoxr+ezc3X1VDmIp1GiHbLgBMI2q9wdzC793li0U/ndGMmSQRTbq3jy?=
 =?us-ascii?Q?/1inYd/GteJ0Ryiw1e5/7R4yyE1cAFd97snjg9KohVnegB/SYIObXYNTEraE?=
 =?us-ascii?Q?pc6OS+7JA7hluVNLr7XrV92TGY3LhvDLEtvVtyvw0WyENLfrF/jBvqM/+KS3?=
 =?us-ascii?Q?x8sdDoxz6BkmAqt4grpfRb0iAMaFCn4zqZz3loydK7qzfFOdsmTpvM3uI+RT?=
 =?us-ascii?Q?uGqfHyJQdqMZXDOJwJTpV1ZgJLpy+KD2m1b1nFxyz5H5Usek+8g1NuuvLa76?=
 =?us-ascii?Q?IHWtT9eQ0J48xZ62ZjuJft0lmLCMikwyy6dRGzWiWB8FPR/WkRQU5ucU8UnA?=
 =?us-ascii?Q?ZWaAmob7utSbQVz395XnxKZ0bTacEGwlQ0tSTKULwWy3Fp5Hkjfhf3kzHpS8?=
 =?us-ascii?Q?+aeTkMpetFkV54Mb/9GeLuSbaKze0mWsWnYD3VAvoulc1cJeRs3KkbeyGf6N?=
 =?us-ascii?Q?GVoLMMp8bStkFgaNVetvJ5lt72/ckxM9eYmTpZ/lddnMir7P4rgIwX0WcxXa?=
 =?us-ascii?Q?cIuxEqGLNnU5b0AwE3QIshqI/XExAjL5pUiCNIG1GebXPkpdnyPoIoHzVCv1?=
 =?us-ascii?Q?DfhgAt8FkU5vmOHHfqZMyoVMGtz+LSEIKsiBwowmZd6SRyKWD6COrSBUMQJO?=
 =?us-ascii?Q?KwNRGJhZcXnLt71oLCNCft1pQUyX9ohePhzbTmgcgysdgmOMZpzWbZFNCB47?=
 =?us-ascii?Q?TTu3u/fUclkMYpwRpDnI46nCf0y3kEs5p3ENRNZS+3xvM3quR6h/+Qa0m0Zk?=
 =?us-ascii?Q?sWyzQUC2aC4thjVq8vigh38zhuFV5Jsjro/A9q0Ryu4B/S829RCpi6kltUw9?=
 =?us-ascii?Q?/1lja8939qqyGSJQ0T814DFsxFuMK9Qg9UzwkyF0ak2poIodBvL91o+kpJhm?=
 =?us-ascii?Q?Twp5MSU8suWs6KcDHneeU9i4TeOFy/3ft9s6XZ72OjE0KDBHp5b3NjTgEWcA?=
 =?us-ascii?Q?CBY6tyJGogQWe9HT4AnmluaIlkIm12LV9MJB+6xS5dozugBsdaWenFzw4+wv?=
 =?us-ascii?Q?f5kX1hrE4P5gOxEgljC/JMbZynscFORQkPGRVdFhHM7s9uJ7YKtq99uBLgru?=
 =?us-ascii?Q?HjwXIkwHv5OcroQhmzsb9FlPvzXBi/f2oQjb/blT?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 936ed992-952b-4180-bc38-08de206d42e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 15:24:37.8579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nMJJ/0wowMesvxSi+obQQF6x+FreJZmudnXYRaHrZzViktwEOJbB4MIl/CJD1C3T4eMQX1f5vjb15l9BO8uyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Saturday, November 8, 2025 11:46 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org=
>;
> Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rp=
msg bus
> > The remote system should always aim to stay in a power-efficient state
> > by shutting down or clock-gating any blocks that aren't in use. In
> > this wakeup scenario, if no GPIO lines are requested or marked as
> > wakeup sources for Linux, the remote firmware should put the GPIO contr=
oller
> into a low-power state.
>=20
> There are no messages defined to tell the GPIO controller Linux is suspen=
ded.
>=20
> Since the firmware has no idea Linux is asleep, the firmware is performin=
g all the
> usual processing, driving output pins, monitoring input pins, delivering =
interrupt
> notifications. If no pins are marked as wakeup, it can then enter some so=
rt of
> low-power state, which allows it to do all this work, plus save power? Ho=
w?
>=20
> I've also been thinking about what a wake up source actually means. I've =
been
> looking at this from one use case i know, an Ethernet PHY performing Wake=
 on
> LAN? What normally happens is that Linux suspends, but leaves the main So=
C
> interrupt controller enabled, and parts of the GPIO controller. The GPIO =
controller
> has a hard wired connection to the interrupt controller. When the PHY ind=
icated
> WoL by driving its output pin low, triggering an interrupt, the GPIO trig=
gers the
> main interrupt controller, which wakes the CPU.
>=20
> How does this work here, in a message passing system? Linux is asleep. Wh=
ile
> asleep, does it still process all remote proc messages?
> How? Does it wake up for each message and go back to sleep once it finds =
it is a
> non wake notification? Since the firmware does not know Linux is asleep, =
it will
> still be sending notifications for non-wake interrupts. How does Linux ac=
tually
> know to wake up? Do you require that the low level remote proc mechanism =
is
> also wake capable? So in effect, Linux needs to go up the device chain an=
d enable
> wake source not only in the GPIO layer but also the remote proc layer? An=
d
> whatever mechanism that is based on, until you get to an interrupt which =
can
> actually wake the system?
>=20

The remote firmware does not need to know whether Linux is asleep. The GPIO=
 is not used=20
to wake Linux directly; instead, it serves as a wake-up source for the remo=
te firmware if configured=20
accordingly. Once the remote firmware is awake, it sends a notification mes=
sage to Linux. This=20
notification is the actual event that wakes Linux.

This works because there is always a physical interface connecting Linux an=
d the remote firmware.=20
On i.MX platforms, this interface is the MU block. When the remoteproc driv=
er is running, the MU=20
block is automatically configured as a wake-up source for Linux by default.=
 As a result, the notification=20
message can wake the Linux system if it is asleep.

Thanks,
Shenwei

> > Okay. To fully simulate a level-triggered interrupt, a notification rep=
ly message
> is required.
>=20
> I would not word it like that. All you currently have is edge. To simulat=
e level
> triggered interrupts you need a notification reply message.
>=20
> > Remote firmware sequence:
> > Receive the level-triggered GPIO interrupt.
> > Mask the interrupt for the corresponding line.
> > Send a notification message to Linux.
> > Wait for the notification reply, then unmask the interrupt for the line=
.
> >
> > Linux sequence:
> > Receive the notification message.
> > Invoke the interrupt handler for the line.
> > Send a notification reply to the remote firmware to indicate End of Int=
errupt
> (EOI).
>=20
> That sounds more reasonable.
>=20
>         Andrew
