Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E001C6FE1;
	Mon,  1 Dec 2025 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605104; cv=fail; b=S2FcmxjWOKHJUdoI+Ym2mzZCbUjLQ893FdHEreaPHBzpDRoXAPtwlmCJki8+PUV+KESTyESEqPLK7jCFudXb15uxvgNcJBhmZReKPLDD76hMAkF90sIkrx3MSMvWRgSjcNVC1j7UyixhepFmgDYIwStvWBZ0vpa5zLA8+9ACRWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605104; c=relaxed/simple;
	bh=/kWv9XBBzIrhVSSMWBsdxEKtnS6zrTuARYSq8S8D+ko=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uz6YGmRYcu95p9d6CU2VggUBwRvDUqKjIv7RMPAiqM/JAPLlwK5afu3a51+ZTfafgR7mVqCtXCRcy6kT9s0BPGwOPVFY8J8XXA/ujwvZrPDFqeU/8CFsOYuhAg2shefE6M/XkDUv7625gYNn1LPNseOewZeLN7VhKAo/cR+BTk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GY+SGx28; arc=fail smtp.client-ip=52.101.62.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GY+SGx28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dStkKpe2IRw/2KCB8lmgihgqZ7GwjnW+yWrBPI90OkcrQoCjwHq59R1AEc78QmSIdd+JhMep3tF10f1e9TPDtbIU+29mX7uGK1gWmWpXVOs2mCu9REtvZ1sePE7IUMSstDYqYpa/U5/o7ocAdK5YzJYzQHTJngLE+3+DCzCvbLncuyeLk+PFSQzpYLTHN+k2v3JQeYXRdn4aLSiUkaXjMmroSWxSp8ucCqm48HS/SsvvCk8DnD+m+LVgpsTS+fFQTuRVk2oVFinrzfmw8Sd/FqFKBM6ptYOpDJdlSfgk4JCs4a/NdWrYBLqZkNPGlupWSYY2IHigV/Rb2Au29MlrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kWv9XBBzIrhVSSMWBsdxEKtnS6zrTuARYSq8S8D+ko=;
 b=auWL0O5nEfCSc2Nh7LjhChnAsrJZHFmAdYoI2bGCS6+GJwaThGXfrWx635QnYerPVYj4gSj7O/tIGHH7dauaM/d7ow6mh4Vd8ToAqH9sRPz1hNpWEmG/GTks9pd+vH+AVZkMW1ofDUTqyPnv5xZIQRyhxEae6YZek+5T9pDxJ4DJxwHOSugmncR4pkgMJMKeTq6ETOlsomkYYOm25cOutm1rlC+tfNyGYFBqVG2KFwdhKorQRPi0YoNJOJsxj13vSztbAk4uGC83gkF2MK8ijhtdXEkwjM7aMfyPYaTmZHmvf9EiVxlTgsg5kXyeqsFpcvnujIUjnpvBHP+EtP1fCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kWv9XBBzIrhVSSMWBsdxEKtnS6zrTuARYSq8S8D+ko=;
 b=GY+SGx28cFdsZKLRog0N7Rp4+bVC4WZYqZIwexWZg5WXDbRstD9rqQRqoTgblTzjej5WKc9ByffR8Yw3J4mNt6wSIT2rl+0LUiQJ7jM9NKwIwZ1GjZJsBUdPqAKIECrm3g3+8VC/lkbItueSEjXmeZneh4BBqa2HFmM4yhuSyT/iBIsQETF8nAJN+F0M6I8Gp/GP/YXdQGSPfU/KH3hWb9STWZtFpJsGli6F6fW/RbVLPxn8uNIK7TafP8XpAH3LEMRO9vDEwDaM6M3kD0GVx+bJdgkyvVK97nbZgqMQKRrZJoqHD2J36ev6M6R57xcVSBf6jAlb7KdOYKh6q3pjeA==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 1 Dec
 2025 16:05:00 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:04:59 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <krzk@kernel.org>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Thread-Topic: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Thread-Index: AQHcWvJVHQmh3Xm5rk+DNxpoga8SSrUDKuuAgAnXrIA=
Date: Mon, 1 Dec 2025 16:04:59 +0000
Message-ID: <3e9f2caf-e3c6-4b59-b4e2-431e796399d7@microchip.com>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
 <20251125-aromatic-savvy-eagle-b81696@kuoka>
In-Reply-To: <20251125-aromatic-savvy-eagle-b81696@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|SN7PR11MB7973:EE_
x-ms-office365-filtering-correlation-id: 2bea70d3-3455-4514-c345-08de30f36114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dGdRSGs4d243T0lkNEozelRNTGx5dkhRTk9ndUVKdC80UCtvSGw1OHhMNEhp?=
 =?utf-8?B?TU40ZTVhQm1iWG9IelFVZDlqdEN0T2ZnRURGYVJCd082S1VTV1M3RnNXK2di?=
 =?utf-8?B?OFc5YVhOZTZGUGdrRDNERC8ybnZkT2lJeVRPY0xiMFQzSDhSOXU0UWMyRUhq?=
 =?utf-8?B?UFNaK3hKT09QekNRanA2Q05OK25Oam1lN1YrOHdEcytMdWdxTFl6c2xvUFRE?=
 =?utf-8?B?MmFPaU5tYUtjb1ZWWEJMcjROc093c2VPQ05uVDhrWkhyc2RYQ2MydmRkREdt?=
 =?utf-8?B?ZUI2UThIV2xZSDRBbkhUR3hiU1d5djJPOEJqOVRMTFFEUzMyeis1OXBjSk5F?=
 =?utf-8?B?WGlsMC9pcklJUzJzWjhMK1BvbCtKZU1xbmZ0MG1LZElDOGFwbVhLVHltR3NI?=
 =?utf-8?B?Yk1Bd2I4SVRmK2Zsb2twL2l1RHBSdE91dUVxSUFqa1Y2SzFENEE1eTcyTGRx?=
 =?utf-8?B?cnhmOTVCb1BxOCtvM0VsY3lVT3dPeU1ZcnVpMWx0Qk5uenZKMDRScnVnSXlu?=
 =?utf-8?B?c1Ura1U2eFNWSWJLMnRJcDZHdC9JTkYyWk9BVVBmUEp3SjFOb1RLaFJIN3Fp?=
 =?utf-8?B?ODk1V09GaUc0ZXc1ZXRrc0lwZFkrQzhxRzltZ01FVytvS3NYeEw3bjA5VHYw?=
 =?utf-8?B?YjNLam1vRTFHeFRlMDBZekV6QTRqSllvbGJPUm1Ubk1xL2pzL2hrMHJzRDJH?=
 =?utf-8?B?SXVIOW42ZmE5c2dKSm9naGFIcVgrYlB3KzVza1hBN0cwWHFKaFdUQlh4T1RJ?=
 =?utf-8?B?cmt4OVdpWUlKQ1M2Z2o1QWJJekZDZFd3STRJR3dQZnpwc1p0MkVwK2M5RlZU?=
 =?utf-8?B?QlU1TUh2WVc5M2JUZEg0bXYwUFFIK0tvTUNyVm42WjRrSE85UFhDZmo2V1d6?=
 =?utf-8?B?ajdZbzI2QXFvc1VaRkt5U0Y1TTNLRWsyRzMyQmhGL2wyeDBDSUo5ekVPeWxN?=
 =?utf-8?B?MXFveHdjRmNpeTRrOXJNVEN1cGdpVkZCSzFJV3hKaUZDZWYxVitZbFM4OE1m?=
 =?utf-8?B?anQyTzJ1eERZMHRkR3Z0Q2hQMXRpRWFuTjB5aWx2aVIvem1iTC9OU09HMTRM?=
 =?utf-8?B?K1FZZGprdkxNamJjNU4xbVRsWWpEWjBOSXpkQ1lTVHlnTHY4MTRMdmc1Q1VG?=
 =?utf-8?B?eUJrMGVtNWVhWG1VNWFDcHJ2ZEh5YU5BN01aYVczNSs2Tk1mejJ6MWtOb05u?=
 =?utf-8?B?WjY4SVhybmtZMnk3RVo2WW0zSEJxUDl4WDA5eklETnZSS2ZMZWNsNk5wQisv?=
 =?utf-8?B?SktMYnh0YnJCQ0F6cTFSalpFb3ZRbjYvak8rWHFNa05LUnhoYUFpVkp3NklH?=
 =?utf-8?B?dDUzclNRTjI3eEZvdTlrcTdPSG95UDJZdVlUZlhjbmNCaTFaemNGNXRycUZR?=
 =?utf-8?B?bmpjN21KNW5VOENLcHc2dlBrWWwwSHlkamdZWGh0ZnBqMUh5SXpFWmRFWjVw?=
 =?utf-8?B?VVN6ODBFNmtRK0VNQzY0QmhiQXkyNWR2WXBvY0VlSlpkMGt0MFcraThvOEVT?=
 =?utf-8?B?VnQ1SmwwZUxBd1pwUUhPU1orRkZZUXhHUFdualNTaEIyRG5SR2pyR1dFYXdO?=
 =?utf-8?B?NmVkUE9GVkdidmhoSzRnejlzNEQzby9vRnBhSEVMY0N2SnA5VXVubktlMXZS?=
 =?utf-8?B?WVNwamNWUGFNdW5WY1JaRkI1M3EyYkIxcHlsTWF4NkprNDBMeEFVSThSdzc2?=
 =?utf-8?B?N1ZnTkR6WGlodGltRVJyMkkvZ2toSW4wdTBwN0p5WktpV3BHTlVkbFREUXNP?=
 =?utf-8?B?alBrWURqU09VOE0ySlppeFVSZENLNkpPWFlML0hvTHYyQzNQSjcrSHB2VW1Y?=
 =?utf-8?B?T2M4R1h1UEVWam84blBtYm1KM29aSk5GZmVkci9tZlFuSHlqRXNkc056aVpQ?=
 =?utf-8?B?WkpvMnc4YldaeWR3YUtobmdha3RYK1hRdU1McnRpaEN6eWdXeEY2WFlGYVlj?=
 =?utf-8?B?TjhFdlNKbHB1cXBrcWJWM1pFbTYrOEpvVGxUSWhGd3JCK2t3KzVRbWlZZU4w?=
 =?utf-8?B?TTlrUFNXMWRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUlGaUJFUHptYm9BWWV0WGxLSHNoUmZKbzNPVkRYVU1oSWFGUHdLb2NVNEs0?=
 =?utf-8?B?OVRZRjhHOUNzTzZIMGJMU1RqREFwcXNoazAydVdtOXpLYXkzdkpFTjk4ZzA2?=
 =?utf-8?B?UUIwQ1RpR0pZRWN3NEJLN0VUTjRsdUM3K21mdnZiSWNCRU1SNGNaZkRiVGlx?=
 =?utf-8?B?OXBVNXJhb1hQTnZUMWVqSHdDbHVtSnJGemF2TXlzelh5TnZlN0J6T3I1QVV4?=
 =?utf-8?B?VTdLQmRzOXdDRm55cEk1WG1ycUNUVkJYcnBFN0UveUNvVkhqN2JJRW5VUHRG?=
 =?utf-8?B?S2w3a2NWZnFuVm13WThua0QrU0RYZUE0WGh5dGxmd2lrZWFnQm9CS0lPQkMr?=
 =?utf-8?B?emQxZ2IxeTVBZW1oSXI0TVNZdXdZOVBSaE9pckJ6TnBHTWFLMTlDWkRZa1Br?=
 =?utf-8?B?SHFqc2tiVWFrVWZaL01oaFI3NStIVkg2ZXdxa1lQMUcxd2d4MnRONklyaWJM?=
 =?utf-8?B?NU01QWZ5VHR6YzFxQ1R4NnZMM0Z0ZStLcFFkVksxTEU3VnhRQkZKZDVWNG1H?=
 =?utf-8?B?aVFUTVRkdjU1bWFzZW90a08xTUdwQTB1UkY2dGhSbzNVZ01sbXdzMS9xVFhz?=
 =?utf-8?B?YXNvbTBXdDJaQnh6ZG1aQVFsYllFMnQ4SVZabUtKem05bjR0NWdSdXRDOGk1?=
 =?utf-8?B?dU40Mld5SEV1K3ZxdzFXbkw3WGFTZVdNTStJYm12NnZZUHg5MUx1NGZkeWdi?=
 =?utf-8?B?RDhhYktWWCttQ0dvc3JmU1VtRFEvV1FMZDZ3cGgxM05sWk83NDFIZUhCMkNp?=
 =?utf-8?B?UlN0eitLalYveTRLNHVCOXI2K2JaRHNXdXBOdUlHdjhNbjJEbXdmZHpnd1dG?=
 =?utf-8?B?RHN4eGVWcUJRQW5yRmhBOFNVclNTS2VOUmdWK2RGRHM5MzNvVmJROXFaZmxR?=
 =?utf-8?B?TTRZR2xtVlo1Rmlpb3FBUnNNS0F3YklDMDFzcGcxMTU2NGZpeXRYdjVQZjNC?=
 =?utf-8?B?dG1RSERiVldLd1BzaDZPemdYNVhLUWZqcFY0WktqYkNsMnFyVy9zK3V5dFJW?=
 =?utf-8?B?WURtZUZ0RVRCdkJ4T1BUZElPb0k4K1ZlU05PMFJvQy9vQW5pNGx6UTVpK2F6?=
 =?utf-8?B?azdSWEZFaXFSdWdCNG52NjM0YTNXNHRHNzVvaXJhWVlJWFNOWDdZbndTS3Zw?=
 =?utf-8?B?Q0JIdllSOWpTUlNlWEZXSk1waW9EYndZMWJNRE9YUVJvMCs5UVdYL0pSaXlM?=
 =?utf-8?B?Vm96L2N1NG1kSDRuUjVNbzJlRU5CYUVjL1VWYTAvYzk2aUlVWUVpZS82clRn?=
 =?utf-8?B?NkdIMkRIRGtqcHdOajFrVWJPb3FkdnFON1hwcEdWNTBSWlM1Z1Z1MEdRSm5W?=
 =?utf-8?B?UDdycjREbk1haDFKeVB0dU9XTEZVMDdwdnJKRDRlZGpUeFpTRVowbVJNZEpP?=
 =?utf-8?B?dlIzZGRkQ1hKTjlyTjY1RFAraWVzYUR5QTFjWFo5RHlIaDFvVDM2bFBsNHl0?=
 =?utf-8?B?RzVnS1NyZ2xlUjREY2NqNGVjaWhENStvWXRQb2VyRitDLzl0L0ZlNDdObTdE?=
 =?utf-8?B?aHRPb3JYSmhvaENRQWtYdnFNdlExZ0xkS1V5LzE1RGw3ckU0QVp1TVVhWTdK?=
 =?utf-8?B?OVFXU0dsRlQwTkl6SHlhdWpqVzlQWjNLNlFwcVB4Ny9QdFN5NDM3N3l5Y1hx?=
 =?utf-8?B?NjNwUnpVcWYzdTNneng0cHlBUy9xY20xblBzYS9FaDBRUE0rUExzRTV6b0N4?=
 =?utf-8?B?eWhHdkRkdUVVWVV5QStUY1pVem4zVDhYRi9MWi9JUFd5MExacktDdVdLVUJR?=
 =?utf-8?B?TlNSeENtVFIvNEFaZUJQTWhmbUswSERoT1lNYzBGMjZjUzc0QU9NS05uWGds?=
 =?utf-8?B?NWs3anJXWUpoZzR2SFVKWmdDem1YRlc5VjBaK1l2eDZ2dHVuZ2JkNEJ1ZkI5?=
 =?utf-8?B?VzhFbWFxSlk2V1RFYVdDM0x3VmxObjF4MHAzeHNEWmhaeGphdzJTOURESytq?=
 =?utf-8?B?c3JYbnVWcnJNM1FQVzRBL0R2OVNndy80TjFIdDlFSGp2L0ZNODFvZjQ0YU12?=
 =?utf-8?B?bnltZUJOM1lJT1hSY1VsaEFWOHJ6ZTdiOUg1VHNDV3huNUdUc1NVZ2pHVXpO?=
 =?utf-8?B?TUtBaTZMamxKZDNrdFp2Zm1JOXl4dUZDMm11bzg4NjNhTWdURDgvc2lpSTFD?=
 =?utf-8?B?cTVEeGd5Z3d1OGliTkdTRkFuTFpyWHVXekNNcVg0eWRLaStDejMxOHNHVVhu?=
 =?utf-8?Q?eLD9z+OsGFiZMed3ZUcOJBg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A19B5786087F964C8E1DB7128D9DCC87@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bea70d3-3455-4514-c345-08de30f36114
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 16:04:59.7095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWJWbcSak3zey1eIB/QMKThQDy2Lq9jCcBHf9kuHO/iIuuu4Gzdm9NNopkPmIRYX16l5AqqwvuqPeqBSQ/l7jFbQ6j/ffhn0c2XybDSafEHDoC7daRyvU82jvfYpM61r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973

T24gMjUvMTEvMjAyNSAwOTo0NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+DQo+IE9uIEZyaSwgTm92IDIxLCAyMDI1IGF0
IDAyOjIxOjU2UE0gKzAwMDAsIFZhbGVudGluYSBGZXJuYW5kZXogd3JvdGU6DQo+PiBNaWNyb2No
aXAgZmFtaWx5IG9mIFJJU0MtViBTb0NzIHR5cGljYWxseSBoYXZlIG9uZSBvciBtb3JlIGFwcGxp
Y2F0aW9uDQo+PiBjbHVzdGVycy4gVGhlc2UgY2x1c3RlcnMgY2FuIGJlIGNvbmZpZ3VyZWQgdG8g
cnVuIGluIGFuIEFzeW1tZXRyaWMNCj4+IE11bHRpIFByb2Nlc3NpbmcgKEFNUCkgbW9kZS4NCj4+
DQo+PiBBZGQgYSBkdC1iaW5kaW5nIGZvciB0aGVzZSBhcHBsaWNhdGlvbiBjbHVzdGVycy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbmEgRmVybmFuZGV6IDx2YWxlbnRpbmEuZmVybmFu
ZGV6YWxhbmlzQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL21pY3JvY2hpcCxpcGMt
c2JpLXJlbW90ZXByb2MueWFtbCAgICAgICAgIHwgOTUgKysrKysrKysrKysrKysrKysrKw0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbWljcm9jaGlw
LGlwYy1zYmktcmVtb3RlcHJvYy55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL21pY3JvY2hpcCxpcGMtc2JpLXJlbW90
ZXByb2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9j
L21pY3JvY2hpcCxpcGMtc2JpLXJlbW90ZXByb2MueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQ4OTAyZjlhMjAyDQo+PiAtLS0gL2Rldi9udWxs
DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9t
aWNyb2NoaXAsaXBjLXNiaS1yZW1vdGVwcm9jLnlhbWwNCj4+IEBAIC0wLDAgKzEsOTUgQEANCj4+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL3JlbW90ZXByb2MvbWljcm9jaGlwLGlwYy1zYmktcmVtb3RlcHJvYy55YW1sIw0K
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPj4gKw0KPj4gK3RpdGxlOiBNaWNyb2NoaXAgSVBDIFJlbW90ZSBQcm9jZXNzb3INCj4+ICsN
Cj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsgIE1pY3JvY2hpcCBmYW1pbHkgb2YgUklTQy1WIFNvQ3Mg
dHlwaWNhbGx5IGhhdmUgb25lIG9yIG1vcmUNCj4+ICsgIGNsdXN0ZXJzLiBUaGVzZSBjbHVzdGVy
cyBjYW4gYmUgY29uZmlndXJlZCB0byBydW4gaW4gYW4gQXN5bW1ldHJpYw0KPj4gKyAgTXVsdGkg
UHJvY2Vzc2luZyAoQU1QKSBtb2RlIHdoZXJlIGNsdXN0ZXJzIGFyZSBzcGxpdCBpbiBpbmRlcGVu
ZGVudA0KPj4gKyAgc29mdHdhcmUgY29udGV4dHMuDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+
PiArICAtIFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5kZXphbGFuaXNAbWlj
cm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+
ICsgICAgY29uc3Q6IG1pY3JvY2hpcCxpcGMtc2JpLXJlbW90ZXByb2MNCj4gVGhpcyBzaG91bGQg
YmUgU29DIHNwZWNpZmljIGNvbXBhdGlibGUuDQpUaGVyZSB3YXMgc29tZSBkaXNjdXNzaW9uIG9u
IHRoaXMgaW4gdjE6IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMDE1LWRpc3Ry
dXN0LWNoYXR0eS05ZTcyM2U2NzBmZWZAc3B1ZC8NCg0KVGhlIGNvbXBhdGlibGUgaXMgaW50ZW50
aW9uYWxseSBnZW5lcmljLCByZXByZXNlbnRpbmcgYSDigJxnZW5lcmlj4oCdIFNCSSBlY2FsbA0K
aW50ZXJmYWNlIHRvIGEgc2V0IG9mIHJlbW90ZSBwcm9jZXNzb3JzLCB3aXRoIHRoZSBwbGF0Zm9y
bSBhYnN0cmFjdGVkIA0KdmlhIFNCSQ0KZWNhbGxzLiBUaGUgSVBDL0lIQyAobmFtZWQgZGlmZmVy
ZW50bHkgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQgaXMgUlRMIA0KZm9yIHRoZQ0KRlBHQSBmYWJy
aWMgb3IgYSBoYXJkZW5lZCB2ZXJzaW9uKSBpcyBpbnRlbmRlZCBmb3IgQXN5bW1ldHJpYyANCk11
bHRpcHJvY2Vzc2luZywNCndoZXJlIGEgc2V0IG9mIGNvcmVzIGNhbiBydW4gb3RoZXIgZmlybXdh
cmUsIHN1Y2ggYXMgWmVwaHlyLg0KDQpVbmxpa2UgcGxhdGZvcm1zIHdpdGggYSBmaXhlZCBEU1As
IHRoZSBjb25maWd1cmF0aW9uIGhlcmUgaXMgdmFyaWFibGUgDQpldmVuIGZvcg0KYSBzaW5nbGUg
U29DLiBGb3IgZXhhbXBsZSwgd2hpY2ggbWVtb3J5IHJlZ2lvbnMgYXJlIHVzZWQgZm9yIHRoZQ0K
cmVtb3RlIGNsdXN0ZXIgb3Igd2hpY2ggbWFpbGJveCBjaGFubmVsIGlzIHNlbGVjdGVkLg0KDQpC
ZWNhdXNlIHRoZSBjb25maWd1cmF0aW9uIGNhbiB2YXJ5IGV2ZW4gb24gdGhlIHNhbWUgU29DLCBh
ZGRpbmcgYSANClNPQy1zcGVjaWZpYw0KY29tcGF0aWJsZSBzdHJpbmcgcHJvdmlkZXMgbm8gYWRk
aXRpb25hbCBjbGFyaXR5LCBhcyBpdCBkb2VzIG5vdCANCmNvcnJlc3BvbmQgdG8NCmEgdW5pcXVl
IGNvbmZpZ3VyYXRpb24uIFRoYXQgc2FpZCwgaWYgU09DLXNwZWNpZmljIGNvbXBhdGlibGUgc3Ry
aW5ncyBhcmUNCm5lZWRlZCwgSSBjYW4gYWRkIHRoZW0uDQoNClRoYW5rcywNClZhbGVudGluYQ0K
Pg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg0KDQo=
