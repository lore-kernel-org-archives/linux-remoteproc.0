Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583E1EBFF7;
	Tue, 15 Oct 2024 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994154; cv=fail; b=n5djNebsrpsgGCN8Yx/EAHr+c6BsSI8IOgj9pflEgrpygDjW0K+lMGTKRPzlPvyyxBzP6o923Cg21sMKqEUVcN4Uwtej6PsEEgVLQHQ0YLqsJ6BNfU6XRL7ixufrFI4hnoslV+IkFMqADmhBymrvGzV90XNnwppatTSlFyM2iLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994154; c=relaxed/simple;
	bh=4TaK+09EdsoupINhfmi7Cmj8nagP6d1gd9OiHyKG6f0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EVlQvZJIPlK6mfNQ+BvYTIjuGV2qB4yqIYfgmsFDP4tq6ApCQ5C1rYIUyLH29W1dNi8pIrBHq7cF8pUUHCflRWSMw4wPvUbYeyT6/H2SFbe8t47oOaKcO5O9b9c4KP+bSa94EfrTu+u+rLyB7RWWrpYB8pAXwnUu9Sis63mXj7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jqyh2Edq; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jqyh2Edq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxO5rDx0PY7Tszkt6sel9qG6C0xXt+VKMD3WGEykfs8oagSfw3sw+nqITyzqJtQ2g+Uya7HtbdErCgwKtsA4pPhqK1PTCrddpS2zAa6YvEXklwlaqMD6UM54SJ69ooJO5OZc02PsyrJDrW5pmMQpFPR9SV+WsGnqMFDHT08nR/0bA2mIYviruF2XvaKHDk9mLO/HXkewBGOk9i+j08meY9EdAeA9oLQS918hlkEdc3MnEoU0q6QCSCBPr+UI0lTfojmi4aPskcALk8iDwT/PA2Fi3qqXP2y0STdVPTeInq43LAJQ1uj8TZeHDECMpLQE/LAXDVPRknfEqwIuY/o34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TaK+09EdsoupINhfmi7Cmj8nagP6d1gd9OiHyKG6f0=;
 b=TMam2B3dMu3zXyAqh3ZqQuV9cPkO9eUYyx4UEnUCyJL2xb8FEd5I9cqHIG7zVQudQYvt+8OpR8SREPJ08FkG2kjEyLlkImLoS5qHnJ6cVqPUk0uPNozAxiVYLlK5BShNa/0UGJgukF3U1SeTBWgJ4ut/4tTHvfsDbiev5eoHm+gMiHqIQTu/rmWKb76wL/hBUwVj+ToHvdttKL7wBndTd6XFpPU0hGRlHQyD+aSDsyAtcfrI5XEEuqhyyRM/WTb6vhFWgTJFtgwya7Nt5h6k0c7Lwq//qZbNafG+bgUrMkGu1cmkPclbgWNqGICTPQjaXPgsRhapVRbbe8Kit5XZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TaK+09EdsoupINhfmi7Cmj8nagP6d1gd9OiHyKG6f0=;
 b=jqyh2Edq0XlXfAu/qAdfTNBtwjQvqEvgAIRdmDAeKuMUrEajx48W9Xrssm1uv+fR8OxPjjwdlOWO0YTcbk4TpghSKZ2vlCW0MZyaE23UmDeHRTU5AZNga5kcfWBe5l3qQpl747UAu1OLO2xjQ69ubZ30q57nheVcojybmZ6bfC4Y9IldwtqH64iPmcG9cQ1DX6lyL2shVO336VhkVsSIlbOO8IZEdkS2AJsXEVl2+j4A+k8qJ6dgHe0uJPcZHCKNm6L9TgJYJq+bvBBqjnry7Q9dXmeJ83PvvuDlfIZZ1DuLlWfaL30Zx18cgCriHZjqmF3xAeZO6cm654J9dXBYVg==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 15 Oct
 2024 12:09:08 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%3]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 12:09:08 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <krzk@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <peterlin@andestech.com>, <dminus@andestech.com>,
	<Conor.Dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for Microchip
 IPC remoteproc
Thread-Topic: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for
 Microchip IPC remoteproc
Thread-Index: AQHbBTOgK4bFlc9OiE255ivfqSUEYbJa35mAgC0MEYA=
Date: Tue, 15 Oct 2024 12:09:08 +0000
Message-ID: <82eae461-3cce-4e36-905c-34c147fabcb3@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-5-valentina.fernandezalanis@microchip.com>
 <fc541e78-5304-42be-a844-70935d66f151@kernel.org>
In-Reply-To: <fc541e78-5304-42be-a844-70935d66f151@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|CH3PR11MB8413:EE_
x-ms-office365-filtering-correlation-id: 465a277b-dd15-43e5-b91d-08dced122be4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2FzV0lQSkFYeGRjTFhJYVR5OWxGd051MUFkTm55R1JwazY0SkhpMkMzb2pR?=
 =?utf-8?B?a0xlYjJOZlplYjRTdmN2QzkvakRFMVlHREd1Sk05OGY2ZTZmU0pRTk9KTm1h?=
 =?utf-8?B?ZUM2SUhsalBiVVlpTndVWjBNd0xMUHRXbW1pdUlDNk1LN05jMXJBWEt2OG9r?=
 =?utf-8?B?Ulc4NFZ0YThFdWRhVUFhQzkwbGkyTWVyTkNaejVVZzhzZ2t1a3dIZ09zMGVG?=
 =?utf-8?B?NGVjVTd4Wm54OE1pcm5GWmVPWklPa0VyYWh6NlVwVnlDNi92RDdpd0ZkUUZl?=
 =?utf-8?B?elNNc2lWL0NwK015Y21TcCsvMFFIVFVKL21tbzhWUlJLOS9EQkVzSUFUdGxK?=
 =?utf-8?B?Z0xEK0JIRS9RSnpBTmVzV2syZW0wdWd0bnlHcXdJSWVpM09ZUGJMblR4bmor?=
 =?utf-8?B?VE5kQU43ZUo0SGZUdXYwWnFwNHRSb0h1cXNLYjRQYWZyVnRicmwyNGtiUldm?=
 =?utf-8?B?UVQwSFE3TWJRZDlVMW5HVEs5R0dzNzZ0QjV2cGFScVoxTWhIcFZzby9RLytW?=
 =?utf-8?B?dmQ2U01SMC9VM3lqaFZaR1l2QmlFcGtaS0lvYk5QaUtpU3hZWDcweG16NlNV?=
 =?utf-8?B?WE1LQUZSb29ZY2ZFakFocys4V2lpbHQyaVAwd05aVGpDcGV5UUhBZnJKZi9G?=
 =?utf-8?B?NWtrVHNQWVlyUG51Z2FPNWtWMXJDZUI1Z0hrSm01dm1JZ2dmWHVhOTVHcTBD?=
 =?utf-8?B?eTl1c1cwTDZCaDRtaERhZUZJVC9pazgvNktyWVViWFJZa1cvRis3L1ExV1JF?=
 =?utf-8?B?MktkWDlvS21zWDFlNmFmakF3YnJmcUlxbXV1Q1RpRzlWc0pCUUMyZi8reFpV?=
 =?utf-8?B?SlZkKzAxNHZ0aFFXalFDRDNFNWVuaFVXWW5qMzhlSzVQeWNRYmZlcjhRRW1j?=
 =?utf-8?B?ZVl1b0RsbGhKSTJEV2lZVGwwblduL21BaWljTXUyejJiNFp5ZndkTGc4Wmhz?=
 =?utf-8?B?Y3M0ZU5CZHhjZnJoWGNZMThUYkhiL1Q5QldmdkZMQTA4QzJ0NDk5SDVEZXpD?=
 =?utf-8?B?RVJOQTI5cWtYWHRvaGZlWEhEdFBpY0RDRGIzWWdaV2s2dWdVWWRKMG9HN3Zm?=
 =?utf-8?B?YWpkZy9qSDltOE5wQmRlRkdBNzRwTkp5NkFGN21CY0Q1UEd6MWNKQ21iUy9J?=
 =?utf-8?B?b0haL29ZQ3V3c2RqMEV0ZHdJc1VCMWZCaVFvaU1VRlRTZ1kzNml5K3k1VVQ5?=
 =?utf-8?B?WlAzZnFVaGlDZFBEY2cyZVY5aWVjL21VeE9IR1JvTW9kRTRzU1pwVGgyRCtv?=
 =?utf-8?B?U1NSM29YV1lTU1JIVnhwcFFNWjRpbU1ocTEyTlhUcnh0V3JhNnI3bDNxbE91?=
 =?utf-8?B?bE1xaCtWak1Ucm1UK3JBaDlwd1Jha3hGMVYvWVEzQWExeUQxVUhQbGNXdXlB?=
 =?utf-8?B?eUFrRlYwb21uK3NzSW00T0dTQmNJc3BDQ0hxVm10bFBlTGpxWlZ5Y2FLaUZm?=
 =?utf-8?B?VnJObXFGTm5pMWxXWlF5Y3dFWmNjL1hiRDBJOVpNa3k2T1ZvZGJMTTlmODc0?=
 =?utf-8?B?cHl4aXFxekJBelk3dlI4aVJ1Tk5HVlRsU25UT2Fzd1UrbllGSUpFajlIckly?=
 =?utf-8?B?RjNJYTJrY0svcm52eUpmWnNkZ3pMcEIxQnlVVmhLb3NsNDc2aEtCMGVKMVRp?=
 =?utf-8?B?cWdEMmJGWWRTbWw2TmpqZXhWK0hSeFQ2akVkOVRta0xsWHVRUWhkZ0NSSGRH?=
 =?utf-8?B?WTdTLytQWVJoeFhTY0pvWi8rU0daVktwWmtBeHAxR2p0OEZSdEg4eE9lWUN4?=
 =?utf-8?Q?m0BkBEmXo7MkenxQpk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTF4L055QmdZNXRtWGwvSEQ4dVJWSTNxZGRYemtQMnd1ZkJUdmhjNnFpMEh2?=
 =?utf-8?B?V2x2SE5MREdBUVZva0d1NWFqSENHQmVSK2NydSswR2xiNG1KMGxMRTVwZE5N?=
 =?utf-8?B?UEcybGVLQmxpYWE3MEtDZTVHUWdEdFVYSVVEcVpDdFV5VGZISTM4VTVRK2tt?=
 =?utf-8?B?RWxRWUl5NWlQWVJQNDUyRGlwdFdhT1Iza2ZDb2FJcllXU3BleXFPSitVWk1I?=
 =?utf-8?B?eE5UUFZtRTRuc0dybEFpclZwS0RFM1FZNzUySHB5b0g1Z29aUFJQOWtGQzdI?=
 =?utf-8?B?WXB1Q3d6NUxhZElwVXpjbm8zcXA4dUhMdnJnMC9xdDFyTFlnbS9vL2RiS2tt?=
 =?utf-8?B?MzRvOHgxTTBuTmZYMWJ2QXNKdk1jeW1hc0R3b2svQXBzM1RjKzJPYmFUMGVJ?=
 =?utf-8?B?VmlONnRGYWhBeE9qZVZtQXZZWktNaEpXVUZXemVyZ2dRaFliT2lxSVZVVWZ6?=
 =?utf-8?B?dnVYdHh2cEdJMzhhNFp5T1pWSHd3VU5iNjNmZ3hseFBOMWs3UVhwL3F2Q3d3?=
 =?utf-8?B?b0YxQy92M09nTHNRZmlqR2Zoc2kwWjhOS3p0NnFrUGhuY0s2UDUvZWVoUzV5?=
 =?utf-8?B?TXlkNlFVNVQ5Q3Q2VXJOVHl6anpES0NiakMxRzd6OXpCUHppR2dEbkZ5bG1i?=
 =?utf-8?B?SFRVNkdOTitFV00rQjZrOUYrK0hPWTJhYy9UOG1QS1B5TnhmRU5TL1lEdjFI?=
 =?utf-8?B?dkhMYjkvWE1wM0tEbkdZbkNqQlBMSEFpVzJhcE1JaWpEL3o4WHl6MXVjdWtY?=
 =?utf-8?B?SXFLVDBFMmdDeGZWdURzNDdKMitUNUprUHc5VUlGMWpKd0RoMENHck96WDY5?=
 =?utf-8?B?WUZsRk1KVmdJWUptZk1yMWxobnROdCtDM2JwMGZXKzRrcXNyemN6R0xOVTNJ?=
 =?utf-8?B?bEhyeEFocmhIVEtDMWhVS01RNENzLzhGcStFSTJXUmNBUWpZbHBVQ3k4QndT?=
 =?utf-8?B?ZUNiUnMwOXArblFkTStHYitsS0M5OFI5UXFGTHdQZjFUc3VOQ1dIOGxZcC9k?=
 =?utf-8?B?NktPaFBsSUIvQlQwNWF0S3pMb3Exd09Kbi84eVBrb2p3NkVLNUhobWJvMWhw?=
 =?utf-8?B?N05Fa3o1Y1J2dVRXcUh1NkFkU09UVTFjTkF0WDRnZ2phQzVLV1R0b3VYMHlR?=
 =?utf-8?B?VlBYbkRtZ09WSTVlWlFEUFZSdFNFTnFvSm82R1BydkpxT0dHT2J2UGsxNXp6?=
 =?utf-8?B?TS9pdGZYVkxvN1lVSGxtdXYvM2tzQUNGVzZOeVVmNjBUQXF6RzdCNzJGV0RY?=
 =?utf-8?B?b0NVMk1GcitvVUlvZ1BKTjJmVnhRb3llRWhuZzVRRGdNUVgydzJWNjNEOW02?=
 =?utf-8?B?QzJDWVpEczV0akZxSjYrTTMvOWw4NXU0WXJEVU1meDdMSXVDZXNuM0YwTU1w?=
 =?utf-8?B?OE1jaE80TER2MW16U3d1U0QrMkRRL0tiZlJUNUhNTmRCN2psZDJvbUtRSTc3?=
 =?utf-8?B?Z20vTEtrb3JRZmZ2eFFmL0M3Yjc1TUhuUlpNZEdPMFhwYURWRzF0elM1ZnlX?=
 =?utf-8?B?cUdqS2pHQ1c1M2xPSEE3UVhIWnBEbVZpWXpLUC9UbFBuYUdZMVNFVnhyemdI?=
 =?utf-8?B?Zk1XMEE1V1VGdXUzVWZNeUZtL2FKd0ptRHNvSThpSi9SOU9OZk5hdDBmVGJv?=
 =?utf-8?B?OHRDNS8xSFR5YXh2aXNKQ2hoZjhHdWFXQnNpbkdEL1J2eHAzT2twcmJ0ek83?=
 =?utf-8?B?NjZEZk93THJsNFZQOUx3TjJoQ001TW0xSEZxVlkzSGhHUW1aUFpYRy96N3By?=
 =?utf-8?B?WEhFZWlBVEd2QjlVc0VCRXNqWTRhZWNNMDZnNlhkWmpETnVBdS9Ba3JoM0NS?=
 =?utf-8?B?eFZXU2psblZReUlIT3VCUmpmaXg0WHVFbjFncEZNN2wrQVl1eFhrN3FnRUlL?=
 =?utf-8?B?LzBBWUpVOTh3ZGxlcTU2TC93M3ovczJVcjU3TXdITkN3RE5iUEhKVm5pZ3B6?=
 =?utf-8?B?M3FnUDM5WFJ5Vkx1RE52aWxHZCt2c09MV1R6SzBYSm5OQ3NJU0drcWxOSXk4?=
 =?utf-8?B?RGZTc3NRKzFvS2NQUHdONWVsejhLdk1vQjZNS1k2TU93ZFI2VzF0TkJZUDRl?=
 =?utf-8?B?SDBNazQ1ekM1TndodHJKcWtDTERSVHpLRHRwZSs3K0x1RkFkL041Z1hia1dx?=
 =?utf-8?B?akNTTm1ZWW8xeW9kWG1mTjJXems3YWRGeFBXRFI5VC8rMWJ6eDRyOXdFT25i?=
 =?utf-8?Q?F8O5B9IPfKe1Ce2OPxuD5IE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A024F9ADD9342043B687D31F50FD1B25@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465a277b-dd15-43e5-b91d-08dced122be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 12:09:08.0750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7pHlbEYh4cQDAjUQt+J2eQuDI8EyfshhO8movpDfWzvxhQWjv8HgS0JRfSfYF8/Jk5OFt/DhhSgQxiSqFzduAHBQmp3skYTLXT5v9vmRsrOl4kCVA0Pi6J1+MBDyYfr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413

T24gMTYvMDkvMjAyNCAyMToxNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxMi8wOS8yMDI0IDE5OjAwLCBW
YWxlbnRpbmEgRmVybmFuZGV6IHdyb3RlOg0KPj4gTWljcm9jaGlwIGZhbWlseSBvZiBSSVNDLVYg
U29DcyB0eXBpY2FsbHkgaGFzIG9yIG1vcmUgY2x1c3RlcnMuIFRoZXNlDQo+PiBjbHVzdGVycyBj
YW4gYmUgY29uZmlndXJlZCB0byBydW4gaW4gQXN5bW1ldHJpYyBNdWx0aSBQcm9jZXNzaW5nIChB
TVApDQo+PiBtb2RlDQo+IA0KPiBBIG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVk
dW5kYW50ICJiaW5kaW5nIGZvciIuIFRoZQ0KPiAiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJl
YWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuDQo+IFNlZSBhbHNvOg0KPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJjOC9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDE4DQo+IA0KPj4N
Cj4+IEFkZCBhIGR0LWJpbmRpbmcgZm9yIHRoZSBNaWNyb2NoaXAgSVBDIFJlbW90ZXByb2MgcGxh
dGZvcm0gZHJpdmVyLg0KPj4NCj4gDQo+IEJpbmRpbmcgaXMgZm9yIGhhcmR3YXJlLCBub3QgZHJp
dmVyLiBQbGVhc2UgcmVwaHJhc2UgaXQgdG8gZGVzY3JpYmUNCj4gaGFyZHdhcmUuDQo+IA0KPiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5k
ZXphbGFuaXNAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vcmVtb3RlcHJvYy9taWNy
b2NoaXAsaXBjLXJlbW90ZXByb2MueWFtbCAgfCA4NCArKysrKysrKysrKysrKysrKysrDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9taWNyb2NoaXAs
aXBjLXJlbW90ZXByb2MueWFtbA0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9taWNyb2NoaXAsaXBjLXJlbW90ZXByb2MueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL21pY3JvY2hp
cCxpcGMtcmVtb3RlcHJvYy55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi4xNzY1YzY4ZDIyY2YNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL21pY3JvY2hpcCxpcGMt
cmVtb3RlcHJvYy55YW1sDQo+PiBAQCAtMCwwICsxLDg0IEBADQo+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4y
DQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yZW1vdGVw
cm9jL21pY3JvY2hpcCxpcGMtcmVtb3RlcHJvYy55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBN
aWNyb2NoaXAgSVBDIFJlbW90ZSBQcm9jZXNzb3INCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+
ICsgIE1pY3JvY2hpcCBmYW1pbHkgb2YgUklTQy1WIFNvQ3MgdHlwaWNhbGx5IGhhdmUgb25lIG9y
IG1vcmUNCj4+ICsgIGNsdXN0ZXJzLiBUaGVzZSBjbHVzdGVycyBjYW4gYmUgY29uZmlndXJlZCB0
byBydW4gaW4gYW4gQXN5bW1ldHJpYw0KPj4gKyAgTXVsdGkgUHJvY2Vzc2luZyAoQU1QKSBtb2Rl
IHdoZXJlIGNsdXN0ZXJzIGFyZSBzcGxpdCBpbiBpbmRlcGVuZGVudA0KPj4gKyAgc29mdHdhcmUg
Y29udGV4dHMuDQo+PiArDQo+PiArICBUaGlzIGRvY3VtZW50IGRlZmluZXMgdGhlIGJpbmRpbmcg
Zm9yIHRoZSByZW1vdGVwcm9jIGNvbXBvbmVudCB0aGF0DQo+PiArICBsb2FkcyBhbmQgYm9vdHMg
ZmlybXdhcmVzIG9uIHJlbW90ZSBjbHVzdGVycy4NCj4gDQo+IERvbid0IHNheSB0aGF0IGJpbmRp
bmcgaXMgYSBiaW5kaW5nIGZvci4gU2F5IHdoYXQgdGhpcyBoYXJkd2FyZSBwaWVjZSBpcy4NCj4g
DQo+PiArDQo+PiArICBUaGlzIFNCSSBpbnRlcmZhY2UgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBN
aS1WIEludGVyLWhhcnQNCj4+ICsgIENvbW11bmljYXRpb24gKElIQykgSVAuDQo+PiArDQo+PiAr
bWFpbnRhaW5lcnM6DQo+PiArICAtIFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJu
YW5kZXphbGFuaXNAbWljcm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAg
Y29tcGF0aWJsZToNCj4+ICsgICAgY29uc3Q6IG1pY3JvY2hpcCxpcGMtcmVtb3RlcHJvYw0KPiAN
Cj4gVGhhdCdzIHF1aXRlIGdlbmVyaWMuIEJhc2ljYWxseSB0aGlzIHNheXMgaXQgd2lsbCBoYW5k
bGUgSVBDIG9mIGFsbA0KPiBwb3NzaWJsZSBNaWNyb2NoaXAgU29Dcywgbm90IG9ubHkgUklTQy1W
IGJ1dCBhbHNvIEFSTSBhbmQgd2hhdGV2ZXIgeW91DQo+IGNvbWUgdXAgd2l0aC4NCklQQyBpcyB0
aGUgYWN0dWFsIG5hbWUgb2YgdGhlIGhhcmR3YXJlIGJsb2NrIGRlc2NyaWJlZCBpbiB0aGlzIGJp
bmRpbmcuIA0KSSdsbCB1cGRhdGUgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBiaW5kaW5nIGluIHYy
IHRvIG1lbnRpb24gdGhpcy4NCg0KQWRkaXRpb25hbGx5LCBJJ2xsIHJlbmFtZSB0aGUgY29tcGF0
aWJsZSB0byBtaWNyb2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jIA0KdG8gZnVydGhlciBjbGFyaWZ5
IHRoYXQgdGhpcyBiaW5kaW5nIGlzIGludGVuZGVkIGZvciBkZXZpY2VzIHVzaW5nIHRoZSANCk1p
Y3JvY2hpcCBJUEMgaGFyZHdhcmUgYmxvY2sgYW5kIGZvciBkZXZpY2VzIHdpdGggYW4gU0JJIGlu
dGVyZmFjZSAoUklTQy1WKS4NCg0KVGhhbmtzLA0KVmFsZW50aW5hDQo+IA0KPiANCj4gDQo+PiAr
DQo+PiArICBtYm94ZXM6DQo+PiArICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgIFRoaXMgcHJv
cGVydHkgaXMgcmVxdWlyZWQgb25seSBpZiB0aGUgcnBtc2cvdmlydGlvIGZ1bmN0aW9uYWxpdHkg
aXMgdXNlZC4NCj4+ICsgICAgICBNaWNyb2NoaXAgSVBDIG1haWxib3ggc3BlY2lmaWVyLiBUbyBi
ZSB1c2VkIGZvciBjb21tdW5pY2F0aW9uIHdpdGggYQ0KPj4gKyAgICAgIHJlbW90ZSBjbHVzdGVy
LiBUaGUgc3BlY2lmaWVyIGZvcm1hdCBpcyBhcyBwZXIgdGhlIGJpbmRpbmdzLA0KPj4gKyAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmkt
aXBjLnlhbWwNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgIG1pY3JvY2hpcCxhdXRv
LWJvb3Q6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2Zs
YWcNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgSWYgZGVmaW5lZCwgd2hlbiByZW1v
dGVwcm9jIGlzIHByb2JlZCwgaXQgbG9hZHMgdGhlIGRlZmF1bHQgZmlybXdhcmUgYW5kDQo+PiAr
ICAgICAgc3RhcnRzIHRoZSByZW1vdGUgcHJvY2Vzc29yLg0KPiANCj4gWW91IGRlc2NyaWJlZCB0
aGUgZGVzaXJlZCBMaW51eCBmZWF0dXJlIG9yIGJlaGF2aW9yLCBub3QgdGhlIGFjdHVhbA0KPiBo
YXJkd2FyZS4gVGhlIGJpbmRpbmdzIGFyZSBhYm91dCB0aGUgbGF0dGVyLCBzbyBpbnN0ZWFkIHlv
dSBuZWVkIHRvDQo+IHJlcGhyYXNlIHRoZSBwcm9wZXJ0eSBhbmQgaXRzIGRlc2NyaXB0aW9uIHRv
IG1hdGNoIGFjdHVhbCBoYXJkd2FyZQ0KPiBjYXBhYmlsaXRpZXMvZmVhdHVyZXMvY29uZmlndXJh
dGlvbiBldGMuDQo+IA0KPj4gKw0KPj4gKyAgbWljcm9jaGlwLHNraXAtcmVhZHktd2FpdDoNCj4+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KPj4gKyAg
ICBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICBJZiBkZWZpbmVkLCB0aGUgbWFzdGVyIHByb2Nlc3Nv
ciB3aWxsIG5vdCBleHBlY3QgYSByZWFkeSBzaWduYWwgZnJvbSB0aGUNCj4+ICsgICAgICByZW1v
dGUgcHJvY2Vzc29yIGluZGljYXRpbmcgaXQgaGFzIGJvb3RlZCBzdWNjZXNzZnVsbHkuIFRoaXMg
YWxsb3dzIHRoZQ0KPj4gKyAgICAgIG1hc3RlciBwcm9jZXNzb3IgdG8gcHJvY2VlZCB3aXRoIGl0
cyBvcGVyYXRpb25zIHdpdGhvdXQgd2FpdGluZyBmb3INCj4+ICsgICAgICBjb25maXJtYXRpb24g
ZnJvbSB0aGUgcmVtb3RlIHByb2Nlc3Nvci4NCj4gU2FtZSBwcm9ibGVtLg0KPiANCj4gDQo+PiAr
DQo+PiArICBtZW1vcnktcmVnaW9uOg0KPj4gKyAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICBJ
ZiBwcmVzZW50LCBhIHBoYW5kbGUgZm9yIGEgcmVzZXJ2ZWQgbWVtb3J5IGFyZWEgdGhhdCB1c2Vk
IGZvciB2ZGV2IGJ1ZmZlciwNCj4+ICsgICAgICByZXNvdXJjZSB0YWJsZSwgdnJpbmcgcmVnaW9u
IGFuZCBvdGhlcnMgdXNlZCBieSByZW1vdGUgY2x1c3Rlci4NCj4gDQo+IG1pc3NpbmcgY29uc3Ry
YWludHMNCj4gDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsN
Cj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+
ICsgIC0gfA0KPj4gKw0KPiANCj4gRHJvcCBibGFuayBsaW5lDQo+IA0KPj4gKyAgICByZXNlcnZl
ZC1tZW1vcnkgew0KPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4+ICsNCj4+ICsgICAgICAgIGNvbnRleHRiOiBjb250ZXh0
Yl9yZXNlcnZlZEA4MTAwMDAwMCB7DQo+PiArICAgICAgICAgIHJlZyA9IDwweDgxMDAwMDAwIDB4
NDAwMDAwPjsNCj4+ICsgICAgICAgICAgbm8tbWFwOw0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAg
fTsNCj4gDQo+IERyb3AgZW50aXJlIHJlc2VydmVkLW5vZGUuIE9idmlvdXMuDQo+IA0KPj4gKw0K
Pj4gKyAgICBzb2Mgew0KPj4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gKyAgICAg
ICNzaXplLWNlbGxzID0gPDI+Ow0KPj4gKw0KPj4gKyAgICAgIHJwcm9jLWNvbnRleHRiIHsNCj4g
DQo+IE5vZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuIFNlZSBhbHNvIGFuIGV4cGxhbmF0aW9u
IGFuZCBsaXN0IG9mDQo+IGV4YW1wbGVzIChub3QgZXhoYXVzdGl2ZSkgaW4gRFQgc3BlY2lmaWNh
dGlvbjoNCj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8v
ZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2VuZXJpYy1uYW1lcy1y
ZWNvbW1lbmRhdGlvbg0KPiANCj4gdXN1YWxseSByZW1vdGVwcm9jDQo+IA0KPj4gKyAgICAgICAg
ICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxpcGMtcmVtb3RlcHJvYyI7DQo+PiArICAgICAgICAg
IG1lbW9yeS1yZWdpb24gPSA8JmNvbnRleHRiPjsNCj4+ICsgICAgICAgICAgbWJveGVzPSA8Jmlo
YyA4PjsNCj4gDQo+IE1ha2UgdGhlIGJpbmRpbmcgY29tcGxldGUuIEZpeCB0aGUgd2hpdGUtc3Bh
Y2UgaXNzdWVzLg0KPiANCj4+ICsgICAgICB9Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKy4uLg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg==
