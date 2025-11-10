Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C3E280329;
	Mon, 10 Nov 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792331; cv=fail; b=F+h9wYDiDyZsO7kqmbhLzn+4x5LxQwdZ6wOsmsGL7tvMY4fOyQruruv/3V5Xu9ie5yNhOGPWadjoIhzLaZXXGAIGLBF+PZipU79tqsuTQkuuGP0W/NBs6zaaTJ71fV2S0ksOcJ3MaAvyjJJ6AXSF6rwHV+n+rDcPip6IQKPfYhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792331; c=relaxed/simple;
	bh=xQ9SyvVYuFTy86FUlt+i3eOeoMiLBqI948DWj05j1C4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qb3wnRQXFD+gxPXcmXjXlaB4JViLAQCICZMa9jCBLxvz6MHou9ZD4zVP2a0dlfVQEIbYTc1oqDFaqnvATyrM08nKWILgqkPQVhkNprizNaa3p9b9Bv+E+FJCBivuHCOZARFDhglxipS+9LuPlvyLVMLe67hKYgvngjXGlRbq+Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=faR5NPf/; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="faR5NPf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu7H50TQ4Qjoqlby5CZbx9aRcVUd2PQ3itGZBLAtaeU3W4+uW3rvrEk6U49oleUy7y2ev514H/qz7RHMVinm2cL0El2/UnOdLtxRzJMn41BzusQgdpaYOsvYxrvUj0n6NW2ILCgshGyQTotePOdiKI2zPjFuGZV/Z3kQH9FTO0V2fTeiJjI89I7B1VmFOWGZhTtGcmK89Jd+XTb0Upk4aJ1Ot+Joim8LQLelVPPAEtFXwP4g4VV0S5PFn0carSrH9Lvqzw/GP/EFfnYiXOzhpmiBbwODF7e9nSz8KgiE98shGaRxRa+HJGguzTw2xJT4izVGhUqKSYQdo3gjs5+yDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkHIsNy9Rw6ja30HvOPfGgUuX7DJankAOaUgJVCd2EM=;
 b=xzGtN0UMDLZg1f7BYJ3zN0hIzogXSEL+mzlHWchyYqvsjQrAFPXAs7CJCFUUj0XDdLAe6/l3KiXBzeVYt5kWd58gV5Ma8JkcRy+LABpBGw84W4bEeCqzkNDdkCIYxqaMHnkDnvsf13PGUnQEFyImNttBuQgGnChvNK8aSgGwa9dswvXb/LBhnqS9ozkBj2LudJUwrFEVpBAMiKVvhpIpnje9nlH0OOWBCCEqLoEUOlRTXxOU+QBnzPfJTWYS5KFubRsjSnEmL+qMfcAy9GoRyTK5fJbezWQdUXWUkNQvq+Pi06Sor6Nt0BTUe4SgreraYSNBTDjQluyL17tjOfdAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkHIsNy9Rw6ja30HvOPfGgUuX7DJankAOaUgJVCd2EM=;
 b=faR5NPf/DeE/iwriHXNn6bokmGQk8An/1m5lhtBPguxRxrW7qLKSOmhLlqepZghTycff/rkooa0fSkrHrESplfH33d7l2241Y1YMIp1mI99i92jrJ5c9aWJvLBD+jqmVXPGQQEqSX7gXVV++VwOmgLCQ9m0zwuKlvkf0ew2dWHQcPZScERaFeXPtPlAANHj2ztZM6DnO6LIcRAOW2fK6VBbPQaJASDyqJUSBeizfVc54dqK1aEmVpzb4+yXfPPvC0L5tVn9SjAjaGsTCpTnlmkLXY440FRkqiFl8gKBDXPnMT+QoQFCvXX4IwoE8l08WuYTqXzgMyV7eY0IQVNGHBw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB11478.eurprd04.prod.outlook.com (2603:10a6:150:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:30:48 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:30:29 +0000
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
Thread-Index: AQHcUl9T+LTfJNsvJUmc0OfY3rguew==
Date: Mon, 10 Nov 2025 16:30:29 +0000
Message-ID:
 <PAXPR04MB9185F5CC1FEE1557B6AD320889CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
 <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
 <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <638dac3d-ddcb-4d53-b06d-e0bd3d9077c3@lunn.ch>
In-Reply-To: <638dac3d-ddcb-4d53-b06d-e0bd3d9077c3@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GVXPR04MB11478:EE_
x-ms-office365-filtering-correlation-id: 288d4ea8-d379-48e8-a733-08de20767675
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pqhalxytzkGwflzrF+R4IcZ/kfABI7VJWVvD6k0Uv7fEnKYpTtn+lzT6+JXd?=
 =?us-ascii?Q?xqSIetw3/KmvBYKGf92wbFxKcHs66etb17R6DIFlrz1R8WJsuRl190VEif/F?=
 =?us-ascii?Q?P5pXlGspmneHi2d3hx7mzMiKW4qfJFWBOieQ4VTA7Eh/fXONk9cm0AK2tH3y?=
 =?us-ascii?Q?ID1NuNZQqtUJ449TlIfmPYo4JlSKlid8C3YKueufQLUQf4OJFRlnEirSAYZP?=
 =?us-ascii?Q?2fYuZsd/vBcbydFaIdlBbL17FnHOcQRB/7TiqTSH5hgDvYVvBty/JbdGkA7o?=
 =?us-ascii?Q?x00hPcsUGQHw1aMvPiOQCK9V2RfR1yTrIKU7t1r55w2mVCG89cvwAQkMQi98?=
 =?us-ascii?Q?DuHVeFGZiGqQavSbJ0HwdaiGjbd6cIhxLfSmDnmKcF8PaQ4njJ288RuyY/h4?=
 =?us-ascii?Q?AYurKUxQGoCeFZzny75sKVtFKWLRVTTyxuhty458+Q4QZi/Bwt5mIGVoH26x?=
 =?us-ascii?Q?pANfW102NOoIx3lIC/9W9u32OvvExgCZb168Ujd7LnXrSGPoNhbJKYfa2VH1?=
 =?us-ascii?Q?qw1TN4wNoLkyNp7JjN4lbgnxdHeKiOulxOpiYeaXqjxIK1M/N7FoEzG9pvHe?=
 =?us-ascii?Q?nVAMqJK2jSWx5W15zbrcDrmwZsk1u3Bdqf34RygMcBdC8kRFkM55mu/88g21?=
 =?us-ascii?Q?wAG2OJ2RWzYO1sObCD/fg/D8yCJyuEDG3jjW891EJJSzcwtRayDaUsYmK2p8?=
 =?us-ascii?Q?V3Sij1WHqMh2AcLcWyk8psLPayv1vhi71ZddtBwyrZcL+ieTPFjuRvTCtjpA?=
 =?us-ascii?Q?hvSG5XZ3WYg3NTObzNs+lYHKbDQzqsuF5bHMt2Jf40NyCL9fXa7vFOXjAtG0?=
 =?us-ascii?Q?Zxtd5dJGStvawws+jQfUQL4y2IM8iwv0u1BMRM5l+UMQvH2FV93RCtiew3Py?=
 =?us-ascii?Q?ym31IlXe1ueEg6TdoFKk0Mn7XTnF3uIqmm5HfiH63If2qmy0bhbD/g1b3yn/?=
 =?us-ascii?Q?ZBw3+4XTbIPul461VkFvGLpkJdunsA6VMc1sEus4dHNMWv8ifZb6noTz2rWp?=
 =?us-ascii?Q?pzVnxt98lAUc8PZBJPtaax7C8nvMljuoXktwkJVc+mi/4OTqfqgPlGM2U8V2?=
 =?us-ascii?Q?6iiOmFnmk1dOTgt7181vGoRCl98i076JD9Xx9Uq8DJpHYusVq+pP28cTn8/x?=
 =?us-ascii?Q?dM+0nA+Bl4TV6t7AXgdBKiwpuciWSHCofyTVNBwYTsb3oHa5+Rvl9Mv2uOj0?=
 =?us-ascii?Q?e9R3zSUI0AjUAXE3dw4wwx0q5lc6EmBGcz8WFSUjeCVRdXmR2AZZ0q3S4HfJ?=
 =?us-ascii?Q?wgHPRYVZzogC9UlenfTsF1H1Xk+XsXJYt3flCYPh7EhwSv9LNlHcoDPsqZJL?=
 =?us-ascii?Q?ZXX0BwxA25v6UZ3NWcLgWVgu4tkfPaQXxnK7Icw8ipXG1cy1xPiGz92k0t0o?=
 =?us-ascii?Q?5t2+qtFGtOspBIwvt5i1FTxuFGS+xPjJS1f4iBTBfWdvcQbCoStXUS4RyVA9?=
 =?us-ascii?Q?G6MmxbD/4d9jed4/d0qMxq7ptw/ntF7SekymN1WJ8xlzHh/bmxJnZlyxLAdv?=
 =?us-ascii?Q?couJhtxLL4EBLFFONvs1uV0jSh98NsdHI5cx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jvXuQswQgQ66610QtO7cmvDxhAqRF75gHeLBohiTJxK4Bb8ydIXKeAV8XeQC?=
 =?us-ascii?Q?LWMSgEe9xwLV/kZSc7qhihiQshAQgwOliqDdm9EenKqVupqaPEXqR3+vIpxQ?=
 =?us-ascii?Q?fR2YCLoz4AVS+vQuiH4TiyN1Oyxi0nhVs+GdYvJVWAB3Ky8tGswrSBq0mGvq?=
 =?us-ascii?Q?PemdSyD5N2Nwd+GVzR8ID0VKxUSOkQxrJ4LoMGo+ykWEIhRdLYX9gRSC//Aw?=
 =?us-ascii?Q?G1fH3iOYFfZnb/lUYznEvKpLm6tKV4Z4PfVU5DORzowgEh5YfBRWMgmjesHF?=
 =?us-ascii?Q?NvQLgD0BFTUS/XBuGQHzE4eBruFt1CGJTfACY9FMV6jY7FJ3FP4m2eUsS6kM?=
 =?us-ascii?Q?ua5prUjcXxLDTZpWFmk1gJ7PskKbNM0H3fFz9WqjIjeSQmukk5gzuibpT69m?=
 =?us-ascii?Q?jl37aXKpsJxDyvSWkELQW4flM3SXtmvw4YwjY949Tj1xOv3IKNkLxsU+Z6Yz?=
 =?us-ascii?Q?o6InHC8e1MqrD6ooGM6T3jWXrFlo8Yq22TN5Az2XrLuuSRg4f3pEIQzh5sKj?=
 =?us-ascii?Q?oFBU+3m0wtRF2fDr1GkuTnyOhblEDLjiYLBRs4xaaVyVRjyYg11NuRbQzrxn?=
 =?us-ascii?Q?IhmHbt1BwYaYxIBgdB71gpkEC3ZzC+nkphwH2hQMgm2sJPaUJeHnRi9CJgxR?=
 =?us-ascii?Q?BCt/rP4FD5yqa75j5u9xaVD+IE8G7bwQhDdv7/5RQf9mqTA9ODnqZSy+cZKf?=
 =?us-ascii?Q?hAs7T0nFiwBJ2G57TEWQxEz/FXYRfdN4dSuMnMpFMgnt+aU40dlCzFWXGYpr?=
 =?us-ascii?Q?jpx6NeOfVLJsDPSvBtveHPCMxqoRf4D4Sy2SjlidiNINBx6xj7/Pj4gP//fR?=
 =?us-ascii?Q?nPKfjNsEJUeFXLobf33C8PaD5QPd1ouO08Ljc4554lz1QRPsjFpMNGwmOmIG?=
 =?us-ascii?Q?wnMNz/tFpv3lUjLkLiK6cBD1RCW4jd0UcpfRWQyV58ygW+iIprKCD9St/5SO?=
 =?us-ascii?Q?pAn756eisvOVnl4ghXcpQTw0TRaX1d57sc3LyhBiRAWiwn5El/rptPYsAjF3?=
 =?us-ascii?Q?swpwM+b7Fsrdg3Pq0AtTpCZxcnr7vFXn1nq4ODpBHHp09/uHBSmki8FWqWvq?=
 =?us-ascii?Q?k+NxOZyu92s08+WBWyMbG0BTnYWs9Qu1AqXoCLq/0cIt7zImHFYPk+hvLTF6?=
 =?us-ascii?Q?Bdn3lgLMvPh+1spXFO017byfz8Al3YtfuxsuJCBbrlhZz8u/JUfTuHoOTBoT?=
 =?us-ascii?Q?6nq0DHaaQM87ezPEiWzX8FveuYpR86j5jEgiS8HdQBB0NkKcNJtdFl51gdS0?=
 =?us-ascii?Q?BgucgVSybysQK/sR8LH1Gxeq8RT1ij0nPpJbmzp8C3xUlobXM+fKQjJSIwaI?=
 =?us-ascii?Q?i2gX257jLD2pT5i1rDjw1Yi0DO1/rSvdZ381mHE5AR1lGDYgeoELY37FWNfa?=
 =?us-ascii?Q?BHYykjzfGjrWXEZzEA95thlRqspeYaqWkEq21DVPaw7sWrYtiSQkiTPfysF9?=
 =?us-ascii?Q?ptJyfWqHqxDna97UrC5RmKLlEf0vXUUy3tOsQcAvYlC4OM9inT8DMmUyTMq8?=
 =?us-ascii?Q?6JVNg3U1rLZP5MCC2PbKE6oMUS9be+N2Ou7Ge9xcgEgtZdqLzv4TakONiIJA?=
 =?us-ascii?Q?f2/oBmAaV5UDyvRL6B+QMalitfoRRMLqLP1LCz9x?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 288d4ea8-d379-48e8-a733-08de20767675
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 16:30:29.8224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2BPNIe7nPVnYjyYgrAPZrxCTG9vh51bxFuYl1ur8wE/jkGHOz0NV0dJFAz+ijADgOuTTnlyShgbss9ygZvIjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11478



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, November 10, 2025 9:59 AM
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
> > The remote firmware does not need to know whether Linux is asleep. The
> > GPIO is not used to wake Linux directly; instead, it serves as a
> > wake-up source for the remote firmware if configured accordingly. Once
> > the remote firmware is awake, it sends a notification message to Linux.=
 This
> notification is the actual event that wakes Linux.
> >
> > This works because there is always a physical interface connecting Linu=
x and
> the remote firmware.
> > On i.MX platforms, this interface is the MU block. When the remoteproc
> > driver is running, the MU block is automatically configured as a
> > wake-up source for Linux by default. As a result, the notification mess=
age can
> wake the Linux system if it is asleep.
>=20
> You need to add a lot more documentation to the specification to make thi=
s
> clear. As you said, the firmware and Linux have different sleep/wake life=
 cycles.
> How does the firmware know it is safe to go to sleep, if it has no idea L=
inux is
> running or suspended?
>=20

The remoteproc driver is responsible for managing the remote firmware. The =
GPIO driver=20
operates independently of this process and functions transparently on top o=
f it.=20
So the GPIO driver does not require to know the firmware's running states.

Thanks,
Shenwei

>         Andrew
