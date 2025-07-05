Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833318A6DF;
	Sat,  5 Jul 2025 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751755156; cv=fail; b=Jth+bx97k+AA0EA7oVJTfOJtcKPFfZ134yxdwF9o07/t7fg4WS6Wd+ngyAeqvUFZ4fmQO4HRRh/hdKqvdA2l02cQoX0i8PcErAubfNgdYc9ocyo/uSQ/kxTGQMOlSIvnyYeLMqUj2TLFP61fW2W96BtpALLL6xRpCT0Y1cYwYW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751755156; c=relaxed/simple;
	bh=K8sV9Ozyyt5rumPz6MeKz6Z91QUEt7aKDFM0STWTF3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C365TPdC2PTZ8c5L9/apKN+4nzaNKFs797RrCONSrdE8jKpcDUo8AtqUIXwqchrlV4JYoZZPTKOveLp1zPPD1Pz2Y7Sqbq8y7iwE9gWj+LtYdZ95uO5gKFkw04N86w/MhXB7zEpyl3RRk+6j6iTaVnnXPVrb7zudMoCbYbGsdKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HCna32xY; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HCna32xY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvJqx1jKkf7UzOFBgG1/toYLbe7733B/99RwavsC9BjZDXSH4JLC6hDgN7gCGebT+vN5yHa72Z5WE9doMH6v8xEC699eJF1nvmikRfmUdl/SPZtYpzbqCcoCNS2x9SzrkXML37HeqmHyyJDdDr5JvhhAuJ8KDYdayFVEk8XI9yAy1S0JLxcCW/pVl5zfaLbfuSo6jjjbDKXY0epVZhJWX/9xWapZYKcJ0w+E6HDocWWXXSWyopca3MAmPkGox0z5sBQWiDg1ylnpHMKG4J8q3B2uTWjMcxEHhUb/0LSowNsLmQyEh11oDr+XG1ZVSx32Gf7dWtsey5vYjblXGIWF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CPwrA+Cvu0eAt6yiPyXftoK553rhXOG4UsRz8rl9H8=;
 b=E92s9RMuBsxpzrkzuauQF2frKK5ddGkLE80JIOLBYcdVa2BSXh8hfEExxu3fOg6GDr9olv21lfBdCDEEPlW2bIGgf64W1BDZnZzUzNiBYglQW0WpDeEd6kD1zJhTBQlA/1v69Kzxu7sWoKTe00aukKN/++2247lEjP5tggFprew8wcxZp/LP/sp6D/TU4BiJtna4T5HLA2BCxS/2/rjI0BdeFHyObvsuSxywqHArbTOqQ0MKv8+tcY/Bx3xNRb4j3i60vIYTETPpVUQ7H2TlNqofLp/rG33jr3Ijv4wt9TyZBa7LSe5iv+6fW9KfTAgipKwSaxz4nwK50Qxe3CnDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CPwrA+Cvu0eAt6yiPyXftoK553rhXOG4UsRz8rl9H8=;
 b=HCna32xYHRUGPRNILv070d2jIxZEM4h0oYS36h3acLNiI/gkM4WyLeva+QRX0Qqpjcb5bJZ1OafvZT7CW0HIdJG3i7szkltKTUiziwoIYJJHIkwBaWTtfNiV5TTNMGRoVvvSRTppPVmS2EZ7zIobtA3HZJ9FXLmvLWhCt4KHOb9xJdaK7Xwxju1TT/DYorMVPS1//6JYtNchWc90EyW9oseGIE0I6Ed/4hoBVPUHap4ok9Vrz4IwyhRFBw2ej5YJUr7AfqjIFOX1FQFLjHuBf8CpPVw5n/B4r9gzBPnsGavmKdHczX4dGFqM37q2bNwmbh90DxeBPmNjD4WGUL9KGg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11002.eurprd04.prod.outlook.com (2603:10a6:800:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Sat, 5 Jul
 2025 22:39:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 22:39:06 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Hiago De Franco <hiagofranco@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Thread-Topic: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Thread-Index: AQHb7BujvN1bZ5fQwkydSJSq+tG6XLQiKD+AgAAthwCAATDxYIAAnCbQ
Date: Sat, 5 Jul 2025 22:39:06 +0000
Message-ID:
 <PAXPR04MB84594935DA490963108CE80D884DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s> <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <PAXPR04MB845955D08AA34D90389F50F6884DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB845955D08AA34D90389F50F6884DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB11002:EE_
x-ms-office365-filtering-correlation-id: 94e7578d-a47b-46bd-c390-08ddbc14c046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZSNhlF73UiOIzqDr7BfwOM2i7a8iCQ5Uuz9irMWYBxWaJjgc/MrkBSpJImXi?=
 =?us-ascii?Q?dBuP+aCGXtgySCXufFeVZ3iclJrOQRTPy2biUqHRj4PSCP8bQ+UREbcASE4s?=
 =?us-ascii?Q?whqZvs/Grx//MSZdEo5EoVKFWRsnVM+Rarc8HH1+Vv9pRzpXI5OtXnp+Efed?=
 =?us-ascii?Q?fmU1IsJnkP9LjHFJQkIMHBoUGGLvEVkYoqJ6oIReInc4rkBqiqHeeb3VkBRS?=
 =?us-ascii?Q?yCUvGzhdlK4W3THgl1tWeJ6XAPKhgfktWVU7K+iGTIMacqZIBdr3mkor9/wP?=
 =?us-ascii?Q?rEdTLGOXrbvcQJKX6aigUC0Yx7ReC4PFwddqVZPbm2jyvTJSIdIPea5KE9E/?=
 =?us-ascii?Q?XFCwHKEN/i+iTp+/58b//dyczkLeKk/WifTAAdKr+bjCSk9FMwrY5QTPs+jk?=
 =?us-ascii?Q?ZyExATd98ZI/l5+LFDNEFYMxxwXNu11JX8BWp1t4Nd6bJSZrqG6B+qXkwn2e?=
 =?us-ascii?Q?BAadLENphNNEnJRK9nBdwUrKs9sO+Klh+evg5BXHN7jJ8ZT0aWo5OJwN5Ex1?=
 =?us-ascii?Q?qcdHMZmKzs/uZ6qavdGFVQnTYrFnHo1OHrTfKdvadVsoyjBEFjLqX8txS9p3?=
 =?us-ascii?Q?hkbvZsgscglX8X6hfAZbjUUsKhDZLBTlHyo01LnJ/0owpPSyJ2/t+lrHCljl?=
 =?us-ascii?Q?pn54FzH6ns7NxWH+BGbSYBoFq898Qsni0KR4o47SI7v4L4WxDyQRYIQwfrkT?=
 =?us-ascii?Q?YsN2Sa/jALInM5vKP5uxkCLfav3QEVUY5GzO9qxvHZyJwjkWNQzrYgZZMzPi?=
 =?us-ascii?Q?+Ycx4gaY8SFhO5IlG3wLlwRk6bGhhuM6XCf13OtQQQ5dLQcHSMaqKQsArIQa?=
 =?us-ascii?Q?tSlPA07dMJR0pwG5mBUUAQ0euCO0M3i8+OW6C/IEYiZo5uZI4i95QVdbjPiU?=
 =?us-ascii?Q?ZqCv15KGGVVnu6y2jQI1mcIN72YD8NofdSECWtTQPHeAyS3PoMzChGiqTtiJ?=
 =?us-ascii?Q?pcXe5M7QFZciKFvoqLT5OdcpbO0qP/ld6jXY5q10ULH7iAA7YdYa9wDawLYJ?=
 =?us-ascii?Q?KFFPZmFr4WsPZdIv2AwLSKZiQoeCQ7qiW8xS/JGVEX7+YjkUSXv5JFN4dlZe?=
 =?us-ascii?Q?X63YjDx7uvv+EwVeXoKS5JFjETmPdxz8oVWqqsmBJrPka4O0CWRq8ZNzHmGP?=
 =?us-ascii?Q?IJptpuiKjTcF/ivVteA9/ZiRtpx5U/futkTcwMrkGi/MIwTO1KSWgjSztF2Q?=
 =?us-ascii?Q?EN9mF1tdtyzLG/zUsrPo/CsypqZPkax76Lx5dP6f+vEwPhNNbKEPX7TkLiYH?=
 =?us-ascii?Q?zaQqzewfMgkbUiSOTHRJmABsfS1CkvxrZGz2lJEDS6+duG2lRQwLQPEEc+jm?=
 =?us-ascii?Q?wEx6wQb1epUNMZZjcGhKEhpGG4IBYoKGnk+JJ261k5o3S1hNfdkEYMwSbU1Z?=
 =?us-ascii?Q?GU6lHe6kidODyYcMPYI8aXLIK1takI9zBwtAdgV7ZDkLfUrtE5gP4+o/p1/r?=
 =?us-ascii?Q?kgL4iVEvTmJtGfVtF0siwUw4cI4kc+OC4kGZhXwQiqXTK6QuWs4uYQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qkKHH8iSL7lpd3M3q7tiWO/gYJE8rU3kyMQnmivUvE1/URjJMq+OvERsvqq+?=
 =?us-ascii?Q?1JqHzXTm+CoNR8VVVfQt/ZJJRtoHRO4RpZ15NUZZUwE7kyrzs40Cm5kQcwBe?=
 =?us-ascii?Q?sJY/utTpICJoASPTHvQGfpQwNWU0a7+VDrtTkHA2YJxcsbFJEmNeqd4HOUnO?=
 =?us-ascii?Q?2xzIyxlkpdDy31L4/oliJ/sTMbz8OxVg2DijQjNE0q85ZxS9szWe+Q4GGROG?=
 =?us-ascii?Q?YFlD54RL5MaE3EEfnxNXWoCJ5SRE7C0bxM0pjrQjR25C0to5azlcvT1/P+CU?=
 =?us-ascii?Q?NsvITF1KvSLSjZ6MR5Sd1z2kyq7EaOS0sqz2AxfFchSBx4JO/fPkpy3teRD5?=
 =?us-ascii?Q?kotw0SPIfU0k6Ees94SwD8mplJu8eJE2LjtbezmdhLc8lyrH6mdNG4FW5UG+?=
 =?us-ascii?Q?x1tanyrT38o/TiRkCSkej7tXhgVM52kNB8UTxhUoQD1XIz02xnmZhyHFSYcK?=
 =?us-ascii?Q?JJi2iN9DqHsSERUpxd5FKOwiEY7TDDPe0FhfVHsPUOxM4YnrN8BOP/7HHkwE?=
 =?us-ascii?Q?69c5xv24eINE4GJ6WFg2Vlu5T7g+Duj0zE9TVNeFrEkNEwQs4CxEUkzsUBiI?=
 =?us-ascii?Q?0UcF9q0PYcS58SX+6d5QRgWN9Xq+ftrtt3iKtAt/Z8BtQ82XS4N8LWITEdA1?=
 =?us-ascii?Q?oW0aQvsjauppwIGksbwZxbWnUV75kfYPB2YJsVpl1tbvVV1FPEi4tf1yU8lG?=
 =?us-ascii?Q?Alkzagqb8zH6hjvkb21P9KRpOOP4mKKuQ4t8F4UHBT5ubbAVTwTs0eBdnZJG?=
 =?us-ascii?Q?aieM/vHie+Y7K5MGjiol2oMDGGgwpNk5IMON1iCcsXPQQyEm9bIfehpBcw2V?=
 =?us-ascii?Q?bkCFReUFJGTLMvtE1nme0h4VPp72vGve6FaP+QWysRm4zclwEfENjUrvWe52?=
 =?us-ascii?Q?m4VCP0bT2GcT6aqZkewTbyNrluSGqu2HZb67NbGmqPMfa2A78UpKNUHs+1Xr?=
 =?us-ascii?Q?kyXmq9JQaQbAaAz6rS0cQ85/tKOLnk5NJ5P4hvLQw0JcR5aI/3rGGw+t+0Ki?=
 =?us-ascii?Q?b2cpxGkON3HqusimlvO+IkRQAWnDjR5URaz28FJ4jkrnd9F3sCp3jKzFkf8o?=
 =?us-ascii?Q?079lfUPFm9zxnd7PZ8UwgmNj75cmkqzXYPGRGoxkd/29JNcuZcDc40limwrr?=
 =?us-ascii?Q?Vp+jp2GBnt0rSdFxAyWJZZKbFKSBHAetcIpRW9/f/rkV/Ah9yYnu3/OvJkjK?=
 =?us-ascii?Q?kTnrZCYxclu2nKNxjj2+q9ds69tQaA9GlBtIBKLp6A3TzXWCg2hwoyErBCCy?=
 =?us-ascii?Q?xS2KIJ+BM9QsBYj9gUPgvJZNBXbbr2210s8menmkrujCLoH8+LvZtVULQUB1?=
 =?us-ascii?Q?Ctx3E3JEobWGvjs+TWk/EYiSKDHFezeuSP7xKnOSVo2LlYGnl6t5zXfUy5ZA?=
 =?us-ascii?Q?z1JVdKnUMOPcqezTKPQ7aOCtkbzHZcQ+NdNsqkmq+2/VahJ7Q2lDPQMhHnfw?=
 =?us-ascii?Q?bz8KRDB/Y6v0y0tOygjlZ5paR/gU9WsxZjF33pa1NF3G5WfbuLNjEhv6ukvf?=
 =?us-ascii?Q?P0gXqx3cloRggE76JPuUZ4xr6nPqN84h9fCViCl3Qh1qQCm7jE9L6qQWGPrt?=
 =?us-ascii?Q?iwIUARpzblh6qjgKKI0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e7578d-a47b-46bd-c390-08ddbc14c046
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2025 22:39:06.7222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3KKVs97gfU9OvewEE62vx6k3A2inKOEvU60zVI41zLHTC69n1pNiPy9WYd0TU6vopn5UFKwzlYRdtX1vmojVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11002

> Subject: RE: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM
> regions
>=20
> > Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM
> > regions
> >
> > Hi Mathieu,
> >
> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > > Good morning,
> > >
> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > Merge the contiguous ITCM and DTCM regions into a single region
> > to
> > > > prevent failures when loading ELF files with large sections:
> > > >
> > > > remoteproc remoteproc0: powering up imx-rproc remoteproc
> > > > remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > > imx-rproc imx8mp-cm7: Translation failed: da =3D 0x1f48 len =3D
> > 0x1fcb0
> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > remoteproc
> > > > remoteproc0: Failed to load program segments: -22 remoteproc
> > > > remoteproc0: Boot failed: -22
> > > >
> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > > imx_rproc: Merge TCML/U").
> > > >
> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > Hi,
> > > >
> > > > The ELF I tested had the following data section:
> > > >
> > > > Memory region         Used Size  Region Size  %age Used
> > > >     m_interrupts:         680 B         1 KB     66.41%
> > > >           m_text:        6984 B       127 KB      5.37%
> > > >           m_data:      130224 B       128 KB     99.35%
> > > >          m_data2:          0 GB        16 MB      0.00%
> > > > [100%] Built target hello_world_cm7.elf
> > > >
> > > > Which triggered the error. After this patch, remoteproc was able
> > > > to boot and work fine. Thanks!
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > b/drivers/remoteproc/imx_rproc.c index
> > 74299af1d7f1..bbf089ef48ee
> > > > 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att
> > > > imx_rproc_att_imx8qxp[] =3D {
> > > >
> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] =3D {
> > > >  	/* dev addr , sys addr  , size	    , flags */
> > > > -	/* ITCM   */
> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN |
> > ATT_IOMEM },
> > > > +	/* D/ITCM */
> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN |
> > ATT_IOMEM },
> > > >  	/* OCRAM_S */
> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > > >  	/* OCRAM */
> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] =3D {
> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > > >  	/* DDR (Code) - alias */
> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > > -	/* DTCM */
> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN |
> > ATT_IOMEM },
> > >
> > > In commit 8749919defb8 "dev addr" and "sys addr" were both
> > contiguous,
> > > but in this patch "dev addr" is not.  How will this work with new
> > > kernel that use old FW images?  Am I missing something?
> >
> > No, you are correct, I think the use case I tested was not good enough.
> >
> > If I understand correctly, this will break older firmware expecting
> > .data at 0x20000000 because dev_addr is no longer mapped for
> DTCM entry.
> >
>=20
> The ITCM in M7 starts from 0, DTCM in M7 starts from 0x20000000.
> The ITCM/DTCM is continuous from A53 perspective.
>=20
> You let linux to load continuous text/data, but if the dev addr start
> from ITCM_START+128KB is not reserved from Reference manual.

Typo: ITCM_START + 128KB is reserved.

>=20
> How could M7 still work proper if M7 accessing [0x20000, x] dev_addr?
>=20
> You need update your linker script to separate text into different
> sections.
>=20
> Regards,
> Peng.
>=20
> > Do you think it is possible (or reccomend) another approach to fix
> > this issue? In this case to keep using the TCM,
>=20
>=20
>=20
> instead of going to OCRAM
> > or DDR.
> >
> > Thanks,
> > Hiago.
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > >  	/* OCRAM_S - alias */
> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > > >  	/* OCRAM */
> > > > --
> > > > 2.39.5
> > > >

