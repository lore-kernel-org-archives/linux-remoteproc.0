Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5F7BB15;
	Mon, 16 Sep 2024 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478715; cv=fail; b=YJ29u+BFUpHdzREjMc+cSS/3vi8wTJSx+fqr9JLi1o5FLH7FJaSAalu3+KC7ew3s4HBR5PzYxeQmdhuhIpV5J3HiDAi/xU21J9CS8GfWtW2hVZzyVcb1kPWdI3OhN5qCl481WUmtn+MkmVgc4o1MuRNP8f3QvzSCkbaVSyTi0DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478715; c=relaxed/simple;
	bh=cahPpN37cqP9PB3v4droXR3IDQ934HdCa7bqTKVtfYA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yn0mPmWE+pnb+4G4GfzMZfsFeIPx/HItJMpi3mY0IOx7Uo6HQXPPEtpwOC9RId3VA5PxbEqwYCFFKeSXzI1LZHZV9aw2ufheNyzA2MidGDwXImNLL6MYDt5nW3c6miuGM0sr4T4YFgdwfEZXZO2wuQSTNga92lU/Fo05WwBfK9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=yvB0iJMW; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yvB0iJMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOuZE4ICLm3W4vKX0AHQYEZ39ld0kDr5U0TlGwyWNv4FEu74C5lbItdTfXwebE4taSdfvAHmGw7KQid5Fjk/T6Hp4x5qaBNbwWpMD/nVvjmlk2nTmBU2brbC0Tkfi8t6n/8gJWUIBffUh1t/7rFPYTbR1LcDYii2HVoqhYE44fiTWrVe8qmJHjlpe6pPlawk0nfJAaI3Bedxs6Yp+yu9QO4MRyTV3kczDjAASHOSjUDNl5gNMdii05WZpAFNv4yRLtYtHfIJbTUqyVgq87/t5nsBfRysETzEXAH2ZLnpE41QNG6zLfGTEmblldOLb/ZlLOEpYQGz1srJGDiqJJLdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cahPpN37cqP9PB3v4droXR3IDQ934HdCa7bqTKVtfYA=;
 b=KzeHlrZi3retQszUUioOZv2rOe5KYr+TbPBEqGGQt70pNc7RKyjxd/kFHTeccGXvJ1aI+MqGc/aiPmkEHWEWBVPNEOYOPK7mf/jeWnUgsXth6/nadOVLNB8KJoxdehN9rGg04/3FgaMgr9D/Q9DOmD6EzsfK99pmGVdZRNVGldIIIJJDN50eqIXE1Gdn9Jtp2siknzIILwe0MshxaoBwi4ZaSG335cQlZSAr9IS59eoxuLG5HqsKg4cKjqVqYIQHw+QNOukXXsC08iBuYYKoNKIMtqvWZynfAF8KzBUzOJs49G8b1Ufd+v2490sJoe99mIboxwen+VhB8E7H+ynbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cahPpN37cqP9PB3v4droXR3IDQ934HdCa7bqTKVtfYA=;
 b=yvB0iJMWJqChpza/k+3jHLGmEnXm7tR49dl6IVfR1SGe/nz2aA41mM+O2BfmORvJvvJXDCx1+/iSD/48QVsQNiy+G3QaEJQvh/aVz/fa+9wD5ROk+5P/8vkamlJ8LlMO9wNSy6GWhAJN2CVCDmQsqcBvfWfpjjch/DckdR865+7nz6Jq6y2YYaNthkOgc4vWhu5TH3NhgZ5q4xRb1ySPfTxMxRk5gp4jEfLK+X82vvQA7W93Si3MGy0V/ix2/2P/u/ySpgSH65+WPyyIWks7eECqEABHzf8lX9WFFHxFehS8k1NMwJ8I+4u+FH7tz7MeFOvCTlUZvpijjSL79Loi7A==
Received: from CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 09:25:09 +0000
Received: from CYXPR11MB8732.namprd11.prod.outlook.com
 ([fe80::67aa:b655:6890:4bfe]) by CYXPR11MB8732.namprd11.prod.outlook.com
 ([fe80::67aa:b655:6890:4bfe%6]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 09:25:08 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <samuel.holland@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<Conor.Dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v1 3/5] mailbox: add Microchip IPC support
Thread-Topic: [PATCH v1 3/5] mailbox: add Microchip IPC support
Thread-Index: AQHbBTOfRl9PvrSWYUKAovI+9GYrsLJUq6OAgAV+mgA=
Date: Mon, 16 Sep 2024 09:25:08 +0000
Message-ID: <657d3fec-ed98-4b9c-81c8-1f5fc6e1c913@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
 <22dd1d53-9ac5-4672-ad68-e82499038283@sifive.com>
In-Reply-To: <22dd1d53-9ac5-4672-ad68-e82499038283@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYXPR11MB8732:EE_|IA1PR11MB6467:EE_
x-ms-office365-filtering-correlation-id: 855159cc-c21f-44a3-0721-08dcd6317547
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR11MB8732.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RVFaMlNnRytrUExtMitDZEdGTndLUjgyMTZCMTI3TURpWFAvazdaTi84U2dl?=
 =?utf-8?B?V1VKMEMwYXZiWldaRHcxdFM5MU9LWE8wZHdhY1lWT1d5a1NqQTJoanJTcXBw?=
 =?utf-8?B?N3Y1VW5TR2hzWTljQXVHMmM5OXFMRitnbkNCbk1OcisrWmNTTld2dFFiOUll?=
 =?utf-8?B?STJUeWEveUZVVENXcnljR0FsQUVOZ25PamFwS0JkcjQwaEo3TEEweHpQRjVa?=
 =?utf-8?B?NlhrTHpzT1hNL091dkFBZzJmbHg3alBiMVc4Y3k0Tkw0dTBFemdkOVJzMFFm?=
 =?utf-8?B?cG5qUytJWEFieC9Kb0VDejNIREZNelJueXh5WCt1aHNSYUpUa1d1czNOd2FY?=
 =?utf-8?B?M1BCRExJUTdqNS9oT29pT0l6QXBLdlJMVVJ6aWZnakxRMDVHM0xsQjB0bzBL?=
 =?utf-8?B?eUh4d2t0N2IyUEtoMGVwVkdNN0REb3lZQ25rMTVWRDBTZzF4RVhFL0d3K05v?=
 =?utf-8?B?ODM4akdyQU9aU0luK3pxVXNIdUU5dkVCTEhEeVpHN3I5aDRzdGpPNDVWaVJZ?=
 =?utf-8?B?R1plZEF5MmlzKzVMTkpDRW1UVlZIRHRrZHUvbDByL1dBZk5zZW1xbWZxN1Ur?=
 =?utf-8?B?MDVyTGpFa09kQXJkL0t2cFF4ZTM2Z2wzaXJ0cjQ4a0tUY0xSNVFpY2RyTG93?=
 =?utf-8?B?WEtXdVlCMXhlY0p0QnRSbGZZbWFHN0w5M0N6MWt6ZUI3SFVwbUZqcTVDemVN?=
 =?utf-8?B?L0VLZTBGSVRBeVVES0dqZHJuOThqQlRxVyt6RDAvOG5nTHJDWi96U000TDF5?=
 =?utf-8?B?bmF3aVhxMWt6Rk9qMmZWK3A1bTF5Qy9xOFFMQ2FhSjBacTRUdXZXV09USUZB?=
 =?utf-8?B?a2tIQVIrV3Vuai8vOXlYcFcvWFJpbVpHUFZ3MW56TUhZMXZzcXFzam1DQVZ5?=
 =?utf-8?B?N0hQZWFYVTVrbzJpdEFvNm4wQjVBM1NsZFZhV1NLMmdndW5yNWJpQkhIVkRM?=
 =?utf-8?B?eHIzZG5GTGovb2YwTmtGZjhqY25YakNQamJwbUdhc05OSG9qbkZYdWJqay9a?=
 =?utf-8?B?TXcrejlWMVRoZkRnOEZhbk5FK012ZW1ISGcrM2xhWGxjdHYyRFRvaGdzVm02?=
 =?utf-8?B?aG12dHluR2tFUVNNYUpadHZlS1ZXcWlWelpHMVJyamR1dVRRZnV0dWUvNmR3?=
 =?utf-8?B?QWt5TmFYaGMyYmxZZUMwNXRPMXJqVTM1VDNONkM4T25LTzZiQXVrZVlHa2xQ?=
 =?utf-8?B?UnRmZ3FGaXVmcVhqUkUxcWhvYnJOVFhZM0Y0QXRqUkJoS0xYR0pvaXAyMjY3?=
 =?utf-8?B?YUtHQ1VndnduWWpUUkErMkUwS2RwRTVCYnBjSTg2RnBDZmNpb2ZZbzg0Zk9F?=
 =?utf-8?B?Rjd6M0FTVWpWZnVsTjBJUmZpYkFWWGVocUt1OS9WODFtU2FvanV5TzVzV0Jo?=
 =?utf-8?B?bmVlcmF6ajFpRmQvenVEd1BVZGhvdkJHbExmR3FxV280Ky9PQVROc3o0dmhY?=
 =?utf-8?B?QnBVR3lORW1UMmt0S0pONUtsK1h3YWYvaExOUEJveDZ0OFk4NGJudGVKK2tU?=
 =?utf-8?B?UXhGc21NR1hjeUFjK1RMejZQUFhvTVdzRys1R0M5VHRxSWw2TXRHWGJ4R3JO?=
 =?utf-8?B?RjdKQWs1WkI3VGpDNW5qSFRpclNuNFZHTzNoMENCdHhhRHpTVXBrcFJPRzVV?=
 =?utf-8?B?cmk1SUJLbFZnTEUxL0NhWCtRbDdvNFFIMk5majBXNkpZOUx6emdCWkI4dlN3?=
 =?utf-8?B?Vkh5TndxSEJMVWt4VFlnVlZ4dDlpdUFoQmlJVnQ0Yng2ejlrTlJ4L2NWWnln?=
 =?utf-8?B?Z3FtU2JUT1QycVByRk9Sc2VrckM2UWl2QnZ0UWFqMWdUQXhTdXFzV2Q3dVhy?=
 =?utf-8?B?clJxdjNURlBnR1BVWmoxL01KU2pWWWdKdlRTd09TZWoyQjNzdi9vUzRGMm9o?=
 =?utf-8?B?L1N5dCtnYXQ2QlBrU1hRSzVTWGtHR3pvV3kzdDdmeXJZVUE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkFsekJqekoxMGk4azZnMXpXOWdvSTkwN3p1YnFvblJLOTcvbjM5bFJEdkF1?=
 =?utf-8?B?Si9Gb2RKNDBnWkVsSkVyTmtsU2NlOEIxQ0lTTnBOZzRFUmp5V2RCd1dwVmNP?=
 =?utf-8?B?R05hcCtRSGgzZTFJNTBtcHNZSHFDUVF2cW1oQVhyd2ljMTJCR095cituNDdR?=
 =?utf-8?B?Z2tmT2kycmcxYUtGZmRWWDQ2TmdPaTFuQnk1YW40QVNrai91aE5ubDVmYVEr?=
 =?utf-8?B?Y3lyZXRmenpYNnpCWHU0eFh1N0Vtek0ySUJwT3htcEhHbTJodmNBRlFQY3dj?=
 =?utf-8?B?RGxyTWVlUFlJdnlaYm44Zmw1Q2VUWUhJTDc2ei84WmwxUWRuZzg3WUQySDVr?=
 =?utf-8?B?MVBHZUd1S3BBaCt2RG5tSTNOd0JpTzl2OVRvQkk3OERCcUppUFgrLzdqaEdo?=
 =?utf-8?B?Tk9XdEhXV29rVTVoMlN6Z1lZODM2SDZlQTR5TWoxZVNJdzNJOHNHM1JJSHAy?=
 =?utf-8?B?L0didndyWTdqOHlTNDRyU2JsSm1uQkNzdklTREVLYmhDN09OUVRTZGkraEdO?=
 =?utf-8?B?NGhGNlUwNncyd3NIcVQ5ZUZEMjcreE0zSFo2V3dIYklUS0o4QzUrK1JyVWU1?=
 =?utf-8?B?RlIxOVFMSUM2eWFiLzFQR0c5TkMvak9Cb1dsRWtyaXlNcDlQaWdIaXRQUHlo?=
 =?utf-8?B?UUdhTEJvcStZd0c0MzNoOHZkUUZWbytONzRzUFQwQUs5RjdTR1lRYnFrUUY3?=
 =?utf-8?B?dERiRDhmbytvNTdRcHZXRlJwcnc3Z2ZmWkFSTXpKN3VuMzFiVTFaWlNnZFJD?=
 =?utf-8?B?Z3ZHL2xOSkFCeWo2MW81NHZtVHBwUFFtZFY4NmwrdTNHakhWcmh1eHhOL0Ez?=
 =?utf-8?B?U2d4b1JuS3BuSHM4Y1lnUncvcEV5UXNXVTNQV0hQWVNiVlNRaFpvbmY5NVBR?=
 =?utf-8?B?b09jUytLMmlPVVV6OTI1ZVZlUW5URWRkcE41SzdxY2dVWWtUNGk5cklDTTly?=
 =?utf-8?B?T1lFOGVnWGdVbzY3QTFkZmlDUVdYTURFWi94Vk5jVUdaZDdyK284bWR3Y0Fk?=
 =?utf-8?B?Z3F1MGZpeVlkbUQ3VjhBZFFLN0NSWEJCZ1FzUkZLMm00MFR6bWUxSkVGRnJK?=
 =?utf-8?B?VkRTVFl6ZFAyazBOd0l2SDMyUlkyWjZ0ME92ZG9nenRGMXVkYnZiRXNkRnNo?=
 =?utf-8?B?QnNKQzhyQUk5WEtxZ3l4UThlcVRBN1MrMURCcnNDU0xDaDNJRE1qa0N2R2Vs?=
 =?utf-8?B?NE9ZSlBjZjZabnhucy9HdjV5M0ptVG1ReHBJMWZEbFFCVUkxcFBtRFlodnJX?=
 =?utf-8?B?T1FzVmFQMnpPcXNjdUUyQzBCWFF6RFA1aEs4dnEyemNDV3M4UkU0a0NEM2Jv?=
 =?utf-8?B?UXdnWkRob3R2WmRQVEgrY2tCM0pDMWpDdU9zdzg1OEkwbEtxUWs0QlVQbHRI?=
 =?utf-8?B?bGpjaFg5S0NFTDJTZ005eU52dTR1QlBIcU43STUvZkhRdTRaNEJTcm8yUElP?=
 =?utf-8?B?dHVaQWNtSHppZVRoMWlMYVloLy9Qai92TlVhbUI2a2lPcVlNemdrZW9NcDdD?=
 =?utf-8?B?VDhlcnFoMU05OVhKWEFtNFBJTzJXTWl1SUNUZ3RqTUdvOG12L1lpVHJIUS9w?=
 =?utf-8?B?MUt0NlpkVHZPM3F2VFAvMmJ6UnhteTlZenRpeGJhbjRyUHhHT1RGT0dBajNu?=
 =?utf-8?B?dnM1WUxHdEhPL3paT1lRa0ZiYVZ4anhSZ0wvZ05VN01PYlFwOUZtdTFZUkky?=
 =?utf-8?B?blNGL1ZoZU90eWtITTJGak5aMnl0R0N5cktLK1RiOXE1ZkNXTFNkdmlaNDBq?=
 =?utf-8?B?VHM0K3p1a2xqQThNdWNEQ282QWlnS2MvbE1jb2JSb1pxeHJYM00veXkrSUND?=
 =?utf-8?B?YU5jTTJJYjg5QzFRMTd5WG9oYVdLZUM3OHVuY1VmVndqUnQvdG5KTlMzWCs0?=
 =?utf-8?B?L0V2bGFaa3NydTZoUWxadGUrUEMyTUpNbmFENXQzM1ZxV1psRzNnNlc5Ry92?=
 =?utf-8?B?ZFpBcktBQTFPZ1E1ZHRTTG1NK0dnMndvRDZzdjJhKzhlM1dlRHAwVjJKTEpa?=
 =?utf-8?B?dmg5ZlRtY3h5TVRIN1BmZFVCTExaeHBQMnZVQ3ljYVdvYlhZNlNubGo5NWw0?=
 =?utf-8?B?clkyMXJTMGw3blFQMkEzMkxOK05UY0lRczNUY0N6KzRad1hXeStHVks2eVFG?=
 =?utf-8?B?L1Jid2xBdXJJNmR4eEgvVUFsV3pTT0ZZTGVlb2VVWjBMKzlvN0MxSHdSSmwr?=
 =?utf-8?Q?Zai3dWNIW0DRJDvl96FDX/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07C716625C78014F9BC67DECB35C6300@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYXPR11MB8732.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855159cc-c21f-44a3-0721-08dcd6317547
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 09:25:08.8795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KcQ+YXwju8NBnVtJr/RvVc9qDoCzN6GMYgJld2Tr1e7mU3RnSRlE330RDJJiNx8iYNxCBtcFmZNgWqUmBzEg27gEuZGgXcg1FtBy/lvqRmzZ5ydVGvGk/AikapVlh5XA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467

T24gMTIvMDkvMjAyNCAyMjozMCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS4gTGVhcm4gd2h5
IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVu
dGlmaWNhdGlvbiBdDQo+IA0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4g
DQo+IEhpIFZhbGVudGluYSwNCj4gDQo+IE9uIDIwMjQtMDktMTIgMTI6MDAgUE0sIFZhbGVudGlu
YSBGZXJuYW5kZXogd3JvdGU6DQo+PiArc3RhdGljIGludCBtY2hwX2lwY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7DQo+PiArICAgICBzdHJ1Y3QgbWNocF9pcGNfcHJvYmUgaXBjX2luZm87
DQo+PiArICAgICBzdHJ1Y3QgbWljcm9jaGlwX2lwYyAqaXBjOw0KPj4gKyAgICAgc3RydWN0IGlw
Y19jaGFuX2luZm8gKnByaXY7DQo+PiArICAgICBib29sIGlycV9hdmFpbCA9IGZhbHNlOw0KPj4g
KyAgICAgaW50IHJldDsNCj4+ICsgICAgIHUzMiBjaGFuX2lkOw0KPj4gKw0KPj4gKyAgICAgcmV0
ID0gc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX01JQ1JPQ0hJUF9URUNITk9MT0dZKTsNCj4+
ICsgICAgIGlmIChyZXQgPD0gMCkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJNaWNyb2NoaXAgU0JJIGV4dGVuc2lvbiBub3QgZGV0ZWN0ZWRcbiIpOw0K
Pj4gKw0KPj4gKyAgICAgaXBjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCppcGMpLCBHRlBf
S0VSTkVMKTsNCj4+ICsgICAgIGlmICghaXBjKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4+ICsNCj4+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGlwYyk7DQo+
PiArDQo+PiArICAgICByZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwgRE1BX0JJ
VF9NQVNLKElQQ19ETUFfQklUX01BU0spKTsNCj4+ICsgICAgIGlmIChyZXQpDQo+PiArICAgICAg
ICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZG1hX3NldF9tYXNrX2FuZF9j
b2hlcmVudCBmYWlsZWRcbiIpOw0KPj4gKw0KPj4gKyAgICAgaXBjLT5idWZfYmFzZSA9IGRtYW1f
YWxsb2NfY29oZXJlbnQoZGV2LCBzaXplb2YodTMyKSwgJmlwYy0+ZG1hX2FkZHIsIEdGUF9LRVJO
RUwpOw0KPj4gKw0KPj4gKyAgICAgaWYgKCFpcGMtPmJ1Zl9iYXNlKQ0KPj4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IE9uZSBkcml2ZS1ieSBjb21tZW50IGhlcmU6IHlvdSBk
b24ndCBuZWVkIHRvIHVzZSB0aGUgRE1BIEFQSSB0byBnZXQgYSBwaHlzaWNhbA0KPiBhZGRyZXNz
IGZvciBwYXNzaW5nIHRvIHRoZSBTQkkgaW50ZXJmYWNlLiBZb3UgY2FuIHVzZSBfX3BhKCkgb24g
YSBrbWFsbG9jJ2QNCj4gYnVmZmVyLCBzaW5jZSBrbWFsbG9jKCkgcmV0dXJucyBtZW1vcnkgZnJv
bSB0aGUgbGluZWFyIG1hcC4gVGhpcyBoYXMgdGhlDQo+IGFkdmFudGFnZSBvZiAxKSB1c2luZyBj
YWNoZWFibGUgbWVtb3J5IGFuZCAyKSBub3Qgcm91bmRpbmcgdXAgdGhlIGFsbG9jYXRpb24NCj4g
c2l6ZSB0byBhIHdob2xlIHBhZ2UuDQpIaSBTYW11ZWwsDQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dl
c3Rpb24sIEkgd2lsbCB0YWtlIGEgbG9vayBpbnRvIHRoYXQgYXBwcm9hY2gNCmZvciB0aGUgbmV4
dCBpdGVyYXJpb24gb2YgdGhlIHNlcmllcy4NCg0KVGhhbmtzLA0KVmFsZW50aW5hDQo+IA0KPj4g
Kw0KPj4gKyAgICAgcmV0ID0gbWNocF9pcGNfc2JpX3NlbmQoU0JJX0VYVF9JUENfUFJPQkUsIGlw
Yy0+ZG1hX2FkZHIpOw0KPj4gKyAgICAgaWYgKHJldCA8IDApDQo+PiArICAgICAgICAgICAgIHJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiY291bGQgbm90IHByb2JlIElQQyBTQkkgc2Vy
dmljZVxuIik7DQo+PiArDQo+PiArICAgICBtZW1jcHkoJmlwY19pbmZvLCBpcGMtPmJ1Zl9iYXNl
LCBzaXplb2Yoc3RydWN0IG1jaHBfaXBjX3Byb2JlKSk7DQo+IA0KPiBIZXJlIHNpemVvZihzdHJ1
Y3QgbWNocF9pcGNfcHJvYmUpID4gc2l6ZW9mKHUzMiksIHNvIGlmIHRoZSBETUEgQVBJIHdhc24n
dA0KPiByb3VuZGluZyB1cCB0aGUgYWxsb2NhdGlvbiBzaXplLCB0aGlzIHdvdWxkIGJlIGEgYnVm
ZmVyIG92ZXJmbG93Lg0KPiANCj4gUmVnYXJkcywNCj4gU2FtdWVsDQo+IA0KPj4gKyAgICAgaXBj
LT5udW1fY2hhbm5lbHMgPSBpcGNfaW5mby5udW1fY2hhbm5lbHM7DQo+PiArICAgICBpcGMtPmh3
X3R5cGUgPSBpcGNfaW5mby5od190eXBlOw0KPj4gKw0KPj4gKyAgICAgaXBjLT5jaGFucyA9IGRl
dm1fa2NhbGxvYyhkZXYsIGlwYy0+bnVtX2NoYW5uZWxzLCBzaXplb2YoKmlwYy0+Y2hhbnMpLCBH
RlBfS0VSTkVMKTsNCj4+ICsgICAgIGlmICghaXBjLT5jaGFucykNCj4+ICsgICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07DQo+PiArDQo+PiArICAgICBpcGMtPmRldiA9IGRldjsNCj4+ICsgICAg
IGlwYy0+Y29udHJvbGxlci50eGRvbmVfaXJxID0gdHJ1ZTsNCj4+ICsgICAgIGlwYy0+Y29udHJv
bGxlci5kZXYgPSBpcGMtPmRldjsNCj4+ICsgICAgIGlwYy0+Y29udHJvbGxlci5vcHMgPSAmbWNo
cF9pcGNfb3BzOw0KPj4gKyAgICAgaXBjLT5jb250cm9sbGVyLmNoYW5zID0gaXBjLT5jaGFuczsN
Cj4+ICsgICAgIGlwYy0+Y29udHJvbGxlci5udW1fY2hhbnMgPSBpcGMtPm51bV9jaGFubmVsczsN
Cj4+ICsgICAgIGlwYy0+Y29udHJvbGxlci5vZl94bGF0ZSA9IG1jaHBfaXBjX21ib3hfeGxhdGU7
DQo+PiArDQo+PiArICAgICBmb3IgKGNoYW5faWQgPSAwOyBjaGFuX2lkIDwgaXBjLT5udW1fY2hh
bm5lbHM7IGNoYW5faWQrKykgew0KPj4gKyAgICAgICAgICAgICBwcml2ID0gZGV2bV9rbWFsbG9j
KGRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7DQo+PiArICAgICAgICAgICAgIGlmICgh
cHJpdikNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+
ICsgICAgICAgICAgICAgaXBjLT5jaGFuc1tjaGFuX2lkXS5jb25fcHJpdiA9IHByaXY7DQo+PiAr
ICAgICAgICAgICAgIHByaXYtPmlkID0gY2hhbl9pZDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsg
ICAgIGlmIChpcGMtPmh3X3R5cGUgPT0gTUlWX0lIQykgew0KPj4gKyAgICAgICAgICAgICBpcGMt
PmNsdXN0ZXJfY2ZnID0gZGV2bV9rY2FsbG9jKGRldiwgbnVtX29ubGluZV9jcHVzKCksDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVj
dCBtY2hwX2lwY19jbHVzdGVyX2NmZyksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+PiArICAgICAgICAgICAgIGlmICghaXBj
LT5jbHVzdGVyX2NmZykNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsN
Cj4+ICsNCj4+ICsgICAgICAgICAgICAgaWYgKG1jaHBfaXBjX2dldF9jbHVzdGVyX2FnZ3JfaXJx
KGlwYykpDQo+PiArICAgICAgICAgICAgICAgICAgICAgaXJxX2F2YWlsID0gdHJ1ZTsNCj4+ICsg
ICAgIH0NCj4+ICsNCj4+ICsgICAgIGlmICghaXJxX2F2YWlsKQ0KPj4gKyAgICAgICAgICAgICBy
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FTk9ERVYsICJtaXNzaW5nIGludGVycnVwdCBwcm9w
ZXJ0eVxuIik7DQo+PiArDQo+PiArICAgICByZXQgPSBkZXZtX21ib3hfY29udHJvbGxlcl9yZWdp
c3RlcihkZXYsICZpcGMtPmNvbnRyb2xsZXIpOw0KPj4gKyAgICAgaWYgKHJldCkNCj4+ICsgICAg
ICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiSW50ZXItUHJvY2Vzc29yIGNvbW11bmljYXRpb24g
KElQQykgcmVnaXN0cmF0aW9uIGZhaWxlZFxuIik7DQo+PiArDQo+PiArICAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+IA0KDQo=
