Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542A215F6C;
	Tue, 29 Apr 2025 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966908; cv=fail; b=Bb2pP0+4ou02aNBV8csxwDCkdzc0OHfxclRKoDee7KeljwyLmHa6aCfYy6PmPo2MwlBJItGZcgWOfqof34LCdmz7HiIapVyjARvPd3mt79aL6goMxztQFztEEPtt0vCnowmx5e7gErjU5GAvhJa1nm8mttPbxVxKj2BgsC78WCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966908; c=relaxed/simple;
	bh=glsNLk702WopxRa3+UBmowXt6KuZAef7w//yecPrcQE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dxm2Lq30eAkogiL+Upqj2+ewgbXsqCGxcAj68LqXhl4HFyrtoiVCIWI9CKr30uVXJ7rAK3+hb/vIkztFdgmQuXGzms+R7xeRAljXybtry3z0N+3hbDgz708fN2999/tBmqcv3Ah0vB7iy/HzLqz8O4DTW6qXntFtWWh3i9KA8ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLbdqZ000331;
	Tue, 29 Apr 2025 15:48:07 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ugr21h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 15:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0ReTrnWmP0ACtHfDoqbfYcdDslZn7rJQO9RSvCIXViJrBBSiMypTEfxNcKagR41+picub4yGp6WozqEmuAxNQFIYq+55wH9BuiiIukIObbeuWbeNHzNvFZnMPvY4n1FeJyyOXseFSdEuA2wqSqEY1UGvfYNGIVTP6JLCApDGPId5Wftf4UOK4IBwoNKHezzKp5rlaowWKUP8Srj8NtQBadMMKvWOtuPeMIzVQBOtgk4C1LNMzi3PwmJSMwVeY9/qxlP4mRutuwPhRR/uqadRTczmp/UxaBss41eTQUVcoFFS6VCSxXuZRW89ax/FIjgTcx/r4a1kdcP1VtGQUPH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6+pbK2VPBhSvTdV8qsxDisfg2HR60c6fpefZelrQ8Q=;
 b=k3YivvqBLdyIN0Gzb8yoLd8QCj8mfY8QzJneoWrPEFeNsXoZR6TpmOr603reTO236Hl1VdecbthZKbC/rPZxHHDVy549Ld1G97d7xoO9EWPFz7dmVGOPNRlYxLeTMOJVK0rm4kzQmFudrx3WSfx8rGKUtREdKQdRTCA9jonjhB9HHFSJ5tKNIAwrt/hKhw1aHrac5sKxmzmuZt4eIVu7gtmhUiTuOjHJHroFkUe8mwAbEorwebPj0vYuKASTtatXjxoLebIydnYYHSmducstmn6xqQGqFthEOrf8uKuJjSMFeTLl1ydyHAtIfc5nah9jwmfOituiNJflUfHY8yZ26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 22:48:03 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 22:48:02 +0000
Message-ID: <a71a6039-8708-4a5c-9df2-c0d3a4359f34@windriver.com>
Date: Wed, 30 Apr 2025 06:47:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after
 rproc_attach() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-3-xiaolei.wang@windriver.com>
 <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
 <CANLsYkynk4wogcEAvVQ-MTyCGRF3CyqSjxaKUS4eYCbGsL7+Kg@mail.gmail.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <CANLsYkynk4wogcEAvVQ-MTyCGRF3CyqSjxaKUS4eYCbGsL7+Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: d386a776-0996-47f9-0955-08dd876fe571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG5Sbko5SFVtSnEwRWE3Z3lQMnF2TG5mZHdGSndzMFd6TUl4VWxpN01qdnR0?=
 =?utf-8?B?Yk5wNGJGT0o3TmdyZGhDN0NPWXVyUGx0TWFZMlpTemlvL3FHeTZuU1JSV3Vj?=
 =?utf-8?B?YUpiUGpNYXhhaFBHV3Q4UTlDR2swbDVGNktBc0ovTnV0NTBRQWNMWHNoeVZs?=
 =?utf-8?B?SVY5SDBFWUpicjQ4NjlaREhvU1NvY2xGTG5kWTVRNXROb2lIcUJlZlRDR1Va?=
 =?utf-8?B?dzZlaDZSRVUrRjdqN1VWVXc4UUplc0lSdzIyc09BOCtxVXJaVEVZMmVxTGZQ?=
 =?utf-8?B?ZmM5QXpMTVJOYmlxTW1lZ0taQkZ2NUNTSjdRMG15bHk1S3MxL2dhbWtIeHg0?=
 =?utf-8?B?aUF1VlJwemxHRXNGbmpIemkvbC91S01KcEphNFBZVjJETEIxdGZ5QW5RTUto?=
 =?utf-8?B?cWlxblMwK1ZXTm5ZYVB0dHJKZUJEYkR1bExVWHdOeHBXcnlQS2x3Wm5JaWdP?=
 =?utf-8?B?OThjSEF0U3Bhd2FBVHRqRVh6WlY0YlpWL2o4OTZ0TkRBZDNGY2dwK0ZKUHdL?=
 =?utf-8?B?NFRkWjFRODhMUVJQL1RTZFRoMk1iMnhMa2haeHo3WVNUU2VzaFdwOWFXVjdZ?=
 =?utf-8?B?c21TZlgyL1ZuOVVxVUxOMkg2TUl2NkJ2RnNJVGpuWFVIOFB1VmRpUzM0QUZu?=
 =?utf-8?B?bGdrQnhXa1RlQ2ZhamZzejhOdGNxbVBnKzkwNzUwL0tMTzYyVGo1a2xiOHVH?=
 =?utf-8?B?Z0JYRmFKRmNkaTJHc0dvQTZESkVpbmtPdXlHenhKdEQ2STBFRXcyUlNIZmNn?=
 =?utf-8?B?a3N0Z3daQkF0aGJIMWJINjQ4Y0R6M3NMTEJpbzUzSGJJMUpmRGkzYW9HeVVQ?=
 =?utf-8?B?UWN3em1rcy9qK003L21PdENaS0M4QTdueHVaWXphUXE2TE9TRzY0b1lUZU5q?=
 =?utf-8?B?N2dGOG01YWdUYXNzclhxTXVUR1ByRWc3TGV1aVg3dXBnUzllZ2tqSUhYb0NW?=
 =?utf-8?B?V0tJMkZ4VFFaUFI2UGlPT1VuM2t6Sm5rY2ZMTUhVYmoyajdtWUZTVXN2ZUVF?=
 =?utf-8?B?bkxEMmxmSWJnM2VIeEpKM0RiMmExZnRNL1RGbDJkWmdsODhaUGl1TWtaVzdD?=
 =?utf-8?B?aE42MDRPV2h2SEl3RHEwN3hoWlE3REoyMnlQWDRaSUY5OXBIYkdvQnNVN1JJ?=
 =?utf-8?B?ZXVnUkdKNEdzb3diOElFVUhlR0FUT05QY0tNVmlsYzlWOC9yMWgwZUdJZWRt?=
 =?utf-8?B?MzZjZU1XUDEzQ2I0SkNISENxUlJ2WnJwcFRuVmVXVHlJWlVPUHo0cm50ZXVD?=
 =?utf-8?B?MGZTZkg3THVYd0llQkJmKzBkOUpDcmgxRDY3cDJwVk9xMTJMZk9MWUI1MEdL?=
 =?utf-8?B?WWlzdHRFMmFBdjZ2S3ZiMCtaTmpEc0tzaUI3ZmVTa0JQQ09xdFQ1ek5QRTVu?=
 =?utf-8?B?V3ZvN1krZ1ZhcVByeGw4VTczRlhuYVFaNVBVRjlZdGZLdHhPSjV2Mm9iTnow?=
 =?utf-8?B?YzZQWnB2NWRtUTU0bklzZWJDWWtBbmEzdTlFb1puZ2d3YndMamFyRlB1Q0My?=
 =?utf-8?B?RStqb0JySkI2TWgrRnp5SitMVVJucGdOWmRCZ1ZQRlp0WEV2RFcyaFl1V2ow?=
 =?utf-8?B?dUtNVWUyWHViMzZkM0djNUVud0VKTEcxWTR5Z2lhWmZ0Mmwxak1VY0hNelZG?=
 =?utf-8?B?L2gxZU01dW9ueEp4bVREc0t1dmhPME0zZzZaNGhoS0U1bjQwWnNLZVpMMmxw?=
 =?utf-8?B?TGJVMXhEUjFJbkJwcWdoNFhaRkJnMElYWnNXbFI2VTkzRlUzTHlqcXZMa0lm?=
 =?utf-8?B?bW0xUFNzYVo1WHdNN1MwZkw5Y3hXYnF3ditrV3ZBWEV4RmNndEhOQTFJNFM4?=
 =?utf-8?B?NjhsczNxQmZ2R0RwVERteFNOa3VPYWFuWGRuUjk1VCtVYk5KR1ZxYjcweXJS?=
 =?utf-8?B?aXNRWXFWSDJGRWtmWFpSTzlqbEI2YkgvUVF3YnhuY2kvNW5rbVFleFFDeUUz?=
 =?utf-8?Q?J6dTV17kS3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmNKODZXVkxtK0xlTTlweHJQV3JrVVhrNk1vd293S1NvVk9tREpzbWxqTjJK?=
 =?utf-8?B?TFk2VFNTSHJtdGYzYVo3L0UrRm1CK3hHQ2tWREQ3YVJ5d1dBbjN6ZmlwSGFw?=
 =?utf-8?B?bU5YKzhUTlNGUTA1YVVpYW50M1llRFloS1JmWitQMStwcDRDYUs1SXBEcXdG?=
 =?utf-8?B?NGdXQWN1d2ZIcHdDR2NkTGUrNXlWMmZxMmJuTjRYT1ZHU0RGYTROSG4xVkFS?=
 =?utf-8?B?MWVBSGcySzAzWTNmVEtUWGhvbnBKOTFJRHpLWHNjYUpXMXBvT3ZMRzBmM0Ns?=
 =?utf-8?B?cFVvL0hZRGVjZHVUaDM5WlowaG92NXRGR3U3cVVmU2xrVTdOaTIzdzhkSmZl?=
 =?utf-8?B?MC9vUmZSYUhEOHk4VzFPYmtQNkJCUFJKd0lPbWpkQWJ1ckNlV2FQMjFNeUtG?=
 =?utf-8?B?TlRsbGlZbktQdjA1TGFjdUlEUXV5cVpsUHRUZDdHOGNQc2VIdFppZjEvd3oz?=
 =?utf-8?B?Vnc5VGdFTm9XMnpkZGRmUFVyWXVRVjYxZzQzSUZpTjNpRnBsbWJEN1NYKzJQ?=
 =?utf-8?B?c2JVQjVZMldCcVp4M09ES3c2ZGNjM2ZLZURFZlQ5M1BwenhTSC9LWUhtKzZh?=
 =?utf-8?B?Q3BiVlhUeE9IRmFQcnhleEc2dTBVd1R3TlQ5ME13ZmFoNzVjbkNvejVPK3VK?=
 =?utf-8?B?NURYQ2V3NmNTV0RKY3NlOC95ZkIzTWJZVjRocnFtMmVmSUlFWXJPQ2FuaWo4?=
 =?utf-8?B?S0FZUy80dm4xaHRnc3ViNTFLNGUvcEIyM0xTTndwWjFlT0NFTko5eFZDSHVj?=
 =?utf-8?B?NjJoV0xieVNicGtsVXlwTHFrQ0ZFdXVnNDI3L09UdG9IalRWRjdXWlE5L2NO?=
 =?utf-8?B?V3M1TFFteUZlVm45cmZ1UHprSSt5UmdIUVVLeWVDYnFKbDlRV0pZMHhuZVN6?=
 =?utf-8?B?eVpOaW80dllNZXlNLytYaWJqd1hEVjBGVmg1alJUZWY0KzBvV25xM2RuejVy?=
 =?utf-8?B?dEV5dUtnRnRpQ1RPc2pRQndldDRNL2hIOTlNZVBmaVhaNThqRktYempPNjVq?=
 =?utf-8?B?dDRtQ1pyTmNZRE8yVURROE5EVFhIZTJEdTFWUmxSMnZlYVhFa3ZmK2N1eEhN?=
 =?utf-8?B?VTJwcVk1T2R0Q1F6R1NlVW15bnFtMzVkYjRsWVB6VkVMYW5Cd1orbHlZQlZx?=
 =?utf-8?B?SWlJQ0dBeXdJMENxZDMwUFdIOUFISjZnb2lOWjlKdFZxYjF6aWRpNEtNVGo3?=
 =?utf-8?B?TlhERWJubWJCVFVCK3YzK3Z4MnNONElyYzhXYnR5RmJiQkFBeGt5YW9RdzQ4?=
 =?utf-8?B?V1c2NHNEK21qL2VLbHJjY0J2Sm43dllPck1KNzFNTVVhTi85Y0xDcmNsSFdi?=
 =?utf-8?B?UWc4ejRQKzdxb3BKQlRtZGU4RFBLQU5iNWc0NTJEMHBzMHpQc3U2NkF2ZmdT?=
 =?utf-8?B?TWFzK2hCQVVYaFhPR0JnSWZKeCtJQ00rSGwxa2wxRWNOdnFJZWRpaUFMb2ZI?=
 =?utf-8?B?M3BPVGtaQmhQK0EwWW1SMHdaUWkxM2hRcU1neE9oQ05LMzE1bnh3YjVqV2VG?=
 =?utf-8?B?MktDSitFVXViTkhKUG5xZnZMYnFOSE1kNHNZL1ErRmhhMnY3aTBiaGZFb0d4?=
 =?utf-8?B?bzVJb3NuS1BZTE56TGdlRkF1UlUwMStTVTVORGMzNkxoYzZOZ0dCbXFNRk1h?=
 =?utf-8?B?UmN6NFNveVJOQ2JYM0YxYkFUVlZiR0ZDc0YyTWtVQ1FSY040VDZ2VHQxbHdI?=
 =?utf-8?B?R1RuZzB5cUNJdUlmRXZpRS9xYTFUaEJPODVKSjNyaHkzK0ptbU9sUnRpK0hl?=
 =?utf-8?B?RXdCSXZ2b1RYTmo1dDl3NXI0OTJaVUhlOVhWQzBVWENwNHhSWVA0WGo4UHor?=
 =?utf-8?B?dDBMNmk3ODBKM2ovOUZaU0NaT0drMmxXakFQT1VrdUVSOVpLRHhZei8wN2tL?=
 =?utf-8?B?VTVibU5mcDFnMWRPOFo1Q3ZEb0lTMDV0ckpnK0h5U2dxWHlXdzgxSXdjUEcv?=
 =?utf-8?B?OUxkdW5OM0JSWC8razZIZmxzN1NYdHJGa3pDb1M5UnNHUDFrWHJUQ0x6L3I1?=
 =?utf-8?B?dkkvcG5kbGxaSWVGOCtVQjBJaHM4elBCc29Xc3VLZG45a01qaVRINEZ6eU92?=
 =?utf-8?B?WEtFSTE2TXVibXdjQVdpV0cxdGcwdFJzSjVLK080R3FJWVE5MHBKSWhkaHMx?=
 =?utf-8?B?bUIzSDJFSWY4b3FOUGpVdUVvN20ra0wxd3lRR2VLL0lMNERUaG1zM3pOSEdC?=
 =?utf-8?B?YmZ5SFBoK1drZ0pUb3VZVmR0RHRKM0NCZjA5eStjYkFLWk9leFRBMFJ1dG5k?=
 =?utf-8?B?NnoxbXM4WFFrOCsyakRZdC80RzZBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d386a776-0996-47f9-0955-08dd876fe571
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 22:48:02.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pk3sgtUCVjAFcEWd+UJjpJtuqK9q8dQBho/ARt+baIvUK+EAdtxJghj8px+4UIrCxrW3DGW7uJ+xheTH+y7Wn5Pq4iTkK5ABhfalzOgNiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
X-Proofpoint-GUID: my_qEK_asZISRsIUxw5JSUYKzo9eGbiM
X-Proofpoint-ORIG-GUID: my_qEK_asZISRsIUxw5JSUYKzo9eGbiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE2OSBTYWx0ZWRfX16zIgDdJ+in5 IWdSfEnsg3TQ+y71ePA8HpmRwsu1FjhsiWCWQsAClSLBM+Xs5uWg/o/ZrhEqX83TUoDltj3oKOW +w/4gM8mt9RxxM9nyC9hxJzHbMnq6BsqACthPt3H/CNE/irypdqtN3sPfd+8Fw9YDTOlMEDjw1+
 YHsLmvhONv9iGtvq2ZysihUo1r+RL6PabmgeVTIVYs6GMiC6x4OLCpes+yfnRxLEDDAj3liHd2F IhpsCQZvfz52O6VIhWgpFMKPZV9FtgIaqV3a+LuHtutswJejeQ6bTmERF7yN089g1I5bGJIQy/t jPVfEyZ7kGoOJnn6moJpJkoAQ10Z3Lfrglh6vuBsx3oPqlpn0KFsNVCth2x3qB2d+3vAIcZbtXw
 aJhb1VXgsLyCUSjjy7UwLfd5hISNBzRiKflwC+F45m1krHPJagXEdTm7Y7FfB2wRBtt+8psX
X-Authority-Analysis: v=2.4 cv=Od+YDgTY c=1 sm=1 tr=0 ts=68115726 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=XoPU7Qe9eS3APg0CSawA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290169


On 4/30/25 01:30, Mathieu Poirier wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 28 Apr 2025 at 20:20, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>>
>> On 4/26/25 14:53, Xiaolei Wang wrote:
>>> When rproc->state = RPROC_DETACHED is attached to remote processor
>>> through rproc_attach(), if rproc_handle_resources() returns failure,
>>> then the clean table should be released, otherwise the following
>>> memory leak will occur.
>>>
>>> unreferenced object 0xffff000086a99800 (size 1024):
>>> comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
>>> hex dump (first 32 bytes):
>>> 00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
>>> 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
>>> backtrace:
>>>    [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
>>>    [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
>>>    [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
>>>    [<0000000037818dae>] kmemdup+0x34/0x60
>>>    [<00000000610f7f57>] rproc_boot+0x35c/0x56c
>>>    [<0000000065f8871a>] rproc_add+0x124/0x17c
>>>    [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
>>>    [<000000003bcaa37d>] platform_probe+0x68/0xd8
>>>    [<00000000771577f9>] really_probe+0x110/0x27c
>>>    [<00000000531fea59>] __driver_probe_device+0x78/0x12c
>>>    [<0000000080036a04>] driver_probe_device+0x3c/0x118
>>>    [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
>>>    [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
>>>    [<000000001a53b53e>] __device_attach+0xfc/0x18c
>>>    [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
>>>    [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
>>>    unreferenced object 0xffff0000864c9690 (size 16):
>>>
>>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>>> ---
>>>    drivers/remoteproc/remoteproc_core.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index b21eedefff87..6226e2d12a97 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
>>>    unprepare_device:
>>>        /* release HW resources if needed */
>>>        rproc_unprepare_device(rproc);
>>> +     kfree(rproc->clean_table);
>>>    disable_iommu:
>>>        rproc_disable_iommu(rproc);
>>>        return ret;
>> Hi Mathieu
>>
>> For this patch, if I use devm_kmemdup() instead of kmemdup()
> I don't think using devm_kmemdup() would work in this case since the
> memory is only free'd when rproc->dev is released.  So if you have
> Attach()->detach()->attach(), we'd only keep accumulating memory that
> is no longer used.

Got it, thanks for the explanation, I will send a new version

thanks

xiaolei

>
>> in rproc_set_rsc_table() function, is it better? Also delete
>>
>> kfree(rproc->clean_table) in rproc_set_rsc_table()
>>
>> thanks
>>
>> xiaolei
>>
