Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3223C515;
	Sat,  5 Jul 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751721964; cv=fail; b=Eu23NOB36Xa7Vf8QeUaZCgaZZLN/UxueBk1Rt9s9OcitFoeRjYI1MS4ORioku6oK/Ri0HDzXv0htmwUTJSVUhC8pV85BB11ZrVosWhPsLDE6+nUGC1Da/Q+7L+SQWJryd/OUjH28mensqzDdseIxL6kS7Ne9UHcGK7PANIMWXTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751721964; c=relaxed/simple;
	bh=eY2OISuM9hED4ECgzTlF90ydlPKXo/vIg98RMjJy9qs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZKQUankvl76hiBk5z9u+oMu7jZYL1MFeZoUxBA6x8J9PTnAaQaWjzcZ01Vw8aPxVqTQNQKWMdhtxz0WEvU0RoMam7a8IsjoyqRFwKDcNgDbdKoUscOLDKglnE9gjQmXcwrISkT+aUhU+AEHJ5/lA1HYsKDrTX2zrvl/1oDnYCOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XOMDDLp6; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XOMDDLp6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE6Oar0HVpNzqCvkvoGhVwyI1kwOiATHG5B/tt3N4GcNdH+9h31RwNvGwn/qWR8oLNBWc19YdMXTcAjauDAfgsUWAmSnybw6EoH75ayQiqrhOCKP4KgRiRpOKlfBMkyrW8mZ4yuBczrcKh5EAYbij0/QJMskQdkQ9Sxdia72x0anW8Gcb+0RYDiRaQGv1KQ+dKcHUifppGxFI2Zsd8FOlN9Mi9IOaes7B8eplsIjEQW0YVF74tI3uVvz3fllcT3qki08BOYNwcDWCnhJ7pVSY9+4dqHpDer1fqUCR5jnt3wb0LZWCA7i9VtIdgltUUldOOjAIPpl33CQyQ9S0lp/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFfAOdZHZIE6KKa8ytmfDci8WXBkWo7UVd5faQGltnM=;
 b=KbHwatyN4UOH6Th2wVnYleZYUIXGqWSMzhdpGImtU50YTHFMiJr/B2PSdpYe1OA1yFAScPzLnRwi0s2CjIPAMFdjrFZmeo/1/EX9wMpbtgXtyZbTE7qO6IBcBLPEyYWO7+w0wtnooElbb+WhO4j1yuZp8qIqdu9+ofDPXo0vZUJ2AfwSdjxJ8bTOjqywSdORDkcfxzzpGL7HwuK4SNpgT11qJeyObbqpPn5EdaImy5WHHddsAh2zER70DmkyzJpOXxbqHZjhzPYXXxXpiShUrLUFFAP0MVLua9h2q7kqQNDsTJ5CS/4Q/luJ4a/E+QFOaW99uFVnup4DdfcQ9+hn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFfAOdZHZIE6KKa8ytmfDci8WXBkWo7UVd5faQGltnM=;
 b=XOMDDLp6BqT1CcLHO6ny8bR+357op1Qu8+D4DQbuTmYQBqs9uiLb+9tdpBxuEysqLJ0GaauK1xUUUD2NGTdYFJe4O8mDioOMKhtODNGkgWcD1nCMY5oiDMd4jQlbULzKXWnfP/34/momvGXrmje38vNzSCcLdoyvWIOFbcYohQ7KBXrQH6yC8aVyELD1ICIUE++hO2inXckJmIg0LBIdeIYWS1M6hxMRdziCzFKxB7pWmwoXxeMzs3DVXLOy+nBtLz/pI6XwiAWaVA3Cq91sHwMtOafhT5jmH/9HY5SGSwdqj8qCGRnzcfZXS2MO92eE0QnJCTEoTjkIAH58WTDnBw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9916.eurprd04.prod.outlook.com (2603:10a6:10:4ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sat, 5 Jul
 2025 13:25:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 13:25:57 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Hiago De Franco <hiagofranco@gmail.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
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
Thread-Index: AQHb7BujvN1bZ5fQwkydSJSq+tG6XLQiKD+AgAAthwCAATDxYA==
Date: Sat, 5 Jul 2025 13:25:57 +0000
Message-ID:
 <PAXPR04MB845955D08AA34D90389F50F6884DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s> <20250704190816.kth7bdf34ufc2ht6@hiagonb>
In-Reply-To: <20250704190816.kth7bdf34ufc2ht6@hiagonb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB9916:EE_
x-ms-office365-filtering-correlation-id: 9076548f-b8c6-4a54-c4c8-08ddbbc77a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?thmiIBSE7hsA49fmSuuMu2RXgwLdbhd2kP8DNFznZRHxU3b0BK8s0euoFxwd?=
 =?us-ascii?Q?S9S4q7HvDq3qXnfVmgYuqyplslEvO7F6K4yS5mQOtuaomUBiQE3maw156qTZ?=
 =?us-ascii?Q?XNkKayDmGUNbjkzwJjqEBPo+W1CuavqnqTWysRIhlqycLmOZDqW1f/89fOIg?=
 =?us-ascii?Q?jFCa4aN7n7xoKqnWvW62FGP/65wmqstu9gWPMEqX+/frpWuM4kjaHMNFk4FS?=
 =?us-ascii?Q?nYhwSPVykJuYyx2H+2SuL9u/0TAeUV/O+M2wmveZfDI/3RSFXwzx3PQfGnYY?=
 =?us-ascii?Q?LifosWvJV826VrGZpIZnuaYxsa0h4/JN8AFPWNdivpwVTRRxNSgWAsHkC1Pj?=
 =?us-ascii?Q?VbEdb60Tk/IOxIzI7Y5wi5B3c4xqM6yhAIm66xOxBx/u+f29+fwOUXc6Hyhc?=
 =?us-ascii?Q?oYTnOBgdkSPtyXYOtcZC0hQVdrZZucTGZIxtPMIU9yvTynvZEuP5z3UxKnsq?=
 =?us-ascii?Q?0gNcX73h1ct6o0xI3gigHuMS9q0NFaF2rd2x9wPFVbyOpwDfSXY+uwcPxLVw?=
 =?us-ascii?Q?i1fiMnMcSSo7Jrvv/Xv3LQ3hcg7eNK9iDSW2QXmoVzKlokWMRyidvvJoz3zn?=
 =?us-ascii?Q?cJrJ4COQHO5sVnk3g12Ox8Lt1wv3t6+Na508pKJWmiU/Jn+Wv1DN/pKiXlv3?=
 =?us-ascii?Q?ODL8mhl6m5ndcEv+Y8umc7LQvKWYXY0JSh8ZlrvsdMpRq0pG60bF2avMv7bR?=
 =?us-ascii?Q?S4UqmSTwJN5/3xzOXSXLpEgavO16NbgGKrV/xd+yhlgnWg0dhAYl4Dg3xoE2?=
 =?us-ascii?Q?snpa1D46cXqKYy3TymLXUiq12ecZLAjpa8oEGcA6MsAdN59Ipe+aeV0jfX2U?=
 =?us-ascii?Q?ViLrNnB4b4EXGf3i8vQyfgyIxCDej4i2T36fLd9aC+MRK9amNOTuF3j9rhmI?=
 =?us-ascii?Q?EFWswK9AdoJMMZfXIJDuatqKH3wdsowgqbQgGM4nbHC5AGqZuGzxT4t81jH5?=
 =?us-ascii?Q?hbx2Jfg/R7q3HcJlEqjQGmA0XmRJO66F0vYnvz5MmU9LH0D1R/nt7tzRAQlV?=
 =?us-ascii?Q?Ix1ZhzamNflJbLMAN9SC0/A0zR96habQs7GxmoSgIBY3b2YRN7RPk8YbtnDF?=
 =?us-ascii?Q?xt137RSXDLOpJ0/HrlnuuK2hE3BCJ/H4cNuMBgf2EFidvpYevTAYq+4UTpa7?=
 =?us-ascii?Q?m2y4u1lDRlKPqBwEapc6e9SzMNbJ7txJfbloeYxLGAnwiUWUYmnAF5C8VZli?=
 =?us-ascii?Q?CeZusbuoei1lJd4p3/KeGGxet7dKvIeZkk5bAGVC0RhcFtnwnBIiKd2h7qjV?=
 =?us-ascii?Q?doc+ngwzsy3wHfY3WXveMlkNfVP856emBKlDrwSSlt/2NGexxpeiCAAPH02X?=
 =?us-ascii?Q?QynWYSck0V26x1eTpQUxKCywKo8tr8ld1J01/wil5liAqNJKINJD+GeHuH9+?=
 =?us-ascii?Q?w5EpBNp10zTYUi1KcgJZWnQixgLUyRDyRlDddPReIPRtTghEFATmO93GT8gQ?=
 =?us-ascii?Q?2eJqbYtcr07LULWfkjO/I6BVXOd+wt8+dXrD254qveDJyaXKE6PJBA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HTVKhWVSb3tjosq2n4Xijvsk+8M/pVSsyMOvmfNDNx+R7o04fxTla4E2o2a6?=
 =?us-ascii?Q?qcd+MgCQKiW6Zg8vVQWpZ5eriT9MYpJVnxLO2c8P0mSgIu6iq9m6v4A96d8g?=
 =?us-ascii?Q?bMSqkdDdNvu8JwGh3rGdlkzYY6SFDBnGRlUsuyuxPAbc59jpEQ4SH+AaLZSJ?=
 =?us-ascii?Q?ycgr2jMAgI8dyqdBOMXFYxO1D6+ADq+nQAV2JFt6BFy1mub4siGHte5RGjqk?=
 =?us-ascii?Q?HLy8f/bIXokNkLJqVuCw1s2td3Jgu73pyjT1FVB5tERxpmW7hNIHCNgwwmWi?=
 =?us-ascii?Q?igxaF/ZPqnt5i+4B7DA0y092wAbdjaDCX4F1+n0q6ARGnpUmn13NhgPn8+vn?=
 =?us-ascii?Q?1jbP5S81xtsg1PD7A02eq8pA5tDxsxU1rkJVMsIbhfHn4AkfXJNegPiPrHls?=
 =?us-ascii?Q?cI+sC2bmL5y3DScDFg9T93/IISpxoKHGNsCeqb1yNSVLESuZBJe6kmRFtSXv?=
 =?us-ascii?Q?ophL5fHf/IX6+RMtFUolHetd3AaxBsyznOFVGR7J+rvSiQ3UJeQYi2REIGxA?=
 =?us-ascii?Q?o+HtSipGGGbbn46nJxjEs2I4UOu6rM7+Wr3n+pBp8mY83ZHxohFAVzh4PEyi?=
 =?us-ascii?Q?OcVLPVguD/0HYdTssGSyX0V2SlawiGMrIZIwktjbRChZZeTR+lpZgI2XR8/M?=
 =?us-ascii?Q?/hxj60H/04BJ++/ZZU/t4VGd85qCT8GIjj8Pf+F3H3AK3DXkqXKkEFm3/SFV?=
 =?us-ascii?Q?qkNYi01yH0dzpaxWxmwjLqst2pVG/Yei9Ld3WEJRiCUaf1nMPqLH/hn8sye9?=
 =?us-ascii?Q?9xR/v1UuMrnQ2+Z757R2hIpgr+1PfyAtBEQpQVH7Dj5ihAVFPGw9GKgWHwMB?=
 =?us-ascii?Q?h0WgHjfLHkzFm4oYmXTT/2lfLg4+lPD0RPzpCg6/Ar0CiR34AEEjMXXGv5F3?=
 =?us-ascii?Q?nzd7FVSTFDvKYgp6GjuLEk4KMR4V0IjMEWtdWOm7fSccdwFNljG4nIWOIz9a?=
 =?us-ascii?Q?oFZ+9Eb+c9SKQtHS6YwrTcAJ9D/cSKLP6gp15WeAxFuBHqhuBi+X6E8O7//a?=
 =?us-ascii?Q?90+kdSSDjPlwCtCJ5vvLg1MA4bscYkLNJtJ19ECS0z20ktPA3z2w77yECc1n?=
 =?us-ascii?Q?9oIMMvDQvFr+/crUVvYZxRHK8QpAwjMUdtKdV70Jy63I7UPB0WaFAF8iYjF1?=
 =?us-ascii?Q?qEJ7OHeEgukCZdrFoV9wWJ7Qe4fhrnLD+xWVtslpFPQg/qIPDn+mmcDbXxZy?=
 =?us-ascii?Q?DZvYk7/xQjna8dlHrfazSKmq5QkBmM8DW51cMR29c1grduWz32GmjNWRK8NZ?=
 =?us-ascii?Q?cl33Wd4TVcvWhQDBCtRGM/Leni/Fa1gQFVDflKw7ujUL8CRYfFUCBmYoXpI3?=
 =?us-ascii?Q?5KwK2ha/1xttMvK/E5KbeZR0a3bhuE6c1dDGMQZCuVHETVzzTsajX+RW5b3h?=
 =?us-ascii?Q?ZbIG9gYYSCyiI6gUfgwraZBsnSAN52k6034dC3DLiwSV/j1CwaMzNCqBw8v1?=
 =?us-ascii?Q?SZiEC4A24Nlqz7G22pD92tMFhUOZkb6W4HiT3ruzf4usK5XvFum8O/AQBZ5Y?=
 =?us-ascii?Q?RQy1znMpngdAUucmF1+n8uAuQMy9/bt2phMjDvzwTJ1NPaD2z5kFHPMDtgY3?=
 =?us-ascii?Q?+gLJJnt5Y0jVnTvILd4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9076548f-b8c6-4a54-c4c8-08ddbbc77a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2025 13:25:57.6102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5EH0T8B918JD/nFujF8erVr5OxZ7vnC95v3F/2g8ObgC/Nfs8OxfzCV6YzHeGKWMsLmFNwnPW7KEeys+Tm1tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9916

> Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM
> regions
>=20
> Hi Mathieu,
>=20
> On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > Merge the contiguous ITCM and DTCM regions into a single region
> to
> > > prevent failures when loading ELF files with large sections:
> > >
> > > remoteproc remoteproc0: powering up imx-rproc remoteproc
> > > remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > imx-rproc imx8mp-cm7: Translation failed: da =3D 0x1f48 len =3D
> 0x1fcb0
> > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> remoteproc
> > > remoteproc0: Failed to load program segments: -22 remoteproc
> > > remoteproc0: Boot failed: -22
> > >
> > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > imx_rproc: Merge TCML/U").
> > >
> > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > Hi,
> > >
> > > The ELF I tested had the following data section:
> > >
> > > Memory region         Used Size  Region Size  %age Used
> > >     m_interrupts:         680 B         1 KB     66.41%
> > >           m_text:        6984 B       127 KB      5.37%
> > >           m_data:      130224 B       128 KB     99.35%
> > >          m_data2:          0 GB        16 MB      0.00%
> > > [100%] Built target hello_world_cm7.elf
> > >
> > > Which triggered the error. After this patch, remoteproc was able to
> > > boot and work fine. Thanks!
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> 74299af1d7f1..bbf089ef48ee
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att
> > > imx_rproc_att_imx8qxp[] =3D {
> > >
> > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] =3D {
> > >  	/* dev addr , sys addr  , size	    , flags */
> > > -	/* ITCM   */
> > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > > +	/* D/ITCM */
> > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN |
> ATT_IOMEM },
> > >  	/* OCRAM_S */
> > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > >  	/* OCRAM */
> > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mn[] =3D {
> > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > >  	/* DDR (Code) - alias */
> > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > -	/* DTCM */
> > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> >
> > In commit 8749919defb8 "dev addr" and "sys addr" were both
> contiguous,
> > but in this patch "dev addr" is not.  How will this work with new
> > kernel that use old FW images?  Am I missing something?
>=20
> No, you are correct, I think the use case I tested was not good enough.
>=20
> If I understand correctly, this will break older firmware expecting .data
> at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
>=20

The ITCM in M7 starts from 0, DTCM in M7 starts from 0x20000000.
The ITCM/DTCM is continuous from A53 perspective.

You let linux to load continuous text/data, but if the dev addr
start from ITCM_START+128KB is not reserved from Reference manual.

How could M7 still work proper if M7 accessing [0x20000, x] dev_addr?

You need update your linker script to separate text into different
sections.

Regards,
Peng.

> Do you think it is possible (or reccomend) another approach to fix this
> issue? In this case to keep using the TCM,=20



instead of going to OCRAM
> or DDR.
>=20
> Thanks,
> Hiago.
>=20
> >
> > Thanks,
> > Mathieu
> >
> > >  	/* OCRAM_S - alias */
> > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > >  	/* OCRAM */
> > > --
> > > 2.39.5
> > >
