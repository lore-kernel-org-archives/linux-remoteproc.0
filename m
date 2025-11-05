Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B52E62A2;
	Wed,  5 Nov 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332698; cv=fail; b=jIyzu3Sdl2IlKADeG7fM7oYD7yr/BqHmAZ0ccwGX96Mvv9atFmg3Zje2fSCwkap1TY3wbY/Sy30HeTnQOqqyvN+3ZnQTw5riBdPKtoIdr/WGYp+8jYT4iVXKgs4CZXqmDXXtxjnRNZpzsYJDY6RYxACnG2L1V4RWv3DZ2Xw6GpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332698; c=relaxed/simple;
	bh=L+jtJQBGx87yNZLV+V6Kh12dAu4ONyUOuKqUCJjvbxY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyeaPHnk/QeqWB5hsmRXlG+tQeNQYf7ZI7bCUOIKka/dM/W5LFM8W7D33DljDigUn4AoUUAD3mA84sIxfa41Y38r6GY7tAar1ej7t+JvRjGE2sreP8l6J113GGAiSWfUGSVoHYQNYZktej4Lm+aZzrmSIdy4eNWkUQKn9HyVv5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ayR2ub1A; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ayR2ub1A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCVX29DmZ4EePls+SNG5GBIwZajtNlsLkHvy/IuZ/BOouOEgd1CzyqHqopqWUyae36RTc+wjMr20vuizKlpZiTjqTlil+AqCML/Zp7Yih7zlvP+GBvKekA73/pOlIZRWnfKIV62+sCUIShOLO/egl20ESJF2lytQHmZwESMFfOAfPkqh56e0WLubV0Y0a7uhw1pM/wdC21rCfy+vOXsM+fvbGaH0ecoGayuBjfvKmbK/vD5/3Ef3cRJ1zoSqmEVJhkyKea2fxiS5Z4OXT8w8vh1jnBkk90tbSbEhQllfEbTMMuYuIJ1uVR6kjT0gITzO5nd+vR3wH0763e5AHko57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+jtJQBGx87yNZLV+V6Kh12dAu4ONyUOuKqUCJjvbxY=;
 b=bZmQGKB/ffLWPgAft22vBWoPhbSPzjbuI08ehlnuwalFQ4RJ9G03VIQswECjQZIDYMB1xkDtmJ+G5LTS7P2LindwTtvxuCO6Ltd2IMNGJAxlvW/y28hEPErsf3H9VilfVyX1IWnBMGyJ144KXv2npM3g0Cuz4Cti1v5tEQUt0xNjEdRNLwyYyv9z31RWx8BrercrhISjT2vuHK1oEj5BGuislZ5cGyAVFLmi+6XK68n+TrexrC0l/Sx8mKyQZqBhKqKrgbG1ixrlvJT41WvHkA2ztmaa62Ifr+Qr8NxC0ySk1NjiyT+IT+LropLFCK2soBmmg06Z+KiHijv+nOyQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+jtJQBGx87yNZLV+V6Kh12dAu4ONyUOuKqUCJjvbxY=;
 b=ayR2ub1AMtxe6rB5oTfkBH3R6d8rLgN07ECqM+DM8UbI/dwYTh9MpdCAtFJllINKcoEyMYssQlc+BIPJMRCcGPabVzyk83laQNbVd0o5m3cCTkQJHQrxu6SQX2H22USfdv1dpI1nvnmbyqGt9NVYAt7avQq2Of4jPj9k/S5kGPLl3z6YuQnw3vQfmcURIMmJS19Dk3BxtMqOT0Oa7aaw7UVzgoyOoLlay8tA09b9km5zVUsIhOSU6tsN7LPX7EHcs8dMe9F/PrSAVh4/M+gSJOCs8UEichqR/kMNZt6jf8gFK/O3AI40CaVEtoiiQFMDlEqA+ANv/dm+/EwspjlnuA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Wed, 5 Nov
 2025 08:51:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 08:51:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <frank.li@nxp.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Topic: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Index: AQHcSg2ra3kDT9fpJ0C/0Bh7g6e2t7TiTL8AgAGA4HA=
Date: Wed, 5 Nov 2025 08:51:27 +0000
Message-ID:
 <PAXPR04MB84595E1EC0AD10E892DE2D1C88C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
 <a2643450-00e8-49e0-bd27-e6680de7b9e9@nxp.com>
In-Reply-To: <a2643450-00e8-49e0-bd27-e6680de7b9e9@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB9449:EE_
x-ms-office365-filtering-correlation-id: 506149e6-005e-486b-64fa-08de1c4881ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEp5L0g3SkwwZk95RHcxWjM5a1NaakY0RFRDNGtzWTd2MDVzWncybHdjbVZt?=
 =?utf-8?B?MzFzNXkrd2NnWkJCTjVNTlpHVVZvZHFqVVFJNWdpM05laitGS2orQWFSc25z?=
 =?utf-8?B?VFBYSEVUY2dBTlVVcGRuME5INnNlTTA3UGRaOGVkUGxCOVZ4UEtTWW1rYlRS?=
 =?utf-8?B?VTRJUmZLQVNmdU02RmhvVzVZL1YrTWh1T0wyNE0vZkxJczlMNUU4eWdqR2xk?=
 =?utf-8?B?K1V2cmR5bUswbjZBN2JISzlhUmVOZnRrejIxSmFyekk5Nm1NalBRVlB3S2lk?=
 =?utf-8?B?ZWZCZnZPWHZWLzU5NitDYkJnZVRSaDBBdldrVkRrQjd2RjZpMVppTG9QQlp3?=
 =?utf-8?B?M0V0RDMyRUMwU3piWjNmdE9xVlBlVXF6R1MzamFNblZFWnhMeEZqMGRyVC9n?=
 =?utf-8?B?aE9HYlpmYUlkUjhLSGJvUFRwdHFPb3pRU3hJQXBYSlJrNXFZcmp6SnB6YlJ6?=
 =?utf-8?B?QksyV0x4aEJTMURGTnpJUm5zVDN0dFY1ck1abXJja3Z0YlNNSjBBUFMrVjUw?=
 =?utf-8?B?MjM4ZGt6NkFHK0lhSDBpV0dNRVpjOURrelR4T0tpL2ppVXBtMFVhNEJzTkxZ?=
 =?utf-8?B?UUliYUY2TkU5R2ErL1pOTFVDRE9TbE02YitGOUlGcTJTK3ZFOEw5bGVmcXk5?=
 =?utf-8?B?WUE5Y2NJSWhRTUJiaGpUZUhpck5RUm8wTHBIWFFIOVBENWpNd3hCRTI1RWxD?=
 =?utf-8?B?MmtoR1RLYU01TGZqMmNIVllPNEx5STVmdGFsWUNpT3VZWmhGTk83eUlYWFFz?=
 =?utf-8?B?a0tKVFBybi9FWWJOMk5KMTArTDBndTBJMFc2ZG4xRHlaZklod1FzS1hjd0hG?=
 =?utf-8?B?cm1XNjJCYkk0WVlUQ0VUbjU0ZUh3MHBQdWN6RkNycjRnV3dBU0VkaTBQejk2?=
 =?utf-8?B?c0dDVTRFMzYxTnErZStHeDBHU253VXY2empRY3QrUFhVb3JGcjhGYTZ1Mllu?=
 =?utf-8?B?WE5FUm4rVUl1aFg2Z1lBVzNPUWlocDJjdHdlQmFGMjlGcnZCcmMrRGNta3Rl?=
 =?utf-8?B?Y2ZDVFdvWjN2aUtPSEFtaVFZT002TWw1dXNMUnNSTzR3b0JLcml6ZUdjK3Ir?=
 =?utf-8?B?djYrdFMvWFBtZmh5Zm5Fbmp1NE1pOERya3hxOTRaVWZ6UEZCRFdaZXdVeWMy?=
 =?utf-8?B?KzVNNzVUMXdBWThoRy9jejd4Vk1pWkgvZ1Jwcmh5R0NCQnBxUmMrYTJoWHFV?=
 =?utf-8?B?T1VtSHg0bzZIeGcvNi85NkFjNnNyZ3NJcDJxVy9YUEEydkFwV0Z5U2tXdEJK?=
 =?utf-8?B?NkF6TnkyTUp5aVllbXhGcTRBRWJKOVRkVVR3eDBtWkxJazF0azdibk95TkhB?=
 =?utf-8?B?V0hIK3A4VTZvUWdOVERnbnJXSjUvajloMTllc0JpeVVwYytOZ1FZMkQ3dDRt?=
 =?utf-8?B?TkF1RkhzS0ZEYTFJWWUvN1JkS2k5VmFTUWJwNjNtN0lhd2ZxaE0ySkQvemF5?=
 =?utf-8?B?K3h2UVM4NjA0VHhoc3RtQmJlRWJRNnRrZWd2UHlxRVNiZ3NxcktJOXRvVFdk?=
 =?utf-8?B?VUFyeGZ5VU1aWlBWYWZWeGw3MTlpVG9rc2V3L3lFekIxSE5TeTNJRGZzSzdj?=
 =?utf-8?B?SkZZcXpxVXUxTkwyekxQVDc3QW1IdDFnV01NWnJSRW54amthTzkwVDJXZ0M2?=
 =?utf-8?B?ckZ3cHRwdEJEWUdmVnZoN0gyNW5EUDBldlFidFVNdExZTi9yMldrc3o2d0ZI?=
 =?utf-8?B?d2N4TG5IZVYrVy9sSmlKcktoVWZ3ZmtMZ2Y5RGpHQ08zRm9yK2JjR0IzUjQx?=
 =?utf-8?B?Uk5xakcxRGczVXhkWThqVEhNWjJzT3JRUVRNaE1UcWFRZkorNTdYbDVzdm0v?=
 =?utf-8?B?bmVoSEcyZnk5TnF3SkVrUkt3NHBidUVGQ0JXYW9xT1IvMmZPVHRwaTI0S1JU?=
 =?utf-8?B?MFZOTkc1U2JjUkxSbnRYSFBDWXJDc0NkdHJlaUlIK2l4dkIwUXNGN2tQamR4?=
 =?utf-8?B?MC91NUpRT0dRckpwVTVTcEdIKy8vdUEwRGxFR0QzaitrSEx5bG9RdWUzZDJQ?=
 =?utf-8?B?RUlvdmFIWE9qZUVRQjBYVVJ2UkdtVzJuaEcyVjRpbU5WajRaK3lqYmV2WFJ3?=
 =?utf-8?B?aE4vcHRNcDB3VDdvWkNKbE5CdWdGWWwzRlJSdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXA0eVBoa2JDLzJ4ZTVtODNLNnM3YVl6MmYwMHA4TkErWG1MMzhhSDZpMkEr?=
 =?utf-8?B?L2tNNVcveFAxNTAzVlFOZEVxUEpib1R3Z0d2RmYzM2FWRG1jMVRIaTVRdC9V?=
 =?utf-8?B?WjB6YTM2WUY3WVdSbVAxNkVIWlcxRHY0ZTNOTS9ZMzErRW1aaGJIQmU0T1lj?=
 =?utf-8?B?ZXdUcENSQUxxSzl6K0p0UjB2WkxMWHhBZzkyL3VEdkY1SnJvSzJpNWFFd2c3?=
 =?utf-8?B?QWZSY0NwZEt4dDVKU3JtRGwvcWZzV1NmcmQ2aTV1OVdqdnpZbUJXUHVYTDVO?=
 =?utf-8?B?bFlpb1ZRVDFlYk9UZDZJTTZDOGxaYXBTMFdBTGNQMTA0YWZuOHJTYzBaQmhI?=
 =?utf-8?B?UmVxYkpmTGluSGdFOFkzdklTU1dlOVl1T2cwblFaTjEzcWhTR1JMdDV5VjFD?=
 =?utf-8?B?aHdFRGFTVWhkNDZIa3ZYRmtENTdJdmJDVnZEMzkzSlFCT29odzVueTlZNHBP?=
 =?utf-8?B?UVNFQ2p4RklRL1pud0dWdUViSGFKV2VtUWkzRitUVzlhbW9CRFZjSndCUDJv?=
 =?utf-8?B?Si9UeGJpc295MjliZmJSNGJIbkFXbkd4MnBMSjRvYWtrZUJhK3luMWw2S0Vu?=
 =?utf-8?B?ekdLejJHckRkQ0dNMjRXaFVzRnBISkFreGNHVFlGUDRGOUwzcElvQm5pRWxx?=
 =?utf-8?B?QUdhVyt3VmV6TjQyRU5XUm5TWGJJelYvRzRRT3dFcGxoZEswWjhvY25mbkVJ?=
 =?utf-8?B?TFRnNTd4OUxoc2RRSnkrWVNUcW9CRUhYNHdJMFF2cW9jeVpMMkN3TUxCazZy?=
 =?utf-8?B?TDgyeDhFMjRwNmFLTDFENlNWeGM3MUY3eG5MTFdPVG5iTklPcjNQMGtzM1cy?=
 =?utf-8?B?WjE4UFVmM0Q1RlRQOWRaeUVVN05Qc0QyTkxSUnoySXRUVDN1S1NoRFVBeWtO?=
 =?utf-8?B?b2k0dVJIay9GNWJkaEVYUTBsdnVHZTM0dFQrSzFzc3NuVjRwYnFOelR5Nnl3?=
 =?utf-8?B?aUZMclJuczB0RzViOExZaVlnSzRRRUNYNld2YXkvUVdUeE9ZeFV5eThYOVE5?=
 =?utf-8?B?WHltZ0xmd2JuVkhiUUJxSitQZDJ1VUxJdHRyWno3elBHV2JkWjVZdmtLbHJy?=
 =?utf-8?B?OVd2Sk9xSjJxRVFXQjUzaTVaSk56UWs2MlgxaGZZbk5NZ01TZW9JbktRcjI3?=
 =?utf-8?B?SWREbHZ2dERzR01qb1J4UXVSektWaDcyWlUzNnE3UUl5ekxqOGVGcE80czlX?=
 =?utf-8?B?TGlCVlljOWRveUZ0cjB0bEtPWWc0Y0g2TCtPcHdVajZtMWxxVzIwelhBckZV?=
 =?utf-8?B?UDVyQmpsM09BNzlCZE5pdDg5NnRYaEdic1lTWDdBQk0xL1VtYmppSURaVk5k?=
 =?utf-8?B?cGxNZVhaUnJzSkNvaXJnTDFLYnZyUGwxT21RRDBCaUJFdWFqYWZPeExjWkg1?=
 =?utf-8?B?aTR5YU9paCthQTY2clo2R1c3SERLNXZET2hNNmJwUVhTT3pReWN3bmhFdFlL?=
 =?utf-8?B?V1B1Q0JOSDhZTDV6YTJhMmgxclR0RmpsMnFieVZHVWZjcmUwVkZFODAyMzFn?=
 =?utf-8?B?ZmVSSitXNkRCY2Y2bTkyZkZYby80Z05Yd2ZpL0drais1cGsxeHBubTNlM3Nt?=
 =?utf-8?B?VkgxVmx5MUt1SzhDejRsc3p5TmdQMnVTVVFEU0hPNnhYNWNhS3FPQjl3ak1h?=
 =?utf-8?B?dkhSR2p0NlIrMmZlVkZ2bmdYTWJjQWV1R3dmbTY1bVI3WGFQR29BZE9lK2tH?=
 =?utf-8?B?YlZQZEVBSDVvb1pvcnRwdEZOZEdxcGtEbDJoQy9wNEJlVk4yeWhGek8yc2w4?=
 =?utf-8?B?S2NCdG0yNFpyMEZZUGNtQWo3TERrcVJXSEVvZzZhTzlXVCtVSHdvdkdpZWpZ?=
 =?utf-8?B?aGptTGlySHpDSXlSc2JaMjhWZmlzeUZsamhISE1NM0tuN0RmblQrdEVocTJ0?=
 =?utf-8?B?S1RxOUlYZzZCS1BNVnhhMmhZVDZqS2VkdDVzWG1EMXh3dFNMdko1Ym9ZaU14?=
 =?utf-8?B?MWN2SGNJQ1plV0d3ZkE3enpyRGRlVCtJc1dVNzUzd1I2aEZ1WnlUZ0NZQ3lG?=
 =?utf-8?B?UEZOdE5Ra2hpTTNnRTBYMndIMXUyZk8xSzhiekM0SzlnNnlDRlJDeTVRSm15?=
 =?utf-8?B?aG5wVHVtYWluVyswMC93YjBYVW0zd211ZUNyblRpTWJ2RUhwVVUxTmNTVVFa?=
 =?utf-8?Q?5wkI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 506149e6-005e-486b-64fa-08de1c4881ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 08:51:27.3393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfXxnOxm+RKEfBzc/9cXSzqXEsHAbN/MpoWmB1h+/voJwC7ytwv419yhE8xiNvJ3uOElg58148X9UR3AnPF24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

SGkgSXVsaWFuYSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNV0gcmVtb3RlcHJvYzog
aW14X3Jwcm9jOiBBZGQgc3VwcG9ydCBmb3INCj4gU3lzdGVtIE1hbmFnZXIgQVBJDQo+IA0KPiA+
ICAgCWRlcGVuZHMgb24gSEFWRV9BUk1fU01DQ0MNCj4gPiArCWRlcGVuZHMgb24gSU1YX1NDTUlf
Q1BVX0RSViB8fCAhSU1YX1NDTUlfQ1BVX0RSVg0KPiA+ICsJZGVwZW5kcyBvbiBJTVhfU0NNSV9M
TU1fRFJWIHx8ICFJTVhfU0NNSV9MTU1fRFJWDQo+IA0KPiBUaGlzIGFsd2F5cyBldmFsdWF0ZXMg
dG8gdHJ1ZS4NCj4gSWYgeW91IHdhbnQgdG8gZW5zdXJlIHRoYXQgd2hlbiBhIGRlcGVuZGVuY3kg
aXMgbSwgaW14X3Jwcm9jIG11c3QNCj4gYWxzbyBiZSBhIG0sIHlvdSB1c2U6DQo+IGRlcGVuZHMg
b24gSU1YX1NDTUlfQ1BVX0RSVg0KPiBkZXBlbmRzIG9uIElNWF9TQ01JX0xNTV9EUlYNCg0KTm8s
IHRoaXMgZG9lcyBub3Qgd29yay4gV2UgbmVlZCBzdXBwb3J0IG5vbi1TQ01JIHBsYXRmb3JtLg0K
DQpJIGZvbGxvd2VkIHdoYXQgQXJuZCBkaWQsIHNlZQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdt
b24vS2NvbmZpZyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZw0KaW5kZXggYWQyMGRjODUwNmY5Li42
YjQ5N2RkODc1NjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2h3bW9uL0tjb25maWcNCisrKyBiL2Ry
aXZlcnMvaHdtb24vS2NvbmZpZw0KQEAgLTIyOTcsNiArMjI5Nyw3IEBAIGNvbmZpZyBTRU5TT1JT
X1RNUDEwMw0KY29uZmlnIFNFTlNPUlNfVE1QMTA4DQogICAgICAgIHRyaXN0YXRlICJUZXhhcyBJ
bnN0cnVtZW50cyBUTVAxMDgiDQogICAgICAgIGRlcGVuZHMgb24gSTJDDQorICAgICAgIGRlcGVu
ZHMgb24gSTNDIHx8ICFJM0MNCg0KDQo+DQouLi4NCiANCj4gPiArCS8qIEZvciBpLk1YIFN5c3Rl
bSBNYW5hZ2VyIGJhc2VkIHN5c3RlbXMgKi8NCj4gPiArCXUzMgkJCQlmbGFnczsNCj4gDQo+IEFk
ZCBzb21lIGluZm8gYWJvdXQgaG93IGFuZCB3aHkgdGhpcyBuZXcgZmllbGQgaXMgdXNlZC9uZWVk
ZWQuDQoNCm9rLiBXaWxsIGFkZCB0aGF0IGluIGFib3ZlIGNvbW1lbnQgYXJlYS4NCg0KPiANCj4g
PiAgIH07DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3Jwcm9jX2F0dCBpbXhf
cnByb2NfYXR0X2lteDkzW10gPSB7IEBADQo+ID4gLTMxMyw2ICszMjEsNDQgQEAgc3RhdGljIGlu
dCBpbXhfcnByb2Nfc2N1X2FwaV9zdGFydChzdHJ1Y3QgcnByb2MNCj4gKnJwcm9jKQ0KPiA+ICAg
CXJldHVybiBpbXhfc2NfcG1fY3B1X3N0YXJ0KHByaXYtPmlwY19oYW5kbGUsIHByaXYtPnJzcmNf
aWQsDQo+IHRydWUsIHByaXYtPmVudHJ5KTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50
IGlteF9ycHJvY19zbV9jcHVfc3RhcnQoc3RydWN0IHJwcm9jICpycHJvYykgew0KPiA+ICsJc3Ry
dWN0IGlteF9ycHJvYyAqcHJpdiA9IHJwcm9jLT5wcml2Ow0KPiA+ICsJY29uc3Qgc3RydWN0IGlt
eF9ycHJvY19kY2ZnICpkY2ZnID0gcHJpdi0+ZGNmZzsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0K
PiA+ICsJcmV0ID0gc2NtaV9pbXhfY3B1X3Jlc2V0X3ZlY3Rvcl9zZXQoZGNmZy0+Y3B1aWQsIDAs
IHRydWUsIGZhbHNlLA0KPiBmYWxzZSk7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vy
cihwcml2LT5kZXYsICJGYWlsZWQgdG8gc2V0IHJlc2V0IHZlY3Rvcg0KPiBjcHVpZCgldSk6ICVk
XG4iLCBkY2ZnLT5jcHVpZCwgcmV0KTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCXJldHVybiBzY21pX2lteF9jcHVfc3RhcnQoZGNmZy0+Y3B1aWQsIHRydWUpOyB9
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGlteF9ycHJvY19zbV9sbW1fc3RhcnQoc3RydWN0IHJw
cm9jICpycHJvYykgew0KPiA+ICsJc3RydWN0IGlteF9ycHJvYyAqcHJpdiA9IHJwcm9jLT5wcml2
Ow0KPiA+ICsJY29uc3Qgc3RydWN0IGlteF9ycHJvY19kY2ZnICpkY2ZnID0gcHJpdi0+ZGNmZzsN
Cj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYtPmRldjsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmV0ID0gc2NtaV9pbXhfbG1tX3Jlc2V0X3ZlY3Rvcl9zZXQoZGNmZy0+bG1p
ZCwgZGNmZy0+Y3B1aWQsDQo+IDAsIDApOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIHNldCByZXNldCB2ZWN0b3IgbG1pZCgldSksDQo+IGNwdWlkKCV1
KTogJWRcbiIsDQo+ID4gKwkJCWRjZmctPmxtaWQsIGRjZmctPmNwdWlkLCByZXQpOw0KPiA+ICsJ
CXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gc2NtaV9pbXhfbG1tX29w
ZXJhdGlvbihkY2ZnLT5sbWlkLA0KPiBTQ01JX0lNWF9MTU1fQk9PVCwgMCk7DQo+ID4gKwlpZiAo
cmV0KSB7DQo+ID4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYm9vdCBsbW0oJWQpOiAlZFxu
IiwgZGNmZy0NCj4gPmxtaWQsIHJldCk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4g
PiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgaW14
X3Jwcm9jX3N0YXJ0KHN0cnVjdCBycHJvYyAqcnByb2MpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0
IGlteF9ycHJvYyAqcHJpdiA9IHJwcm9jLT5wcml2OyBAQCAtMzY5LDYgKzQxNSwyNSBAQA0KPiBz
dGF0aWMNCj4gPiBpbnQgaW14X3Jwcm9jX3NjdV9hcGlfc3RvcChzdHJ1Y3QgcnByb2MgKnJwcm9j
KQ0KPiA+ICAgCXJldHVybiBpbXhfc2NfcG1fY3B1X3N0YXJ0KHByaXYtPmlwY19oYW5kbGUsIHBy
aXYtPnJzcmNfaWQsDQo+IGZhbHNlLCBwcml2LT5lbnRyeSk7DQo+ID4gICB9DQo+ID4NCj4gPiAr
c3RhdGljIGludCBpbXhfcnByb2Nfc21fY3B1X3N0b3Aoc3RydWN0IHJwcm9jICpycHJvYykgew0K
PiA+ICsJc3RydWN0IGlteF9ycHJvYyAqcHJpdiA9IHJwcm9jLT5wcml2Ow0KPiA+ICsJY29uc3Qg
c3RydWN0IGlteF9ycHJvY19kY2ZnICpkY2ZnID0gcHJpdi0+ZGNmZzsNCj4gPiArDQo+ID4gKwly
ZXR1cm4gc2NtaV9pbXhfY3B1X3N0YXJ0KGRjZmctPmNwdWlkLCBmYWxzZSk7IH0NCj4gPiArDQo+
ID4gK3N0YXRpYyBpbnQgaW14X3Jwcm9jX3NtX2xtbV9zdG9wKHN0cnVjdCBycHJvYyAqcnByb2Mp
IHsNCj4gPiArCXN0cnVjdCBpbXhfcnByb2MgKnByaXYgPSBycHJvYy0+cHJpdjsNCj4gPiArCWNv
bnN0IHN0cnVjdCBpbXhfcnByb2NfZGNmZyAqZGNmZyA9IHByaXYtPmRjZmc7DQo+ID4gKw0KPiA+
ICsJaWYgKCEocHJpdi0+ZmxhZ3MgJiBJTVhfUlBST0NfRkxBR1NfU01fTE1NX0FWQUlMKSkNCj4g
PiArCQlyZXR1cm4gLUVBQ0NFUzsNCj4gPiArDQo+ID4gKwlyZXR1cm4gc2NtaV9pbXhfbG1tX29w
ZXJhdGlvbihkY2ZnLT5sbWlkLA0KPiBTQ01JX0lNWF9MTU1fU0hVVERPV04sIDApOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBpbXhfcnByb2Nfc3RvcChzdHJ1Y3QgcnByb2MgKnJw
cm9jKQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCBpbXhfcnByb2MgKnByaXYgPSBycHJvYy0+cHJp
djsgQEAgLTQ4NSw2ICs1NTAsMzcgQEANCj4gc3RhdGljDQo+ID4gaW50IGlteF9ycHJvY19tZW1f
cmVsZWFzZShzdHJ1Y3QgcnByb2MgKnJwcm9jLA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0K
PiA+DQo+ID4gK3N0YXRpYyBpbnQgaW14X3Jwcm9jX3NtX2xtbV9wcmVwYXJlKHN0cnVjdCBycHJv
YyAqcnByb2MpIHsNCj4gPiArCXN0cnVjdCBpbXhfcnByb2MgKnByaXYgPSBycHJvYy0+cHJpdjsN
Cj4gPiArCWNvbnN0IHN0cnVjdCBpbXhfcnByb2NfZGNmZyAqZGNmZyA9IHByaXYtPmRjZmc7DQo+
ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBJTVhfUlBST0NfRkxBR1Nf
U01fTE1NX0FWQUlMIG5vdCBzZXQgaW5kaWNhdGVzIExpbnV4DQo+IGlzIG5vdCBhYmxlDQo+ID4g
KwkgKiB0byBzdGFydC9zdG9wIHJwcm9jIExNLCB0aGVuIGlmIHJwcm9jIGlzIG5vdCBpbiBkZXRh
Y2hlZCBzdGF0ZSwNCj4gPiArCSAqIHByZXBhcmUgc2hvdWxkIGZhaWwuIElmIGluIGRldGFjaGVk
IHN0YXRlLCB0aGlzIGlzIGluDQo+IHJwcm9jX2F0dGFjaCgpDQo+ID4gKwkgKiBwYXRoLg0KPiA+
ICsJICovDQo+ID4gKwlpZiAoIShwcml2LT5mbGFncyAmIElNWF9SUFJPQ19GTEFHU19TTV9MTU1f
QVZBSUwpKSB7DQo+ID4gKwkJaWYgKHJwcm9jLT5zdGF0ZSAhPSBSUFJPQ19ERVRBQ0hFRCkNCj4g
PiArCQkJcmV0dXJuIC1FQUNDRVM7DQo+ID4gKw0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gDQo+IElNTyBpcyBzaW1wbGVyIHRoaXMgd2F5Og0KPiBpZiAoIShwcml2LT5mbGFn
cyAmIElNWF9SUFJPQ19GTEFHU19TTV9MTU1fQVZBSUwpKQ0KPiAJcmV0dXJuIChycHJvYy0+c3Rh
dGUgPT0gUlBST0NfREVUQUNIRUQpID8gMCA6IC1FQUNDRVM7DQoNClllYWguIFRoYW5rcy4NCg0K
VGhhbmtzLA0KUGVuZw0K
