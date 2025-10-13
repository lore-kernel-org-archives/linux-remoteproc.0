Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8A308F11;
	Mon, 13 Oct 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366690; cv=fail; b=GptYZ8GH2dnC7/H1KYIYZ8iuyAwBFe2VHaDHqU4DbegZdhv0OGQq+EUCDRIRdDMLff8KZcfnQCxn7wZsuH8WrY7NxWbcXoz2b4GV9yGovtUB6R5fUzRbVm9CViYjZUVfLDgy9EMmtZ28QNwAAZG7iZdKtMwi+p/PcuVGa3j/cbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366690; c=relaxed/simple;
	bh=l9eQnTV9zA4RuUOeL03FfYaFU9ca4S4JNfxYyv/25wA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LjF69v10BtzOtKbfkc9/TVzFUgl9JRHSN8mvYBF+S+VoTGrL4AfmeHVAXWwyZvqyaeckR7nt+BD/YdMi/BOWV8JTTHwJ0PXaIiH5ZatZdlTuc/VOABydYCkj9LcqOCLH2Z4aoP4iiynWNkiVt5AR+vhg14EnfIl9ut9x6neIfLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fNXjZy5j; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fNXjZy5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNieYQBeaMo/b71d3fba8z5ci3s8j3MWKArfi3tbGE3gD0b8EktUjRqn890Au3y30cRD1ugdC3EX02WQZXWShkn1G+o6qCEQyuQxIOyU8I4KAHT7EAPGn9xY3qGUtQ8zUa4ZpqvA/AhXrNK2HhrFgBaCPOOQI8VN3QojG1eztrgtghKdBBVFPe8ZfbT23knm8E7rrwi7t4H3v0cNs1IqlPy7k6v1sYboFSjXIBmkC1WFQoR7PM8G35SNODAcdejC+MR+/yG1qKQ8ZJzVkszVn96mKs80PEyc5tKEA5RUj90iy6PaSbA60g6EDorSnhIB+VA/r9XPhC2tOmj8AGSp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfnJvV/JW4vNNhHwbRog+rZUQt4HSZqoZkMOUGsqSS8=;
 b=VzoGf2ezyzfZbe2MB8caKV9VbH45T5YGJrJNgiRJFro6XuAHXM6+nxObwZUJqXLpvrKT5wEM3SNFu1dj9xVHYS8mETBeCr6h09s5hqxRA7RcwtUWrG385zZfJVm9+Yu2vxuYJMWsbth4DcNmvgSBMMVv/spmjqXpc9LvH+uFyE8TIP9k/1Z7hxLMp44DowikyHfhD6S5O/JVytbbYOjg+fJML383k/IfsnaYq0PJu2UxlipKzRVyLSQrZ7fgk5gxY00/igwwCQRmt6mB4FOpX4wd32s16S8Gnzv7EVLfbew+jyJyAdPU9sjNG/WrAVfvrWKFYv9xnuFTrBfE+0Mt5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfnJvV/JW4vNNhHwbRog+rZUQt4HSZqoZkMOUGsqSS8=;
 b=fNXjZy5jQwvKXDNVveWbiU6RlA/EULALTcdLcC2RcNSSi5U6gzTHm81o32ZbPKPbCqHJT5cy9btx+yhB3VnrsYqYgiJmZU5txslgNbUI1YSe5zr/CFvg33IQ99tc9fMat/eH2GYVSMtjdNSN9rHiHeVkMByL+MA7uCyQOTOdoYeiPoh/P8EggOQqa/LI2ptu/ll3I+ie3VbzSd4KmtLoK+nR/zj2U80Ih3WlVoFM+9YX9ly90bk/9MWPUmkju4Nflgr9mQ2aIn/UV9m0XuL6AyRQFavpq3vPzMSUr2Uh0BBtLeAZIOBWrIBkIQc6OPraEHCu2moUCe1GvTLB62x3Hg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU7PR04MB11090.eurprd04.prod.outlook.com (2603:10a6:10:5b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:44:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:44:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcPE/p8HZNFd5djE+JoBVj7U1Crg==
Date: Mon, 13 Oct 2025 14:44:43 +0000
Message-ID:
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
In-Reply-To: <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU7PR04MB11090:EE_
x-ms-office365-filtering-correlation-id: ad94c062-b5e5-4f4c-aef3-08de0a670c00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hiJVi6Pmyzt7K9lhbXehxnr7gNWGj8oy26p0ITALR2RT0GT9GjG69NltTbJH?=
 =?us-ascii?Q?H8oRC5BKxoTlhJB37QxL1vysJzP8uM2AjsX2Wnn9YkzO7uAke/VzmZYcpajj?=
 =?us-ascii?Q?sJzZXj3s4i394//AP2KNHHyw5lswnsL1xgZ4r/GK171Z/mfBbzRvKqtve5wN?=
 =?us-ascii?Q?qtdt4lr90T1NL6/48eDzOAWlqEdLd8COG+WOA15p+mZzeJhh2s6v8bFL4SNO?=
 =?us-ascii?Q?sNM3Zq6N1sgn1SnJwtKC3347fY2uy2ZQs/O4oo3Ef3OMPEq+xB+UL6lFm3wt?=
 =?us-ascii?Q?NjuQnx++PnO3T2wgCWG3viVyLkn0zFnNIRERndLzbGJv+MIoWftu/oz5vRP6?=
 =?us-ascii?Q?O/MRaLhNkXhQ65fjI+pDFZFCK6X7D2ZuT2fpuBqFoWuAhnoIgdAv471rhrn2?=
 =?us-ascii?Q?fXkMwBJP8GyChsf+w4M9/Kg4OlNhaL0gpk6blaO4V73P8hv8shwJPC315Aq9?=
 =?us-ascii?Q?b0iAHKuHlOtR6dQpCuAEdJzEi3s+MnWRFxQVI/yuKS9L96sTo+WAaQ3Q/gzk?=
 =?us-ascii?Q?JSvdQ1U5cljw9y+KQwqcf+KtaVtPpOeAPKaPyaEbJdmUfcpfmdwWJ6Z/YRHI?=
 =?us-ascii?Q?N0yEjpwycH3nuM/hyKdKoS3thARb1KYTnJ5rV3oDQRAQL7Dl7Lf5GYPtsmEX?=
 =?us-ascii?Q?4Rg8FSs88TqgW8ZN2klfXkKZIPRlvNZnecMJr7B4Bp2NekHQntkYlGfXk2gx?=
 =?us-ascii?Q?2anvdK/xbEc/P3HmrWg+w3uEttfQNWSjZGszJFH0xUeCCC+PqVTuFhUw2bcg?=
 =?us-ascii?Q?U370fvCPOI7ts3pSmMpKm+pG/yxoI1g6tdDCvnhKlLDUTzmUQCytteDY+UEW?=
 =?us-ascii?Q?0gQaBAt0HDCZ8L4NYsYnhpRWmDlXHF8iOwLRySERHrjuB4tSU9DLV+AcsZxl?=
 =?us-ascii?Q?Mcp2N5fkTExycYH4HAhucGT4woRUnIz2afqeTfkn4Sr9gRetVTgaAwoMZdRo?=
 =?us-ascii?Q?PUCneofZK2tOZukc6ipUBXVe6/3y36gfftJ6yyI/k7HU4HIyjgoKnF0nVfPN?=
 =?us-ascii?Q?fHVTPuL4QsiP11rFprQ3YFFAu/xkPMs8zWpvYxOfJc0CNwqhfJb4fkoKx5Ap?=
 =?us-ascii?Q?lw8gPi3zouPQQcRVq+pVFofbOm+n51eYg/O+0xKWgNiFzvyN3zZKlRJKqBTg?=
 =?us-ascii?Q?JV5gRhRGyBlxAQci8JwBrZhc5aENNI3dX3Mpl/VviR64ancfx7q8qtWTZLQn?=
 =?us-ascii?Q?lUGWTMCk7zwLa8Sin/eKvEq4B6zBv6hvmOeIhDxCH5L80d4s+x+hqBP9B9ne?=
 =?us-ascii?Q?6QVtPaXz+nmZlcjdJUuYkvbQ2mtAKszwqbL2qC0dY/xuzWXWNFKRNJ+fByv+?=
 =?us-ascii?Q?prbZISp12+59k1t0jARit0EhbP0oa661HaCHcjyt3wXbKUyfHER+0+Gw9KFO?=
 =?us-ascii?Q?pzF68XUXz/czxP3N3Cz2mSdvBdap7+WKY+j7uqQY0EgkCDgxlaad9bz/BtoH?=
 =?us-ascii?Q?F7psVvQwXxUj2mCMV8ahvOvG+dj83yBHIYMMkRVhzHFTknGJ2ErwYpA0TQ16?=
 =?us-ascii?Q?YwMty3woo9MR3NjsKu/qUu3BAp0EMfX2qnSp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r1ZnffElCxA+5cMf9COllk0MJ0usxNQMIIbenaTuCFhOoWPQ5iODUzAsboix?=
 =?us-ascii?Q?FLv70T9V+NL9KCryljXhM6zU6jfbXqbCwg6vxQdIm6sUOxICIZo7BhsMn0aO?=
 =?us-ascii?Q?42sRyflcSl/J3ZLGhNr/sI4bEtU7plT2ShpZyTP4wme5RibJbq/1vgqlwvBL?=
 =?us-ascii?Q?rkIanZTl3BW7QB1dNKP2xZI4pThEBcS7E8gb7HmeUpTH6jab3ja0fwLuSW7N?=
 =?us-ascii?Q?DVZI+5F9tTss+61w1sZJTlvtD/w7QV6DrMx7PLjDpo2iCUds7mrI/Ph0sxAv?=
 =?us-ascii?Q?qjx4Md6DMaGbvcIC/JOpn6ehEiw2mSPsu+XtL5CHE5oqCG25eWFYf0CA+BSW?=
 =?us-ascii?Q?TleLodF9uDCe3nmXwzBvrsVZiqqcFKZy0nIXbP4e5uSIZAl7v/vdErfRukZ/?=
 =?us-ascii?Q?HDDj04ZsDMu1ZYh9lSEgpWmO8Ctvi2OT7OazpPtYXVYyrYdA1bmvK6nZrXwx?=
 =?us-ascii?Q?S7YPVYf/1nwblzI4BsLF/dQa47APSIP0TEzqNp04IEyJNwO0fyuEVl7FgEs0?=
 =?us-ascii?Q?LD/XaqkYISBqPugiEUFKRUlHsxshhvvLdNr+27LZCg+UOFvTAEW17xMg7Uq9?=
 =?us-ascii?Q?Kf2ecD6Sl/7KHoZ0s1I7IgjghmY1InFsklMutflsjzM61dKNXqbX/KdYjZBf?=
 =?us-ascii?Q?0GKDEIxzW9/sSQKwTThsEi6cSoOHMTrkGc8h9yvi0HG9PZSjWbLfEycv6rSH?=
 =?us-ascii?Q?fT5MpZJ+V0gbSKHWb7L95xR6g8q3rP+tldlXW1wcvrHBq6YvjKEbkF21vquD?=
 =?us-ascii?Q?1Tr7TpcixpyVN15HWFXktEoEjfcui/aBLASBhT3uMyP76b+4o+m6/CUm5J+X?=
 =?us-ascii?Q?2WRTbv/Cujcv27qzIwKZnPDT0iZ2uL8QaRzg2BF36rUmpRoS9z32wYFLn8Vy?=
 =?us-ascii?Q?IG8+nNQNounYehNzGdwgO4FhqV/NDO5CEyc/uFAfwSK4rbo+TePhGcUsG+Ip?=
 =?us-ascii?Q?fyB0Ok2U0oFVdW7BwfPuwLUvANi5kaSq0IIQixEi4/xWQfGZ9BkChftjnUKN?=
 =?us-ascii?Q?iF+smQm6/oJE+uUh72hqfPRA5PEG+u++N4XQfWk/+YRzBMlfG3BW5LnqkOt4?=
 =?us-ascii?Q?1Vn1LgAtANZIIT6eqMDf27p5+etE7ruc09Ze6xXCSkl6duyjw3nHJDtaUOd0?=
 =?us-ascii?Q?Y2Zvodnle288ZKVY1zbVym1+9RosLcsU2EkI4LUIui0QnkMNudjtPHkHkyHr?=
 =?us-ascii?Q?KTac6kapmgrIV1MwiAJyvuUd00baoSn9Yf3PTT9kAKA1+f7laXzTu/DpMeCQ?=
 =?us-ascii?Q?A0ec0bo1+U6CLhYwNPJa7CKSGTD9sq6dLIKhQZndRAFRSg9yJmeiu3SlmTYX?=
 =?us-ascii?Q?1LV39/VRfqgEIADZ0g1vN94kkhfkFC7gdKT7kIZ5TXAI8jc994qmLE9LOd33?=
 =?us-ascii?Q?RkFDCTkAp1+mlejTvSETtZV4Dve0twKDPgTJGCAsIPX7h5iPOsHs2bfC9lxo?=
 =?us-ascii?Q?j7TEqMTiHySzmp85soDEe7PzPkW1J8bizANlc1kO9LuDImWm1QJnLeUj9QMf?=
 =?us-ascii?Q?oM8GGgjLqIxKypdLBOcKmKltMzr/i0g44gTeinK26nrsXRvXeK9mZqifC5FQ?=
 =?us-ascii?Q?oK8nJBA4t4sscGOzHas=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad94c062-b5e5-4f4c-aef3-08de0a670c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 14:44:43.2030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbdZRHxLqre8pqbdOCHosgigWW80x+Ci63BeJgZVScJt7sc0qZcYZLrdarMExawryVLJrLTUVxtk+h8ztrJ/3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11090



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, October 10, 2025 2:32 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> > The only platform-specific part is the message format exchanged between
> Linux and the remote processors.
> > As long as the remote processor follows the same message protocol, the =
driver
> should work as expected.
> >
> > Here's the layout of the message packets:
> >
> > +--------+--------+--------+--------+--------+----------------+--------=
+--------+----------
> -----+---------------+
> > |0x00    |0x01    |0x02    |0x03    |0x04    |0x05..0x09      |0x0A    =
|0x0B    |0x0C
> |0x0D           |
> > |cate    |major   |minor   |type    |cmd     |reserved[5]     |pin_idx
> |port_idx|out:{evt/rc/v} |in:{wkup/val}  |
> > +--------+--------+--------+--------+--------+----------------+--------=
+--------+----------
> -----+---------------+
> >
> > Cate (Category field ): can be GPIO /I2C/PMIC/AUDIO ... etc Major :
> > Major version number
> > Minor: Minor version number
> > Type (Message Type): Can be SETUP / REPLY /NOTIFY for GPIO category
> > Cmd (Command): Can be Input INIT / Output INIT / Input GET for GPIO
> > category
> > Pin_idx: The GPIO line index
> > Port_idx: The GPIO controller index
> >
> > For Out packet:
> >       if it is OUPUT INIT, the out field value is the gpio output level=
.
> >       If it is INPUT INIT, the out filed is 0.
> >
> > For In packet:
> >       If it is a REPLY message, the out field is return code. 0 means s=
uccess.
> >       If it is a REPLY of INPUT GET, the in field is the value of GPIO =
line level.
> >       If it is an NOTIFY type of message, it simulates an interrupt eve=
nt from the
> remote processor.
> >
> > I can add above comments in the commit log or the beginning of the driv=
er
> source file.
>=20
> Maybe Documentation/admin-guide/gpio-rpmsg.rst would be better.  You shou=
ld
> also document how to handle features the device does not support. e.g. i =
_think_
> your hardware supports all 4 interrupt types. But maybe other hardware ne=
eds to
> return something meaning -EOPNOTSUP?
>=20

That should be one type of the error return code in the out field of REPLY =
message.=20
The return code of 0 means success, and the others are error codes.=20

I will add a gpio-rpmsg.rst file in the next patches.=20

Thanks,
Shenwei

>         Andrew
