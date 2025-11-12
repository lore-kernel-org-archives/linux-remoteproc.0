Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01D27603F;
	Wed, 12 Nov 2025 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762961786; cv=fail; b=VjkRyKWZtMoNE3cQ29zvCBFdFVKAIAaMtSt9DD8jDXteWPhQzcIaffVlWBM0apVPObFstpJPEZf25YjsCEz7j6IuAIBWaP5Jpzq7NTQ1Xh0ddAvaGPD0p7zARXYhyKdFs86y8H2fKwLWt7hUf9HY+KqZsa8AnUs0wWTdFf9oFQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762961786; c=relaxed/simple;
	bh=CK8rLgDXopZNeB8CKADbnIZRtCrHN5ugyCr0X6kvDVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GrKlDFfqvfXvjrMMi4aB2q5hxiVeQcXwlmia686gBw5RogbqEw/m6acFinLK/CuFqoYCatfZoblyxlHxsGPylN8W7MpQVGixLT1ouRzd7By+RQg8IoqxhMeqCRxGbXf4X2zC4vUrLqL5ch7arMOjPoOPzH+EzYvYzaKHOcq84AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=URV7d4sN; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="URV7d4sN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e83dNvrHoYLk470rKppaIa/MHLpo0k/eBXNsDauZUYtGiHISSOJhdbLZgkCzRYpuo5hJmtBpOJCLNvBY4SBRHPdEFvCV3rIr3p6+DG7KSXB30kedHDM7sbgAo2ndN1O1GMV8Y2SNB7ObXlXyGcfTsjLHj01bojiYI/ak/MeyeRS6rX0iqLMKL/bluLff2nJzyLvYtU0+NnswaQaQEh9DaI4eRVVKwwKpMk1mkF1Btg29kTJJ1pv7S4SorvrA3SHTpOBwKcXbgVc/Ga4iIobgT2XqILSEQHPAmEJA52znuFwmcX9dbpHkhTx2f9l3p0bEBGf6bNb1msJjQz5+I7Y+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1xEUqnMhqMDd4NoLdnK/s8pzYsrGyQ3BrmHj/KeDs0=;
 b=p3MQNEPecLVic6g90HEQL6afeTanKysy2/t/HN3ZKTfSLv+Up5yZcvdxzoIAdoNsVEFzXucLwTy+ozhn8tZ9GEbHNk/M2DArujHr7OrmXoYkLR8c2dKNszNV2OEUZLDOwuF3TcX4djPWSAMekczfvhfjZH99DvpqscVjkjA9WmvPMZep2G1eefaFjVbz7F0DkhUHRwEd3bBtxANXZjoOQ9/MIi73DPLF870JkTaY8jxc8Iigb1aFNZeVFElDk92Ga1SQdrJMCF7itPHw12Cq7HAhiRP0RWgyD2okM8z2oh0mpiXRlzCp3Vc58CPEsVCzzsJq1w4f+lfXa0CPqNAyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1xEUqnMhqMDd4NoLdnK/s8pzYsrGyQ3BrmHj/KeDs0=;
 b=URV7d4sN4I/appEDSHWdRvAR7Zrv6hTK5VXUqstOSTPyjcrf+u4B/WH6zNKp1XMlLId2yNsJ49DTmJOjuphuGQXjgXy9KOLZ2s+RJMwFIKxHh/fbtF6BO7cguJaIMz81s+woOGtbiyoCEGDnRvkxk4pWbKk0k/LyfoZVgStfZY93JaqkRdi7o3fo3GwxRo5GTdPX2q4pFeEgozWZichK3iIqWSukGEsn5LpmM1u+Qksi22xcb2cDJsuT/rs6hOiNiCd7ICU3GUcxc4qUVEYZlrHrpSwJqk2zCGSbRBdThV+B0Ko2oFvWMVnYsj6KyXPlSt3xWn/OI7j9CLb1Y7n0Cw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI0PR04MB11483.eurprd04.prod.outlook.com (2603:10a6:800:2cb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 15:36:19 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:36:19 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHcU+oXQjD048+dOEiUuYS5/jRDvA==
Date: Wed, 12 Nov 2025 15:36:19 +0000
Message-ID:
 <PAXPR04MB918521F7ABFB880CD1F6B1F889CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-2-shenwei.wang@nxp.com>
 <20251112125312.GA1319094-robh@kernel.org>
In-Reply-To: <20251112125312.GA1319094-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI0PR04MB11483:EE_
x-ms-office365-filtering-correlation-id: d90ed598-f20c-4fd1-c2a4-08de220139df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5SZnIJ9z8RACYZk85hlIiAOJ7YkkGJ6TvCDX930T9rM8vCrIdW5N/Up25C?=
 =?iso-8859-1?Q?i39Yql0MjtBxjkwcqHszkKD2wOThpInubHbAFJhls4fLyLskXjej2zw+Sg?=
 =?iso-8859-1?Q?//LTM1Qb5oVwEiuH/wnDGdILBcRECKf0FuhHRBH09bHbmxSRXb3/FbeabL?=
 =?iso-8859-1?Q?Yqucum09qqjyUVturN4UGbJHtR8qeBU2MwFGFCt/lPmz+4/0ZhSrKIO853?=
 =?iso-8859-1?Q?EcOktVQ0ku4XDbT4IKQ+yIwnyC1fP4XFFkpF1xzRCUGEWJs78gWPWY0+NT?=
 =?iso-8859-1?Q?BasUNr81bbYNoQfpjOYzX4pjGMI1mBcxnCtIMY5TgweVrxb986pncbLihD?=
 =?iso-8859-1?Q?dOrAqbTQ7vD1N0Q6n677VlAQepjMXoagLnzq9JDF9AYiNk3mBzPKfUYet6?=
 =?iso-8859-1?Q?7yclbHXyKtH4VtVEfsJ3ePAaNbOjbNae6z6aulTaUqPPpBilroFe3+V9qo?=
 =?iso-8859-1?Q?uBT3ZofMox48XHozUtBtfWGLvtXLiylrsJrk4j4meLJlFcOBDF0wmEVe9R?=
 =?iso-8859-1?Q?ZVn+K+17JTuDmBHlMLyO9QOlUMPxZKp9+4ciNOnvx+AHLiEEiK1JY606D7?=
 =?iso-8859-1?Q?Lw0nRLbGePyVXLsnb6Gbqa4vb6LkrXCyJ8XHn7NjE0X8n6h0jW6welvcdp?=
 =?iso-8859-1?Q?xpTICddfUhVEHw0F0FubdOmJLbLd9Hmfwon4vIWkCPSXJWV/lN+CtrEj4X?=
 =?iso-8859-1?Q?WzrVYwPuBBp8Zt5tR5kg3w2i65dIRlsn5YIPOxqByvt1g+RbAm96g7p85h?=
 =?iso-8859-1?Q?6TxbDC7AFrM6nQ7KD02Dl1mB+stY4DD4ZPNkX0HFHuv35Q3Yu2rp+yRiYj?=
 =?iso-8859-1?Q?7UMARRYB1kQuWTDw9Zk6QVPUDooKYR+qQryb3KRW3QEU6dRriA7i6d1tDk?=
 =?iso-8859-1?Q?sKeC9qeQzibuh6funN7m6JsPgGYp21dzcuDGFjk5JvMMe/DP1VF0ypERon?=
 =?iso-8859-1?Q?IK8e+8E4ouw79zsxqDYisN5Y3JzK+TH5/RdcaTNTALFxK0Mzng5GGKxuUf?=
 =?iso-8859-1?Q?ymVZkgY8wJUA6m2QEMgINCjt6NFr81W38ksSY5x5x4zLQS9qTmtz5MQj0g?=
 =?iso-8859-1?Q?/uKQI76h8MtuanE0R5uFA4Ef1OVhmL5YFd8bVyXzc5ddtoCuAQjcG1t/Gj?=
 =?iso-8859-1?Q?22Tq75781uN0k22dTjU/NsjQoZWyNSzdFyUiPfjp7eqDOI7tSFEkM7+4Pt?=
 =?iso-8859-1?Q?K0Wyrf6C4uyFVI0bFI5svK9uDN7qO5vi3MDzKSZTh1oRXIkMn5GsShzKcu?=
 =?iso-8859-1?Q?TmFgJ64NCKwAnBhQJifEC3PguCkxHsvJtq+dcCQuv2iJVWXkSsM7XE42zF?=
 =?iso-8859-1?Q?iIsngBiHguU1uS4jS9Me4elEx0AEl/B6YpXxJEOIrWCTIo/Ab1naauGUv9?=
 =?iso-8859-1?Q?7DNw7NZWLdTbsarxkrgI8xMEOfhsr08bHSf/ZqUqfhnIwufsy/fwFDlOXH?=
 =?iso-8859-1?Q?SD5w3lPs7tur/N5Fe8octue54V6gWhHjgJrweXaGjDI6d8PhX4lneXvLap?=
 =?iso-8859-1?Q?ynTwQIz621u6yXG6PWFCGDF9RB0d4IH1jcwQYbTW8pVk/0UnsGFs2eWCT9?=
 =?iso-8859-1?Q?GV29dgxB3zqDA9eSd2X8Jm0BsJ8D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J435sDBm9GanYaNVfgsE+4sHU8TZFzDf7axxcKm3TZOQ/x2ePTPwjzhni1?=
 =?iso-8859-1?Q?hT9w5TsLCrpXWKtaElA9WLfxB0/Xku2SaiqaiHVhSbkjQr5eWO7FPihQgg?=
 =?iso-8859-1?Q?lgNg6iE9Jrjg7GvOIACjmFDYJbkEjfSIungRFWxjpG20xNBq5zYuhigXBQ?=
 =?iso-8859-1?Q?W4gDJZaSrmcm+FiHz3CFGwqr1yExYDF63YTN46F2sIzJv/N4HfZjVdzmCm?=
 =?iso-8859-1?Q?MsNmikmcDdCiTpIxOEC67m3Gn0USOXEFNB6pw1DyfQqhxrl7S2heJaBVHf?=
 =?iso-8859-1?Q?dlrpTcSIp5ByYICEcV9Lo23v7a6PwDt2e+Js2+d/cEXAJ7Bqjy4Irpo7T9?=
 =?iso-8859-1?Q?QyuXIEQFiTigBlaZ54izmXptbcCG5PmQbHw2xQ7jKWN+PFmv+mnXLHPGPb?=
 =?iso-8859-1?Q?0tZsYg0KUwXFqXcJxXHI8Kpl6JgIwl/qxnb88QGDUdkgD+w7OjuCIbXWYt?=
 =?iso-8859-1?Q?quVHI0tRYtb40CHLMPRMZ3MhSloOcfO1nZVEubV9EwXjLVDK7HztcbJQGd?=
 =?iso-8859-1?Q?9nDzmJ6XsABfffufheP/IjTdiDJV1VxvTWy3EbtT5CVi29iqjcmwpy0Tg7?=
 =?iso-8859-1?Q?eOZLimGhSWGy2eha047MFjCDZ68rwfsu2K+xOzmC5yEP18cvk6nwQKV91N?=
 =?iso-8859-1?Q?uyNY40gXX4eBmX69Fdk+dMKjD3WEGHT+fi4Vr/zRwHv498sKCDKDV6kbxN?=
 =?iso-8859-1?Q?tM6cg90CCNBp41z+1+0jG09EoFIeUiInj/RQtIaoDGu9hvB49VfpyJF8LE?=
 =?iso-8859-1?Q?u/kwAKdJVpW3sG8a29lx1rFixV3dMhvF3Za5gWzEAMdAwPQc8iJsxzX05Q?=
 =?iso-8859-1?Q?vpMEY1TbY6hEkNe1Xn9uApSv/nwvm/Ly9DQiUon4KY61mCpV5vq9euRfLC?=
 =?iso-8859-1?Q?SQmthz09qgydXvMEiWYFkqMjp0kb1Iq0M8em58nOzEJmIezyHB2+sCC5pO?=
 =?iso-8859-1?Q?XnRibSRn1/DNygWwSaSeQUUM/I+1hlQ5PPmR/v5QukwRaX9YnpDVWgGrvY?=
 =?iso-8859-1?Q?MQAmmN/ExYwOWYLsYIYaQ/TeEZCuf9EcNQ49h4D8MZhMbX1oGfNnZlYVpI?=
 =?iso-8859-1?Q?yMfXspVEHxatsYZu6Pf4Mo8dxNdZH8zn8DoF1luqWSY4SQl91ogJcoaqzy?=
 =?iso-8859-1?Q?Yovwthb74JqdIYQajpcDvkNZRnIADymlbNMr1nUI5k5Xp2/0MDkvBy1Flm?=
 =?iso-8859-1?Q?reeFWZORjPdnTx6HUtp8MZAQExSNEq73RNF12pj+c350EoUciAL8r2k8I9?=
 =?iso-8859-1?Q?iBm7/R86xTn8thZzDRo7f7BnAraecWKg6wrzFnUc4scmjPXNcCPBCLFv/i?=
 =?iso-8859-1?Q?HNPQX1AkqtqHUHKmSM4Vsd6GJher9S5RHuv378pdR+BQdDxDhIwwe3KAEI?=
 =?iso-8859-1?Q?AmB0LLGfHeENJXGo16HuIvilElbGzZAI4Z6Qj2Fii2mMRvIfnIXO09B3Rd?=
 =?iso-8859-1?Q?yN+bFPh0iyF1jTDV4aBpNnbWEb8qFZmwvnbz8yPuV69stZpvez4LC7JrEW?=
 =?iso-8859-1?Q?4r7pkIs4RIe6c7FPziyR90JIMN7Gp5hw6z3L9c+ZL0/7CL6F55kAddjoLZ?=
 =?iso-8859-1?Q?rmcv0t6tMtJ9GVPTZX1AhnmlUWq8Fz4locfZ0fyBCmDZjaL9u5geEk2sQO?=
 =?iso-8859-1?Q?PPZmo8N/nBvL8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ed598-f20c-4fd1-c2a4-08de220139df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 15:36:19.3968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+vuErivvCZijpko1tBoTCwyHxNAtTYvl/idaY6en72QTtj+XWvmQ95Q5O2yr66D/e8eguGYRgbYx+0GKAsR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11483



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, November 12, 2025 6:53 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; C=
onor
> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux=
-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add
> "rpmsg" subnode support
> > +        patternProperties:
> > +          "gpio@[0-9a-f]+$":
> > +            type: object
> > +            unevaluatedProperties: false
> > +            properties:
> > +              compatible:
> > +                enum:
> > +                  - fsl,imx-rpmsg-gpio
> > +
> > +              reg:
> > +                maxItems: 1
>=20
> I still don't understand what the numbers for 'reg' mean here. You explai=
ned it
> and I still don't understand. In any case, it needs to be explained in th=
e schema.
>=20
> For example, why do GPIO and I2C each have their own number space?
>=20

Hi Rob,

The reg property represents the index of the GPIO controllers. Since the dr=
iver manages controllers=20
on a remote system, this index tells the remote system which controller to =
operate.

For example, if the remote system has four GPIO controllers but only alloca=
tes two (indices 0 and 2)=20
to Linux, the DTS might look like this:

          gpio@0 {
            compatible =3D "fsl,imx-rpmsg-gpio";
            reg =3D <0>;
          };

          gpio@2 {
            compatible =3D "fsl,imx-rpmsg-gpio";
            reg =3D <2>;
          }

Similarly, I=B2C numbers are mapped to their corresponding remote controlle=
rs in the same way. That's why
each has their own number space.

Thanks,
Shenwei

> > +
> > +              "#gpio-cells":
> > +                const: 2
> > +
> > +              gpio-controller: true
