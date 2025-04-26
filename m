Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453323C9;
	Sat, 26 Apr 2025 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745675230; cv=fail; b=O2Aqypv/wmJ7WcfhjpzZmvO9t3Tqt2YcpJZA0heYaAtEJesFjPZNdOzeGJG5i+qC+T19rqCJDu31bxZKQVzzZg4hgX17qbl8n/nQQ+bErrYKlaXZvKpQoRPleEs10GEIyK4B5a1Lhr1qUzwJ78v7aTbhsYvAB/6Frb4YvFbpkzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745675230; c=relaxed/simple;
	bh=CK7SHxC5L6JSmhdcUnE4q2ZQnpTUyvMvxTlxAwvZF1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m5QUhVfrs5s0FOBagegfy5Vz4rT6wBeMeyVaSgeg8ufhCQAbQkCAruUPmCWiJEHAqZkuVRuA+IVbIIfu/RRUxaRVj/jizX2s3ghZtyqSa9mcXpVF6vpgifZrTVzsxJpd2YKIo/VvLoXH4D1Lw8VThJ+FtpLnz5l0fVG/medhiHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QCnxZs032717;
	Sat, 26 Apr 2025 13:46:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq18kd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 13:46:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL2Lb545oAP5WsYu6EFvCM09bH/mYEevx9+nHRKl0Z/d1pFjlvPwoZHYQox+8plzWvbhGxureVwT49Rlz+JlE3rBB0CDzLqJdIQSBs0zZzMnDyst0WaEUNWmGPloFPHsa8Ver6kXCVRpXz8o/NHDTCwuSWs6nOX/1W7EAoQlin2UVjblFq/5xCs8GPj5ToGYmiy9o7jt9IVHZwEcAXm7JlFn5Y2wr9OVQDrgZ5FVwo7GhG4PNmMMoxjg0DxiYf323XauyWmrJ77fvcRMvLrnsW0MZbjnTv+MP0TsriK2Tr/kyCIbx9KhVgEtM1iaM1K5HKQZlizbGE7yD8VmN+zUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzS7105RXYjTXsphPOjRNtjgaQ6viE1s1lFxLsQDIWo=;
 b=jGxO9ehjzLd2kuo2DDvegimrmVlHjqbCkqDoA+CiN7SknT1kWfBQAQI7lBiLhTSAHBzxXv4YwWpJkiw7SGJLF2tHm8xMHdALw27tZIdnyvr5aBf5BdE6CdOOltd79LxEgsfbKRVm7Weop5NK9jP/kA0gpBpJC+GjMRutg24EmhCaIQGavgtPFD920ikJOV9Xl9TSrhOIPcBxEpOsrORTgZlH5i6FX786HxUKGj/Grm8aOyR5UXTN1jLN4/0D19jlZMrnK9ap3vF7LNd3cfdD0Kn02Nt1JzH0sBpVHqdky468FBUem17CWl+jyWCiiapgBJKYJTLaoYAD2uOaUMT1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Sat, 26 Apr 2025 13:46:45 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 13:46:44 +0000
Message-ID: <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
Date: Sat, 26 Apr 2025 21:46:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
 <20250426131804.GA13806@nxa18884-linux>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20250426131804.GA13806@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c86e15-089e-4af9-1ced-08dd84c8c847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEp1bllCenowc3FFL2hzRmFaV3ZnMk9NdE5lYVRiUjZBeHQ1L1pwK3ZoUi9q?=
 =?utf-8?B?RUZaanBEWDU5Y1RFTG5LTFRXcHkzRWVCdXgwUFV3ZFRHYXN2TnE4LzUxQito?=
 =?utf-8?B?VzF5Y3BLOUx3bU4rTEsxaEN3bjI3aVdNVnVoTUh3enphNmw3SkVzVzc3NHhr?=
 =?utf-8?B?VUZvNExTRGMzNVpNZ3Fad1UvNjJtbkhiZmtVeWNTYjh0bEo0RkRqK0F2OUhE?=
 =?utf-8?B?NWw4OWlkdkZRbEJ0TFB0dWNlS3VVMmY4QlhhOExiRS82UmdVNnVlWFE5dFVO?=
 =?utf-8?B?Ly8rWE1wSHZiNXVhNzZMNGxUUnJPV2kvNjZjcllOMEtrOWFXN0JGR3BOdlRu?=
 =?utf-8?B?N2U1L056N3liR25BQWhFT0dqdE9vcm93UEQ2eGxvdkJLbTZhOHhHRXZ6cnhZ?=
 =?utf-8?B?WU40OEw0SkdzMElZZUVaTFhFeUlXTFNpNlEzaDVIZ2JvT1FrMnlhQkFNa2dp?=
 =?utf-8?B?TjU1Wi9PeUQvUkl6V1hseGJMRkZzWFhGYkpRMnBZTEtvaU1MQll0UEVDaEdm?=
 =?utf-8?B?STYrVWF0dUNZTHE3NkFBd2EwWHAxVmdlUEJPZkZMYWlWSUFTaUVaTCtiSXJN?=
 =?utf-8?B?QWpTampXMi90cldFL2xvdkVUTzlzUGxqQzBuRmlBRUJVUmgrdU1idUFwSWpU?=
 =?utf-8?B?cFZVQ2hEaHlQTkNjZkh3Y1hMS0tZMld4a3gzdDUzak15YmF4RjhvVXozUTQz?=
 =?utf-8?B?WG5wRG1SYWZDRTJNa2RzYWUwZzdaRnl3Vm90LzBVUVoxTzlabjdIbDl4YlNr?=
 =?utf-8?B?dktCNU1TZmR6NWcxRGV3N3BjMDJ1dzIySG5GaFVGRGpzaDRDbklsK29VdmFB?=
 =?utf-8?B?TkhMdmowaEw5QVRvenNteDR0ZCt6Y3lLb0loazFiNEE2ZTF1dFlXUERRczNR?=
 =?utf-8?B?MlZwS2I0bEg2bmpKZzNmejNubFpRVDZYQzVnd1RuOWlMa09JbVBkMEtOcHI1?=
 =?utf-8?B?YTdGcW9CeG9jdVZIeXFnRWRmRUY0S2NLUUxIb2pySXd2WkdRTHZKY3dITDFO?=
 =?utf-8?B?T0ZKRXFyN2dpVUhobXBKVHJLa1RpOGFpS2dKeFYxVTdmamRLYllaM0x2aTR6?=
 =?utf-8?B?empNSXl5SDlGS3hJMEJ6TER1aktzR0pwMnVOODNndEFZb2RLUSs4S2d3MEVQ?=
 =?utf-8?B?L2xDekVxV2tySExxaW9kOEIyODl2V1Y3WCtjZFRzTjRQbDFXZ0lqNVIvUUla?=
 =?utf-8?B?Wi9yMjUwbFJjbGhTZUxMR3FqUWRadVhkNUVudjJKMExEbDVpRW91ZkdEdGs2?=
 =?utf-8?B?NG5adTFiK2NlSzBsTGpqdDgzaGpCNHZjNjBYQWNSbjhXQ2w2SndVZUwyQmVn?=
 =?utf-8?B?TU5HT3dyZ2JiYmx4NHBSUHFxOENZQUsrZkc2SkphZkcwbWIyNndLTFo1TVFn?=
 =?utf-8?B?VXlTZ1ZGaDVuVXpJVnZUKzBzbXFqa1hSY0tlTzlLNHA3UFdIOGw0REx5Ny9M?=
 =?utf-8?B?OE9pNm1uVkxPZ2RtYThucDBWakJyNVRDbHdQT1FhcHB3SG5JN0pPZU92OXc0?=
 =?utf-8?B?cStrbFFtOXdJWmJrdmVJSk82ZXJrbk9Xa3BCMmxUTUF4QTRzcnhHR0FPTkJo?=
 =?utf-8?B?UHdTTlFtT21LS2lzWWNSemxidnhIV2JKZGNhUklkOG41VnlWQzJnMzB0aGxD?=
 =?utf-8?B?dEh5aHNzdWFCbkwzc2lKTTRMUEV3WDU2eTBSaUNBb3hUeHQ2Q2s4YkVCNUhr?=
 =?utf-8?B?cDZ0ZkRDaThGN1MwdWdvdlFWTzhDMUtRNWp6U3B0dEU3VEMzOERrSW5PdjVa?=
 =?utf-8?B?ZThPYWdqUFJxVHRUb05IVnRFZUZEQ1h6ajFodTFpQ3YwUE1QTlI2anRQc2xU?=
 =?utf-8?B?VTd3U3pVc0hMYlRVSHN6N0RwV3JZdFU0VXdvYnRxYTYyYkZKQmpVZk5Rc1lW?=
 =?utf-8?B?VkRDZGt3NVJGWlI5eVBBb0l6dkFZeE9UNWxqUURHQkd6Q29rMi9wc1NOSGFM?=
 =?utf-8?Q?26Ujm5Lu8zM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUpldVdyL2V1YkNBVnpVNU1OU2RWRWRrRmwwU09OSFNKTkR1YlBGam0waUZ6?=
 =?utf-8?B?MTNZYzZNZy84WXZ1ckJqYWhiZmZRZ2k2NVhsSW1aMFJWeWFpYVdtRFNHUVFn?=
 =?utf-8?B?SWo2SnFEeDc1ZUk3SGxSdE1JbmhUbndzc3RneFh4ZTJqVWd5U28yMlpZTnBC?=
 =?utf-8?B?T3N4emhKaWd0TUJEZ042LzBWa3IrY2hJbWN4dU5KRTA5bHlvTDhSRG93VGo0?=
 =?utf-8?B?TVQ4YjNrNWRpSzgwYmw1TE5PbHZTZUYzV1pXUUwzMjNnZ21rNVBEMUJwTUcz?=
 =?utf-8?B?QmhtdWY3SkQ1SVNVbE9PajdDTmJvMkZKSkdWdW1yQ0VDU1Vka1c1VmM0SitG?=
 =?utf-8?B?VlU4Y3puaWsxSkFrT0RuOGRIdkpaeEMvVmxzalZqcG94NTZqL1ArRjFPbThK?=
 =?utf-8?B?d0M0WHQ2cThmdk5zNWM4dzhxTGJMV0FLL29CZEd1SVNhRzlZMFBiYmU0UXBI?=
 =?utf-8?B?bWNvamZPWjNoTFNSejE0eHhrcFhpT05oTVdqYnFiMWdZYjM2T01kWDM5VXo4?=
 =?utf-8?B?TUF0Z2xKNzlaMlZIaFVnL2d1TW00eUloK28rTzkwK2tMT0lvazR6N2VnNDNU?=
 =?utf-8?B?SGRpWWtMdWwxMXNUazhDNVVvYWJEVVNqUklHOUlMTjR3ci9Bc2lGMGh6OHFD?=
 =?utf-8?B?dHNPQ2pMRFVFNm9rVlU3bkg2aXYyRVkzMGdUNVRjZVZBYVlPUlFmOW9lMWVz?=
 =?utf-8?B?dnByN1lsMUhJSUJRcFpZNWp6Z3VHQ01QMG5FMnZQK2dveGFSbXo0eVlWeWRw?=
 =?utf-8?B?UnZ4MDd4T2ZOa2ZkN1I0a2JIU1VEZXAvdjhaRHFLYU1WSG8wWExKTnh0UEJz?=
 =?utf-8?B?Uy81Qm1hOUR5eExrWEo1QVpaUzVJTktpeU9vT080V0syZXdxaFgwQ1BFNXJR?=
 =?utf-8?B?cDk1VlhjTEtRT2ZPdFBjNmFENEpvdXlyUDhQUGoreSt4a29WT05MZTJwZjN0?=
 =?utf-8?B?eXZBSU5Xa0Y3Q3Yxa0hzWkJQSU1lMWw1NENiYlBjL0FuK3ZDcnd4V1M1RU9o?=
 =?utf-8?B?dnlyOXJWaWJsMm0yV3cxTmlNZS91TXVsYmU3MXUyaXQ3TmNlSFllZ0tWaFYy?=
 =?utf-8?B?NVplLzJZeU05ZnhtR084N1NxUkN2K1IzY3Uvb0RCUG1KK21Od0Q5TU1aVi9W?=
 =?utf-8?B?eFFmUVJ0Z0hSc3RzY2t3bVFsSWtLbS9oOVVkeHdFUUlMaWRxdXhLVWpmQTQ5?=
 =?utf-8?B?K3c2eWxaYmdEbUNCTVRGRFNIVTVCMktUdDZiU3lHTE5pdDBjeDAwVUpEaVJV?=
 =?utf-8?B?YUg1SWkzZUFLSmV2dEpHalV2WWxTdlJPMkpWTzlyS2lLekIzemFKY2Z3UjNZ?=
 =?utf-8?B?bzVycGREVzdGellySHJ3T0pTNStmdkVQOXB6WjFlQ3cxb0Q3b0EvbWlvYTBL?=
 =?utf-8?B?NiszRHlxWFZmQ2FPakdZU1JMbUZnMUpjUnhTNDJ6S2NpREt6U1p3NDBIeWph?=
 =?utf-8?B?QmdqQTdhdW51KzVrTFc0b1FHVXBjUXkwRUxhSFdSbXF4Q2ZEb01FbDJxa3dK?=
 =?utf-8?B?TldJTVN2MkFDTHFDYkpua3UyYmxWNzFtUFVjWUJmWmxVQUdlejR1UVFVVTVR?=
 =?utf-8?B?TmRHaFk2L3JreWJ2VExFWnYwRC9XVTMxUGc2MDd6OTlkQmNGOW16emJDWExV?=
 =?utf-8?B?VGYxZGwzOWh5cHdSeFVZRTJ2dUZKYk44M0VpV3ZSMlUrbW1iZkRFUnQwYXBm?=
 =?utf-8?B?UUk5R1VDSGJueVJLMTlSeDgzc2R5NHhpNGFKZDluS1VVUExDQytSd1FnL2ow?=
 =?utf-8?B?eVZZVnFRQStPUWJRa2szcTBkOVFEbVFlSGdCdzZZWkU4a3phckc4Z3IzejB6?=
 =?utf-8?B?bldUNTE5akR3ZmVzOU11b3ZDOGV0NnJLU0NlYjJIVkJoSFZzZ0xCRExmTUZw?=
 =?utf-8?B?dkxmV2hwTnB6eEk5ekkwQXA1czVYK1pnNnZ4QlZ2K1BEVXQzdWRwaDRaWkxH?=
 =?utf-8?B?eXdZUUpvdVhhMWJJNjRYcWI2V1Q5ZlhualZ2ZXJhWXp5SEVIaDh0VVBYUUxI?=
 =?utf-8?B?WitHRm1nM0pKczJ5MEZJR2svaWRTcHN5akpvbUhseUlSSG5USkM1M1Rna1ZI?=
 =?utf-8?B?NmVCYkJXMzhTVXROdlRTUXVBaXlBandEdUNielNXVkpmS3ZwQzg1ZGtPaXds?=
 =?utf-8?B?eERDTUM4dkVtNTdwNzdsTFJlbnVGY2RCUkgwMkcxN3FQN2toYU9Fd2dmU2dH?=
 =?utf-8?B?cWVNS0IrazhqR2drc3RFenYyd2k4aTZjdmlPa2thUFZWTEJrdGI2VFFPVnJ5?=
 =?utf-8?B?U3Bka0FsMWYrR0FUamRHcktSMm5RPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c86e15-089e-4af9-1ced-08dd84c8c847
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 13:46:44.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOg8X2/gJRv6atZkfozRl7QMo0L2K6azU39yqqZR2BpRmtse6t3mKv3Od8ZAvRTWxn7TIoIqvaujZA2Nqv1IYjOxNAAdnYFml616ZcWDT9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680ce3ca cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=o9i73HTHQvuMp2PUURAA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fOFfq3N17lCmCh1xonPOBy3-nYzWohSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA5NSBTYWx0ZWRfXxCFLvmLoxblV ayPJOZzslufNFRmG+XosbKMLJLPxNSnvCWtxN4KQ5BTc4Ftnn2gvdVZtM2yAjNoFkQ60lQhwyw0 71q8n5LSSUEfIqXkIdLO38ahPsOIsym3QNDME+13ZFkI2BxakYKRAWhQV6VmbKGcObQZgmz99yb
 vKVLEhPFkFDSUuOipkyabYuBhhIaiCVsVUnvrjl105p2ATBihnsjAMNpWuXUXM+7gECN0mG7FGO ZIvqXgwKm0L7Tpt4T8PNS+MOg2D+DufD9kyQnXy2ZfXeiYkabA6Q8XRkI3q1c2L5dXPrS7oOC2p K0pJQ90zlVXV7yIw9mKqZxMzvhFdEdtj306Ps6ukbD3L6YSSOdG+jAPVe0pBwOvCmabf8Gh03gT
 My91iO4E9yoSesH95VCcF5oGyIQEYRszKfDVBdcgHr8KpGfuk9cuPHjuij/CfyYDeBSTPeEH
X-Proofpoint-GUID: fOFfq3N17lCmCh1xonPOBy3-nYzWohSQ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260095


On 4/26/25 21:18, Peng Fan wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
>> When rproc->state = RPROC_DETACHED and rproc_attach() is used
>> to attach to the remote processor, if rproc_handle_resources()
>> returns a failure, the resources allocated by rproc_prepare_device()
>> should be released, otherwise the following memory leak will occur.
>>
>> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
>> memory allocated in imx_rproc_prepare().
>>
>> unreferenced object 0xffff0000861c5d00 (size 128):
>> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>> hex dump (first 32 bytes):
>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>> backtrace:
>> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>> [<00000000521c0345>] kmalloc_trace+0x40/0x158
>> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>> [<00000000e7e994ac>] rproc_add+0x124/0x17c
>> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>> [<00000000efc298a1>] platform_probe+0x68/0xd8
>> [<00000000110be6fe>] really_probe+0x110/0x27c
>> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>> [<00000000db3eb243>] __device_attach+0xfc/0x18c
>> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>>
> Fix Tag?

I will add it

>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>> 1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 74299af1d7f1..c489bd15ee91 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>        return  0;
>> }
>>
>> +static int imx_rproc_unprepare(struct rproc *rproc)
>> +{
>> +      struct rproc_mem_entry *entry, *tmp;
>> +
>> +      rproc_coredump_cleanup(rproc);
>> +      /* clean up carveout allocations */
>> +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>> +              list_del(&entry->node);
>> +              kfree(entry);
>> +      }
>> +      return  0;
> Could "rproc_resource_cleanup(rproc);" be used here?

Thanks for your suggestion, I will try it

thanks

xiaolei

>
> Regards,
> Peng
