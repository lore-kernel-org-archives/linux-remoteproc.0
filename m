Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2115.outbound.protection.partner.outlook.cn [139.219.17.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DE2773E5;
	Mon, 27 Apr 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270952; cv=fail; b=kbuah7/824SH2dpJyqlV5dR2aaHSTRj7hy48jGV+BeUrD/yomljgEyZtFuI4BbRsNHRnsOmdcTY02TAOpNae8U4zQDXzcqKUnG1FSBY/CkLqo4YBdmYkwlGLi3gMosOdEPIk0GaIAUhk0ZSzifhUW5/3Q4IeSc94q9NIfJHOn+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270952; c=relaxed/simple;
	bh=LUvm3roHBlNajZiEmxe8lG2cwAinJZ09y9DAyPMGqDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nI8lpTH21Rtd5iYGyMTgQDsDtc94wx/F/Yw2k11BeXZOXDODYMV9MPakG8QM9YGUNJWMsLV1Q5hX4b+78n0U6JHhr3cUCZ9EG2E4/A8b46RPjL+bFap9d5eaMAE5vlhtA2f0h/NrwbXNIprdxtI0N1paCzrVfxfiiqG6aLD0D/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD6K0Dn9sgyLxUM1eanAq/JLkz/x6bQv9hzuC3Tg+x7F67EbCa/D/JdiP9/U1cHbS0sCTzU0brBODIv14BRkjkFDlmqePI+lXK4TPGfCN3SBWOwt+WProZto9xiVfLQ0d4K6/m5lZ7VbafceiYQZFjJo7cvMIt9TC6a1Or6Wp8MAE7600nBmYun3m2VEqWqhXpx9zfiIwMrdbBddkvAMFs6xvC38JhpnySwaPDH06bwuf0ieCxsvQO8rR/v4hm7NmFifph2VPs4aJyRhF40htZiSB0TZefNsmj71GTyn8lvlHEs3ig+avTpZ/SJ8wlfXpwLPSaUtIawjczXA1pztmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6Q4kCpU4tBdespTviVfzLf5OaFuglXXtyrUAlMDgkk=;
 b=f3upWI7rHluSHdRn6+GLI6LXZiysK7+cfW/DdhQJiSEFwLa/2/zp8j5c09Rpb1BzRjYCQ5PhrnQ94aoNJgxIQYGFwYSeltQyTaGTaH2JABWhz2j13O1ToN/wZ6nh/PCZbefHVHpLyDauIkia2aHkckg8yVN3l5vx+iEM32e8mMf6XuJhtj6ilqFSH2IkjborAJlJ/Q/IOtTa5ejRmN4f7JOE6IpnIuZAlMlZbphrzBLpf7To/hEadcMoDbEMy6FrCKMuxcz/k8NkBOJ8Wk5HVL/7Kw6eWKQpqMGaHBgWYx7q+TIORCKih+Th3zNSmJffiNLL1XHe0kmRAcngmF7XsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1097.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 06:22:18 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9846.025; Mon, 27 Apr 2026 06:22:18 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mason Huo
	<mason.huo@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of HWspinlock
 for StarFive JHB100
Thread-Topic: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of
 HWspinlock for StarFive JHB100
Thread-Index: AQHc05lR5+eLrDl5rUSuAiEMyjSTWLXuceIAgAQAWjA=
Date: Mon, 27 Apr 2026 06:22:17 +0000
Message-ID:
 <NTZPR01MB0956FF07C381B57B35F4F1929F362@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
 <20260424032026.62301-2-xingyu.wu@starfivetech.com>
 <20260424-corsage-strict-026754e5f045@spud>
In-Reply-To: <20260424-corsage-strict-026754e5f045@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1097:EE_
x-ms-office365-filtering-correlation-id: a0093742-aa05-43ae-d646-08dea42554fa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7d12TH/YomcV9shQEJHwX1Yagyl3soQmhTuhq3tufm146FMAe51VocmZKBY8Cyj1/EHGrkK2XdeVirmcx2xEl6Ad7jUDZGcyDPH/NrHMrs0/Cn+lJjQGshRlOj/k/PRW2UdPsX/QEVePdLXG/X8NzF06XCxXlGYiS16YeqLo+4HwZDomJ353MAfuDNSx+InX1nT19pd37g0g1ZuQhfkcQE7BzIkikP73PRCJeUIcEX4ca6aL2K8q4NR2e8U3gEcLZRP5O7q/jBOYJH7loYZr9NDRjdgFmsE9+KPUQiNrAttZJp9GS+5ldAfn/FozO8vxXz4v0FtyY+ar+Pkn5HbBIKD3r4MFPigiuwNhQ7WFDqNADxUcbRHvG5pE8YeuMUug3bbhBEX8vpfcd88tW+5RX7T+PFsChwiVhuoDU+Rf6ObIP831UdRwn1GytdD4sVJFud3cVRL6XLN5srPsRhV4UXFlm8JiHP3ENYnvJMzNuf9u6fpm16NLO/s5bqUE2Ar9aFqztlN2P0eBl11IhXES/Ibt+pLmnevewFRkojQdERmA2Pawyz1IXLH/1NFuMzvwsnKb+7RMNtM/Jp8eDePXs18EOUV5FDkFxTJeHYq1l58=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3vHu9SvGump7x0QZSeGI1hIeM9GQfpy1oY1ctr3jFvmrovJyZboRV1Z5wQwW?=
 =?us-ascii?Q?x10MrQFHHXgFck6fyEiCGL9P1eObeZF3Scraa3fWiSWDfmBRsNhYNxQgr/sV?=
 =?us-ascii?Q?kde/Q9q8Sax3XHSU1Utpi1KF7ezOnoHTLDobm1WMbiuz/sBmflkGXyUKtzom?=
 =?us-ascii?Q?6GzBJalVqYnFFOPIF6YemFvSSosFU9jRHCI2JTk/ppteC8YXW8WUfoZn+s6c?=
 =?us-ascii?Q?tnt6VPQejjPvzzdP/gg+SWeukWbJDmG/SLhyh43KKBMqt0pEg3S3NTr31upH?=
 =?us-ascii?Q?V85raKaCzusAHc1ilOTG9hiksmvl6QNYCBMu7nb9+PCVAwZgIS6zcYwdIXNV?=
 =?us-ascii?Q?ODgPGEmR0vCTtsjgoXqeQI2ZyfVhisN2NtHxTIZpqwaVuwWu9AkfH4AYfh9U?=
 =?us-ascii?Q?CM9mxDG64pD0h//Imr0SDdRiHTqd1t33SBaLv03vXSxaV18Ltdj7kRobXo8U?=
 =?us-ascii?Q?TaDInjduT6g6fG43X/RqDOBfPVIRP372zd3aelLEuT5HUGuTsvpQP6ZdOGWo?=
 =?us-ascii?Q?iXKtKAyOoTevXhbt26s7PSkopUzGG0hB5bOZ3yzOFi790SN3bVC7S2wnynA8?=
 =?us-ascii?Q?ev6Vru0vxm3mgK6YxcdUOf/DxFpw75SVNowSOlG1Lq7BVIACllq2IGZgnbxx?=
 =?us-ascii?Q?cxavfS2fM3yDtEokS+2GA1fjh0/EeMd4FhTVzfy1OPnPYz55FroaKsQRId7k?=
 =?us-ascii?Q?qV6nO5mByZc+WFb4Yv8F22eSS9Igno7kh5X4Rb8JqDLAigz8Vefc6YV64EBO?=
 =?us-ascii?Q?PBHpZUyDk/YsP0LqxJWVzIAYuzn+bRbPtdEVr7nff8ISqliCPolR6auKd+Vb?=
 =?us-ascii?Q?fbhyLeJDS9n+hT4pBBnMGFj6dN9r2r+7EcJsPZf6YxgSnPDxPRcXyLkma9oT?=
 =?us-ascii?Q?1RXV8tMoy4tP8cWoKu3++CS9Q9vGXqeC2+XjeNcbvDyFWnvRf0qOqNGIWVtj?=
 =?us-ascii?Q?C9xjRqsuhnGBOkW1uTtjv/wAGSs6u1KoqTCBeVtKMOAEObjUDpDgB7sRYFxB?=
 =?us-ascii?Q?9IEs5PmsxWdqfdbMopQtM1Zt5nu2xeKxIA2X6/G4dLfQsbcC3HkMKbyywmnw?=
 =?us-ascii?Q?XUIks8UV8UnSWSAEKkx5uKBfw9u8s++QPKzU/jzULT/5XN/2JWXEtntBRA+7?=
 =?us-ascii?Q?FsBePedjPtE1vzuSnMbAqL4o8UfgpHqj54Rvz1XAiMCoh7qDcQEf9q6mJ3yV?=
 =?us-ascii?Q?nAe5wM3dVhJpQ0pG6yhPYjlzIQshHe4MGqAFMWbgGGymGmbM/8dqWMqp9R3V?=
 =?us-ascii?Q?43nDDmJVjHGlnOZk+szuRkIwOmXvxGLCYVKou707F+BPIjldGDhZ7WhR9P41?=
 =?us-ascii?Q?uoGFlCC5S+MRUOYBl1cwqXCD7SwGOjretxl7T5UtE1njqVOZVfbI4ETQuX+w?=
 =?us-ascii?Q?1o3/1VllwDGlHqpm7qVLST4xu3LG2FzN0c8TiFl15u243M9uoSig9mukIgrp?=
 =?us-ascii?Q?GbSbGFn9TXkFYdW+Qkj7ACRd7NBDoUqZnupUpOexIXm9Vf5rl/69mk2tmra9?=
 =?us-ascii?Q?M2S9F0+i3Gzc3jOEPKLe0yG6h5SvxmqYJsR9zDBj5AgE01TzKWBSRJs+0NDW?=
 =?us-ascii?Q?vXpsxdc8sQblelGe0HbiQNHSnst3Axi267NxTvfVOTMloePEcgjMz4YyZ6O9?=
 =?us-ascii?Q?4OemCBnPKUsgzHv1CEwqO9fN7iASThHwyfUFRP1I+wfhlV6JswS7rbWdNBLF?=
 =?us-ascii?Q?J35bM5Fo2lrz2TE2tS2oPWP+PZfiz5Xd5aIZGydm0z50PRZRyeB6nanBUdiQ?=
 =?us-ascii?Q?EzqjBIORIg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a0093742-aa05-43ae-d646-08dea42554fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 06:22:17.9279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWsDy8GsHqn8jjqzMN9S83RXxaxIts4by7GiavYJ2Tt6hURcw9NKr1IVn4QV0tfwzjxpD7w8ME1eLXfGYlTIB0+15LS1/TZUGbRG8bJ9cd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1097

On 2026/4/25 01:05, Conor Dooley wrote:
> On Fri, Apr 24, 2026 at 11:20:25AM +0800, Xingyu Wu wrote:
> > Add the new documentation of hardware spinlock for the StarFive JHB100 =
SoC.
> >
> > Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> > ---
> >  .../hwlock/starfive,jhb100-hwspinlock.yaml    | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.ya
> > ml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.
> > yaml
> > b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.
> > yaml
> > new file mode 100644
> > index 000000000000..b1b27fafe9bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinl
> > +++ ock.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/hwlock/starfive,jhb100-hwspinlock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive Hardware Spinlock
> > +
> > +maintainers:
> > +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jhb100-hwspinlock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  "#hwlock-cells":
> > +    const: 1
>=20
> Does this peripheral not have a clock?
> Seems unlikely to me that it doesnt.
>=20

Yes, there is a clock in the hardware and I will add it in next patch.

Best regards,
Xingyu Wu
