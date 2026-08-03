Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC83BAD9F;
	Mon,  3 Aug 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747846; cv=fail; b=I5OM1CY9RJ27bZPjTSye3/yBrF5VIqpa+zU+vGG7smsIH4pXl7467wS49lnY6oaVqGOQof6fZoVemJbsXiDeJz+GXN8hvyu4TMMVDYQnz4SBsUv3tb+g65GW8nK3Po42FeYbeL1z98Q0Gz6u/yeZ8c/pzrA5g2dSQZgexpGKw4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747846; c=relaxed/simple;
	bh=3oPCapOOMYGLUsCBshACFad/PoHCdHvJ5exJf4my7Rg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qdxtsadhK3p1SUpfZ008jnMSjTNNUKlZwBqXQa1svWcTZCCqJSLld9ryounYNaHAQZQ7utivW9xLIKCNMD0En6Jp2ltdN/jvvFek8yBBY+HEpZQ449yWFCxKQtP+GQp1StwvL0vjw1KbN4oFmp79bCbqw+/+iCZpnCZkTLZbL/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iZMgtb4C; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iZMgtb4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBWcuy7EtgyARK0Ome/ufUld7nMY0YUWY2Syr8h9K7KysMSPnZRRS0ueNf3OZwBkgsswUdGTV+94BDeSNg5x+nrHARnJx3gZsBVeRqhZGszskNyaYduUqp3LS2gVjxWeNqJxtR/qQ+yICdDNMyoWo309A0GYDdECHyEAI1BgQIfcrx7H7mXx9NYjDZk0aARH5XWo7Ops3yhXmxVWiylmqv5/zGeysQnZtpyyisiFaAnJAIVStne+oyzLs8ZWDNOlBf0oHlhUiPAzryIWsFValK/ZAwn8waGSASnZS3xyXBJsgiqdyjYDzcJutJGrVKpZcjBEJeMFcCq1s91Z02b8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH7wcmOcXZFOwcUqWWheUbrwOLEH4SEcvKWawIZfkFI=;
 b=uj1QC4Uxy8OAvR0Cg7HKGVpQpmK9J//4JZ24KM7uLH1JjhfF92sWT0cIWe52pf5l4R4pZDfXegafvyt/3NKgbpZKCutlqTlUFKXghuOoJK7rHXRbR2OjhayfZQVAaEceR3Kwt8BGqYMv+y90mKyPX/GjrlKW5nmpT3V/p+3BmwFnKwCfe5/1FRMt1b1b7ZGQTR0VmMf6zn3Ka8pdgHSy++anNTPGNn42WmPQiUnb8fdcDgR+NvjbSUWFXpeqBejg+Ty+i/Reh69Osc11UOByy+MCJu24QHjgBcZ3oRbxgstLR1jMerS3krxEYo/2fhOjltT5GxcHXmPXW7v13O2crQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH7wcmOcXZFOwcUqWWheUbrwOLEH4SEcvKWawIZfkFI=;
 b=iZMgtb4CklQPAQbrs0OuRcxsPRKbF1y0vtGL089+EaR9EQqVQ6foI8d0dB8IeBsdz7AP6E0CoXOMYoYsPtdHJUs5svOucwKneURmPv4MxwLbvqskXiOI6uMNwGg+sey3O0MKCuf7TKJvJCX9DlDoAxo4FkGUdvUwaBK//e0y6D2Rs+6r1iO1E4roAb8BSHENo0FelRhZB9wSyrfTXkCfnSfft0xNXH7YS8R5gVOCizgh3ljzNfskgHNsIw70IhDyTfOjYZnp4bjZp2236SqkdPitA2hTvCLK0pV2CohToxa7O2QxAeoccQG53OYIzABJYfmOEcI11qgWKWG47HbEXg==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Mon, 3 Aug
 2026 09:03:58 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 09:03:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Laurentiu Mihalcea
	<laurentiumihalcea111@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, Fabio Estevam
	<festevam@gmail.com>, "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Thread-Topic: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Thread-Index: AQHdIEFsa8xSeqygz0mMXpUhGv5EHLaGXecAgAWvMJA=
Date: Mon, 3 Aug 2026 09:03:58 +0000
Message-ID:
 <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
In-Reply-To: <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|VE1PR04MB7360:EE_
x-ms-office365-filtering-correlation-id: faf0e0a2-a3f4-459d-c638-08def13e273d
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|366016|1800799024|38070700021|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 pkoxdGZZ0TLD2P36Qs9Z5cwPZ2WsFKjEPT2XTKJnnT17N8j/Pe9YPAYia7dP31EjrYXCQelyZ9L5MlsiTo5EjadCo3jsu7c1pesuaHXSUasGwpoZTHyDlXeJZJLk7AGsHqH9gKsJkyRH8zHfLC15m5FztSDGFlZV+yiGK6Dxu0ybFs44Y/t9EXG8Je7tbIPFmPqXdwU5KyL+ji1bl+E8gWPnxVj3UeSrao6O400lrODBy5O8sdrjTG8W6QINinZhVjXSvZy4zN0MpM2fMdjtool2nOK7hJ1gS5j+qlOwtFwqCZtB+z/l7LCPthgToHcUu8EStl1T8fNVTnl7mcRAVoZCtr9CzS0AqgRJWnzwd5INC9wyICjaDCgdXd+ijjnF9FaETM95MZufpLXsEGJ9LsYqGjMocRyEdWqGaO0qBN2EzNJd3mnRXNJ5X+qoW56Hab78ef2NGmQETspxxMawwF3J41YH2FsVTRWbl/CMQQRWqkCfG6aRKE+3/bopBzb1WT5TJYCH4DYNf8to8EV5P3H9lzOyfP/ceVXt3WXLturnyANaMTeMOlAtudU07S+VFEuPtx7ONbiYvUz19+ga8VZCyvj9/Ev8XxcBfyixpTL+XDIvX8QPm3eU+W25aOme0F9sItowOHDrXmo24aZ7HxQ9jWo6geR/WzrmhZtsHY0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JGB9IlPrxZsTEcCR2Czd596nuTuM1WwUXXdz6E6uL9ZvCMidTmrVDwQ8PlrT?=
 =?us-ascii?Q?Nvubri/rWUPMVM+i5crZkC7TRVMx3TqcDQlcu8e10oW4vuhRwPg5QNz3LH6V?=
 =?us-ascii?Q?hbjyfLnlDY/CaoBkSFMikcdseaSmu6l9+UKnbdA4W8lGYsA2+SXY59duoOBr?=
 =?us-ascii?Q?8wbZpg8ia7MCLrjxmwQ0LTQGl981v/ANC1FHFrm3rxFeUlE+QrkGPLPvnBBW?=
 =?us-ascii?Q?s1acCMdeXiy2jinRyb9sQ6XmCXo6jRNICTTlhnj598LtV1kt97p1+3Q6Fp/w?=
 =?us-ascii?Q?hMiJbBjQIXeVYrZLP965nC8XUNMyk3iucRmM7AOU8WlNtkyGP/a9je8LkHSs?=
 =?us-ascii?Q?LnX9/X4mg/OJw8u7rSC50MmirYWA65KHoHzIBHgG72X9CKzqQDmDLnvPhDXs?=
 =?us-ascii?Q?6Q1zLl/O9xK7u8CnlqDfb2m4rvkAeblF5D/tktQPpdUBm0+fUD/mGm22nNhB?=
 =?us-ascii?Q?ZL1iEh9//UoydBlYFIAbQcfGy+ud75rTwPhErq9us4XBx8XFYTUOmW0BSxRg?=
 =?us-ascii?Q?yQiQ7VH2CvXNIZKnnnsuX9eqDmkG0bC7w8RD+FZPuUVObkV4ne2w0BZTDqhq?=
 =?us-ascii?Q?K49y8vVYTjltKYr26hrCvU03zjVuFCoVNNqhMbTSuZvhmWXSJ+hzJvOhCkpO?=
 =?us-ascii?Q?9vU5eUYmv70rtqzE9OX0oQ6RJCnrQTJxLSP680wUFn2bzvDWvmMbBPGnZzXP?=
 =?us-ascii?Q?feIgbO9GCN8pzxP+m2WY9CSAPXPenIW2Nu+MEpQoomU4Q0WIdhFsN6XlHh4l?=
 =?us-ascii?Q?Fg1/ewjnMPdN/Re+4NZlvSetBo0ztBw18CNKuKBabJiWha8jlEI5KYQXtS7i?=
 =?us-ascii?Q?lgPSIsk7j5sQ4mmdiFq1/1mQUYupf3PyEWFDvpTAaKncGNQlZBzsVhxuw4MV?=
 =?us-ascii?Q?IelzgBKgN48+cLfxGUV2zOGuRX/UNRiQMLQ24uJ5i8q07++P+l5OfJclTmHz?=
 =?us-ascii?Q?alc1/wYuRVYSggudwyoW4fcEGXPI6pkeDLFLqyJESc3qg+wRNi6rh57HeYHE?=
 =?us-ascii?Q?gm1t9RRrIptDpw3G5iMXyZi04uYpu2UapWLJoikbGI+T0P+MxRelvZiS51Be?=
 =?us-ascii?Q?+KriVOSEaU4jK9k4170y2y3DL8OF0/1GZd55zMxDL1Ah4De1oLxHtgka+BrY?=
 =?us-ascii?Q?oQCurirqQ/XMOgvprTcX5qoWWQtZUQMrHu1mQWy4c17BD6WFdDxq8Dzttbw/?=
 =?us-ascii?Q?FDoCfxaGyLZY3S+EZQTKaw8Fkoo6e6GBt9V+j9FoYUdo5ZYTSRKr+89ZOhRh?=
 =?us-ascii?Q?tAN6ZKEwev9gPBXl4liJvXLiKVUDEKHoGJcfkpd9yTR5Tt8pCBRbbUvnWkAW?=
 =?us-ascii?Q?uaNfm8Cs1ZkNbMxXO+CtHR01Fv2r39c7JbZl6vgIDZbLRIptz9ynv5rV3xH7?=
 =?us-ascii?Q?wyr7h3HndnBoxwLZmmCc21frPjlgTZ+CDMiDU2WWbLXTVXfryQwSgXJyir8O?=
 =?us-ascii?Q?opXABZ67YJzNswgA+Gje4b22Sh+Jx+fD1ce6VjJvvDEXkgWlgyjlI2xL2W80?=
 =?us-ascii?Q?W/CD6UdPYW9i/e4mX8s8ZCgptg+/vRux0JOX0rKE8U3+X1ChBz5cBzjEkXoR?=
 =?us-ascii?Q?BoaI4ni+/+AK6hdb4duRTnEhWuvINHgQM3k0LuLngo5+lu3rpIGM0JM6SO5h?=
 =?us-ascii?Q?siRXL5eLeNFZZZ1agFpV4Gzj0OS5MoqitsDg1i80j8+eNuelR3NY3wASnHoy?=
 =?us-ascii?Q?yiKQ4PTKQ8ZGplVMAhX/RowZNxWqfmPtlnBPVxYNPEUOt0xz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf0e0a2-a3f4-459d-c638-08def13e273d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 09:03:58.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKTST33YluY+f2gvVtmBwqQ5bE95ygueo1pi+iJJyZtDGm6JBWKJuCWrAcFSOVEi2IYua4/OMy0uTiZjpb8Vug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

> Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
> document optional "memory-region-names"
>=20
> On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > The carveout region names are derived based on the DT node names.
> > Because of this, the DT node names are ABI, which is not supposed to
> happen.
> >
> > Fix this by documenting an additional, optional property:
> > "memory-region-names". This way, the software will have a way to
> build
> > the carveout region names without relying on the DT node names.
>=20
> "After update all existing DT tree, this will be required.
>=20
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
>=20
> Additional information to help understand why it is important.
>=20
> 1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
> https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.k
> ernel.org/
> 2. similar case happen at
> https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.k
> ernel.org/
>=20
> Suppose these problem should be detected by dt binding check instead
> of sashkio ai.
>=20
>=20
> >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> > b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> > index c18f71b64889..8e3e6676a95e 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> > @@ -62,6 +62,10 @@ properties:
> >      minItems: 1
> >      maxItems: 32
> >
> > +  memory-region-names:
> > +    minItems: 1
> > +    maxItems: 32
> > +
>=20
> Need restrict names
>=20
>   memory-region-names:
>     description:
>       Names for the memory-region phandles. Each entry must be one of
> the
>       following recognized names. "vdev0buffer" is the shared buffer for
>       virtio device 0, handled automatically by the rproc virtio framewor=
k.
>       "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
>       vring buffers for device N, also managed by the virtio framework.
>       "rsc-table" is the resource table region used to share the resource
>       table between Linux and the remote processor when it is pre-
> loaded in
>       memory. All other entries are treated as generic carveout regions
> that
>       are mapped and made available to the remote processor.
>     minItems: 1
>     maxItems: 32
>     items:
>       anyOf:
>         - const: rsc-table
>         - pattern: "^vdev[0-9]+buffer$"
>         - pattern: "^vdev[0-9]+vring[0-9]+$"

There might be other entries such as m4_reserved or m7_reserved

Regards
Peng.

>=20
> Frank
>=20
> >    power-domains:
> >      minItems: 2
> >      maxItems: 8
> > --
> > 2.53.0
> >
