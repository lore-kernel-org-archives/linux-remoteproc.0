Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D042ECEBC;
	Mon, 15 Dec 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797226; cv=fail; b=pXihiZ78bnb4+t8hHrsE+mynX1XIV00gEDDJMwuUoqaEXXfVft6Cg0o//iZAdoVqQuYRAhySWK+zjyIq7PE7F/+a8fYVWSSo4dOAnscth8zGy4AXMQP59R6rmR3D4SCWB+GZwtuHWkGvaEHD6WWpCoWYP8nqePRPGjV4SfBgUQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797226; c=relaxed/simple;
	bh=fhSxIcbmigIpicURiFFVV0HhgnMe4/DAaNcWTO5VrvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LEKl16BL0cM5CqEaxOsgQszqykzgBhlPrIR5sPFNnfIpVdaee6u8ZfQJlRmkxnIDoGJe47GSpafccBpjZZaIwSDgdxc73F8vcP5kDcC5x4LsV0D4Ez9gvE26bkvDHOAzADHt57Sip7FRYkbDOPY7UuGuYU/bWQ5V5ZxCE72Yzds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bqVjBxf5; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bqVjBxf5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSmjvkJB32F8J9D4MCgE3NyoxKeQ/uppOiPEcz7N7oevi3XU6cTgTPdUOeticBw1QVGJBS9m/cpRMZMNSGLWO3lrQ3lJLSKEqCYikNc3m7NjRXGAoeBWUYbspz2+x4Lde4MlhGRM9h8Ec7wCDVGOjkZsWibPgMjK0OiEv6zjJhQG+E5MOf8H6uVwxppkNhhfGCbLN7DyeiIyyK6BeiOg7X8bkxBSactvWlPiOSCID7BcQHlp80A2fuNYdxvUli5aOxStNx/7SqbZ3rMshgZCFE4RiYiR4F/05Vb7qKpwQbTN/oQB4dNRi0gPFvRqKJT0NOM2RxE4e1CyXz3NlZ5WCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhSxIcbmigIpicURiFFVV0HhgnMe4/DAaNcWTO5VrvU=;
 b=kCosweTslCD9nCnS77XITGe6Mepm1LDJN3qNRjDDICC7Yhe2Hb0SiZLTK4R0y3VWOdQrStS2B91wV9IJJsNPn0Sn5b/A1FnHemyBdqf/yg330QS3wZC+AMxQOB/elhjB6Gl2bWYwR743BybRa7+iuSHWS8QnS8cvNfeGyUjc4MpoJwn82QgUa/rI4mSa0QSOW12qgzAa+48N9uktIGrOvtw2QUK1thA3i/u67RpWGv+4uMOnSmK2cukb9KLuOJ0iu7QpsUWFGPZVS153iRiHUZD1TGmxMnEKYey/BkJhKown1TqZkj8IDPBRh0KrxZTDItKLFC0aW3VMBd3UrKlFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhSxIcbmigIpicURiFFVV0HhgnMe4/DAaNcWTO5VrvU=;
 b=bqVjBxf5LI4pueC/q14Jk3jW2d3yoskuFp/KD8n8lTCluPC3XO7lenBz1eg3zIHeqWH/DJF/iCj+ZFUL6l1Cce5fYjj8GYkDG16+W+KtaqKXy/SgsL79mx66a9+i2SDV/CybXf3tyLJi+G+ywQ2dI8ULC4heU4nAhtTwc6nUCLLZDbwtkaXHdKxJ1Q0K/AeFNu6MlBSYoDCN73kCIBeyIP7q6kf763gGX7cbKcSH2HfYiacC0o1jT43nt24mFezYwo5qqImTJiCInlRbGUXEfh1+oykYL8Sx5R5YKxOZ570RDCVAgIc8+o/xc7AcDi2Wty7cvlHheY5tKRNsb0tZQw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:13:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:13:41 +0000
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
Thread-Index: AQHcaJsRpvSgZG43WEGbv/V//qPUhbUilj5g
Date: Mon, 15 Dec 2025 11:13:41 +0000
Message-ID:
 <PAXPR04MB8459148338CF7EBB38C699EA88ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9659:EE_
x-ms-office365-filtering-correlation-id: f59b4b89-c706-47e6-50f2-08de3bcb00cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vgpQcTAQtDPggKqSBihaMuNjxDGlDCzfLONrMV62FuRyiWcyYn8f3ZYBGoUu?=
 =?us-ascii?Q?+J8LObYNWrE76aZ8cxAX7kRtvewoxpJxvPPYXfr055PcGIfEmzWCuwi9ArTA?=
 =?us-ascii?Q?d1nlSwla0MQTlI81EzR6r/HdyNhp7BQwdynbkZgDXZeWf75/p0wiZHPhVMXG?=
 =?us-ascii?Q?jCnK+6641cRGkn9G6uUdQzzpiOo9ccfY9Cmw88dGbHeCRs7Znt9p8A5lW/Vv?=
 =?us-ascii?Q?90ZLf8gCXRiq/0N5tCE0T1AmaaArN+KLtcAhKlUE1hCeZBt/SEOC5czCM2iA?=
 =?us-ascii?Q?aF3atrhW/k01C+OG2eGVBxEKmoiu7luZkfRCEzXnaTNcVNMZIK3xHgjSJ5e0?=
 =?us-ascii?Q?JYbCD485b9s2CvaQEyGCfp2tZQ/BgUsKfSfAEWpnQS3iPs/cXiG+S1XICQVs?=
 =?us-ascii?Q?XMnbNqxALjgimn0WOeDtuEtWkIVBEWRUZnmhKYfjoSHTtSbeI0oS8IZKq0ca?=
 =?us-ascii?Q?hCMrqnQ65hDbpkar8sLXKGquwL8Kiqk+REqhJlwCQ6PKU3VNBDCvU/xgODWP?=
 =?us-ascii?Q?12HdWiegVldF2lpVhrwuFFbsxIHrDjGBZy8Kt06aLq6AU7rxItKXgZRNlzh1?=
 =?us-ascii?Q?VND4lK1GNCEepW04z/94vsz4gX8XAjrdNGXQ7Li0wzLoMgERGSK2AK9KZoQE?=
 =?us-ascii?Q?5AADA3Ry02yjtF3D5qHNPvAmPPvT5zzfC05GfU8+upgQM9JILmjoFOdyGt4K?=
 =?us-ascii?Q?PsXFi4CCzoAU/drHNK5USuwQ8umyw+ujISQc05jboD0YuXoxQAJSTuDjfiZG?=
 =?us-ascii?Q?q9Ope89qiMvQOrZzd3QZ4UXRdV+ssD2nYK9iCbaJjKyxNiebZTvEr6JW9Wh6?=
 =?us-ascii?Q?JQc/6RFXe49EQpVC3WdvETCJfpa8h+9IfFYh31g+pQYnVE/zG0ISljqsKMcr?=
 =?us-ascii?Q?eHZKkUpYfT+4MsOasV8Y2dAUrKj068vR/0Fw5FSujAEyuRX/iPju9vlcmMKH?=
 =?us-ascii?Q?AqMTb8Ur7xxcvBBNFmhCYk/nJl0oo0J2XatoJgOGBwa+SM/thjVCkVKmgAJC?=
 =?us-ascii?Q?7qzSsER4AmwQKZBpxZYNcxclrWt1z6xunzMDvuQGE0d4C1bWqfODBRkAP+64?=
 =?us-ascii?Q?qyp+rQiF623WLXJuyl+68IcP6X1VVVrwEHVCOM3T0HXmN2nZs6i8nFAnO18K?=
 =?us-ascii?Q?SmBzsG1v4XFr39TIjUWBfwwI7A7YHtxO5oMke+fhcTrf/4/VfaUxbB7w9R9o?=
 =?us-ascii?Q?/0On/X0+GUxUAc8fkwNc9DVtqkxii0Pb5tfitKMPkL8TqZgbq3l5AChjhsfV?=
 =?us-ascii?Q?C2nQyQeqjOJdxBjY+vW6fdjFmXxRoUaZ7knB5tvIM3ybx8HMyxtVBvJCs8Cg?=
 =?us-ascii?Q?+Qxwn5001MWs1yN1tLZpLjd3fxfg0M1e2UVLPr9aHeb4mqGzp+s5ObhJnEbV?=
 =?us-ascii?Q?KHgXGVAS1oZaMOl1QMfW8o8Jz9MK0+I4vtOrVQzrHJ6seknqEjfa0cSvfEn8?=
 =?us-ascii?Q?Q11htxnRaFWWL37v6zENOFR4iT9wHfY76AsmrldOFFES6h3+jKzCKpuScBPk?=
 =?us-ascii?Q?1L/B5WLde03LSsYZGE2ySrq4W9FER9irvT37?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+kIXXksvIKF3BNgTYoCdFo/YM6+UtN5JPDGtVOt4D8jfv6CZUxxzPEE7R7jg?=
 =?us-ascii?Q?y+R28xEkZE38xzuEFrpnz7os9auRX+01cDUUo70PSu+GaB4d/2/o3FMfpgGT?=
 =?us-ascii?Q?LdEE+QQDIIqMDCANxOlymauN2MUH+w/70qKLfMpxqalg+6CMe2H3Qhn3eJnw?=
 =?us-ascii?Q?8cQY03J7V0F1cYFyVThYt6p9nY6mVRMGmeakw++9GOfw5bav6QrJBjTPm61X?=
 =?us-ascii?Q?MyA4AtDC7hxVz7onedJ6Zg4dlcWdZ+eHulKW4xZyMSojxgDBqILIGhiPr+ju?=
 =?us-ascii?Q?9YP7uovcVOWx9ez1/fLXFkNlfW2espHrzqC98EvWh9D3MLu8paOShWGq1kJj?=
 =?us-ascii?Q?JWJI4Ht/J97aGoNFLfIgW6H7n6nxkEsQwdq2EoW6KgUwN9xX/r+DkRIrLkLa?=
 =?us-ascii?Q?sgAIg8cF+/SDIN9jhgyIPwQQCJQbJG+ShWigyRRDN5U6982GzFTq6S8OxboW?=
 =?us-ascii?Q?jpSL+IdDDzGA8ZPOFzvcyWCxKZr0Njm9Foy7beuBy7TV/RbR7jmyxOsC4yfu?=
 =?us-ascii?Q?uNSpLZinlnhvEPCdUFarX4sm7Dj0gs5Xo5FE/jZ2TGs6PtAJaaMr35RPKd8t?=
 =?us-ascii?Q?61j2gR58todoiXJhg6gVviHQYkk2XqC2uoHFE/FdaJMA9IesUZrQgpl7aeCM?=
 =?us-ascii?Q?zU3UjkeWsAR5Epgyz7CmBje+jn9EvqACFframRprVtuiRVHdWOGoiBRo/rmO?=
 =?us-ascii?Q?7BYeRerwckiLmssJlFKjTFGUBrihoDm5un1VdctwerhuSL6sWqyVypdbWGlf?=
 =?us-ascii?Q?kgrG51TnH8HTMbrp+5+M55oZsJyyjoL3I3PTlmOg9JlRskWekWXkq9Bv79pC?=
 =?us-ascii?Q?1oUHvf9IpWoCy0FWc+x2m0HvdDfDPrsHnezIF3QxdG5XceXYCIgwQV+A3vk0?=
 =?us-ascii?Q?zgjBgNI3s4HiUFU2cpEXP/mGBABY6ACu96GCBJ5QgzB4cpJohBHny9eL+8Sp?=
 =?us-ascii?Q?Zf34BZZBkT7OmqTc5iywv/fgPAUTRzuYlJPc2lMR9FAGwb2s8H7eP0EPeEki?=
 =?us-ascii?Q?VfdabHncvTNb7vTI1UwFQYgcemG5CmHhTSW/GHQDf3RpS1xeSrAdLqEOLdL5?=
 =?us-ascii?Q?gvyYY9qhdDq82gcDmwZISXMGQc6ZMKa4XUBtBHfnQID4W7yaFI8KTBFRWlRR?=
 =?us-ascii?Q?tpQyJ8TsicfVgXcRC7PwncdcGvBc2TpLgFPAyLign7V3coQQhz+pHEhu4QqS?=
 =?us-ascii?Q?RUrxDYijWBpt25AFG4kyL2imy1q7ljNbDAGHBupo8FlxiIRkr6HNx2z+fXG6?=
 =?us-ascii?Q?kV7gZB98qtr/5uxSGM+a8SZaqYOX8HqJ6Pqi04cLjg+EUnXgZ6527HH5YLTk?=
 =?us-ascii?Q?n3lDMlnPUH27f1ChupPrayKpQPyXU0tVDigy/TMiGb9nt6CqxI4tCi3zxuPu?=
 =?us-ascii?Q?3Qrqd4pfAa91q8scwhlwpQMsH4rLgtZJnjTOnnYI9otRM1Ek20hAlgePtTTA?=
 =?us-ascii?Q?38uv8+J63XV7eW3dj2KtPAsx3R4sti4dLHm/FDEpD4o9f6VeUJJiInZtmA1Z?=
 =?us-ascii?Q?0KTJV+W7gWiBfE4q8VOm5j4+VlLZ/CD6eNl6QAjKQYmkmw1IreOf8InUFoZj?=
 =?us-ascii?Q?e/e3BllyCIkmLsZu5W8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f59b4b89-c706-47e6-50f2-08de3bcb00cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 11:13:41.0777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjMRXL3EQm634spDLGbYtW3Q/y6o6Z/OBKmHYdVA77aVK4wKUQiwGdIfnsXD/Se2fGTmsLaIcRnKneVNLpot5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

> Subject: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
> check
>=20
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
>=20
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

With fixes tag added:
Reviewed-by: Peng Fan <peng.fan@nxp.com>
