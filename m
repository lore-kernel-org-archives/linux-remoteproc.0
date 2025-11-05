Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F252DAFCC;
	Wed,  5 Nov 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332477; cv=fail; b=OPzi0UHMhEsWVRfo7Cv04LqJtTh2fqy1S5gBFDdcRNlK/mhzqvXxBI3t1IuovPs9/ciVpEUGn6mgvM30Ddb1clMAgKQczwEf9toj3a6MJ1MyR5rpxZTt9Varvw2CvCfhwwKapd+j787JnUY4wl7CWxPA4t9tyiQxvGG6Y4MazSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332477; c=relaxed/simple;
	bh=rTrbidWAKgNG+d83+ATGr6DlBNcao+ePBioQu7zy+lg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jTdC3tps2yPreIgdIIhDc8vdc8UC8MK0+oarJWsy0HUizm4c6gRx/doLD6SDiHqImvzHvHlT3uvWlFSRI4WzIv/lU6/Zmsbv4t6eOmxK4wovrYpztKh6+cqirGSrYccV6JJS/wdSzAPejXcZ9la91zp0nVZfOguS2ofThpHr6NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BMaeGFSr; arc=fail smtp.client-ip=52.101.72.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BMaeGFSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUQ8VcLWxxd44oB7V/3vimtwdleASBGfTYW7aS/ILoFO94Hq9kTSFrdFAbghQTmoZKKKI8h+pvr5HzkC38pWBhTQci+o98vrdW2leGjQlQ1c4wi6DXnlLgjyxUljhnxVxC4/q8e2V9dewjSIqip/ayJXhnkSTEQ6sEjunCXqZDXcBFKKdh6PU8Y2QDayl88OGTOaOmsTuS1ZX4YiG5i8UCycSJl5eRPAuyvwpV6+RvntnX/GyJKFrDUS29ewzYhCH3NH+kkOqrmSMjF0BUyw0pR+VnEeaTv8CKyj7qhYx+EIhcyTybMQbASZbu4XKm4EDXf7YAC02GzYc9FDTkbcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTrbidWAKgNG+d83+ATGr6DlBNcao+ePBioQu7zy+lg=;
 b=c1adH3P6q2kGvfASWowrEjtpFD6G2DNTo17SFIKwWvE16CzkcdJY/Qwle9U1ZR19mBz7BciAvII6t2GnR11d1xYrjPAv+f93C1MV1U39EQMzbSonocCimw04eg/gthBQtRNoTrOgz/Zk3rFwJ32q5t5KNMO/CeSGNpnoySvHDuC9bhm2+VXF5sA832Mb0vcBSMwYvEl9yH/WW7UtTipOyFL+UtS2LqNSycEO3gJ0wcpCqEqtMZ1XDjfMEgV+oeX2XqSbpzkWJxvEZT8i/LExnjHvTAPVIw2wX8ZuzTbBl3SF4wXGchYiuY1jusd3QAeYJbV+qcX4dNMjn/6FghJAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTrbidWAKgNG+d83+ATGr6DlBNcao+ePBioQu7zy+lg=;
 b=BMaeGFSrbJdQLaq8L1cQSmwR6rhv5f2n5NarwaxUXA5OFL81qywVYq+enDAi4D4Q1SY2/bEACEObKx45fexsUBDb3pMwgcq0Tl3FLAOMwB9KTI1sMlmP4I/eoGAg0BFb0Bf7sTc+rgE8UL+rDOd3lYnzSidATWfMIGcAqwrtkqcNufN0hHMu/CcF8iD56LcZPOggrP3+O4lhAMrY4QerucfP0dDxb438ENCsaASv8sS+DdQ1J5x3wfq5DdP/msCXY+WU3X35nyooNj7xRVnk51v1xLdXzeBT7vBjIpmzkbNRNcmIpNs9Dxabi1f/vmqYPII8ye9XrjTSUtkS924rwg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:47:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 08:47:47 +0000
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
Subject: RE: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Thread-Topic: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Thread-Index: AQHcSg2lUSQc/XeJN0uWVLPLm4so+bTiStQAgAGCVpA=
Date: Wed, 5 Nov 2025 08:47:47 +0000
Message-ID:
 <PAXPR04MB84592657431777C58019A8C588C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
 <b20cf557-8bde-4435-8a84-290bba1b68e4@nxp.com>
In-Reply-To: <b20cf557-8bde-4435-8a84-290bba1b68e4@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9276:EE_
x-ms-office365-filtering-correlation-id: 4f81a86e-771f-4c13-a3ad-08de1c47febd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUVwUHErSWFPWkRZUmUxbDRRNnpnanZCU25NNmZZRzZGTmNMOVduUnduZG4z?=
 =?utf-8?B?bndzR1ltbi9sbGhqL2hwUnNjTitnai9lQ3JRK2cvL2R6cnZucmdOaTQ5ejdD?=
 =?utf-8?B?cDJRa24yTjBteHgwL2tYV3dIamV4b1p4L2RXNStMWEVWSk42d2YzVTBSa29j?=
 =?utf-8?B?ZzhDWXYrYnd5Nnl2Q1NjUDZIam5uOGp5TlBxSm01RXQ0YTJmMnlsWlhBMnA3?=
 =?utf-8?B?R3lWdlBocUZmT3hxVURLRDdqSDMvUGZ4N0xVeUQyZzh3eGVub0RKdkI4RUtJ?=
 =?utf-8?B?clBqa1k5QzB6U0t0VGp3QjVobGRpeEVLa2h2clAxYW9kN1FkdkNUL0c0UVNm?=
 =?utf-8?B?WTlvVDdmSHp0WHBhaThDY3RzZkt0blpJTVViaEJMVkVBSWdBZ2FveGNzM28y?=
 =?utf-8?B?UVJWUDZERGo5TGFhamN0QmVsSGFKS0N1N0RiTUVaaDNTNWZYSnpxTURNMlow?=
 =?utf-8?B?R3p5d0NFOHBnY09KbDczS0p1TlF1Qzh2RWxTaURxbGwveTRsei9Da3hrUy90?=
 =?utf-8?B?a2xiZDlNczVOY2FKVUtrVGlPMWQzTkdlV01MTWxtM0J1M0N5YXphRGdleFpl?=
 =?utf-8?B?SXVJZGlkUnVRT0FjY2tVOXA1aXEvcFVncGNTZlVneUZ1cVlTQ0NySy9FbnFJ?=
 =?utf-8?B?ZGUyS2p0aVdCMmpWNnpKTklDQlFQV21oQlRvbG9lVFZFN2pud1FGM3p4NkZj?=
 =?utf-8?B?U2p4Rit0SUJDQlp3VHpkODhZbk80Tk5aelZOd3FRY0tWZnlQN0c5aVZCdC9y?=
 =?utf-8?B?aCt2aTczN0ZwTFExMC8zdXVzTzVET1BsVjZDVU9TVFNTVmRkamFoZlRWcWQ1?=
 =?utf-8?B?VjdzdzFPZUZiZDllQUsrYnJwU2lFY1BhOSswenl5QndNWEdSVXhMMmRDVFcv?=
 =?utf-8?B?clVKKzRkdE16VWliUDB6eDJZcHN4emZMYnVSRTVwQmVVbzlSQUJKZWtnc3dk?=
 =?utf-8?B?Q0huV01DbGNBZnFNejdBMXJHTUZZYmp1U0dFNjZ5akZ4Y1Rod1pVd3ZubHlm?=
 =?utf-8?B?d0F1M3VoWkdSRzIzK2FOU1lRblZ1NS8xT2lMSjMyay9KMWIrOXhrdk9hNWE4?=
 =?utf-8?B?UU1YS1Y5OG5ESy9WQ0krejJ1cTdBT0JZNDlGcE8wZkxBNU5aZHljUS9KVjFY?=
 =?utf-8?B?RVVSUWxxVkJjL08xWVU0U1Y3d1ZUU0dSRXVseGd1dDl4ZDZiSUpvU0FuMFlt?=
 =?utf-8?B?b1FHckJhMFBSbE56Zjk1QUNnVHRVMlgxeGRUU3k0ZGtteHZIeUdXbFpKVXh0?=
 =?utf-8?B?cytMNlhvL045K1ZuZXlKYm1NZk9xVnRDaWdjS3ZMVTNVdTZJWHZqOHN2dGxD?=
 =?utf-8?B?YnN5N09xZE9rWFVQdXlvVVE3Q0toZytBOG9KN0loZWNRL2JWdVNFM1B4WDh6?=
 =?utf-8?B?Ry9Ib0F0NHRnN2puWE5CMkpRWlhuSmRST2pKWEVCeUovMEdXSVlWbjNQVHRw?=
 =?utf-8?B?VlZBblF4WWRDb3FBNndYZStWY2JXYUFva09hZXQyR0RtMFdsTWpPSVhEazJz?=
 =?utf-8?B?RlJaaFg2NjlXNXljRjBVaDhUWjg3aHFsRDhZMWxXWUtYREcwTmYvUi9VY0g5?=
 =?utf-8?B?T0ZUVWNoVUpaaXAzWi8xUjZjQUNDdmdVcmdnR1lzODArTGQzZWg5MG1JVW1h?=
 =?utf-8?B?UVA0YndVWVd1aEZyOVVBNHE3U29GWGpyQmFkUGZhZkYrKzlUZnk0ckdZSUUv?=
 =?utf-8?B?VXE1VDdDV21Da2cxWmJrUnVPZVBNUmYyYzRDY3BqS3BaL2p1TUx4cU9JY00y?=
 =?utf-8?B?Y3k5WlFDUVp6ajY5OUFyd0dsRFF3NWRCTWtwNHlmNEZDNHl1aGJtOWxtQTJW?=
 =?utf-8?B?RnZ5c2xvWjQ0bHRXeE1MQlNYZjAxQVkxVm45b0x0a29sQmdPd3RBTzUyQUs5?=
 =?utf-8?B?UDlRMVFtU3R1Q1o3aWNBeGdtVFprMWQrU2hxNCs3RkNaQTFvUXJxcU1ZUWh1?=
 =?utf-8?B?NHFBQkR2OFNTdFVSa1pXSWM2Rnk5cStYTnNMYzNDMlRTWSs3MGhBYSsxREl3?=
 =?utf-8?B?K0NIdmNWWmo3THFHYllLdnU2TVF5NGovRVpjN05CVFVKdm83TUlOdm1JTFpO?=
 =?utf-8?B?YjFXNlZBVnZoSmxDWi9kNUZnNjBaMEdEMWVYQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YW50RHN2cHpSejlaUjJqaUlhaHBqMXN5VjRGbm1jWGZwVTRHNGk1VXNUQnBT?=
 =?utf-8?B?bUxiRkdrRjd0NVlXaFBrM3Y5UUVHcmk3WVNIbWVEZEpKNGxBTzJXRzlYQUc2?=
 =?utf-8?B?ZGswdUVvV01Zb1lpL3VsaFJWWHlzOW5ST2FralNzWlpSODVRc3dzUTRrck1W?=
 =?utf-8?B?enQ2VXF0TkRFV213NE5jVGdiYUFNdnVRLzlnLzl1WHd1OUw4RTY4aVpiNEIw?=
 =?utf-8?B?bFBqdUxuWW1FL01lRW9DZ1UzM2pLM01aV0xuMjI0Z25kM1d3eUJLTkZLdm5k?=
 =?utf-8?B?OXN0NGczQnZJTTJyWHBvbUE1Vk54d3RvUXRXMElvTkh5MXhqYW0wRyttY09h?=
 =?utf-8?B?SGl3YWNVVGFURTNVeDROY20yMEI3TFZCV1BldjFRaXB0YlM1WXpsUVJLazJP?=
 =?utf-8?B?UENwblBqNTBEL2RzRSt0SC9STFU0S0gvNlk1NGUzR2ZkRjZBL2FIVUNGcHF6?=
 =?utf-8?B?UXp2WSt0UnFuWVFZQUR5RnBwd0t4SjV5Yk0yNkJPMXBiU1ZqQ0hycEtjSmND?=
 =?utf-8?B?Y0dEaWQwK3BETmJGUEJGRDdRUThha3ZVUW13M0t3TFg2dDA3d1FOWFVibVkx?=
 =?utf-8?B?WWxLVWRLRWpmeDQ2V2JCTXcwRFBGUzNrMXNqYnI1amdiNUFaM3JrTThsN3NM?=
 =?utf-8?B?d3dmMWptWGhxZXNGeWxKZ0liMWI1QTlxckdHcEEwOFNWZGU3dEZlTzQrOU1r?=
 =?utf-8?B?U1pTUVJGNnFVQ2Y2ZHYzelN0NjNJaE5PRWs2aW1hR0M1YzhJV2FpOXRSNDAx?=
 =?utf-8?B?eERuT3lpcWI2Ym1ET0tBbUJJb2kzYlBHL2RUYThlQWlEQmFVd0dsbjFKRVIx?=
 =?utf-8?B?ZFNtWitPNEF4K05rR0tZVUZzbXh3TmFnTWdJdGtpbU94VklOYWJpYkI4bXZ4?=
 =?utf-8?B?dDd3WDROTkxnNzltaXhUd09FNkFMdy82WWMxdGV6YXBYMnFvUzZqd05BRng4?=
 =?utf-8?B?dDRCUFJUODN3aTNqZTlsTXc4c2NDdWJOY1o1cVcvejFCdDNQYTFUQStUam9H?=
 =?utf-8?B?ZDk4bkJwRDNOQVdSWm94WlBsWU5zVzZwd2Q5MU9OWm1nQ1pHWlRSZDFPeUZP?=
 =?utf-8?B?Q0dDczdwUlNJSGtmSXU0SW5HUVNzVm8yWTdCVW8vT25LcUVTUDBPM1dseW04?=
 =?utf-8?B?MWJCaWZWenVoNkk4alZiSVN6UjZObFZkNitYVmhCYVhGaUlvNzJjVGlyUHJr?=
 =?utf-8?B?K0s5ZkNVVnJaaFJteDAyb0VUeVdUWTl6aXJ3cmZtd0lWQkllR0xvYTVqTklZ?=
 =?utf-8?B?cDlVcnBzdHFwazUwRG1mQkpyeGdTNmZHcExaam5ZVHVGNlNMaXJJVzl4MWdz?=
 =?utf-8?B?Y1pwNW1EUDlScC9qSDdvL2lYd2w4VUF4MVgrSzBMUFEvdi9HNEpGOTlaTkZ4?=
 =?utf-8?B?SHo1dEErRjJyaXJpTVhDZjJ5SUxFNDB3cUZ6VkZNekZqTG5SWFhJUFg4Zjcv?=
 =?utf-8?B?OU1RTXBaK2xOYVFESGlJbWZ3WlRvU0xNT05hdmN5NUtrOEtEenUyZXdYM1lW?=
 =?utf-8?B?RDE0dHhSakNLK1VBRFJNQUNESFdTRkxtOVcvSWlWWG0zMS9Gb0NlRHhpdUo3?=
 =?utf-8?B?eEVoQjcyS0N2U0czVCtpampoOW5IOUtJd1NxSUdNV0dBWVp4MFBvazh5aTJB?=
 =?utf-8?B?b0w1dnB2cHBpN0ZsdWhCNTBKcWg0bGQrSCtYSDVlTEs4ODd4SmY0YUhqdU9j?=
 =?utf-8?B?cTlCYW9ydkZrOEdEZkpURUYwcXVwN1BDS0JncXNCelB3RVVTV3NLWjFUMkRX?=
 =?utf-8?B?RVJMcHBMR1NkRUVMSHlHK0RtT3RyV0lKd2ZmWDZ5ZFE1TEFQMUR0ZXg2WHFY?=
 =?utf-8?B?MXdTWHA1UCsrakZSTkRLMzVvSURVZnpEbmhOVkswUlB0dlRJYnZXMVUrMkJI?=
 =?utf-8?B?dVlNYmdNV2NrR05HOUNKTWZiRFluWkYrWHAwekNPa1F5UHJwSEdtZk1xVE01?=
 =?utf-8?B?WVhleVAxSXVjdG5SMnlnbEdPNmY1RjRqU2tISnZIaUdvZ0V6SkJEbThVcEpz?=
 =?utf-8?B?Y28yM0R1ZmdzZ2ZZZVJ2RkZ6L0tVSno3KzBwZkhESjVSN2s5NWRIdkdJYytL?=
 =?utf-8?B?M3dxOEsyZGVhWElBVW44VW94bmdLY1FydGhiN3Rnazd6ZTg0UWxBNENIUTVU?=
 =?utf-8?Q?I2Ik=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f81a86e-771f-4c13-a3ad-08de1c47febd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 08:47:47.3958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clEGNDQPHiqslxoouBjR963+2d3tn8gw5gRW9v6F4sKnnoJfJiaYkqUqv9lz8UPWWZ8Vcbd6UeAAEnhG4ecWaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNV0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBBZGQg
cnVudGltZSBvcHMNCj4gY29weSB0byBzdXBwb3J0IGR5bmFtaWMgYmVoYXZpb3INCj4gDQo+ID4g
LTEwNTYsNiArMTA1Miw5IEBAIHN0YXRpYyBpbnQgaW14X3Jwcm9jX3Byb2JlKHN0cnVjdA0KPiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJcHJpdi0+ZGNmZyA9IGRjZmc7DQo+ID4gICAJ
cHJpdi0+ZGV2ID0gZGV2Ow0KPiA+DQo+ID4gKwlpZiAoZGNmZy0+b3BzKQ0KPiA+ICsJCXByaXYt
Pm9wcyA9IGRjZmctPm9wczsNCj4gDQo+IFdpbGwgcHJpdi0+b3BzIGV2ZXIgYmUgbW9kaWZpZWQg
YWZ0ZXIgaW5pdGlhbGl6YXRpb24gaW4gYSBtdWx0aS10aHJlYWRlZA0KPiBjb250ZXh0Pw0KPiBJ
ZiBzbywgeW91IG1pZ2h0IG5lZWQgc3luY2hyb25pemF0aW9uLg0KDQpUaGlzIGlzIGluIHByb2Jl
IHBoYXNlLCBubyBtdWx0aS10aHJlYWQgY29udGV4dC4NCg0KPiANCj4gQWxzbywgeW91IGNhbiBy
ZW1vdmUgdGhlIE5VTEwgY2hlY2sgc2luY2UgaXQncyBzYWZlIHRvIGFzc2lnbiBOVUxMLg0KDQpZ
ZXMuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IEl1bGlhDQo+IA0KPiA+ICsNCj4gPiAgIAlk
ZXZfc2V0X2RydmRhdGEoZGV2LCBycHJvYyk7DQo+ID4gICAJcHJpdi0+d29ya3F1ZXVlID0gY3Jl
YXRlX3dvcmtxdWV1ZShkZXZfbmFtZShkZXYpKTsNCj4gPiAgIAlpZiAoIXByaXYtPndvcmtxdWV1
ZSkgew0KPiA+DQoNCg==
