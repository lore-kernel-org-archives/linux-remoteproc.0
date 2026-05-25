Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078EE3988FA
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690071; cv=fail; b=pbHiokawbgAH4QcPF2uxr1hNKwsd69LdW+ZPM+VI5fnv3Cz3pyseRuQvmSbWTZAWw6A8WfPYoIYvzFtitTaGRHftF14qK34M8QgNDpZMf1xl7WLiioekDuItvPuYStHOfR8RFkrqiBgaBH+dzKNwo8GoJe/wmdI08tfNzvzJAcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690071; c=relaxed/simple;
	bh=dDsndPuJQXxvAi8tzLQAa0X/ALPJwKhn23orRxIuYBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ECKTQZ1A+LJyChshYFvMO1zPoeq21rYa8nSiU4n006Hbk0f0zViQ64d8lxUeWJsZC+Epjdha1pVWhk23L6KDS8Y2ii+oac0YlEjXrM+kNo02XVjyXVZkNiOOvXFTj08JF52748QcLEvTihL1gGrNy/y2k543viuoyKtM9ulCG2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oWKMsGTu; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oWKMsGTu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDqmMJTogkNScd8hggdOAyXw8BGGMEfbPpFrPHR+xq1JSVOMycPOo70SfXETj8YB5xQrlGwVOk3TYanEMKwPZofokN5wyPuWVihvyf4b0GCcgRNxOZScQRHL/KcuCi7hMR4kGJK18L9ftITFGLKjJq5KKrxyMm/ILcHckSlvdtAHlJHOe17JArrrvRRcT3tNTMkzMBX3P07TOTKXJzx/OUWyzmgBgfmTuw8/hY81R9zhlIWtFXccnA04YZgTv2UakGTeO1AwhnhYeBgfJDQzxXYgsI/ae04tBhT7hswFN3ltQnmgOyhw4npTa+k6IsP7pTrIbKYNjmGZ/mNH0ei4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDsndPuJQXxvAi8tzLQAa0X/ALPJwKhn23orRxIuYBM=;
 b=nkCOju3ur8PlDe6EUYsKq9GQkNNCW4Gpre+njNlZMB3IpXEyIRZeNPJUaqKMg7M8YWzMfdGdhGnKxNbepHnX3MT4XMoJjGyENzykkc/2kwH3iwrpG1TBex3XAwykjc+j1YyE0cqtZvhoBa4M+jCgytzEJmZKnvoBsWTb3GvvJd/EmyL7xQ4xJApk7uTss9DfpcrxH9qPAXlRaB5uDKKaSDKRzouyqqg+3nE45iIHzv0bThJdRC3F2lg/fmzR0H7mn2CoA3dmMXFbQ9Nr0xgUcChzWMhz+2dDhCXrM7g8oARLlCfTgCCV86178SAinSpUpetPB+nk4Hf/AMMYTNT8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDsndPuJQXxvAi8tzLQAa0X/ALPJwKhn23orRxIuYBM=;
 b=oWKMsGTugLsRiEqr4D6eEsN+4AYJRaSI2BP9LRqkQt5KdEUZcbO36ks93Ru4QywjgV4s81vqzPzbGNbto4Oric9Ate/vi/BAUHvVuvEdxadQvBdhPzJ+/+ku2Y/7i4dvJbghvENED31Y4PjltqUQmHbQVCTyBX3BinZxuwibIFqpdMtYXHk4uYW8fBZiTeNNHC8Er3yhF3JEm5S9X92DialDtOD8CxlrgrCdjpyH88EVKfPe/rc7HWUMTAXuU1D7dTZYQP7RjXZ8bC8kwj8XqKt+inIyF17A1KtitjeICpjKqMFPKRumO8Dzvs05yykacoG0zSNnAD/5zAf5YVNm4w==
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by DB9PR04MB8346.eurprd04.prod.outlook.com (2603:10a6:10:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 06:21:06 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:21:05 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
Subject: RE: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for
 i.MX93
Thread-Topic: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for
 i.MX93
Thread-Index: AQHc5dNIih5S12RnGUiQk8p56z7w+rYS/WWAgAtT64A=
Date: Mon, 25 May 2026 06:21:05 +0000
Message-ID:
 <DU0PR04MB9418393959435033271FF1C3840A2@DU0PR04MB9418.eurprd04.prod.outlook.com>
References: <20260517080301.24774-1-Zhiqiang.Hou@nxp.com>
 <agppYVRcGLwflwCl@shlinux89>
In-Reply-To: <agppYVRcGLwflwCl@shlinux89>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9418:EE_|DB9PR04MB8346:EE_
x-ms-office365-filtering-correlation-id: edc3a3b5-640b-4817-4adf-08deba25cda2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021|56012099003|18002099003|22082099003|4143699003|11063799006;
x-microsoft-antispam-message-info:
 4vhEL1YwfJteDEfbnD/k0AEZkfspMWmB7CVA8msk3CRRkbMFkTSLxf3iXwRbLlMN3NivCyMFNLoCIcTIl0ZKpqI7h/HHDk2xQnTBgi67GaiyakhVvQauwcewsJXq48fgOik6Jh6kn6PZV37aYvFIpFBMTTE/STRoDXCYhkbUfcN7waIbyll2JMAzf2eCggXvvPjGf+I3MoiDj2x4QO/58YwcqnQvietxJL2u6RPyonMXEzxlL9fr6g/62eGO/KC0DQQQ0JqySWGZAe1bDENhVEinPYukLZs4sBAndmcwfvdEaLlbHqpbbiD6mUhknZr1YUJVm7ewW0A8VoxklUgEkw6PwWG2n/zx8JK7r8HZ3SSR5ewhxGnJs4J0ksRkRIR9/5aZdBNY+QAx3UYZiy9SjngBPpAYVcVmrSWTMOjI4e64ZBmv4fmdxFxv2yOyO/Bj6T2bt4TTSLQCoOXGc3IJx+q5Kj/35Hc8YJ3R+AoCBecDP5E6iGJh+xA94l7LhN0KEODseK3Uh21c4aVRLwFZw7d5DDlQCRs9df6C/Ltizu+N5hOlidtoMn8Vz+E9Jzi4xuN+3xRkw1mmRH21gTJFBgrG3MeDGFf29uELzbxWFAc18DZuYfrDIil/6tPO8v9/O04GZzkGFHbmv1466ucWsHRpYRzwojc3SHnRBDfdTa2B3NCanLhMFlp35w4fvcOm81OZQz+7jrXfi0ZlycWKfMx79m31y8Gec+U8UkLZbr9nTnjKCpM0SjYElg8QDdIN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XQCgTDuMMlPM8jag7OXBieu8iiXbdwJzsRmh0hs1oEDC2PB7bJ2+NiqaQdCh?=
 =?us-ascii?Q?U264/fMPLSWaZrqiOlFhR2R8ZPcDgdGe0A9RAv8jzDCJAHxJ0fWGXtrtkPwR?=
 =?us-ascii?Q?hC0v8VdgO5CUPFOmNRchToQikWNL1pXJMxzehTaRvh9MiJQqPNcYP3znzOhW?=
 =?us-ascii?Q?g4Kh4rmDc87wZZQkkWnj+ClV6C4qJFRox+kKG+oY7TnNklq8Ez/HZr0BmKpH?=
 =?us-ascii?Q?BkAT+mFwjWizvJjLrKA5w63OY5aFXxpGxjK95r4nsTCPkSARBbbpzB57kDDI?=
 =?us-ascii?Q?Ctj/n/LpPyxLizdVRoeXcIbZz7S9KsEmFgNGNz6OzJ0QiyWPBcAovAcmt0Lk?=
 =?us-ascii?Q?gtsmqMbsrKfPxfhiqUxb3MwYs6/TRYG+01prY1kPEX8FZ+3gmI40BRM/nwvH?=
 =?us-ascii?Q?/9OWq3V7h32ySajGu0XGwdT1VbbcZ2yjd6I6jViq8yy/S/Zl0M1QAbANQnkG?=
 =?us-ascii?Q?oglgqZrRC58feMgx9uvJuKXvWibqIIFd7i2Y90PUyhNG9uT09nwuVd12mMxG?=
 =?us-ascii?Q?LnzgBmNy8eeM/VzX/YOhFiQlLBEbefvcH0KEu0imWKtG+uuSUnjSDKQyW7KO?=
 =?us-ascii?Q?tRSeWVmk1mzZHlCwSlS9oZYDbnUSsbbREOmiQjhF16WEWiQyuKP3jVurMZQ5?=
 =?us-ascii?Q?7zaZ+wjNnqIWlESoWXx3rYkCmQVBtPZhXsMnQpX8dJFJdqmuZBqGU/LdnGfO?=
 =?us-ascii?Q?jFFJqbeCeATiHMkURCV8XhYaZfBiDk2c2V0fVVULXtQiNH6Ncm85NIb4PPEd?=
 =?us-ascii?Q?QbowBvjp5S9jCXA9luODinjcEw7vhNPxgEJRzTu2xxUDpB18asmmXwUTeJtJ?=
 =?us-ascii?Q?rquH3iMBFesXYjSrrbu+d1ZtMNqwaXkj+czemDMWJzsVoZlp5HQTqlaBCcHS?=
 =?us-ascii?Q?1Xg3r9rGSithXnm+tWOCKCjZ3At0nvChM7Oln5cFX2WvnVTGp3BSDfDPlGDS?=
 =?us-ascii?Q?7Kv0gvwJ+IQTw7NvERa3qUFZUXea+8ZlcN9/XptV/pI7Kqflk7Ie1vtoaStB?=
 =?us-ascii?Q?cAtc+SxM4gCKIWztBeRdUcs/i+PuhrKoGBmrpl01xF3O0CRuMiHuNutTIyaL?=
 =?us-ascii?Q?0K/x6FgVWbUQbzrfYmct4UGhfEnZbNbFu4yy0uUFJgKK3MpIe9S5MMx4QoOA?=
 =?us-ascii?Q?3epvvEhbMAnS/btGZ2erUTHr7xksuOx7O3UvtdR2VUEaTQuKiNJ0KSvbHPlz?=
 =?us-ascii?Q?0JsqHEM/VyxaEI9amAkZ0RRmNToWdqI3UGgxN2kIB2jBdkcfthMtIFcP3JVC?=
 =?us-ascii?Q?Rldhuo6sc3WlINvGeXLnKwlZmYFuPlEnmNvGQTw+EO4PD1z4Jlnp2XYzoJzr?=
 =?us-ascii?Q?ScfBj3p/9f5dbECjlEiDt57deLHC6UWLEWOZ1/d/T6rerqoroXfctAnhdeyL?=
 =?us-ascii?Q?4inbfkYyu7gv+wWZhFJHr9fmuCDfl7pobKJpBbP1m8QqfQNOq9arwTeM/QiP?=
 =?us-ascii?Q?rPTl/qrNaFGVTGr/bc2IdpXI/otZb7HwF+UatyNqHwqklo20/q6OtSSmP+He?=
 =?us-ascii?Q?kOsd2Ymj0Qc4QbCMZYLiKYN/rEUhGh6UBqU7aL77VUoMr4+YwofXH2KU7ZBv?=
 =?us-ascii?Q?6PfKul3uWvxiM1wXOObRJzdZw5+yTLLWYYhjweiL8CYlIcsC7chqXxNAyQIg?=
 =?us-ascii?Q?ntuEpkU5uWJpLmMi79o1iLKDJUEPTavKQcYPetxuCJKJff0FxnGRJL9jQaKT?=
 =?us-ascii?Q?58II4PqR8kjl+VX0q3lQiWcqfpJycbMc7awVIegr5nx0iSWA?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc3a3b5-640b-4817-4adf-08deba25cda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:21:05.9130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/AOh3LDfx2oHvKao2tsBYEESdLGQt8OLl8KddnHEv+9AtILsofM5aJB3cGe7ijk4vFxe0TI9X+JaRwZWhf+wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8346



> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Monday, May 18, 2026 9:21 AM
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>
> Cc: imx@lists.linux.dev; linux-remoteproc@vger.kernel.org;
> andersson@kernel.org; mathieu.poirier@linaro.org; Frank Li <frank.li@nxp.=
com>;
> s.hauer@pengutronix.de; festevam@gmail.com
> Subject: Re: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for
> i.MX93
>=20
> Hi Zhiqiang,
>=20
> Thanks for your patch.
>=20
> On Sun, May 17, 2026 at 04:03:01PM +0800, Zhiqiang Hou wrote:
> >From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> >The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
> >0xa0000000 of A55 mapping view.
>=20
> Let's add more details, as below:
>=20
> The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure) and
> 0xB0000000-0xBFFFFFFF(Secure) are both mapped to 0xA0000000-0xAFFFFFFF in
> the A55 address space.
>=20
> These ranges are currently missing from the i.MX93 remoteproc address
> translation table, which may lead to invalid address translation for firm=
ware
> accessing these regions.
>=20
> Add the missing mappings to complete the DRAM coverage.
>=20
> >
>=20
> Add fix tag:
> Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")

Updated in V3. Thanks for your comments!

Thanks,
Zhiqiang

