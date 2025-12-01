Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFEF7E110;
	Mon,  1 Dec 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605787; cv=fail; b=dvYcevCQDQ+xOo3vJVN+HjtzDagMxWYO2rJpWsDum4QSUUwP7diAM783rdM0n/3sQDoFA2DrC9/VP2+5TlJyHh7WFT2FgfZHBi2nh0Y648baAUvsY8HrGsNghEHlGtnAb7qO3o/5mp+ek8A6vXi7JZh2tgYqiSiXITUnfJnrVOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605787; c=relaxed/simple;
	bh=YV5dEaAMYEXnrnqbjfEPA2VMqpazI6S89miKBFvgqKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cTOZWm0TWvAfjR9xWEYrbOl/K2gf4Ryz2ZZXBbUV6vM+/UMKUFAM2xmozdI3WvyIskY3beE96ijj/M6+Zgve61dfD42mLCUZE3GszBHh0JC0DBXY5Z/UK5IlUejxWU5x6PQV1fZlPk5EnDngD4b4d5yoZTV0EiaVgVl3/nwq0dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=k0E7Wdq4; arc=fail smtp.client-ip=52.101.62.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="k0E7Wdq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZwA4m1TnwFymF3HEhucRCETZJjD7/vAzTgcT9l8PjgDaultO7czLwj4oeRbZ+cyvsxKk8OviC9LKbr0G05avoExU1dTA+VVXZhtoReNTj/1Awzo8RUjHWrxpp2IpAPPIGdwHudTqRH2LeTaHjD/ZmQpsnJHRlQnhFo6mRvo5uM1UfJKq3/uMaU6WMhR9k5ev2YuEUziVD6EgQNAzrZefkBA8Vt6mp/zco+WFBCnRBMaXfn9plh5UkkhT+tQVY8kvYCBhehxzQ2j8iusdDmN8A3r83MaVvGI4Ip5LFBebtAt4/Jkw+ZIHlNB/uutjjjfDVoRTuqs+YrBAHx5Es+OOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV5dEaAMYEXnrnqbjfEPA2VMqpazI6S89miKBFvgqKc=;
 b=BEEw8f8WvoDYwg8EKiBiZkP0KGl+EUUM4gUDlDSFoA4toFQoqIXspxWxQ0Bnu+GumGoZuR+HkvxjjyZ1recpS4dSlu55dadQfHeLhKo8IKet6XEM9hK3CDz2XEHZVu2TEi5ZvdG6x8kWbC6jNh1MNghjfEVGHkc7qkOlFvfV8Q4AA0sgkIeiMgrATPRtIs/gLeFEdvV+6pDobYrrhxmTuKVp9o/pnFJlpO7+cF+nVg0w05BlFp26DtnxCcLG+Z3UoIHD72vyiWh2TI/zlZK/ynAzCUMwL0zUpc/gMsyB5O0JKLChlhooGPgX5H4Oo+gzw0pILz3Zt/uSRDgtBgdkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV5dEaAMYEXnrnqbjfEPA2VMqpazI6S89miKBFvgqKc=;
 b=k0E7Wdq4rbrhhchIkdJIeeifglB0cj1MSeBZU54r75hCKYNNDTonT/OmL2OMvlqodNGag34eKhXVvbyI+neefcVrtqyeLXiWS+RumPJgPwEN62uzn+0Y6WVFTaMeZggcskLvm7Vak0G+aNmzIoYwkXte1Mz8qJydnmkq78M3kV4dubKMy0arrZbyw7IywLJMvuG1f1zxrYqzXVi/ISDoLaML/Y0BMcn+GwcEAfP57/Nhydqk/RRJLyGqOSinWt/Hw0Ur3RpVkVuNcrxsIck5UOUtkTf3rknqjXOhljIbd3nLuOu+yEOkKWVmTSnplbsviVGuAc8UH/ihZ6x47OUjQA==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:16:22 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:16:22 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <conor@kernel.org>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Thread-Topic: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Thread-Index: AQHcWvJVHQmh3Xm5rk+DNxpoga8SSrT9c2AAgA+SZIA=
Date: Mon, 1 Dec 2025 16:16:22 +0000
Message-ID: <0aff01c1-7df9-4ae4-9a6b-045a957c3542@microchip.com>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
 <20251121-doormat-splashy-1343ea24888a@spud>
In-Reply-To: <20251121-doormat-splashy-1343ea24888a@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: ca0b479b-464f-42b9-612e-08de30f4f7fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UVk4RC9LMDNLRW81MzJ3VGZFTkI0aS9RTnF2eSs0T3IrQ3plTXFwMnUwejBh?=
 =?utf-8?B?bVRHdU04Y2tiYlJHT1M1TGNzd1MxSUE0enFlZmFYUDA1ZTgrczVpUDFXbkxT?=
 =?utf-8?B?RytEUUQzWmk2OTF6UlJGRjZ1VWE3NzhtYXdneVk4bmQ2c2NDTzBhVmpIYmMv?=
 =?utf-8?B?bm5GeVZnSmpCZVkxT2RFYlVDWS9NZXNyR3UwdE5qclFkeFh5RVpPbWZWdW1m?=
 =?utf-8?B?djd0S1loNlhZSzZyOVVnZXV5d2c5VjZnSmRDeXAzNDk0bCt1T2o0WThYL2xu?=
 =?utf-8?B?ekNpUWhTdVRPKzNhc29zWmJlcFRMNjFaQmpnMGttTlZlYU8yU3lrSHBkQzk2?=
 =?utf-8?B?UXlIdmI5L0hCNFkxd3VPN0RvaFE2RENzVkRFSDBpa1FJRFE4QWNrV3kxRTNj?=
 =?utf-8?B?QUM3TWxCWVprL2dNYUo4cDQwMUd3WnFqaDJiVW1pbzRJMVZFMG9QRHRua2VL?=
 =?utf-8?B?RGFyT0oxZnJJTWJRV1NKRDF0UTY3eStSbk4rc3lZeWlmTkQzd09aTkw5clN2?=
 =?utf-8?B?SmJoZ3dXZXVXU1dPWDV5VWRuUVAyYXdMUVlyTzNyeHVrTm5mNWphT0dGbGd5?=
 =?utf-8?B?T2pzVWpnVnByQkRGWGdnSmk4N2NmTk5HY3ZDRkIzdmE0aTQ3VTVLbEtoZVAz?=
 =?utf-8?B?elJQR2lYamVDRSt4VDI3RDRVYmhSbFliWG9nUEJyNm1QQzhQcnpTM0Z1eGJr?=
 =?utf-8?B?SkNlMHlxQm9JRzFqS0xUem1tMXlBek16UkJnd0c2WEt0Q0xBRVZYR2czQUNs?=
 =?utf-8?B?TTR4TWdSZjZsYS9DaVU4SUVlSWgwK0VRNUd2UWRJbGl4VDZnRllUc1dSU3JQ?=
 =?utf-8?B?OGNnNm5wLzFDWXBWUVZ1d3BMSmU3a0VLV3hmUkFhMmJUbDZBeWpGWm8wV1Qv?=
 =?utf-8?B?aU5Ma3ZPNGxOODVCN3NOdnhDZUhWcGxxSVVYb29yZDROTFc4Y0N1Q2d4dmpy?=
 =?utf-8?B?OVhyd2ZseElVTVQ4RkZRcUh1dFZGOExrUi9KSndRWGloT0trRy82aE1Beklk?=
 =?utf-8?B?bzRJcHpxM2UzVHppTDFzandvb0J1bXNPV1ZTZWpTNmtrVEp3Und4N2dsNlZt?=
 =?utf-8?B?N0c0MDU5alFnd08xM0xMK25pN1BKMlBKd0ZNWGYvOHN1QlRuU2JLOWpVT2Jz?=
 =?utf-8?B?S2hoWnlvR2tmemJPdUVUMVlEQmdQL0toTkNGUU1DU3F5N1NxcUpjOGxGOUtM?=
 =?utf-8?B?ZWROYW54cklFazR4Z0FaNkt0N0xYT0VvR2lZcDNZZ2pRUE1JWDJONXBmWkVy?=
 =?utf-8?B?a2txNGJJNFFSYXpWa2tLa2IvbW4rL2x3QWZrWHhPcmZuMkNySklldlkyaWIr?=
 =?utf-8?B?UVlORHlkZGxmdm1ISEN5UUdOYmtWNi9ZRkFON09lR3E4cTdWYXA5c0lLblFE?=
 =?utf-8?B?N2hROENaT3VyRlhMV2FTbWRZUzJlWDJtVDM3SWJHZUErUEJNUHlRTzZ6bzVh?=
 =?utf-8?B?R2l2dE05TmRqKyt0NU4xY3FyczVvQ3labkJRa3dROXY3VVBkUWs3WHl1K25r?=
 =?utf-8?B?eDFuVFV4ZXZXZGc5Qjg0R0lyOStUNDAwcFlER2JkRGVEQTZQTDJaVW1Ndy90?=
 =?utf-8?B?TFpSOEo1TC96Z3NwUW5jdWZIWlY1Q1d0dmJCRVhQbVRYZFdiYXFoTzBMNzZO?=
 =?utf-8?B?MjVWTmo2U0lEUDdzNzlqVmkrRkV0WHdwMCtLVitrYy8rMnRTUUNZNzFLSURr?=
 =?utf-8?B?blhTWFFBZmZCSnpXR3BybWppVHo1bUVMQ056OWFWQXNENnZRbTlhN0I3MzNq?=
 =?utf-8?B?aFdYT0VpWnhLdG1Rb0I2aGY2Rm45WlJWN1J0UTVlQ2djeXJmVVUxK2NlaXhx?=
 =?utf-8?B?K0pIaDJhbWp3bWdYOWlQTFNYN2FpZm1XVXZCZktzWmw2eGtRZW81S0oxZFRx?=
 =?utf-8?B?M2lNalBycUFHY1BRZDZZdk5jaHl6ais2NTZaWjgreW5qZXVGOEFNRFFaaVhC?=
 =?utf-8?B?SCtXU2ZhbUZWRUQramNvZXdHdHVDVlFtQjVMQTRHaER1bjVQcGt2aHRVWnhG?=
 =?utf-8?B?cU1hZHVQcWVRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SW5JaXlLOWwrTFBxUTlXQVArcmhRNUl6QkprTDZrS0RWOUJyL21ySmNpdDB1?=
 =?utf-8?B?KzBMdVgwUnFtL3pTeUgzM0RISFRTK1JmMlhVV2tMNVU5TVhsY0RCNzltV2xV?=
 =?utf-8?B?YlRCNzYrZUtwQWtzeGZ5Q0JrMndOa3BScC9XQTZvS25jTWdEZVRaY0NSN0c4?=
 =?utf-8?B?UW1Uc0Ird05lMzRoOG5DaHFsTkxBSzhDTjc2TzR4Tm9ZWit1WnBWcWZ0dDdZ?=
 =?utf-8?B?WldWN25temVvekNybUJ4WTF0ZTNYQ3pmTHBBbStjOTA3WkFpeWR5a296WmIx?=
 =?utf-8?B?WnpCMnRuZUh5WUJ5cWpGdTU1UmNTb1FLWE9UWCsxRXpZd3JIQmVCRmpONlRl?=
 =?utf-8?B?SW1XYlhTZC9vd0pTU3lSSnNEZExPT20wR3VOOERXMkYvSTEzbGZBeHRkNFZY?=
 =?utf-8?B?UDFLVWRMQWhiOFIzdjdiQ29WbXJNTzVrSDlCWDBKOW91VHp0NUNYTmxnanJq?=
 =?utf-8?B?dzR4a3p0eklBaHorZXEwYUpXaTJscVFNczNnVzJBZVkvdytZYWpIZ2ROMk1o?=
 =?utf-8?B?SjRFVFFOaUphMVlsYk90WlZvRFNLMEliQ2o2NWdLdVlqaDJ6aDZyNFRvbmNk?=
 =?utf-8?B?Y0hTMStIMHlOOXprRTE4T0s3QndjWlFvMDMwNEQ4d0ZBUXZlUjU5c21zR1NE?=
 =?utf-8?B?TU1xR3RITTI3OEFvRXBsWmxKSUV3KzJEazlIR2tsUVJCRisxOTI1NFJReEFl?=
 =?utf-8?B?MFpZMUNYWERUdjMwb3pBNXJYTmtPTitoSW9PRjNEUDgrb3VHMVJBdlVmNVlj?=
 =?utf-8?B?Ukk0SE45dWRobE9MTzRTYlVUMkw5YXhyK0k4NjN3NG0weTlQNUtaYy9mQmZ0?=
 =?utf-8?B?YmF1Uk9MR3pqeC8rdUxLSTlNV2lNVDhRNXBHUWwwanZqTzN2NnNIVmxwZTJl?=
 =?utf-8?B?UzBqYWRPZ3ZzR1NHNnlrSG03YkRTa1BOZDdFWTdKaWJhY2pyY2FYb1d4NnpE?=
 =?utf-8?B?Qjl3bFNxaTVqZUhlWkZQMWhiUTlVSDdmd2pQcDdUbDBmaDZ5R21GYjJEc3hZ?=
 =?utf-8?B?Nk52Q0R5ZmgyK2tpUjBpSWwrbUNlTEROYUdmdVhOZnZUbHh5b0QwMVhsZGhx?=
 =?utf-8?B?RjlIZ2VCWmQ1TVpCV3FBR1h6ZnhxdGJWTVRrZXpjRWg1T2JPODZYc0kvNnk1?=
 =?utf-8?B?ZHBwODBZZ1JrWlJUbHJTT09Sak9YOUpnMzQ1RVJKTDcvRndFRzFvdzFtTHNP?=
 =?utf-8?B?RmtmVC9NRFA5YitaNFZ6RWNGREkyQlVkK3RGRGRLOHRmcjhlUE5CejVNNnZP?=
 =?utf-8?B?bmJzREloQ0piVjZxNi82NUY0UWx1MHM5L0d6Umxpc043aUl1Mkw0MlNDZEtP?=
 =?utf-8?B?Mk1wNlVCendNRHd4TGtaTGJqalVLNysxWC85ZGx3MmJ3UDFpanY1SUIwbEJT?=
 =?utf-8?B?QVJqK0pMUzkzSFFTMW1MWVdvd1dNT3FCS3Z5WkV5cXN1SUwvQS9hdXYxbUNN?=
 =?utf-8?B?SWFqeld5S3Qrc3BkVzIxZVNzYXZRcGVBR1h6QnpEd0oxeHdJWmRHNitxMXJH?=
 =?utf-8?B?WSt5MGRLMW12a0Z6TG1PWEM3eThsYWdWTHlwMEFWdzlPanJhSFpDdS94Yjl2?=
 =?utf-8?B?ajZzWWp2MVkzQU8yVzNqV3hFQWNHeThJWUhpZFJaOUtQdG0wV0NoMGE2Ykp5?=
 =?utf-8?B?S2d5Q2o1KzJac3pUbFZOMGZKeHNORWt1UDhGQjluWEl3cng5SjBRSGJWTXFD?=
 =?utf-8?B?aFA4bkpnK1RnbGw4Rm1vS2VDUE5XeE51Z09EQWhNWUQwNlpjd2VmRFBVVHVi?=
 =?utf-8?B?VUhtMGxTNCs4RUxOcXZZd1E3enUrMnlkZWFrMkpGU0pmSlg3MEFXOGdSR3lk?=
 =?utf-8?B?TXR5WVRjbW1Jam04VE1IVG1Hb0ZoVllORDE5dXR0S2lGeVl0MkF4K0QyajJV?=
 =?utf-8?B?K3RGdFI2YnVNY2toWURROHpRYit0bDlJQll5dUNxaXhpTHhJbmgyVXhHREt2?=
 =?utf-8?B?WWxBZTQxWWZJNE1LRmorc1N5L3lBcjlZU29XYnFVQmhQbHVaUUJSSnMwUHJQ?=
 =?utf-8?B?ZThnVjVVeXJmZmlaajZDSjV6UEVscEZkYVd6RG9tUVFoUDh6YlhFY3hnRHlK?=
 =?utf-8?B?aU1MQzZiT3l3QlJFODRPRjZQZW9KMTQ4V01DVXBlQUM3R1BDYTlUTk9QYzls?=
 =?utf-8?B?RDBIYWJtMms2OGNzY3Z3OWRSY2xpckQvTndIRUl4NVFjSFAwT1B6emV6ekdl?=
 =?utf-8?Q?ybecTd0KidrL+d7sNj4TGZg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05E248A707536442B4E4C9D82EAC09B5@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0b479b-464f-42b9-612e-08de30f4f7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 16:16:22.3350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfcyRox7VdE3xyZXfZQ1DyZ8vI1O8vb8GCmLqHa9GcLNR4QkDB8OlNPriZSRJJnhX+rtAqy0nr4FiX638pbbzi4eqUMm+U0hxC93qeAtdGhdg8zpaydkNcdKWMzP/q8T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203

T24gMjEvMTEvMjAyNSAxODoyOCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBGcmksIE5vdiAy
MSwgMjAyNSBhdCAwMjoyMTo1NlBNICswMDAwLCBWYWxlbnRpbmEgRmVybmFuZGV6IHdyb3RlOg0K
Pj4gTWljcm9jaGlwIGZhbWlseSBvZiBSSVNDLVYgU29DcyB0eXBpY2FsbHkgaGF2ZSBvbmUgb3Ig
bW9yZSBhcHBsaWNhdGlvbg0KPj4gY2x1c3RlcnMuIFRoZXNlIGNsdXN0ZXJzIGNhbiBiZSBjb25m
aWd1cmVkIHRvIHJ1biBpbiBhbiBBc3ltbWV0cmljDQo+PiBNdWx0aSBQcm9jZXNzaW5nIChBTVAp
IG1vZGUuDQo+Pg0KPj4gQWRkIGEgZHQtYmluZGluZyBmb3IgdGhlc2UgYXBwbGljYXRpb24gY2x1
c3RlcnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVmFsZW50aW5hIEZlcm5hbmRleiA8dmFsZW50
aW5hLmZlcm5hbmRlemFsYW5pc0BtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9taWNy
b2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jLnlhbWwgICAgICAgICB8IDk1ICsrKysrKysrKysrKysr
KysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKykNCj4+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9j
L21pY3JvY2hpcCxpcGMtc2JpLXJlbW90ZXByb2MueWFtbA0KPj4NCj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9taWNyb2NoaXAsaXBj
LXNiaS1yZW1vdGVwcm9jLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmVtb3RlcHJvYy9taWNyb2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jLnlhbWwNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjM0ODkwMmY5YTIwMg0KPj4gLS0t
IC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
bW90ZXByb2MvbWljcm9jaGlwLGlwYy1zYmktcmVtb3RlcHJvYy55YW1sDQo+PiBAQCAtMCwwICsx
LDk1IEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9yZW1vdGVwcm9jL21pY3JvY2hpcCxpcGMtc2JpLXJlbW90ZXBy
b2MueWFtbCMNCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogTWljcm9jaGlwIElQQyBSZW1vdGUgUHJvY2Vz
c29yDQo+PiArDQo+PiArZGVzY3JpcHRpb246DQo+PiArICBNaWNyb2NoaXAgZmFtaWx5IG9mIFJJ
U0MtViBTb0NzIHR5cGljYWxseSBoYXZlIG9uZSBvciBtb3JlDQo+PiArICBjbHVzdGVycy4gVGhl
c2UgY2x1c3RlcnMgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gcnVuIGluIGFuIEFzeW1tZXRyaWMNCj4+
ICsgIE11bHRpIFByb2Nlc3NpbmcgKEFNUCkgbW9kZSB3aGVyZSBjbHVzdGVycyBhcmUgc3BsaXQg
aW4gaW5kZXBlbmRlbnQNCj4+ICsgIHNvZnR3YXJlIGNvbnRleHRzLg0KPj4gKw0KPj4gK21haW50
YWluZXJzOg0KPj4gKyAgLSBWYWxlbnRpbmEgRmVybmFuZGV6IDx2YWxlbnRpbmEuZmVybmFuZGV6
YWxhbmlzQG1pY3JvY2hpcC5jb20+DQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBh
dGlibGU6DQo+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jDQo+PiAr
DQo+PiArICBtYm94ZXM6DQo+PiArICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgIE1pY3JvY2hp
cCBJUEMgbWFpbGJveCBzcGVjaWZpZXIuIFRvIGJlIHVzZWQgZm9yIGNvbW11bmljYXRpb24gd2l0
aA0KPj4gKyAgICAgIGEgcmVtb3RlIGNsdXN0ZXIuIFRoZSBzcGVjaWZpZXIgZm9ybWF0IGlzIGFz
IHBlciB0aGUgYmluZGluZ3MsDQo+PiArICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbA0KPj4gKyAgICBtYXhJdGVtczog
MQ0KPj4gKw0KPj4gKyAgbWVtb3J5LXJlZ2lvbjoNCj4+ICsgICAgbWluSXRlbXM6IDENCj4+ICsg
ICAgbWF4SXRlbXM6IDUNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgTGlzdCBvZiBw
aGFuZGxlcyB0byB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgYXNzb2NpYXRlZCB3aWggdGhl
IHJlbW90ZXByb2MNCj4+ICsgICAgICBkZXZpY2UuIFRoaXMgaXMgdmFyaWFibGUgYW5kIGRlc2Ny
aWJlcyB0aGUgbWVtb3JpZXMgc2hhcmVkIHdpdGggdGhlIHJlbW90ZSBjbHVzdGVyDQo+PiArICAg
ICAgKGUuZy4gZmlybXdhcmUsIHJlc291cmNlIHRhYmxlLCBycG1zZyB2cmluZ3MsIGV0Yy4pDQo+
PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIGFueU9mOg0KPiBJcyB0aGlzIGdlbnVpbmVseSBhbnkg
b2YgdGhlc2UsIHdpdGggbm8gcmVzdHJpY3Rpb25zPw0KPiBDYW4geW91IGhhdmUgcnNjLXRhYmxl
IGFuZCBmaXJtd2FyZT8NClllcywgaXQgaXMgcG9zc2libGUgdG8gaW5jbHVkZSBib3RoIHJzYy10
YWJsZSBhbmQgZmlybXdhcmUuIFRoaXMgDQp0eXBpY2FsbHkgb2NjdXJzDQp3aGVuIGVhcmx5IGJv
b3QgaXMgdXNlZCwgZm9sbG93ZWQgYnkgcmVtb3RlcHJvYyBzdGFydC9zdG9wIHRvIGxhdW5jaA0K
YWRkaXRpb25hbCBmaXJtd2FyZS4NCg0KSG93ZXZlciwgdGhlcmUgYXJlIGEgZmV3IHJlc3RyaWN0
aW9ucyB3b3J0aCBhZGRpbmcuIEZvciBleGFtcGxlLCB2cmluZzAgYW5kDQp2cmluZzEgbWVtb3J5
IHJlZ2lvbnMgbWFrZSBubyBzZW5zZSB3aXRob3V0IGEgYnVmZmVyIHJlZ2lvbiwgYW5kIGF0IGxl
YXN0DQpvbmUgb2YgcnNjLXRhYmxlIG9yIGZpcm13YXJlIG11c3QgYmUgcHJlc2VudC4gSSBjYW4g
aW5jbHVkZSB0aGVzZSBydWxlcw0KaW4gdjMuDQoNClRoYW5rcywNClZhbGVudGluYQ0KPj4gKyAg
ICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaW9uIHVzZWQgZm9yIHRoZSByZXNvdXJjZSB0YWJsZSB3
aGVuIGZpcm13YXJlIGlzIHN0YXJ0ZWQgYnkgdGhlIGJvb3Rsb2FkZXINCj4+ICsgICAgICAgIC0g
ZGVzY3JpcHRpb246IHJlZ2lvbiB1c2VkIGZvciB0aGUgcmVtb3RlIGNsdXN0ZXIgZmlybXdhcmUg
aW1hZ2Ugc2VjdGlvbg0KPj4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogdmlydGlvIGRldmljZSAo
dmRldikgYnVmZmVyDQo+PiArICAgICAgICAtIGRlc2NyaXB0aW9uOiB2aXJ0cXVldWUgZm9yIHNl
bmRpbmcgbWVzc2FnZXMgdG8gdGhlIHJlbW90ZSBjbHVzdGVyICh2cmluZzApDQo+PiArICAgICAg
ICAtIGRlc2NyaXB0aW9uOiB2aXJ0cXVldWUgZm9yIHJlY2VpdmluZyBtZXNzYWdlcyBmcm9tIHRo
ZSByZW1vdGUgY2x1c3RlciAodnJpbmcxKQ0KPj4gKw0KPj4gKyAgbWVtb3J5LXJlZ2lvbi1uYW1l
czoNCj4+ICsgICAgbWluSXRlbXM6IDENCj4+ICsgICAgbWF4SXRlbXM6IDUNCj4+ICsgICAgaXRl
bXM6DQo+PiArICAgICAgYW55T2Y6DQo+PiArICAgICAgICAtIGNvbnN0OiByc2MtdGFibGUNCj4+
ICsgICAgICAgIC0gY29uc3Q6IGZpcm13YXJlDQo+PiArICAgICAgICAtIGNvbnN0OiBidWZmZXIN
Cj4+ICsgICAgICAgIC0gY29uc3Q6IHZyaW5nMA0KPj4gKyAgICAgICAgLSBjb25zdDogdnJpbmcx
DQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gbWJveGVz
DQo+PiArICAtIG1lbW9yeS1yZWdpb24NCj4+ICsgIC0gbWVtb3J5LXJlZ2lvbi1uYW1lcw0KPj4g
Kw0KPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gK2V4YW1wbGVzOg0K
Pj4gKyAgLSB8DQo+PiArICAgIC8vIEVhcmx5IGJvb3QgbW9kZSBleGFtcGxlIC0gZmlybXdhcmUg
c3RhcnRlZCBieSBib290bG9hZGVyDQo+PiArICAgIHNvYyB7DQo+PiArICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwyPjsNCj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPj4gKw0KPj4g
KyAgICAgICAgcmVtb3RlcHJvYyB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNy
b2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jIjsNCj4+ICsgICAgICAgICAgICBtYm94ZXM9IDwmaWhj
IDg+Ow0KPj4gKyAgICAgICAgICAgIG1lbW9yeS1yZWdpb24gPSA8JnJzY3RhYmxlPiwgPCZ2ZGV2
MGJ1ZmZlcj4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmRldjB2cmluZzA+
LCA8JnZkZXYwdnJpbmcxPjsNCj4+ICsgICAgICAgICAgICBtZW1vcnktcmVnaW9uLW5hbWVzID0g
InJzYy10YWJsZSIsICJidWZmZXIiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAidnJpbmcwIiwgInZyaW5nMSI7DQo+PiArICAgICAgICB9Ow0KPj4gKyAgICB9Ow0KPj4g
Kw0KPj4gKyAgLSB8DQo+PiArICAgIC8vIExhdGUgYm9vdCBtb2RlIGV4YW1wbGUgLSBmaXJtd2Fy
ZSBzdGFydGVkIGJ5IExpbnV4IChyZW1vdGVwcm9jKQ0KPj4gKyAgICBzb2Mgew0KPj4gKyAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsN
Cj4+ICsNCj4+ICsgICAgICAgIHJlbW90ZXByb2Mgew0KPj4gKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibWljcm9jaGlwLGlwYy1zYmktcmVtb3RlcHJvYyI7DQo+PiArICAgICAgICAgICAgbWJv
eGVzPSA8JmloYyA4PjsNCj4+ICsgICAgICAgICAgICBtZW1vcnktcmVnaW9uID0gPCZjbHVzdGVy
X2Zpcm13YXJlPiwgPCZ2ZGV2MGJ1ZmZlcj4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDwmdmRldjB2cmluZzA+LCA8JnZkZXYwdnJpbmcxPjsNCj4+ICsgICAgICAgICAgICBtZW1v
cnktcmVnaW9uLW5hbWVzID0gImZpcm13YXJlIiwgImJ1ZmZlciIsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJ2cmluZzAiLCAidnJpbmcxIjsNCj4+ICsgICAgICAgIH07
DQo+PiArICAgIH07DQo+PiArLi4uDQo+PiAtLSANCj4+IDIuMzQuMQ0KPj4NCg0K
