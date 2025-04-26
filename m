Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F023BE;
	Sat, 26 Apr 2025 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745626091; cv=fail; b=R+BfRAs5t6KlMZaWS2qK8FpcW0IFcyMGXOqG+1aD05d04j6wmImjifl8iSl7E7R3iC57q+ngAAZWy5YyQ02jhWIcGyGoaU3zcUtTVtZq5sccWm3s6skR655w/tSEVCPcTGgZtM/uLRc/DDUG0RA7cf9lDwZZNhyapyIl2iITe9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745626091; c=relaxed/simple;
	bh=WcwTZxasDCD+lvvmpU2oMKI+hoxi0c4yG1BBSW/9TWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pzIGwh7lT9xXNVnvqlEH7yMNxfLc5V8Oj3RGSSzcG3H98tsuZfYE9UHfeu5kMgyorkgT9Fa685/bCuegRvFNPcZQQelqlouH+rNZsUnI1STs8DmMZLT6RfBSxM7F3k0HDL/1bkO2nFLE3Kq849jNu7n3eTMjt4L/BYQH7DIYcwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q009Uw024817;
	Sat, 26 Apr 2025 00:07:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh649xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 00:07:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp90PMd/65j0lb9GC2myXDLWubI1VqXyEaPAibe8bA1HwlGTdnz0N69ZalUe0F7sSatEDGaaNk57c/7+wzbYr2s5J/JXI5t31Btrd3idk0WZMu+ETiO09rzYnlAnAbsx5yLsNxuPdzen+Ed19Dd3iuDvrqzRAwPfYRvC1Kx0upfc6bWn4UbqKPDegxn3EJdiCbbrcgM5FG5cEWf/ppPd+dlhcZ2Y9b4ar/JO6csfbKjt1CXkAWgyxrUeFiSdjw8N49Dezo978UhVphy1+O1uMq7/nWlNfXJ6/SHj8csYp0NcffPUp53atGkmGNxt8kFdfKZ16TNmXX3EXxxU+gPqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guHkTBn1qCWP9lTOKYVIBtCMHvNh92sR12ajvRrSa9E=;
 b=SmUY0Ol9EO+mR4zMJgTR1I/Wen/wH5Ks013bPzYDHtRKOSv5VO6i0uuREC2OMdQ52AXi3D1zX8AZ+uis3Q6lssFRXgLvAOODaZ371dM3UivSnheiKuXzidbuibmhXCxdyHdnH1gfDLmTuCPxzcf2jzJb/DL19JHLcV/A7GyRW3xDRfDsIzkatTBSlakevtgvS2g4cK4cTRAm4eAwFfrzuQ0t3/16rGptGYQUN4YCoJ1ZRd5XmhXeCTAw1RQU/3meypkBE/sgb438R9WOEtJC7gSQ7N9zGwJ62TEa7lTyq51lhPMJMrqykfs4N8fvejeE1RsZOHj4ifW6gFko3adBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 00:07:37 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 00:07:36 +0000
Message-ID: <2d5d6cc0-4458-427e-8308-7cb6deec57eb@windriver.com>
Date: Sat, 26 Apr 2025 08:07:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
 <aAu8qPl7EpcIU0oe@p14s>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <aAu8qPl7EpcIU0oe@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: c73b72ff-00d2-4cbd-671d-08dd845659b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG9uTnErMHpPb3hlSEgreGl5SWFMeDBGZlJIaUFhbC9nMUl6WHJYeVRMWmR4?=
 =?utf-8?B?MWtOYmpxVzEvU3haeUNydUhOL05ONm00Z3JsK1Z5bUZlQnZkeTZYanZwcUdp?=
 =?utf-8?B?QlhVbmNCTUk0RUxSREg0MFQxZlM1M0N5WjZWZWhPRldORTVKK2RZN3pzeWt3?=
 =?utf-8?B?YkZLYlJRaU5Tb0tOV3Mrb1U0ZnhGOHJOVVRKOHRsU0R2M2xsUExtdENtY25G?=
 =?utf-8?B?cldydFowMFIydkRSNGhzNWN2TUZuREJheitvb2tzUkNUbVpaV1ExaWNDc1hO?=
 =?utf-8?B?N0tVRU9JWkhKcU44Z1FQZFdYVUFmN2NEem5GeGRtM2NFR1ZIYTc3ejlBMXho?=
 =?utf-8?B?c1h3b21nZnpvVlBvamszVFVwdk9MLzNJc0dtUWg1MGUzVlpKMGE1UkZNeGZH?=
 =?utf-8?B?WncwaXg1eVp3c1BDaUdWUmV2eWVGWFc3Mk96MGh4Qnh0WC9NcU0yVUY5ejNN?=
 =?utf-8?B?SGgyZndoUExhZTVLSHpKelVQdTVvSWZoZUw3dVZkTm5QeU9YNDFsN0ZvR0tW?=
 =?utf-8?B?dTd6cHF5cmp2YlcxWDZpQ1c5M3B2K1BFK0pUbXJrZkRjZmlDbkFmV21pRXpu?=
 =?utf-8?B?ZzJjYlI2ZzU3a1FMNW84Zk5KZzVaRkpqeGljbDBwYVBQQVRDdWUvRGU2TWZT?=
 =?utf-8?B?NUlVUks1azM3bDdUQjkyZ0xKOGRaWXFiMzhpQ2UrVXEyRDl4T28rOUZOakYv?=
 =?utf-8?B?MENqcnFmRkNadTV1cVU4Rm1JbDBRbWpxZUM0dVJzeEZzU0U3MU1nUFBLQ0VU?=
 =?utf-8?B?SlFJOUgyVEJCRHNYV0E5dmtqMVBjb3pTczhpek1oRmNDZlpOZWlsWnhPWmlQ?=
 =?utf-8?B?K3lIbEFiVXVPRmh1RzdENXZrdmJ4MEZFZXgxbGRFQzNZdEJzYVBlam4xaTBr?=
 =?utf-8?B?eXR6ZGNyQVlESmhpdVJ4TnU4VHU0NzFnMGNYT280dzNlWHVFU1o1VTE3Undp?=
 =?utf-8?B?YVE5RGNyTW5GM2JaQTMyTkx3Q3BDeEJWQ3NUaTlISkJRZjRYYTFiOWM5NnI3?=
 =?utf-8?B?OXBKY29vL2pkUmlJVFNmbVVvT3Q4SEM2UGZqL3ZkR1FpbXY2K0RQWUowRWxH?=
 =?utf-8?B?eldNREkrc2dVZ2dWMEhYL3BvSzBhcGFuNVBIYzFhUWdvTm9za0NuQlUzaXFp?=
 =?utf-8?B?S2REdW0yVkFnZmxHUkRzVS9XYXFZTk1jS3NWZFRMM3N6ckZKNFlIMUxyd3Jm?=
 =?utf-8?B?NzVRS3ZFZUZhRy9UbFVSSGFkZHBzN09rYmJRaEMxV3Y2anhmZnU0TEd3K2w3?=
 =?utf-8?B?WEF3TVVYQWkwWGlSdDdxR3M4M2pxWUZ6Y25SL01UN0JFbFFwcENaZHJxWWxV?=
 =?utf-8?B?MzNmZjNEcU5YekJWVXRzZHRpeE01ek9iMk93UlZzZUxUcEtTeklkWkhveCtw?=
 =?utf-8?B?bkVoSHgrSW9qbWluV1Jic0drT21nVG1LWUMwdDVuMmluYnFBYnNNV01xNmwy?=
 =?utf-8?B?UzdyeXBPTWdjODNUTkhKVTYrQ3hZdEQxQ0QrMlZXS01qNzd6ZnlCT3NEL05D?=
 =?utf-8?B?RnJ4TEk4cXc5TjdZa2hCczdsZzRVQTlYVnpiQjBUYlBQYmxHRkhSMjRlMG8v?=
 =?utf-8?B?cUZXN2hVVGI1aU9nWHhxdFdBb0hJa0dSRUNwaXFHK2Y3QXNtV3ZUWkIzb2Na?=
 =?utf-8?B?cFNlcXJmcmJkNERtZE5BSGZ0dUhWVHR2Tnc3c24zZUVaT1EyaS83Skx4YjFX?=
 =?utf-8?B?dktUZ3BCUSsza2hmK3JNNDczcHNsekJSaUtWVGhGUCs3Y1FpZVlKTE5lSUpO?=
 =?utf-8?B?Si9Ub2FEUmhvMUMyTHBjclA0ZjV2Wkh2WCswT3A2YWFHU01RMUlKblBwalVL?=
 =?utf-8?B?VUFGb2ZpcWFORXE0WlZXS2F5bjQrdzRZVzVLYVhjYjhuckVjYjFqM2lSTk5T?=
 =?utf-8?B?QnQrSG1PVXpjck02a2UzVnJDSUlXRHFmYmdMSEYwMnlJVmxxRktNRlV6SnBE?=
 =?utf-8?Q?EDdRHNBCwNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhTd1ZYQmp1ZjJoTmhJbUVsbUhJL2ZIeTJTYlE2WkpTMUo0NlhRcmVKV2pP?=
 =?utf-8?B?eGxwbGkvU29NVjBpaWFPc2lXTTB6Z2MrQ1ZhaXVRZjZ2S3p5NnpCNWFWYS9w?=
 =?utf-8?B?a0p4Mm1jclZFZmtRT2ZYNG5LdnBVMkw4dmlONmI5R1paalY3TXg3aUdDd2Yw?=
 =?utf-8?B?WFdsam1uZWJxNmFISDNuZEplelp2eWxjSWJqTFhQSzBzRTdSTVRqN2E4L3NQ?=
 =?utf-8?B?enU1QmZJVkJEMmJnZzZuMjRmNE1ISEQxeVRRTGNiZFZqZjhReWZMVDdvVnJx?=
 =?utf-8?B?RW1YQ0lwRWJDQ2ZpYnJJNGxvM1lDRFRqcS93cGwxeWExZ050WE9GQmdRZFYz?=
 =?utf-8?B?QkJXbkhMeVd5akVtaEpQMzlEeERuM1dUY291R0h4THNjWVlnY2pOMi9UWkFO?=
 =?utf-8?B?RmNtNjJma0xWcDdRSmkzeTZPNFkvWnhYYWwyRWUzSHVLN0xnTmx6TERzYkpG?=
 =?utf-8?B?NTFWTThuaWt5T3VJOHVSTC9Mc1RnVzBkbzZ6LzlGRlhldkxmYTE2Q2VoVEU1?=
 =?utf-8?B?alh5RytweW5HNmJleStjOVJzUnBTK0ZSdExtNW81NjROd1hsL08wR25nYXlW?=
 =?utf-8?B?WjdySVU1dmFsMUtPbUFJY0JCVUdiUmh6dG55RVdoTzkzeDF4YkNlN2xQdU52?=
 =?utf-8?B?dDVQYmIwQ3V4Q0VUaDZUTXp4bDVmZDV2RGRxNktoVHowVlBJS2FkMG5PTzRL?=
 =?utf-8?B?dW11cjdJL2M1Z1dwZFA3d0R1WGcrZkxSaTN2ZWFoR2xvbk9Gc3NzT0FCUmV4?=
 =?utf-8?B?cno0UlJ0L3RuZmhOL3lqTmU0TXFQT3ppZUE4K1F1OWhoZUFJeDE1ZHh1dE4w?=
 =?utf-8?B?SGVhTUtJVm8wQW9WMzRWV25ON0R2YmFSVFFUMWsrdjR2V3NYMUJGMGV3K2dj?=
 =?utf-8?B?RXBVQTJJM3F5UVdIZW1lT3VRUzg0WWlzM0xzV1dRaStNOVNVeVByRFppUmt0?=
 =?utf-8?B?b3ZHS1NzV0pNekZrNW00cHRTdUQ2V2FCdDA5dG8vSW1ZRVJkV21ZRGs2aGc3?=
 =?utf-8?B?a1hmeEZrdU9uS21aZW5BeVFodXBIVmtuQ2RnWks0Z0VRcGY5bVhHa0F5emlx?=
 =?utf-8?B?dGMyWEJLTEl6eWJnVFJhaGZROW16eXRYbm9OdEF4OGxZRmxkeGlNSXk4VXZa?=
 =?utf-8?B?Vlh5UHhBWUVJNmpWbEN6SXdrblpaYmY4c2lOWUJGSEoyeDVIZ1lUaWdMSkY5?=
 =?utf-8?B?aDBKYkZSSGJ4ZWwzL1dNOEdLQ09HS2Y3aXJWQnE2UmpWTlRYVkNGT21NNVB5?=
 =?utf-8?B?Zk0rTlFleDUxeVgrQW14N1lGVHhnTzhhWUFpelpUdG05eXFjalZ3Y2hoRHU3?=
 =?utf-8?B?ZFhBZm9adzhUK1pSZHhyMk9QWGdoZHArdWhwREFPT1VXMDZXMnR4Wmk5TjVI?=
 =?utf-8?B?R2FuOHA4Q1k2Q2t4QlNrUjdhaUEzTkZRaUh2ZE1jTzFhQnVLenRVdWFrbjkx?=
 =?utf-8?B?QjZ5TzVGTXJWZFdJcVAxUzFFL2xkc2xDZ3RHdkJKQVc3RXFBSjM3clIxMUlM?=
 =?utf-8?B?Q09PVXc5Q2h0NTU3b0F2UnBJM0FBOXdzbXIvTWxSTW5UbkZ3bVJzZzFNZ3A1?=
 =?utf-8?B?THFIUHgrK1lOWW5HWGpTWVNPaTYwRDhnQzFWNVRTZnRmdzBxMWxCRVc1aTE1?=
 =?utf-8?B?MGdQT1NBVmNDcnNHUlcxWWtGOEduamhTNUFmaS9BWWxPeDFtOXgxMkxyZHk0?=
 =?utf-8?B?RjZZRURrOUdMNW5wWU5ndlpBVHFic3IyL1ZiRkJjZVRtSllyNjRlWXFWUVJq?=
 =?utf-8?B?Vm5RS2Z1RzB4eUR4Qms4MjRjRnprM0VoRHRBSWoyOFN2cHk0OFRrWnltNDdk?=
 =?utf-8?B?dC93dkNxaEdhRjErbXJlQjlQQW5HOVl2T0tIdHRDajJjZXkwUU40WVFXS0Q4?=
 =?utf-8?B?VnkvQStwYTlJWnRjWSt5dEgzcFQ0dW1lMlRKRC9tQzlWRkhBZ2hGMm1EQk56?=
 =?utf-8?B?NVc3ZHVkZFRWMTZBS1RocVJJRFlMV2xvelFSS3NvQ0EvNkJieWdZWnJnQ0tt?=
 =?utf-8?B?L2F3UG41ZUk2Q05nWWJqb1Vub25xa1JlcldIYmI4Mll4bWlNck5JOTFkQjFH?=
 =?utf-8?B?U1ExeDh3RnpSeUNSbC90bWlVNFpjd004YUdRY0lCd2VjK3hLc2ZqNGViRmxK?=
 =?utf-8?B?R0Y3NkhMb0ZwMXc0ODY4bTYrL3hoRU5NeS93LzZLQ2I5YkU0UzZmR3ovNlJQ?=
 =?utf-8?B?MnhRcGRYTXZFM3dkcktHNHlaVWh2ZVNqNHVuZ2V3a1dnTnVsb09BNm5reEV3?=
 =?utf-8?B?UW9KL0g4NFllclR0V2xMV0Z5QlhBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73b72ff-00d2-4cbd-671d-08dd845659b5
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 00:07:36.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhISkTjGDYSFKhpWkOA2/UaP5GPsNVkOsOV2RLbKZ09P+nVEMjz44/qZOQqiFH9d2/6/Rh80/q6bq5MJi8etKnAf6N1tS9hAhvY3E1Pd/xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-Proofpoint-GUID: QsVr2eql9Ixc2v07z5Q7DFpkojjSGdVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3NSBTYWx0ZWRfXwP5zaKHFSotq CaxrSuGt4TyllTITZmqb/P3EJKQlU6uYpQ09XoLxBFMZ6lXkgRnF/SBW6ptK6oua81UXy51I60l XJaZxfU90nre/dyzR05SGe1p/Z4e44LxVZM4hOYhednDkgWTV10ULL0W7ls68Mi87yqROmfymGa
 AwFskJ5j+r0fmv7s1N5h4+Cr29Qy5PrwM25yFfEPGvxsRibQydzTUtDHsvfKnjCtvxJf03bNwZR lsplYnyc2QRE06SIlyB9OV3oKwVi2oZPPi5UQHd1x34bEMwL3/L2uK5P+CA0V4+b+iatE5tYDqJ hcSBuZwpXphkz2YCjJHlqfAosjd4hanQJBwr20MQyoTpm+RDH0aLiqoT8PLEj2FDtOrmX4mkjIf
 ioLPnJd4XnDEugMJZ/j6T3oqI1pgcwTb9zSoCQDTuL/U7SscDl4tzahOu5zVLYdM28NRo7H8
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=680c23ce cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=hk3agzs1gYrDLCvP3I4A:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QsVr2eql9Ixc2v07z5Q7DFpkojjSGdVP
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250175


On 4/26/25 00:47, Mathieu Poirier wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, Apr 24, 2025 at 08:22:51PM +0800, Xiaolei Wang wrote:
>> Release all carveouts under imx_rproc after rproc_attach() fails to solve
>> the following kmemleak:
>>
> Please provide more details on the steps needed to reproduce this problem and
> where in rproc_attach() the original failure occured.

Thanks for your reply, I will add the steps to reproduce and where in

rproc_attach() the original failure occurred and send a v2 version

thanks

xiaolei

>
> Thanks,
> Mathieu
>
>> unreferenced object 0xffff0000861c5d00 (size 128):
>> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>> hex dump (first 32 bytes):
>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>> backtrace:
>>   [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>>   [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>>   [<00000000521c0345>] kmalloc_trace+0x40/0x158
>>   [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>>   [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>>   [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>>   [<00000000e7e994ac>] rproc_add+0x124/0x17c
>>   [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>>   [<00000000efc298a1>] platform_probe+0x68/0xd8
>>   [<00000000110be6fe>] really_probe+0x110/0x27c
>>   [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>>   [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>>   [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>>   [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>>   [<00000000db3eb243>] __device_attach+0xfc/0x18c
>>   [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 74299af1d7f1..c489bd15ee91 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>        return  0;
>>   }
>>
>> +static int imx_rproc_unprepare(struct rproc *rproc)
>> +{
>> +     struct rproc_mem_entry *entry, *tmp;
>> +
>> +     rproc_coredump_cleanup(rproc);
>> +     /* clean up carveout allocations */
>> +     list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>> +             list_del(&entry->node);
>> +             kfree(entry);
>> +     }
>> +     return  0;
>> +}
>> +
>>   static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>   {
>>        int ret;
>> @@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>>
>>   static const struct rproc_ops imx_rproc_ops = {
>>        .prepare        = imx_rproc_prepare,
>> +     .unprepare      = imx_rproc_unprepare,
>>        .attach         = imx_rproc_attach,
>>        .detach         = imx_rproc_detach,
>>        .start          = imx_rproc_start,
>> --
>> 2.25.1
>>
