Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712512D780C;
	Mon, 15 Dec 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793742; cv=fail; b=QHIdSuDq2bC4dqVr9kBpg+XPiFLJl50cKvUxZ/S2/n7C+D2xPJnY6s7xvGTqJpTcqyZBf0WtgPdRdeQmgPZJC/PVfgmsIGX7KJpIeLfnyXo0Twk9LG8HZW1xAA8mQDFPkbbVD4F6EXD0I7D5dk5jB0A4ERJkl8VmCoz/lOk6HRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793742; c=relaxed/simple;
	bh=pSrk0IedDIwKdPsYFUj08PnwniAIRoMvvtHDGVMOQJc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sI95VdxabA7yF9BiZzQOLdlnYqZraLydn37j6YjbXIADL2od75l1UJ4ayjR+K7nJvHqG6hip5PWEufJVQG4gM9Gb1pvU3LZi0RvYv+IYKcEI7wx6moiEs88UzUd673yLG+keFRkFXNnrzXPuScp6uTLN9X5zzUVMzPIPBxfVwu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f/Wj/lB8; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f/Wj/lB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/AvuNhGW115YT+OhurB4HREc2B+vgNm+Tyrby7Oaek6bR3pscbkPVmehHZTl6kgH8C5+FncOF+6AQulcfbY9l8HBQt0fiSdfpNedvJji6AiHibt/nVTN6SC62X3UYsNB956EHKL41JLNlxHuqvuLRnxSKszLopT4e6mfSC0od13+158+fbbKMEnvKPgaSb4FdG62pox1ool0ouOedDQ39dYRrS4KNXAIy6XlYybS5gmjVWh8gL63jE0b0rXuhB5ebUofsTXEwVgJ24oBtepSK3jq1BNT4pzM1yfT+n782OVh1x/4RIGru2XdccXyJRN7Dk5eK/hqtlwJTctQAd0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrj1P4ZeEeumjaBir1tTp0/1DclcG0PaNQzEaklcgeQ=;
 b=ND5jTBWmA0O0CQkLHnxapJFem86hz0S3lG27LUv/STk+psIoUT+xJ69ecsJrnFBN3dSyuKNXU4mbHJEGBeReZyr6Z8V++Lc5VwrozTphrm/NLnNIuNqPbAltvGCtUM5XFfJ+2U1PwChSwL3nWxQdzuZxZBBk5V/mwSChEZsHZ6ocXvVaCEZrrsdBHcir5Qf8JAYL1qd1+/FL6LHwimvrhMVU5N3u9tLE9/ifaPTet6wtAJ+nRL/EMAenrpE4sbjgPLKlPqJbTKXwF71c7pDqKmoJu+vp69M2idZelocmYuaRiLVm8u94zEskSI58Ac3Iy+46M/UcD03bj280LNoVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrj1P4ZeEeumjaBir1tTp0/1DclcG0PaNQzEaklcgeQ=;
 b=f/Wj/lB8mE6LMNd29T8r8AqR2/8qpRVmqbC/T7r55EOIXast7b0srLw6rtIXvJEjrJrefavH69g3I/J2kt2aAViLhcZAtvWnmEjMLN8yok52mMMv/91Bn5kB+Mqb6JJixhDuXDfJ5PLkXanJhf1fjeztiqd8H7KQ0ovozJCKOXcKb95kNpQbVlSKomB71+hz6H5u3qsaQXKQedwDdL1eSlXGW90yOxXigRFeOlFS28kssVKRCfOFhoZxqV9np4sihitj9jklHCOEL5y7SZmb8VvWhPbcdDtCsOywYEH99E6ojt28QgZVPXivzBmv0Sky/DtlNO7HOkx6lEfN8DZzrg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7577.eurprd04.prod.outlook.com (2603:10a6:10:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:15:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:15:36 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Topic: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Index: AQHcaJsRpvSgZG43WEGbv/V//qPUhbUihaIQ
Date: Mon, 15 Dec 2025 10:15:36 +0000
Message-ID:
 <PAXPR04MB84599C141E28B6B83BD62C2388ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBBPR04MB7577:EE_
x-ms-office365-filtering-correlation-id: dcdc2bab-5a8a-4198-f688-08de3bc2e39c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0ojx8x5lmLg40oGW9EfMP+Zld/A58BXmDo4HhyUVESi/TtH18pNdbzmcnYR9?=
 =?us-ascii?Q?UvXJhq0fxbZFFOwM9q0Bn76RWgxyPsM9P05PzTB+bKHGBMEjEmW2YCBoMSJw?=
 =?us-ascii?Q?TLTI3t01StkTgS7ydW+ZBr5unfyshgDo1Xsw1UXauJbHS7qpdXiwvfX2D7t1?=
 =?us-ascii?Q?GV/fC6WDQxCI9KJz20fqZ2TdUCQFINkfn5oElBk3jxNLszeWLIQddDtarZos?=
 =?us-ascii?Q?j9xBQj7+jrkOtgBYWpQQaaucDAQTqEuInFBXXjDK5LJQPZlgJb8A6OcuKqnp?=
 =?us-ascii?Q?5t1Fv8PQozAlV+IQu63ojVrFm76NrQ3N7DpDBqsUFTpvu7AgtcF9J4z79Ji4?=
 =?us-ascii?Q?a2zzWWioLQ1oIfz2zCDpt2OLQ+D9bAc9dkLsJljDYxPR+rW69KK+6MQjixWE?=
 =?us-ascii?Q?7qqNR3MFSyyCJ0J4Pterw68Xh3RTJ1oHx2c7jwTjl81jK/i7wXqx2RoNzEmV?=
 =?us-ascii?Q?iY5gSg8SBsl1dopMr6SiJe9IUp6AFuL7BuO2ZseDOoWQbkVzX83OfAEpeB5Q?=
 =?us-ascii?Q?1CiC7nSlIZdb+sTpZOz82od5U8968RtF/rsyRnwJY8XgeFMZP5+5cRMOSlVG?=
 =?us-ascii?Q?AyqOXya8v5Vw3TofGfqQwRFR9skr3PUBPd3KtBjGRMA3UIaL0VeSriv1I+H9?=
 =?us-ascii?Q?91LWx2DRkcSRL87I8bbcewpp87sCfIB7wzO7CsIur59LlPc+5PfTkYuouU3O?=
 =?us-ascii?Q?JywxsteKt45t4vabbG4Ff/X/gN6l2FZcdwwvptfvbB8328uHdJu4J4GL4nz/?=
 =?us-ascii?Q?QJO0JQtRWLlbizEgdDLDSN80taAOG3RpNiFG4w/2+pBp5LCnD6P07nsIvOZ7?=
 =?us-ascii?Q?Fj4jH+vnD9bqLrigZRFEOJJecVob8xDjV6Tu7/jZHThcEoEmKDYR2ykAMf7i?=
 =?us-ascii?Q?bfmtsfIxus+Sml4os2+lmsoiVhciEYElDkgNu9ytgOA+iHFv2RJUsVKMTLY5?=
 =?us-ascii?Q?5QvcPWsbRpo6BhltHjhZD/fJSLLq1ewfBAIk7aNHxE/mI4HbpfQKtYiYy2+k?=
 =?us-ascii?Q?VCyw4IdomqxLXjLrk1QHeCMkHArqsAOvM3OTn5ZRCh11CJXwrhEUggmQEVDa?=
 =?us-ascii?Q?RNzCqBQlZPNZgsCfA7qnYlhE7gnsQkwO7XwW9LzwxINT8go2bZyR5i0yrlsl?=
 =?us-ascii?Q?Ff/ifpGHRU0R+Cqdq4FI0H5IGFngLeYPY3EXIWcGNXGx5BYtRJ1w6f0HkxFz?=
 =?us-ascii?Q?aHZS8nDDTP79VYLrAoJhTe5zqvyarZYFF1sQ+qf+rvfNJ5Baxaf5ZEAbe5UK?=
 =?us-ascii?Q?WcjFI0JuaPu/rmA57ULmK5Z+tCVT8TF1D3mcEmNx+bpxw6HspsEQlP62TIT1?=
 =?us-ascii?Q?kLjRQIUei45uj7ff7w1QUSR28MBuNbU4B0Bv3dwzhq04Th0IjnOs7Ogj/WUO?=
 =?us-ascii?Q?OjnzbnCAdeBevdR3cd+JhHBRBXYA719ANuj7F9QWpO3mFoGeRanB6eil4meZ?=
 =?us-ascii?Q?sa1vv7zzj7PVoZzYRr5BY2O0XgU0V8etRimBjoDOAz0GDdQrbqWv6Upo1Q+c?=
 =?us-ascii?Q?LTzqir8rbZ2eDmkJg7tdzUyneLNAfgX9HZs/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W6FtOMZEd4ynAcsbOeOz0GvfLkvkWCBrdvmZDGrpgU7DWv+ymmYGG+jeyajJ?=
 =?us-ascii?Q?EhsQt65pVeVouJ8jtS/lz4FLLKtrb49l9hzRXDSRD2VNzKH6zRsjXniOeqmS?=
 =?us-ascii?Q?LtETKF5eGL5x3MX161KM2TQDX3UzidkTOkXExsdnMER45xB0RrTB7m4t5PMk?=
 =?us-ascii?Q?gSTpDLeteFtmiAyNy2pGIfJz0bg//J+CaGjSYwdlvJh9gFcET3dRCuCHbTIs?=
 =?us-ascii?Q?LbhByNS6Fg78+HVWx9SKMyBvs4FbwVCJ2ep3ha+ybshGPg8GSn8lzFixuvTS?=
 =?us-ascii?Q?mOcAaxfWSx5hrfFJwN8CyomIkmEtebHEIN5ngOatPyh9GCBXzvR7GwMJSGwi?=
 =?us-ascii?Q?natl2AiqzqmvowN9dXjEUOyd+8LiP0rQwUIHwmuZkrsywKs1CcVbhMB/UZYC?=
 =?us-ascii?Q?lRG39Sdlhj6qjvVwiJDkElo5bIziyoJRvxUg7Cd7zEkbUfHNhx5jmdMeFocU?=
 =?us-ascii?Q?3rJfXsxJCFuYc9qm5dz63HBGrPtJb9OudI569bKeRzxX85e/LfllFYBFFRUF?=
 =?us-ascii?Q?jKo3gFEW9pwDkCTXOBvQCGx6jP2NW0D0xOcMm2WLP3hi3fcfCTTqvBQQeBWD?=
 =?us-ascii?Q?yJIbUsoG+dqWY06MaoGuoOhZTbBGjEhyxwHN31b4N+1b+czawTVRNYYqgu/B?=
 =?us-ascii?Q?3ZOPy7o/uRWG2d5fiSCqVnGDNx9VYKSItrO0UjnXAa9aJqVOrxFvVYtC6KX2?=
 =?us-ascii?Q?ovFYOts/pLt/FLxU1DVcOVky/xr/gOMUiwke8auduSfOr9fWKXbXFo9vhGlj?=
 =?us-ascii?Q?6qAEd/USmsEDh3lc/O8xaTr1hMeKS63J0IvdGbmRH3RwQzu0ejxZJR7aNbyO?=
 =?us-ascii?Q?4nxDJLEjoAEkaPlRplJ7WcA60wBFS85opJfXiswj6JIS7HEKHHMmJD7hJOYb?=
 =?us-ascii?Q?BNldIug22XWqmbyXYlefB0lUQw48J0UAIlmTmnlwJ65Vs598HIMTbdcWByFC?=
 =?us-ascii?Q?1c6mB/VuVsCqpooDjY4dIYMy/f+KwC0K4xCjqw8Ecr4Q9ki7SKTCM924Vzfl?=
 =?us-ascii?Q?tn0ixRHbla16McV5wXgbrt1wouJF9+PNjJ6PQfAECiDM4AaAi3bwrOqK82M9?=
 =?us-ascii?Q?71OJ+mo/YxVh8Y2qfry8CYrkDa8aQHTlWsAkjpJ0SoHReaVRUEB3hRymShUu?=
 =?us-ascii?Q?Ec0DIeNaNqMFK58NBg6C4MyOCNhDOHhrTNXZx2depkQVKht4NYCpD4ScMjW/?=
 =?us-ascii?Q?6dmZ5L2M5daohpmhIWzBWVgWgHIL1W7hEfsmC6a2DDD2UPR0YDM8RzeYY/uF?=
 =?us-ascii?Q?4jKO4YOYXAisxn2GQHfkxdMmOQpU6Lf9+GJM2K2EXIQOpYiW71nTGUqRe4rw?=
 =?us-ascii?Q?CYoEgt4AUZoxmyvkaYWkHBiZrKZyXCywuCEsNT+5eA94v8fOda4I2fhQfKP7?=
 =?us-ascii?Q?ILW7gFmVnXrxArO7AApS5BZK1NiB5amO3kNYWPZWDcN+ZKKqpDYMxscYV7J6?=
 =?us-ascii?Q?ofEVz8wRxCS/mHuDw9wx40FnuB8ILZuQggw8bC9DTMyDrMMhAsQV8u5DutNu?=
 =?us-ascii?Q?r3fxIxyoT+YwPpdfgNqdqaqlZtZuN/pVwK9xzk0ez9kaemI/VVDT6QKTAOKS?=
 =?us-ascii?Q?Gtd1QLcS+Oqja0PxuAI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdc2bab-5a8a-4198-f688-08de3bc2e39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 10:15:36.1217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8pC55IA+z06EcK7mOIPoqho5YjckP/CzMkRgzAQKHGvrlk9YFK+JXqhW/Fro7/jBIPYW+MmLLHXNrN7bA7QdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7577

Hi Shenwei,

> Subject: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
> check
>=20
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.

device_node->name does not contain the suffix "@xyz".
device_node->full_name contains the name and "@xyz"

Do you see the device_node->name is rsc-table@1fff8000 in your test?=20

Regards
Peng.

>=20
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index
> 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc
> *priv,
>  		}
>  		priv->mem[b].sys_addr =3D res.start;
>  		priv->mem[b].size =3D resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table =3D priv->mem[b].cpu_addr;
>  		b++;
>  	}
> --
> 2.43.0

