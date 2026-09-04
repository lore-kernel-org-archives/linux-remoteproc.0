Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA23B71A0;
	Fri,  4 Sep 2026 03:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492735; cv=fail; b=r4saNHcer86QhyxY/ER5kMbj7Q+9NTqbgC4xjFZx8fhiKJMa7eFVud69Im93D+kXG7riygwPMQYYtIZJNpS3UzfmAcg1RcTOeDMkfs0Kzia8yJPeaUuNhzo42PxQHvCCJkF3lTlbNHZm8T4uQ6JhorumpYMNr0Uc6+0R+/uNT70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492735; c=relaxed/simple;
	bh=bYo1oEwrGGlheWlETujFFAJrsiu35ve141GyInirn8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wlqwd4Ln/cbd1LvnGxybloHtIee/fcuzq0Vb2ZPvsLSCeE1VnJmU3PbjyEcYnTjSDUHScagsXI7xUJaDeNBPU9ufGdhsMbToTd2ZOk0l32dmfimh4prLgf5fPdo34RIGZ+8jgTlLG+JPBVM2YHFz0PiqOs7/B5KM6bnK+JDI/sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hZT3rC9d; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hZT3rC9d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9MITYnm8RBsQAgvCvEAgFdUxH7oso1IWUoDOMGGQuh/JZuM8cDe2G/nXAW9MYiu6H6pQPhaD6lWbfXaRn8sGB+PtRR3L9mVT/eyWK10nsgrNJfWf6gLWrXrJUq9d9mQQjRis6af1rVWSxzkE0lc9+HWD+47YfJi0ZKCv2cq/uFlI+V6l0v0sXE7stc85Dhaxl3vNzRtauEzFXmqibSapLaula/YubtZm00rJeBAUSLtYO2pFvkZtKyFdyG0eTe0CfciGSxrX6IQ/7pfgHDesBVbCpjRbbhUjVGpcR3DUYOfBzXRl5akIeICmze3olj8zlOqZZ0YZvFRvN8Yfcqxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEzQNNdPHhphQ+h+40QBgOLuFx6MEFLAzyGQwz6NTOM=;
 b=k6MpWsJDCMkB5EeMU7Lk7Xm68i+UjcEz0A7Uz+PRCnGPdF4DrtwDqfDRHBhqZoVk69kECIj7O6pmt4dXAD/lP0G8R+4D2rzmvFu2/K5LxFg25lzf5q//OOiivMfeeNmvkG8/HaRxg6OaNi3CZF7thazzaM2nId/B5qsVVgHPAq9Xk96nxJ+MwxaHC6OYymrj+943hKFXqOvfRfO+Iq4rEwN6OTJ5zH8+/8r9r2T9BM23PVBDxgdERgXpKb1nlhtcuWaVBbFTFx+cBK7mdxI0ZJ2MMTOi17okBIkbHs+54q6sGTyGmOYRWFLwrNyNO7SvvHySkIs5XinB0/DQbnklpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEzQNNdPHhphQ+h+40QBgOLuFx6MEFLAzyGQwz6NTOM=;
 b=hZT3rC9dZscxcYAoS1LKZX2Cc0rkhglklTzotgNU8pawpThLY1iPkb4bjaw0a8wJHhDb1EypLu7udMU1JIWBFtub+9PoqwRAuHDFQ7NKjSoP/6BA6If2qtw3f1M+P6T0GDtYHlbHb+hLF+M2PsTwRX4NF4wO62qcTwowNk56pE63iIyaFYqpwKwTKmQVRXzAMrXnWJoRECX1cJhKq7EooQ0Bwib/Z2YrZ+4KcbdnVyWVnLhyTR+XS4Pf43IB+YSNRXohQBSToCLRCF+DIuYEUoTximTElQYVnAlAGldu3OUrBcLicUIttCYIuiCXG91RBGJ8ECl5wfMquMOqTac+pw==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by AM9PR04MB8954.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 03:32:08 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 03:32:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Marcel Hofmann <marcel@hofmania.de>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Marcel Hofmann
	<marcel.hofmann@ingenics-digital.com>
Subject: RE: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at region
 boundary
Thread-Topic: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Thread-Index: AQHdNiA63cfzcteT/kqv5q6VWnnCf7a9z2KQ
Date: Fri, 4 Sep 2026 03:32:08 +0000
Message-ID:
 <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <20260827123136.438798-1-marcel@hofmania.de>
In-Reply-To: <20260827123136.438798-1-marcel@hofmania.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-04T03:31:05.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|AM9PR04MB8954:EE_
x-ms-office365-filtering-correlation-id: 20b6635c-cb57-4528-b599-08df0a351970
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|19092799006|6133799003|56012099006|18002099003|22082099003|38070700021|10067099003|11063799006;
x-microsoft-antispam-message-info:
 FUYiDKAMHw4DW/AS3jsKp3sJwdipGIKY9jiZ+sGQ6B/rwJYiA+tz7oVo+FnRdY6pcDp6J6lLc0nCQtxXwwzJ4AoiJMKIL/d/NFfpYAJ4ie3Hd1WP3bngN6on+x7RAZSXasqOlrT9+N5cP4k8OJQxtb4aDEZ0CIzgdI7kRGb2gzWxMMtDFzbmT2S4cgsH6HZ+CeOiuGcaLDZ3rrvF7fDwdbB424Z8GM68MuW395C4rlb3WtJ/eIEIlFryT1FFUKiGj4degT+TAypd/33n5xhr4OCJU6GMLwxNKuILeUPpHrUA16Cz5slerxFvXTY4QUDtpdlQJaK29n+CoybtujnFZeb5VjhcvHY5JQ35efpPnsd9e93rkwQiqUEXAVfPWmAZoobB50S6irZszP/cWrThaXibMlJMPMPuQkuU1Lyf/iADo+n/yTqVNNQP6cl1o8T0t0MVmBJNF9Ztjj4OkqFjRUgeoEoP8YIxpAyPmpLQyfURu1F9HHc3cIV/6TuLVfl+kB85YGMLi1ShaPp+QLVS0hZ4zWVt/XaxVYxNhYH5QjUOL1osCT9Jv6/jWAhU4YE8/+aNeyhPbfGp2ZKFY84o8PukVZwWO9M7/YT3Wv5y/K8X9oL0xENtkPqi6MQx5Bm5NPU/CqI41KdtzGbOD9Y84ON/8nSWjCtI6xntkxiW4+PjFaZdzBSIfNKAwrUD1WqbEl3QWO6sYk5Ybo9c1EfPrQ0BMpXdobPi4TNqIEjnr1Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(19092799006)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OQRh6fGE9R1Y9+rIu9q8F2EtJE0Z51JIOUcp2JOEKVvgAXFXq3L+iVpVgxpX?=
 =?us-ascii?Q?qCoF1jOCfVOskTRDEuMLznMGCyPlyR0fTidTNkILSwceaxUsr3CQj7WAe2UP?=
 =?us-ascii?Q?4n3PeC98WwcWHNrFHKfzuDN1H9ITBrInAcFR8UZF1qTHXi1L2uhAqE+Ypb29?=
 =?us-ascii?Q?m20jUXJKCebmM/J1FEC5jkvtx32n75FDMkBPZjM8osMMDqgAWTrmt5AizgFx?=
 =?us-ascii?Q?T8ESphxwJQXxM0C+ygtvkyzIg++VEVKZdyQTTF3OMJwrOljoqN7Ru53/5MA3?=
 =?us-ascii?Q?mmOhheEkW9nvql/YD/W3pqw4LhbMoHvlHoybTIQ0L3WZg/hotZjYTL5f116t?=
 =?us-ascii?Q?0a13kEs/wQYZtP8ENaMf1wy5gkpxU+HwNjf4P3noxZKSAZizFHWt2dN7/puW?=
 =?us-ascii?Q?01y8n46kvMr1Q5BY+q/7yRlUUBiFjXr7yakxC70xo7iet4rIUIJh5JLHSl8s?=
 =?us-ascii?Q?XXnXKPjOgwFjPolwQkyd2G6hBDa7bRF7o8BaXeeIuhWlcq/thBqJ8ZQ3hn7A?=
 =?us-ascii?Q?H1B+QTcyPmY1++XTu87H4/tA/oeUhSvfZmCfpIQelsXCZN4QVbrHBL4bqt60?=
 =?us-ascii?Q?fVz5JQ5kc1wvE45pcUV8nQgIbxbiAiMdLaVt5ajTiq7s4VbExHG4NVVmwePj?=
 =?us-ascii?Q?Kq2AONGo+AldFysUXucx5m0F5fPxFly/t2Ikr+QV22fPnVAlXFO+Pu9L7V16?=
 =?us-ascii?Q?pLgGWSwBDSWrHYHAbVvnjzMlx226Z5a9LXRRlutFxObRnbcSQ/Q7CmACBfGB?=
 =?us-ascii?Q?AhOaa0LiNw4zJBdLOdtW41zb13aHMpqLERGE9v/4Qbqz0abMAWa2RIGTU7lv?=
 =?us-ascii?Q?mDeq8pH8chHKM9wlHdupqhJFleymTEp/6ACddOAPpZXimppyOQeu7z23qYm1?=
 =?us-ascii?Q?WERUlJxjuxg+kIXKXlkNbFkhEPwzRV/LAg3XmOlfxdarVew4kyNphG3OxjVi?=
 =?us-ascii?Q?OyEDbFqQNyYKeYwE5rEe08mHFLXFerIBvaxF75+DCGaWUJKYmvJBNxG4HkXr?=
 =?us-ascii?Q?0X/sBwSAHX3PeFVEqTkwHui4+e3MM6vmFHlJkdjc+itThthpbeJZPF3ZBNAH?=
 =?us-ascii?Q?0TG9V+65V16W9icJdeqSUm6Fejevxs+G1DtvabNZzMZlX1/FQmC7BrPJSySm?=
 =?us-ascii?Q?cbBYQYgFoP3SBpqzC1+NocUsbjqox++peXDAV3zPPS0JAG1qZa+Rae109uCl?=
 =?us-ascii?Q?mwTE2BEgp0q2NRc5UkdCr2/mmDuBs4MxRDRX37nzJxoaOaj5QaxnjldGXj10?=
 =?us-ascii?Q?f3UoN9S8pXsfY9rMf3vxhlovMT9nCBtvANWN+BpuvjAyXYprx4NUzMNU1HYY?=
 =?us-ascii?Q?lSXGpfFrhrtlE0Rv9y56CE/GcHr925BppDGlXO2snoM/sqxSVuAG9wwq96T/?=
 =?us-ascii?Q?1XgoKJZqUUOcQIgC82FZFg0syv3kThCvVtUi2sPu2ORvpRrmlhnpRr7iug6L?=
 =?us-ascii?Q?1P7N8ZVW83cnghdU55CoraJpDlt2BukcIxYFRr2ygW/uE7riGqhPaVqmJn9Y?=
 =?us-ascii?Q?YCj38RhJgJ5TTHyBTKbUmjLoEM1P/l/SjG4TRJEeCMjf4DzXFX74xjzV0iEv?=
 =?us-ascii?Q?j0TsO61tjpcz9IR5u0HztoZZGI6J9+I6/1j3aUDNMgQdU/HpMdSvPc0nZUn1?=
 =?us-ascii?Q?w8lfnP8bB8/OrSYrzSfiVPjNO+wrnrczIzY1eOPP8Sm/1ZT6wQCEIC5YozOE?=
 =?us-ascii?Q?qNomOhJY0kKsUCoXdRBkVJF0nLxoy56+/nbq3OwmLQpBOW/L?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b6635c-cb57-4528-b599-08df0a351970
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 03:32:08.6121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nwb+MAIkjIBxxyMIZreOT4T1rbAmK+rPIxymwzM4bUp77SxszYT/smXraNiR+z5qf/vpdk/wk8YUNnUf2UIDsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954

> Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
> region boundary
>
> From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
>
> The address range checks in imx_rproc_da_to_sys() and
> imx_rproc_da_to_va() use a strict comparison for the exclusive end
> address of the requested range.
>
> As a result, a valid request that ends exactly at the end of an address
> translation or mapped memory region is rejected. For a region [start,
> start + size), a request [addr, addr + len) is contained when:
>
>     addr >=3D start && addr + len <=3D start + size
>
> This occurs when a loadable ELF segment fills an entire mapped
> memory region. This can be produced by a linker script that extends
> the resource table section to the end of its designated region:
>
>     .resource_table :
>     {
>       . =3D ALIGN(8);
>       KEEP(*(.resource_table)) /* Resource table */
>       . =3D ALIGN(8);
>       . =3D ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
>     } > m_rsc_tbl =3D0x00
>
> This produces a ELF program header like:
>
>     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R
> 0x1000
>
> In this case, the segment size matches the mapped region size exactly,
> causing the address translation to fail with:
>
>     bad phdr da 0xa4220000 mem 0x1000
>
> Rework the upper-bound checks to allow ranges ending exactly at the
> region boundary while guarding against integer overflow.
>
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale
> imx_rproc driver")
> Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-
> digital.com>

Tested-by: Peng Fan <peng.fan@nxp.com>  #i.MX95-19x19-EVK

Thanks,
Peng.

NXP Confidential
