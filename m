Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0F34DCE2;
	Sun,  8 Feb 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770551115; cv=fail; b=pEc29EjoV7wBrKuhU38dRfwWbPTGTX0QXsqzRfDp4UeZP2gpikk7fcOQzJVWJZe1FvYDSRffE9MeaY9YbybirZhOCrV5FLxybhibeP035lZTn+y+Nbc0BRpxiRRcEzc2/Ofa5uXxXI3I1Rc6KUX+GCVqwd9vvnrQmjzoUL9YZf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770551115; c=relaxed/simple;
	bh=hkbfrmXSeIPWKSZPD31TnENYdT1uyKogcksDlCaM9iQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ExNHPcye14BxylZG8jrkj0y7HpdtXduSsdSdInL2fpFlaTt4VpcujV48abXwN2srH+OWBOkOp+eNHBZvz8wLg60TQLPy0J5XBw500eOPiRQ+0jhN+W9lJ+IYdkM6vIF+FQPEEDjqSJnpDKKrZEn9v2nxBh/5H7Z7Ia+oRsUjT9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FGRIHkDN; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FGRIHkDN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsIbVir5TAxUISBIVvAigOVuFRrUInm1iMc+o9ZTpYWfTZyBEgdYFgcuMp9cnYVFnI7zUcpJHxMrFTNFVv1LT/9eYp8aS5Sch+Oi0hKzXI6h/PoQtT5gyVn59o1oOVhjz7QHPCOpwpElRPXwJgHQaP4WAll2NHq5w816G69YHi7ifLPP+QCcXOS2JL5OVfc13UfjWfBW1s6KRsF+dUEZczt6U1aHQyQ+u9a0p7TS3L2LYfLAEDevVzqCOuDF5PEKqGlloCyBmRLy4FoBHGw8XaWzP1cccZYUp3INkYo6a0da/d9Loa/Dvd0R2mt1PNOXH4vYwddY5+leOOvIVYKhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g085mK7dlTL/pjvvItj+7VZ6169FI0xkmCYJy6D4dI=;
 b=GmtbxxNLO35WM3hWJa5kyyXZtrG2thZ08r8vVy4JziFyGxZ86nkbZ5eeq0tf35/nb6zR5VcZv95TB5n6EYNUpR8OBtacdeMZmU8EvlWxN9QfFSeT/35UXuxEXkWcs8DVCXuPJ12XIJ1wmrTTwKHMeBKKbwGl+FcozD5WdxnXHmmaibzOJJbmYrfuSo0iuBsZDYmtejMRI1eDRYlv5gCzMk9MbcTPEkp9jrFTFgKMMnPErGlJV7oEEe6MwREKdWHzR+C5ZFGMJuTk3SZVqpUyGaRrxjeGCa9GkDDMfgSPOwBF5kis+5t5bvelY++iwvZ5PaxdPz7z+BSHDrVtHFWwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g085mK7dlTL/pjvvItj+7VZ6169FI0xkmCYJy6D4dI=;
 b=FGRIHkDNOldxMX/J+VGYpPUMxXOuJOtac/Q0D7yeCrkV08qy26teoGYp3uoMRjtk2LcqK6G/mBlKS5HO7Y66Iy4o1YDinarSe4hMh3CA/KUoBu7RjyFTQMthXbfbNMe7O/2OprDhowz3fk56tOvAfgLuNWjDKPoNfPbJkjh5ciV3QzhxL6NDSdHwZh8vUi9P1NrubA0wLajeOSjC8JSl8lMYxF+quZhc3d8QMusyVX5M67+iBE0RpyQU9FnV75+DGCrzuSfNvk4oVs7C8RnWoI4bau/xR6Skh2+pqkFeZeIC3G8QwXfbqrcJlMkpDUn16Hz5JbkDjHFADyPDEoRagQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 8 Feb
 2026 11:45:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Sun, 8 Feb 2026
 11:45:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: RE: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Thread-Topic: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Thread-Index: AQHcl25HD4HxlvqrUEqKyFIT1+WP0rV4rXtg
Date: Sun, 8 Feb 2026 11:45:11 +0000
Message-ID:
 <PAXPR04MB8459F2126C8D692EC6F8065D8864A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXveV_Y1gT73JoK@stanley.mountain>
In-Reply-To: <aYXveV_Y1gT73JoK@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA2PR04MB10160:EE_
x-ms-office365-filtering-correlation-id: e300c85f-aaee-48c5-7204-08de6707844c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DB48U1yBeBzymqNoOsiVnjdWa7OnwCEcXomAin+jupT/6zByCJKkNxsUe5cr?=
 =?us-ascii?Q?Jq8k1I3rGSQHEeSm+07FknGclW2KIvDe2u1nMHwZwclbshCmUTIE2ut0v5ln?=
 =?us-ascii?Q?wFYUD1hYve7bxto0rkBvEoorCJvQ6BPlmJcF2CrniPbhLxXcu8diGvbCu5id?=
 =?us-ascii?Q?tU94AhZjAwtbyF6zYX/5Y5AXFpXuhV4uWMcSX2XqY1ocaGulT+iAoWkxZNcQ?=
 =?us-ascii?Q?iZoqRGCUO/Yid7s5RQBW56CMAKgJMBjxAPLWlG0cKajTfVwDkycHEo3wYZ1k?=
 =?us-ascii?Q?Z+OyMHQLbKNxNLQREEjv4bWocqUzN7sE7OCgNKlhnZqbpuLE2WW6x/pcwOPX?=
 =?us-ascii?Q?3XdPNer4fdsngP5Ohg7PufppX7W9eaaHmOaUWllwtftmKl/I4qwgeTKiZo20?=
 =?us-ascii?Q?iOgVbA5lAs+7dqAS7hlj8Fmnhy6QMST3dr5GGdWKctP2shCkCbs5yWMplrBY?=
 =?us-ascii?Q?ay+1lovFXz1G4vGzG3XsKldOUKCF2oYT44WoZHsg7bABG59LBA7CPBEYIbgz?=
 =?us-ascii?Q?iFemDHLe1njwAxIJ2cimn3ZEcYRPAlfkd/mslJs6UCSrHFM7xgI9XAKnJmvJ?=
 =?us-ascii?Q?hdRbByJw7rTbw0Q2wRzLmAYrZL7PyIF61nYCfDo407AY7M0oBmIccKKZCKnV?=
 =?us-ascii?Q?upyCzS96wMC+PUmhvLyJSbE690GQvs0FLgnylQc9vGvH6Zw2/qJY+yobzrwy?=
 =?us-ascii?Q?17ueHSF94nxSmK6BTThjStonTrtKnUaJDlftMoljMKeXeMEROMW+YbylGPsj?=
 =?us-ascii?Q?BrgUFTAvO7q+xerERBg172Pd9TT+YqlRO4xspZZLUjOwG31tDiJrpgHyDAaJ?=
 =?us-ascii?Q?ZskR4o1pbFMSxUXIXB6BQQH71bLDReXIm6SM4sttrUkoaJN+nwgq5nAnf/pZ?=
 =?us-ascii?Q?6k2tDf8NBI7U8620NF3/peoym+xw1a8YTKZGCZWRgRnOYyijD5DPBfcsFOOe?=
 =?us-ascii?Q?utx58bx/s7fwdkFixmN1SAMcoeGzUrRTcW3ycqMrns0It3/O0qzuTpwrR9wL?=
 =?us-ascii?Q?xGPK7mW5ZU57cbmLOdA8oh8uANrHhcYFrxaUM0uh+/6dIJdNuR7dP5bhTiK5?=
 =?us-ascii?Q?KQ2MJzhdOYLM7VZcbbysSayteJF8zQEqxVCbniOVxInj+jfb/V9IFUIbfeT3?=
 =?us-ascii?Q?MY1oZsUEjUzx/SRhhUxEhHj7/re2vJci9g3/RMg8a+MmzzgWjc9tYJ+lXRte?=
 =?us-ascii?Q?1ed9urVdX13mkB/6t7UJ8xTFBY9FqerrqFnynnspjF/XeOyqkTHc1Je5omT3?=
 =?us-ascii?Q?KKh2bUCqVokqfSWrCahX97yhLyUZIC/LUsbSD0uvJzk07xpuFhkOPHxcKEEK?=
 =?us-ascii?Q?WqYVugp4My+aHV/urCw7RYRr2CtO6BWR67Rt2rtaXw8iLQh8FgCl1TMZZmca?=
 =?us-ascii?Q?jx5qK+N/DgvRKmTezDODzH5rgFF7hnm4Fwv0gNCAcnViV115h5yABFlMHf68?=
 =?us-ascii?Q?xidvvB83i2G2FI8i9Be/ufMf/pwBhfxz25NLJwj1Et2FfHRdtXYtu7zkOffA?=
 =?us-ascii?Q?U2k+YGjIACKYImMBgiygWneSdaiOUQQtxjzGVH8xK3OqXn6gvheTxETIH52g?=
 =?us-ascii?Q?hdmTCsAMjXyEfVsR3NDBg7qdC1ajGaNN7PJONIzuWrZqyINFozUI7bs9V6fT?=
 =?us-ascii?Q?D/UZEYXEJ0eVHFt8cKvKR0M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uwbTVWEyXu+sT/dF1+ABRhE61MNj4/R8jMQNdNlKbmhR1R5ZpE5D0fllP946?=
 =?us-ascii?Q?aiAEhyx76FOMJPs5uoSdJJyq1cli1jbIqYxQy//qCnYSgC1W6rBXlj9lvovY?=
 =?us-ascii?Q?kzBF25ibQOritWN9S439P4H/AK2ARuuSgyS+L1dUR86dqoABdQXkliY15LNb?=
 =?us-ascii?Q?2tMmc2pCFXjQh4gxIN3Xp/v1k6tjguHsWPK4rnn3PGfa8+qcDVWD2YJrcuqQ?=
 =?us-ascii?Q?xB9W5VFhGLJpB289wemvYv7rqu1OHZtraHue7hXkGIn714tXMoBpWGFNKXvn?=
 =?us-ascii?Q?/R3ZrB9yX8XN/iE62UKx4twmSGgUkZlenpatsn2IzIxlJbVPeVrqqrMtk1yx?=
 =?us-ascii?Q?ot5SIFC/lFLHJJCgD1podyJ5m2J6cfY2uWLkJ2F4IeIQfW1YMANOtJwx+93R?=
 =?us-ascii?Q?45EtKMVYLWJsvu42lpS43FydtwaRPeQjwG7ooc5j1Khs4SbkX734jJCuIgro?=
 =?us-ascii?Q?r5STpqC4Aur3jh/unPUoda8tXR/Ood06rNyoxOU2W4d6ZyIzNDGfzhimQSD1?=
 =?us-ascii?Q?yupb3WFrcbtSJq5VhCYLtZUs0zzrEGvQcI1ZIIX19U23AoH/fX7I8dkH25rj?=
 =?us-ascii?Q?KNfYSGP6r2PhDpWXJ/8SKGcBmEC4CRfcc/FMYP9znFDEqL8HsPqoFGEQOHNx?=
 =?us-ascii?Q?s7HuMd1owG1+6weiYo8ikbIXmNT4h5qWNDL1noohBCHeJvv+3acdRa/yOAY3?=
 =?us-ascii?Q?TWXbxFlAZdGA1B7XJrhmxh/7v8RTylAr2Y0tYs+XROb34OCG0aLvZJpbgxut?=
 =?us-ascii?Q?t8pLLoMK5smBsvFnf8Xb3LlpexXsBQ/Do4ThLUU9ay/zVfp2z0jOL/R6xc9z?=
 =?us-ascii?Q?gDbTt90fTEG31isnxmBp2q/PqE67WklWLmtm4pxbXwo2CUGTL6H0JTirgj1O?=
 =?us-ascii?Q?lrcdNc9aHwlVGXuCYSeAzQpIQWwoavJMFBDIhIQld802FzJa/fSqEbVwd7+e?=
 =?us-ascii?Q?1Gk9L0PE3tgvl8zW2lXpmBis0oFXRzjgnH3tSKg4JF8TO1RBhLb8DuYDelGW?=
 =?us-ascii?Q?Hu3z0W5SU+WhIQ9rF7hE7X18pbHhHemdjXRYWnlJW85aAUKuddnz5DT4+4+8?=
 =?us-ascii?Q?HLbRjSzz0hzPiOdsnLNNSYDnBk7KQbaSwdAewJ3FcrYc9IVTSY69V3oS8Ihz?=
 =?us-ascii?Q?09Vk1fvVvfcPKsyrhCOg97lwhecIrc6vTcv5G2UI1+VbBiMv8f6H/mxLLIlh?=
 =?us-ascii?Q?HWDy8Meh6Go+Y1p7pyzwp35ZPrDJpyxm4pBFSrBI/djZpBYHdL4UKD68/NWY?=
 =?us-ascii?Q?lFBbzTCRpORERyKSfrIyKz10gzMdaAkzTSc3yirgZuKCBsnw/2GE5GOeD7GD?=
 =?us-ascii?Q?Nho511pCGeXc1IbYF++9YEckqy+zlVHpVk1ZaVBQvbV3aVIfPE4u7UNvR7yT?=
 =?us-ascii?Q?xbDBJSWDh0iJVfOUGcm2UtzsjZxXI6ROIugYiWBlGaRu5wq+1FDRgwj+0Gp2?=
 =?us-ascii?Q?D9lYXhOIUXrc0H2hzRlnkkCPcuI4T3yn2LhN4waQ/xleLEPVNm9jfv/LpoBA?=
 =?us-ascii?Q?NJCXJWfLNtpI6D7h1br/dhmeX25Aq3mXkfC3JCUSsdaxVQRKO/lfniFO4vK/?=
 =?us-ascii?Q?+04lwobIw4eZrQzjygoN/ToFJi1WW8q6Nvu/KahiJblcLlmPAEyMoYyE/hfd?=
 =?us-ascii?Q?KVPjDMCPBEkrRoGROaEkVmdROu4/ymTcyuBGlZ7LVMUtfilq07JIdi4VT68B?=
 =?us-ascii?Q?TUC6vnIZv55nBdhrnz9oRYTLkvjrTfCvJvvcqLlrE2Lvoy9j?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e300c85f-aaee-48c5-7204-08de6707844c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2026 11:45:11.4807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grbj3IGbsNt/wLjfpNPxUrMvx9QoqjQH5AfR7b4JrfYv0Qu3xq6Yesb6EE29i08VKsfAC3mJCe29qG/wiYW/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

Hi Dan,

Thanks for your report.

> Subject: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
> imx_rproc_dcfg
>=20
> Hello Peng Fan,
>=20
> Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare
> ops for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
> following Smatch static checker warning:
>=20
> 	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
> 	warn: ignoring unreachable code.
>=20
> drivers/remoteproc/imx_rproc.c

[...]
>     642                         return -ENOMEM;
>     643
>     644                 rproc_coredump_add_segment(rproc, da,
> resource_size(&res));
>     645                 rproc_add_carveout(rproc, mem);
>     646         }
>     647
> --> 648         if (priv->ops && priv->ops->prepare)
>     649                 return priv->ops->prepare(rproc);
>=20
> This is unreachable code.

Indeed.

The i.MX95 patches were developed quite some time ago. Later, there was
another change [1] which modified the reserved-memory while-loop logic.
When rebasing my changes on top of that, I overlooked this behavior
change, which resulted in the early return making the prepare callback
unreachable.

Regarding why this was not exposed earlier during testing: NXP U-Boot
powers up the M7 (leaving it in reset) and initializes TCM ECC by default.
As a result, even without calling the platform prepare ops, Linux can
still load the M7 ELF correctly, so no issue was observed.

In hindsight, I should have tested the case where M7 remains powered off
when rebasing these changes (:

I have just sent out a fix to address this issue. Thanks again for
reporting it.

[1] 67a7bc7f0358b ("remoteproc: Use of_reserved_mem_region_* functions for =
"memory-region")

Thanks,
Peng

>     650
>     651         return 0;
>     652 }
>=20
> regards,
> dan carpenter
