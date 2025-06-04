Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB043595A;
	Wed,  4 Jun 2025 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046298; cv=fail; b=L55vYd9zetaoW+b2mBCuJ6jOrwne9WqUpRll+YLKTvuvjo57oXCls51CCX3cyGgQegXONhO50m3v7cfx5touyNb/tEJip2SAGhGQl2f0skgs3BEGnLY1EcpYgWwoY4ck0UQp0rLJMzj9ncBprYWh5Udv/PoHmvhla6wEdlQ+zpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046298; c=relaxed/simple;
	bh=dlALrJNLWGAMbBQgxHcgO1AwLePH1KTcsYJFkl08xwg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bedPjxLOLrD9zsMn35nNJ2UTb6M/Nvwd0/v+eCa1pGjURy8xpn7lCpj2okgZ+NY5DYfxy5dYGusL8aHy8EXoU2rN5PU9N3IMWt5zV2I/zc+mO8/asn+znkDik2N4TDY0z5wE0r0cpYlfURd+EMz7bgEaZ/Ad8hZC3/vV7GWGMSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dgg3Zi7i; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dgg3Zi7i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li4CI7Fo2pkts8/LRM9r2BtkhVR9IxsuwPplsVYfwRwKynDysO/FCqXvTtimVRxbW51tDLBJkGrhWXhVb1IuZOhbhApsa9PO/ouxW0D9fRAobSMoF90X6OPwXs/yBJL78tnrY+S3Qq7a4RkwIrQw3XwABfslqJkp191inhEH+ds9xm+3umMB12hP/7c/WGqRxXS4d7yCe1q95Ssa7gep1B6kqTMebvViK66AdY2xtjngndGb30skz2ijybwNtFemnLJ9U99/+hMw4F3ciWJqVIE1CNIxO76y7PuYr8eVGlm2R8meeyJPt+eIrCyUj+R7SQMj4B7iCsCqwvf+1KxZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlALrJNLWGAMbBQgxHcgO1AwLePH1KTcsYJFkl08xwg=;
 b=LvJtt3WbRS/sqBaRCvH5h64G6L0ic06GJtphrGcBmNgiRkfzmO3Sy7LIQes39KMXA1MfDXWDFntf+5JKEmUVOaFq2VWgvBBVNGsO2Nit1HcshXQmiFUXaRqVFjxfEJi3HZGAtxvdMgtiNGviVxPSVpzQ730Z5woG4qFDsI0B8cux1qpsaVewOTeHv3WCdNl8WRMlvQLOcvHVVts2tIWSBUXAZVuyW3Qjmho19m88zn5J3ZdRBjZjT1b6QJzQze5DGUIa0Jq3R5OecgpEmO4LQEba6tAaaaWIxuMdUhZDNQz1aXGqUQVqKmga/yYXfUjAda0gjKM2h1G7rh7w17W3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlALrJNLWGAMbBQgxHcgO1AwLePH1KTcsYJFkl08xwg=;
 b=Dgg3Zi7ioGLvv7Wg/xE/lbTq0ASIv9MsDJyMWsLlZnHzHNKLoklPXb9Q0dSBucl52nwmOvRljCssd8LOwaKxB4NJUNCTzAMqQbwzZOLmGHH1KWQrF/Cc/4i5t+EO4THAJ0yh053OeI1do2sAJq2wk9/OCZVg6kPphFYuqlJI524zPqFe3tQpyUijH7svZ6JBhPp3CjOJz5KFQDAF85ERx3ycFjr2ce7q1agOe7RotHm8T1aTgG8huUGisUHIv+eApxRc9UC/dVW0TNbsTQqgOm6fXoSAtpOGAubf2dfX74oljCKPdr59bDN9pHF3DUJD3MsCTfiOwDxpV44oFM2/5A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10619.eurprd04.prod.outlook.com (2603:10a6:800:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 14:11:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 14:11:32 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] remoteproc: imx_rproc: Add support for System Manager
 API
Thread-Topic: [PATCH 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Index: AQHb1PlrWBV202+31USYgPd+94a3V7Py9hGAgAAUglA=
Date: Wed, 4 Jun 2025 14:11:32 +0000
Message-ID:
 <PAXPR04MB8459A7D00D6D7223E088EE49886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
 <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
 <CAEnQRZByPkxojykJ3w-Mxko08Nc5txsOCL4vy+P76HuTy3YTaA@mail.gmail.com>
In-Reply-To:
 <CAEnQRZByPkxojykJ3w-Mxko08Nc5txsOCL4vy+P76HuTy3YTaA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB10619:EE_
x-ms-office365-filtering-correlation-id: 7a5ce8d5-d654-4b0d-b14c-08dda371b541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1F5cU5xZHR0eVc0L2lHMHh2ZXUreTBwSXQwYmxPNzcyN2NDaEphcFRERzdU?=
 =?utf-8?B?alB2SS9neUlITUpYOE1ISld3dGlCSXE4TFNFQnFTQit4K3N5L1N1dXA5MHVS?=
 =?utf-8?B?TFhMaEFTNGhpcHVFYWZWQlV0dWc3ZWhyOGZPdmZLVHd2ZE5JQXp5OHBHbmUw?=
 =?utf-8?B?cHdQR0RHTG4va0k2a2JFcGRIcS9FSDdtWEhFMm1LL1lTS291Y1NZZmQ1eFNS?=
 =?utf-8?B?VkpzWHFObmlkSjI4dXpPc3hQTHpCSVE4MmlMbk4xbVV1WjFuQTJtSStMSnc2?=
 =?utf-8?B?cmJxSm8rZDJrTHA0Ym1KN2ZiVXczVHhNWVBGZnJuTWtIdnpocERuUVZUeXJG?=
 =?utf-8?B?c2l5N2FLc3VmNDFmU2NERGxSdXFPY284ZXZ4c3ZHMEk3NnZiWklwSkY2cnB2?=
 =?utf-8?B?WGdTV2swVzhJeVIzS3ViTHFnblZydW5kbXNTUHlpY0xsSHVzT09EckpRUHVs?=
 =?utf-8?B?NTZEMkVLckZvcVVsMGc4c3ZTQWxaSXpNd3pFdDllY2o3TU5hazJYcmgyNWh5?=
 =?utf-8?B?ekRLOXFuQzNPVkJmZ0UzNUZtRkJLU2MydnhoMC9KWU9LN2oxVXprL0JydG5Z?=
 =?utf-8?B?QUVtMlF0Qm5MOWNhWFo5azRpVTkxVER6ZHQ3a3pyNEViaWswMHBrV2hRM2hs?=
 =?utf-8?B?cS9kN0RldDJLZmw3MldWK3hDb1oyYVoyNEFxVEo0Y0N4bDJ0T3JhNmJaVy80?=
 =?utf-8?B?c0l6QTVhY08ra3E4YS9hN3ByS1hVNkFkNUxUWGVWWWZMdUVXR0xvMUtOVHQ2?=
 =?utf-8?B?eWVHdkEvNkZnUnhrZXF5TS9hZFR1RnZ0MVZCTXRmYTA1M1p0NjBmWldORUpW?=
 =?utf-8?B?ZGlFMGI0WE0yT3hIQU9EZzFKZStadzBCZHlCTldTT0Z3NXp5bHR4VkFLdzJC?=
 =?utf-8?B?QXA3azVjSWdvdCttb0swTlBUOUdUSUNRT0Z1dkI5a2I0TTgyMytZcEFiKzFz?=
 =?utf-8?B?dFpRZkdFRHpuUzZzMGZVSk5qNFM2dExiRDlidjZNRnlFOFJONWJOZEgvQ2ZI?=
 =?utf-8?B?ay9XcHNMSXRaWVJWUDV1U3VuY0tBS2lyS0oyb3pFOTEzVjk2SWR3WCtBbFg3?=
 =?utf-8?B?UjNWNGozbk1BUTk3UnZXa1JwaWw5L3hoazFDRDBoZmdiNlhQYTFhRU5SM0pF?=
 =?utf-8?B?MXJJR2lrakVvaWlHRUhhOGwvR1E5cWdSM09GOFNaZVUvek9TSEcwbG15RVgz?=
 =?utf-8?B?dytLWDJCTkNwUkswSTNWbUxhdGRQRnFxanpxbWtPd01YaDVNcTdtTGcyRVli?=
 =?utf-8?B?Z1lTVXR1SThJbFJaTFkzSkpNRTdzZ2F2YldIaGdOOHNRZTZkOWM4VFVxREtW?=
 =?utf-8?B?c3p6cmFaWm1BY3NBbHVVMTR1QXp2SWxaUWZmditWSzlXRjUybE4zb2RtK3BN?=
 =?utf-8?B?N1hqR1c1QjN4aURaZ3o1Nzl6Q1dhT2JCWFpxTDhCbGsvQkFCaFFNbTRld1Bk?=
 =?utf-8?B?TmkrNG9hWDhXMkFzMDJXN3VzU3RPZTRlei8wT1cxd1hTMUdJRHBVb1pxUHZH?=
 =?utf-8?B?OWN2ajBFQnByN3pIK0lDc1Y3dU1iTndlQis4Ymp3WGZFalFINXZQVnVMK2Nn?=
 =?utf-8?B?UC9XTjZVVmpMMkowOEQ3d2p4SFNpM05kZnJSenNNSnBWOXIvQklTQ1ZBOEQ4?=
 =?utf-8?B?cnJYeWswUHIxb1FwVTBTa3dPR1JrZ1dmMjYvTy9XT0N1UEJtdGh1Nm1QNlgw?=
 =?utf-8?B?KzdGMWZWb0tZMW5EUVM1aVdBMEdpWVpRY28wTTA0M212cWFGTm1mbGQ4QnM1?=
 =?utf-8?B?ZFh5dlNUamVZanVDVG5LVFNza0JBQ1JmRDQxOHhMSWs0NXFzaTNCUXk4cGVk?=
 =?utf-8?B?bFFqRWRLOEQ5YzRGQXRlSk5qMjM1bC9ZQWd0Rjl6ZHAzclNabXNvc2R0b25R?=
 =?utf-8?B?NnhnTVBlWGpRK1JoeWpxOVQxSlJtbGd5OEs1VFc0anZzeExRTTdRRCtIVWR0?=
 =?utf-8?B?V09MOVhBa20zSXVzWlhPV2Z3N2M2ckp5cGpCYkxuL1VESHBrRzROWHRYUXpU?=
 =?utf-8?Q?SwWaI6PTvSZBjM7WJSNsICVLgbY8CY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmJDQUh5VEJkTVdtajNZWk9OVC9FaXRjZ3FxUmVEUWgvYlhIWUQvd0h2Nmxt?=
 =?utf-8?B?bjM0RUFYK1dDYVl1ZG4xUkFKakVlQTNRd24yVHpWbjhiMTFGb3FUaUgxUWE5?=
 =?utf-8?B?dFBoejUyN0Z3dTU1WGtyMmhsT3lzMU9QNllPVTd6WEJuUEE5OHI3S01YRzhy?=
 =?utf-8?B?WVBQcTA5K0hnc1hFMStZV3RmT2dpY2ZkQ0tpZngyNmJOSmdqSjhFSkU4Zk1D?=
 =?utf-8?B?cEhvQXlyVW5jNm9nSVBnMDlkdC9ENXROZmdFcFIzcFhYT2owR21mTnVoUXFS?=
 =?utf-8?B?Nk83S2VaaVYzSTJKRHNZWTBxajA4TXFwZksvamxWZUhsYjFWelZxZXFjZmUx?=
 =?utf-8?B?cUp0RlRlVWlVeEJnUGtaQVp3cnY2UEMxRTJKNHBnbHI2eUpEZ2gzMitKdzBT?=
 =?utf-8?B?VjhUU0pkbWl3SFpCb3Z1SVhGNkVGVHhOUDVmcklZdFdETmtpejg3cGMxSmFa?=
 =?utf-8?B?ejhYYkNybUVXemxEZE11ZExtRDRoT3dKUXZ2REp5V1VqUFFSNmVCK2hRd3lk?=
 =?utf-8?B?Q3FqOG80cFdpRStSODllRWs5NGYyb0xnL05OS0xCbDVQK3k2dW0yYXpRaGht?=
 =?utf-8?B?bHh4Z1FCVjVKckhaZkRWRE5kbXc3bGtkb05ZUHpIeUlhY2tsb2xrTUZramp5?=
 =?utf-8?B?K0lvK0JoK3lJZ0xMNzFnV1U5TmpvQkY2Skd6RjBRaUVpOHRNU1huanFYYXZz?=
 =?utf-8?B?ZnF4d0J4a3EyelFhSjhZVzcyMnp0dUw2L1VUME1heSt2RGI2R0FpZlhWOU43?=
 =?utf-8?B?T2NUY2tFYVcrdVQ0dnlpVFRYWW9MSmJqbEJPMWZLK2pZSjVGL05UL0NGaUd3?=
 =?utf-8?B?NFdUQzdHeTdhR0VVYjNZY0Y3NXFpbkpuT0tkWmNWL0xJR3dycXJXWnVWVG5X?=
 =?utf-8?B?blpGakZQeFl5UDVtNVZHQnZ2K09lZFVNVUVPdHdrNEpsOWJzWUpwemg2YnRr?=
 =?utf-8?B?bDB2R2NiYi9GRlY2bU12bERxcXpGbytFUFBnWUxQeHg1NGM1NW04Y1Z2VTdh?=
 =?utf-8?B?WkRKZTd3R1VYTGlrTTdiWFUwem53d2FNL3BZYkFZNjJTY2xOY1JsMzAwRDhS?=
 =?utf-8?B?YUNnQXNOdWJQMVJKZnN2emNZenBqRVM4V2diMUZIY1BMYmJ1ZXplbHpFNExo?=
 =?utf-8?B?VWJLL1FhZUNtOE1hUVdSam80SXFaOExiS25VT2UrZGtEaUVCQlhXN0prUllx?=
 =?utf-8?B?blNkaXVMM0wzRUhqUUFqWUI1UUtGQlptM25uZE1TUHI0T1cyc0RjRUR0TGow?=
 =?utf-8?B?VUdWWDNDVnppcE5jdkpMbis0aW9NeGpuOFlyVjVpcUYzLzYwYWtLOW11b1gx?=
 =?utf-8?B?YTl3QVduRWM0bVZMbE5mK0xrTU9HQlU2ODM1a3pBejN5RFR2SkNBdUpybVBz?=
 =?utf-8?B?SUs1bDBWQnorOG0rMlFwWkthUEJDQzBoUnlvbWc4MzNsdHAvWExRM2tscXc0?=
 =?utf-8?B?dU9McVhMaHBxVkhRYXJPQlc4eUN3RDJ6OUo4MUU4bkoxck04RldKNmtPYmNo?=
 =?utf-8?B?bG9Ob1g4OTcrVWFoYktndGNJMS9pQjNkanVpRWhBa0xxbmdoaUJMSzRKeVpF?=
 =?utf-8?B?Tm9DeGJpM2dqTjYxc29MaG5VM3NWMWRUdStVUFVyd0JNaGFnQ3I0bFBUL0lI?=
 =?utf-8?B?Wnk3MG9vRFRXZGo2dFdra25hdWc4R25aSVg1djhZTE0xN0F0dlVHa2lJV0VT?=
 =?utf-8?B?Vzdsc0IySXYrUHB5NURRZ0dWejhxTm00bjFUYTUvQW51N1NJODJ6cldOanlF?=
 =?utf-8?B?MUIrb3k0QWprdm9sdHgvb0F6eWRHOUs0dFZuMlRxVjZpdDRBVEFMemorTG1r?=
 =?utf-8?B?STBYdHcvWEwrdjFaRkh2MUtzZENCQ2tSOWpOVS9xWlljTTJWM2pwa21oWmR0?=
 =?utf-8?B?VGJOaFdwSTVvZzZxY1pyWkNUUnBoU1FlTjF3dUVjVzFsSkZPZzUwYVlneUpx?=
 =?utf-8?B?c2hlWno3dUZKZmdrQ0Q1MURTTU9OM0pnaGNwYWZNVTk5aFdwbFE5RTJnSE9R?=
 =?utf-8?B?ZURQRHowTktnOEtSZ1UwcmhydGlkSGFrTE1UbmRZZ1czN1A1WVV1MVZEU3Er?=
 =?utf-8?B?a2RJOERqR3cwS1NwZDNGVWRuYWVNMGJHNWkwSXhndDg5c0NHcWx5SVFuY21m?=
 =?utf-8?Q?52i8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5ce8d5-d654-4b0d-b14c-08dda371b541
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 14:11:32.4066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iayTo5uvL+fHIveISzaC1BGVru5Mdqrv2ZR3ibLV2wGSOuv9iYEAB+sUnVK31/yP5WTv0S7MQEMDqRKidn6aAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10619

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBBZGQgc3Vw
cG9ydCBmb3INCj4gU3lzdGVtIE1hbmFnZXIgQVBJDQo+IA0KPiBIaSBQZW5nLA0KPiANCj4gVGhh
bmtzIGEgbG90IGZvciB0aGUgcGF0Y2hlcy4gQ29tbWVudHMgaW5saW5lOg0KPiANCj4gT24gV2Vk
LCBKdW4gNCwgMjAyNSBhdCA1OjM24oCvQU0gUGVuZyBGYW4gKE9TUykNCj4gPHBlbmcuZmFuQG9z
cy5ueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPg0KPiA+DQo+ID4gaS5NWDk1IGZlYXR1cmVzIGEgQ29ydGV4LU0zMyBjb3JlLCBzaXggQ29y
dGV4LUE1NSBjb3JlcywgYW5kIG9uZQ0KPiA+IENvcnRleC1NNyBjb3JlLiBUaGUgU3lzdGVtIENv
bnRyb2wgTWFuYWdlbWVudCBJbnRlcmZhY2UoU0NNSSkNCj4gZmlybXdhcmUNCj4gPiBydW5zIG9u
IHRoZSBNMzMgY29yZS4gVGhlIGkuTVg5NSBTQ01JIGZpcm13YXJlIG5hbWVkIFN5c3RlbQ0KPiA+
IE1hbmFnZXIoU00pIGluY2x1ZGVzIHZlbmRvciBleHRlbnNpb24gcHJvdG9jb2xzLCBMb2dpY2Fs
IE1hY2hpbmUNCj4gPiBNYW5hZ2VtZW50KExNTSkgcHJvdG9jb2wgYW5kIENQVSBwcm90b2NvbCBh
bmQgZXRjLg0KPiA+DQo+ID4gVGhlcmUgYXJlIHRocmVlIGNhc2VzIGZvciBNNzoNCj4gPiAgKDEp
IE03IGluIGEgc2VwYXJhdGUgTG9naWNhbCBNYWNoaW5lKExNKSB0aGF0IExpbnV4IGNvdWxkbid0
IGNvbnRyb2wNCj4gaXQuDQo+IGNvdWxkbid0IC0+IGNhbid0DQo+IA0KPiA+ICAoMikgTTcgaW4g
YSBzZXBhcmF0ZSBMb2dpY2FsIE1hY2hpbmUgdGhhdCBMaW51eCBjb3VsZCBjb250cm9sIGl0IHVz
aW5nDQo+ID4gICAgICBMTU0gcHJvdG9jb2wNCj4gY291bGQgLT4gY2FuDQo+IA0KPiA+ICAoMykg
TTcgcnVucyBpbiBzYW1lIExvZ2ljYWwgTWFjaGluZSBhcyBBNTUsIHNvIExpbnV4IGNvdWxkIGNv
bnRyb2wgaXQNCj4gPiAgICAgIHVzaW5nIENQVSBwcm90b2NvbA0KPiBjb3VsZCAtPiBjYW4NCj4g
DQoNCg0KDQo+ID4NCj4gPiBTbyBleHRlbmQgdGhlIGRyaXZlciB0byB1c2luZyBMTU0gYW5kIENQ
VSBwcm90b2NvbCB0byBtYW5hZ2UgdGhlDQo+IE03IGNvcmUuDQo+ID4gIC0gQWRkIElNWF9SUFJP
Q19TTSB0byBpbmRpY2F0ZSB0aGUgcmVtb3RlY29yZXMgcnVucyBvbiBhIFNvQw0KPiB0aGF0DQo+
ID4gICAgaGFzIFN5c3RlbSBNYW5hZ2VyLg0KPiANCj4gcmVtb3RlY29yZXMgLT4gcmVtb3RlIGNv
cmUNCj4gDQo+ID4gIC0gQ29tcGFyZSBsaW51eCBMTSBJRChnb3QgdXNpbmcgc2NtaV9pbXhfbG1t
X2luZm8pIGFuZCBNNyBMTQ0KPiBJRChnb3QNCj4gPiAgICBmcm9tIERUQiksIGlmIHNhbWUsIHVz
ZSBDUFUgcHJvdG9jb2wgdG8gc3RhcnQvc3RvcC4gT3RoZXJ3aXNlLCB1c2UNCj4gPiAgICBMTU0g
cHJvdG9jb2wgdG8gc3RhcnQvc3RvcC4NCj4gPiAgICBXaGV0aGVyIHVzaW5nIENQVSBvciBMTU0g
cHJvdG9jb2wgdG8gc3RhcnQvc3RvcCwgdGhlIE03IHN0YXR1cw0KPiA+ICAgIGRldGVjdGlvbiBj
b3VsZCB1c2UgQ1BVIHByb3RvY29sIHRvIGRldGVjdCBzdGFydGVkIG9yIG5vdC4gU28NCj4gPiAg
ICBpbiBpbXhfcnByb2NfZGV0ZWN0X21vZGUsIHVzZSBzY21pX2lteF9jcHVfc3RhcnRlZCB0byBj
aGVjayB0aGUNCj4gPiAgICBzdGF0dXMgb2YgTTcuDQo+ID4gIC0gRm9yIGFib3ZlIGNhc2UgMSBh
bmQgMiwgVXNlIFNDTUlfSU1YX0xNTV9QT1dFUl9PTiB0bw0KPiBkZXRlY3Qgd2hldGhlcg0KPiA+
ICAgIHRoZSBNNyBMTSBpcyB1bmRlciBjb250cm9sIG9mIEE1NSBMTS4NCj4gPg0KPiA+IEN1cnJl
bnQgc2V0dXAgcmVsaWVzIG9uIHByZS1MaW51eCBzb2Z0d2FyZShVLUJvb3QpIHRvIGRvDQo+ID4g
TTcgVENNIEVDQyBpbml0aWFsaXphdGlvbi4gSW4gZnV0dXJlLCB3ZSBjb3VsZCBhZGQgdGhlIHN1
cHBvcnQgaW4NCj4gPiBMaW51eCB0byBkZWNvdXBsZSBVLUJvb3QgYW5kIExpbnV4Lg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyB8IDEzOQ0KPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvaW14
X3Jwcm9jLmggfCAgIDIgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJv
Yy9pbXhfcnByb2MuYw0KPiA+IGIvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jIGluZGV4
DQo+ID4NCj4gNzQyOTlhZjFkN2YxMGEwZGI3OTRkZTQ5NGM1MjMwNGIyMzIzYjg5Zi4uMDY0OWZh
YTk4NzI1ZGI5OQ0KPiAzNjY5NDZjNjVlZGYNCj4gPiA1YjdkYWZmNzgzMTYgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+ID4gKysrIGIvZHJpdmVycy9y
ZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+ID4gQEAgLTgsNiArOCw3IEBADQo+ID4gICNpbmNsdWRl
IDxsaW51eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvZmlybXdhcmUvaW14L3NjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZmlybXdh
cmUvaW14L3NtLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4NCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbWFpbGJveF9jbGll
bnQuaD4NCj4gPiBAQCAtMjEsNiArMjIsNyBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvcmVib290
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3JlbW90ZXByb2MuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NjbWlfaW14X3Byb3RvY29sLmg+
DQo+ID4gICNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gPg0KPiA+ICAjaW5jbHVkZSAi
aW14X3Jwcm9jLmgiDQo+ID4gQEAgLTkxLDYgKzkzLDExIEBAIHN0cnVjdCBpbXhfcnByb2NfbWVt
IHsNCj4gPiAgI2RlZmluZSBBVFRfQ09SRV9NQVNLICAgMHhmZmZmDQo+ID4gICNkZWZpbmUgQVRU
X0NPUkUoSSkgICAgIEJJVCgoSSkpDQo+ID4NCj4gPiArLyogTG9naWNhbCBNYWNoaW5lIE9wZXJh
dGlvbiAqLw0KPiA+ICsjZGVmaW5lIElNWF9SUFJPQ19GTEFHU19TTV9MTU1fT1AgICAgICBCSVQo
MCkNCj4gPiArLyogTGludXggaGFzIHBlcm1pc3Npb24gdG8gaGFuZGxlIHRoZSBMb2dpY2FsIE1h
Y2hpbmUgb2YgcmVtb3RlDQo+IGNvcmVzICovDQo+ID4gKyNkZWZpbmUgSU1YX1JQUk9DX0ZMQUdT
X1NNX0xNTV9BVkFJTCAgIEJJVCgxKQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBpbXhfcnByb2Nf
eHRyX21ib3hfaW5pdChzdHJ1Y3QgcnByb2MgKnJwcm9jLCBib29sDQo+ID4gdHhfYmxvY2spOyAg
c3RhdGljIHZvaWQgaW14X3Jwcm9jX2ZyZWVfbWJveChzdHJ1Y3QgcnByb2MgKnJwcm9jKTsNCj4g
Pg0KPiA+IEBAIC0xMTUsNiArMTIyLDIyIEBAIHN0cnVjdCBpbXhfcnByb2Mgew0KPiA+ICAgICAg
ICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRyeTsgICAgICAgICAgLyogY3B1
IHN0YXJ0IGFkZHJlc3MgKi8NCj4gPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29yZV9pbmRleDsNCj4gPiAgICAgICAgIHN0cnVjdCBkZXZfcG1fZG9tYWluX2xpc3Qg
ICAgICAgKnBkX2xpc3Q7DQo+ID4gKyAgICAgICAvKiBGb3IgaS5NWCBTeXN0ZW0gTWFuYWdlciBi
YXNlZCBzeXN0ZW1zICovDQo+ID4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNwdWlkOw0KPiA+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
bWlkOw0KPiA+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFnczsN
Cj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3Jwcm9jX2F0dCBp
bXhfcnByb2NfYXR0X2lteDk1X203W10gPSB7DQo+ID4gKyAgICAgICAvKiBkZXYgYWRkciAsIHN5
cyBhZGRyICAsIHNpemUgICAgICAsIGZsYWdzICovDQo+ID4gKyAgICAgICAvKiBUQ00gQ09ERSBO
T04tU0VDVVJFICovDQo+ID4gKyAgICAgICB7IDB4MDAwMDAwMDAsIDB4MjAzQzAwMDAsIDB4MDAw
NDAwMDAsIEFUVF9PV04gfA0KPiBBVFRfSU9NRU0gfSwNCj4gPiArDQo+ID4gKyAgICAgICAvKiBU
Q00gU1lTIE5PTi1TRUNVUkUqLw0KPiA+ICsgICAgICAgeyAweDIwMDAwMDAwLCAweDIwNDAwMDAw
LCAweDAwMDQwMDAwLCBBVFRfT1dOIHwNCj4gQVRUX0lPTUVNIH0sDQo+ID4gKw0KPiA+ICsgICAg
ICAgLyogRERSICovDQo+ID4gKyAgICAgICB7IDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIDB4NTAw
MDAwMDAsIDAgfSwNCj4gPiAgfTsNCj4gDQo+IF4gdGhpcyBiZWxvbmdzIHRvIHBhdGNoIDMvMw0K
PiANCj4gT3RoZXJ3aXNlLCBwYXRjaCBsb29rcyBnb29kIHRvIG1lLg0KDQpvb3BzLiBJIG1pc3Nl
ZCB0byBtb3ZlIHRoaXMgdG8gcGF0Y2ggMyB3aGVuIGFkZHJlc3NpbmcNCnlvdXIgaW50ZXJuYWwg
cmV2aWV3aW5nIGNvbW1lbnRzLg0KDQpGaXggaW4gVjIgdG9nZXRoZXIgd2l0aCB0aGUgdHlwbyB0
aGF0IHlvdSBtZW50aW9uDQphYm92ZS4NCg0KVGhhbmtzLA0KUGVuZy4gDQo=
