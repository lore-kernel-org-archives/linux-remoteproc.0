Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12833AD2C;
	Thu, 23 May 2024 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716484289; cv=fail; b=NKNHzJzO/sfWwtDwidvBLL4ZBT72fH/0p/cNmYtpxX85F1YXfBQ9o8eQubf4JtmBgxsAuZSLy6Qssh3Ly0YeNcLtzAmqHP1ZGkot5v9wg6J7QQ7BSCAUOJPiJd1EPiiw/HoEh1FYAVoK3W5MGvKkqfmFzGmUDpGaU2Fbez0UGF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716484289; c=relaxed/simple;
	bh=JtjZOFQ7EYHgjn0hBoevb+Zr1kLbHveeg8oHMWxsDxY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bJS7kzEgmgW9FSAxcvxzK7XMfwcVw1iER79PLIAQlfl04ej1Qg+KeQUucw4oOjltc2EfAnuOy6S0v0ZGR94VUY7Ly+ZRXwkpAmaW5Ltc29n7qluHOyBJor0CTHZGeL+bwt4c3qhCfwj78GXKx6Bs5w3Nlwrhbj2wqyHLs69t0e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uMfU5GPx; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uMfU5GPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+6sRm/EcJf11hPBeu7hLGFj2FOzyOzJL8GWl0VrZe6UHAUz9oS1n6vDkwEq8sXNSbW3oQJJVX5T2SmJtWaTWpoq0IptQ8XEhpL4s7CxYYyoW9Rgbe4C+pNEYQPe8scPAOWIC1X8ZAOxj7MqlOgSiI6yz3aFIX0UirRlg0wb+mjqIEG9TSm9usDAt86ccCrmuEWpwlD+XKJEroXVeSFNU8w2kHzFeNvF9BQPzewdF9GyhzUwH1yvEXg4L97h9IY1lwnIooteUFOSGbQei7euU7SDfZI/JWJ4+gR8QLyFIRYKfjGGCAEamktfCNERjaWRAVlJTABmsaA/qa0Q1igDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzgoIcSTVBMXWIcK0O83M98Hw45mFYNtRrqYy/mh68Y=;
 b=XifPkyeoogE+7rhlEFH0/i+GttB1maM5M+88cDitoo2eG9MXSvSpYoeWulc+8EpCL5Q0u6ffMeMl/u9bHef1xLiJ1RgVc3aFmVBcQfLmga/BBUwXzs4aNltg+F5KDbes8IURhgJ8or6hO5Ka+ZiDRPNbCcvSUhG8ovJGUw/ZbJ5Ea/129n27TE3U17z4emJymwCfW6PwYKPqp6IiDcar350rwkGqFgaHZ7GcvwP/NOvB+GkEFHHfmiI7Z9N+O9tWHrOIQoPk0S/38TdD2Npgc0jUYaNRTtnldyleUFU+bQT03k+lrcY6Pc8sRfSl0m6L2piatfe+DNZbxR7AA2hzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzgoIcSTVBMXWIcK0O83M98Hw45mFYNtRrqYy/mh68Y=;
 b=uMfU5GPxrLsJzPIIr23hWTnA4l+UvgUNwI8oN203lEpJGFICPzcVUQrLgmLQsj0JkFIG1pBVZJP7/v6zc7ARQ1m3AY4mal5ymkn6C3/XhnTkJQrc/7wJMHU47gvjyhZhru9JyMX10EbZcEffHSWimyfuY2GdINECqyy81zkcAx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 17:11:24 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 17:11:24 +0000
Message-ID: <465b1e4c-0a71-4ad2-978c-a66958aedac3@amd.com>
Date: Thu, 23 May 2024 12:11:22 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/2] drivers: remoteproc: xlnx: add attach detach
 support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240511005126.1240430-1-tanmay.shah@amd.com>
 <20240511005126.1240430-2-tanmay.shah@amd.com> <ZkzgVn4+iTcrLEDT@p14s>
 <4046d7a9-7d6a-47d1-9435-90185e6d32af@amd.com> <Zk93Pny2wCBeeBGQ@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <Zk93Pny2wCBeeBGQ@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a92846-7e1b-4ccf-5300-08dc7b4b600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1hDRlpwVlNwaWFBaFljbGNzVkdmaXZ5NGErbGlrc3IyaTY0UEcxVjFjaytj?=
 =?utf-8?B?cnl2RjdLcWJQTGEyTlRlWHJ6eXp0NVphYmlQUXZLcU9Bc2dFa2hhWWVLL015?=
 =?utf-8?B?M3IreUVyZXp4TzRmRjVDMDFTU0lJcTY5TGZWVWNmNHlxN1BHWVIvY3lYTmcx?=
 =?utf-8?B?Y1lsbjQzZE1mNmljYklaY2tjbEJkbVFieW1RemNGNHVjbGtKcFlQTy9xb1lL?=
 =?utf-8?B?VlBWL2QwVXlmSTUwdU11RktCQVMxZzcxUENJelAxdzU2eTgwcWtKSXU1SnJa?=
 =?utf-8?B?RDVoVnNhL3crSzR3ekl4L3ZRTWQ1aXp2YjdMUGJ0NW5rN3RvVkptK216SldB?=
 =?utf-8?B?ak5PRlU0dHhXQnBSRDRjaVFBTlc3amlRV01mUWZiYnJPVnA1OEN3T3M2Qm9k?=
 =?utf-8?B?ZWN2aUMwZzJYcy9EVGVPaE9iWmQwT0ZlUGl5VXg3QVVvdXZyM3JTUHZScXJT?=
 =?utf-8?B?VWdWZjV2N0kyR1dhT1haeVhub2ZOZkFxeTNJdEZoVHdBLytvMkVzM2J2bkUy?=
 =?utf-8?B?Qm9lUzFBT0RwZDVVWSswMDRzN3d2bGxpenN3NWV0OEpDVnpYakVEMVBMK2F5?=
 =?utf-8?B?V3BubVF1Rk8zUFZzY2lnRjZWazVWQ1lJVUlmWmxCQ21kRzg2cm44NVUwZE9J?=
 =?utf-8?B?SDJIVkpGSzJFemt5M2NJdW9OSFhycisyWW54VG8zUWowTUY0dHl0NHVFMjFS?=
 =?utf-8?B?Tk9IYnNkSkd6V1l4WEJuUnE2OUJRektuWEg4U3dYMWFqd09CQnhjWjhYL244?=
 =?utf-8?B?dU1xV281ZnNDZndYb0hFTWY1RmY4eGxma3l3L3ZORkJFclpRVUNvVGRpNTFi?=
 =?utf-8?B?cmc4Rm52ZHBpck9YK1d2T2tqUVR2ZisvZHVpc3FubGFrYklFcHcxRnhqQU43?=
 =?utf-8?B?bitZaHVMZHRleU9EbUNYa0RRSGlCSzNDcTRoV2dmaTNLY3hqcnJDWnRoRHc0?=
 =?utf-8?B?a05udzREWWw3enNDampVSmRmdE1GT1pVU2xtZTZQYmQ2YXJsUXE2a2RWQjd3?=
 =?utf-8?B?MlYvZXRYT1MyRTZDWmdDcTJVdVA3Vzd5K0hZMk1sTjJrbUV6UEZZOVBnV1JL?=
 =?utf-8?B?MFdpVjdjcERpU09helZtUVREYmVjVHJGVk1TbEQ2aTF5Wis4U1RpUG5YbVJ5?=
 =?utf-8?B?d0wwTFJYdWd2VWQ1NWFnTWNuMTVGUkptdHFMdCsyQitCSG0wV1V6dFI5ZWV2?=
 =?utf-8?B?T204VURwZjR3NDNhTjZDemlOYU1sVlNzckpjTUJ2aU9ES1lCN1Y0YlMyZHRz?=
 =?utf-8?B?Um4ya2ZrUXVHd3laaHM4ZTJxYWZpYUcwMXRta28rUHFiRlRpT3BUUEQ4WC9z?=
 =?utf-8?B?V1YzWkhYWnFGVS9tZ0FqYmdvb3FlejFvdHh2ZXFRL2prcGlGcFdLQ2F5U2pG?=
 =?utf-8?B?cGVJdStMdDAxT2JJb3pORnBOazBMSjFQK1BTSHM2Zm93djdaVnhaelJaTFJ5?=
 =?utf-8?B?enBhVkxicjRNVy82WXVoWnNtUzQrdmk0cjRUYno2bzBCWVpDN0RERmJSZjMy?=
 =?utf-8?B?N1U1c1R5d0tsTzRmSFhERStnb2JRczdEdEVnWDlpRlJWMmkrWEo2RzM0K1hp?=
 =?utf-8?B?ZEppRlNjakxuSVNzTFNOZkZIMVVoQzdPZHZOMTNIejdqTitWUGM2dnRDU3RE?=
 =?utf-8?B?Tk5seG9hUWZpMDJDczRPV2luaTFGaTdJMG5QZHRaaFJzVzd6QUVERUR5eXZZ?=
 =?utf-8?B?WVRxVGtuenFwQmNJNmJSNU5zU3JLazZGa0s4U1dORWhUWWx6eS9QRy9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEo2a1JvSGVqeGhmZXJzRk9OU0ZXZ2ROcllnUXB0b1dqYzhUYkxvU01zeml3?=
 =?utf-8?B?YytDSXJ1NHpvVlFaODgyVGhDaWhSZDlaUHNDWW44TUhpTC85bmhxcDNrMjJl?=
 =?utf-8?B?RjZZY00xdmI2MnlRVTdDS2t3RFdJMkFsYjJIOFFRVzRIaDRUVThvMndGWW4y?=
 =?utf-8?B?VExJdUx6QzVBaEJpSzcwQVZPczlxOHhlb1U1eGRrZUh3ajBKSXNUWDhEbXI0?=
 =?utf-8?B?SzVpMEFrcWdSaDlCaEU3L28xMFVEU0tveDhwcFFLTC9QcFNCLzM1Vmd2dE9F?=
 =?utf-8?B?Y3plZzRIejJyclBFMHFQcFQrMStVVUVuN2h3N1d1OU9YRVU1a1ZPSTJLQUs3?=
 =?utf-8?B?WDVKZjl1Sm5YN1ZJeFNFVXp4WnBxUUlHMzE0aWJzS050VGNCdVk3cVoyejZG?=
 =?utf-8?B?WGNsWkY4M3M5QXlYdUxTR2hWTTYrUDI4YVFuWnM0RUNNMHBVN21UNjFFSURL?=
 =?utf-8?B?NXlsL3pkc2h1bDZER3p2SFZsQUdiNytHOEdURFQ3UVI3N00yWk1VOXZlWmcz?=
 =?utf-8?B?WElKbkcrZTRjNHc3N0NvZGtnc1FCcE1mM3Zad1YzWUxhYXQwaVE2YjVjdUp6?=
 =?utf-8?B?c0l5L0NRZ3VZTzQyV1VNeWcxSzdnSnVHMUcyYjZ1WW1JVENrTUNjZEpGSzhl?=
 =?utf-8?B?QTgzQ3MreVpZdWJUMFlpZ2tERFV5cmZ4RGF5ekVzNmlBRE5VV2RoQ0xwVC80?=
 =?utf-8?B?Q3JxaUVMQ3VmQzVUVmgwNzd0WVRpMk14U0puanVNMHNKNDRiaVAxbjloUk02?=
 =?utf-8?B?RTdYb1RoRS81Tmo5QXZFNXhBL2JZV1Y0UHc2R3ZXZmcrNnZiVVk3WW40eUNL?=
 =?utf-8?B?enF5UGhabXBUaGlyZ0ZGb2ZQQnFaL1NsRmpDYkM0eDlteTc0NmpsVlg4c0xH?=
 =?utf-8?B?elJXSCtBdm5hZVgvNWNEamVyN212dDRNNHZGc2RkQytWKy9MOWQwR2dhV1lU?=
 =?utf-8?B?WmNmK2g0MFNHUVpJWGphY1ova0tVMzVxNHlCbVZUWnRBZngrbDZBcllGb3N5?=
 =?utf-8?B?U0FqcWVGaDJzUmFUUDBxRDJJOFBZcW5FanhiZzdGU3NRVm5ZYURlMVM0VDFh?=
 =?utf-8?B?Nzg4TUpSVnpjeTkvNXh2MHNKNFRPZU5oWTNCcGV2ZnM1dW1xVkZReU9saUxx?=
 =?utf-8?B?SHZZQ0JLckk0UVY5aC84VkgrdHJ6VTcvZHMwS3g5RzVrMzZWZ2M1ZXQ2c1lU?=
 =?utf-8?B?R1hDRkc3NWJBRHBUb2o3YVBQNGVQdTNVaE4vSmltd1J0MllLNndhdXZWUUhM?=
 =?utf-8?B?b0ZwV0FCWXdRbDNwY2tOQ3pPWmdoaTRyaytuQVpoK2RjUEo4QU1nTDZORThQ?=
 =?utf-8?B?dmFnVU1EbmRWNVdtTXo0YmVQNHNPWll2QkFuVjdPS3Z6UWcralBvOWk1ZTVP?=
 =?utf-8?B?SGJRQmdVTGpPLzM3OW95L1J0czUxRGVYbFk2aCt1SWJadHN1c0hLVXdEOW93?=
 =?utf-8?B?UEFKUXJrYjZhcVgzTUxYRFQzSUJCRVRrUXhTUVliVHAwcEVFemlaNmU2OUFa?=
 =?utf-8?B?Q2Z4azlqa055bmtpdFAvM1hPVTZnbDFtSGgxVUR3RytEMFc4YXJxcWhoOWhU?=
 =?utf-8?B?MFUrWXgwendYbFNld0VtT2ZBbWhtY0piYXV3ektFOFlLOWhyVFA2WjlZY0NX?=
 =?utf-8?B?ZVFBMzlWcnc2UXpqMitPRmpZVXA1UFhjZ2F3MGhxWXA1MXQ2K1c5b29CTmFP?=
 =?utf-8?B?S0lWbERVY0dJL3BjWlBZa3BmT3RCN0xaYzk5OHFIeWRCbDY1em9GdjlSbGor?=
 =?utf-8?B?VUFBZlFZcU01UTVHaWJsQXFRWllwTjk1VXBsdjdjSE9ML0ZueG1JZnlxK0c0?=
 =?utf-8?B?cmNCKzgyRE1jRjJ4aG9wNGNMQUVEQ2VYS0pJYUZ1bll3T3ZBSXVLaXM4cSto?=
 =?utf-8?B?YVdFdEtEMlpnQkUxOUJMcEREbkkvNzFZVURyejNOYjNMaWlpd2tpTmF2MGZ2?=
 =?utf-8?B?emo5OU9pSm1uOWYyU1NZZkJuemdmMldNSlZ0WHEySTlDU1oxeGZOc0Q0aGFU?=
 =?utf-8?B?Y1Nod09rc3FaRWFFNmpXNi83d004K1EwTEM1YVlvUklrcHROVzkzUEhmUjZL?=
 =?utf-8?B?bFN1VnVkMnh6SVMwVjg1QlQ4OXhYa1NVVlBjZzg1MVZDdHdFcHF1T3N3akVa?=
 =?utf-8?Q?2soPJtxWaeWMFVBAyIhUH8pEr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a92846-7e1b-4ccf-5300-08dc7b4b600d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:11:24.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocJK4PFw7953HMcYUhRmaUPH1DnJEyX9FgOjjP+4XIGN+mpw3bzSVoXNYSziDsIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121



On 5/23/24 12:05 PM, Mathieu Poirier wrote:
> On Wed, May 22, 2024 at 09:36:26AM -0500, Tanmay Shah wrote:
>> 
>> 
>> On 5/21/24 12:56 PM, Mathieu Poirier wrote:
>> > Hi Tanmay,
>> > 
>> > On Fri, May 10, 2024 at 05:51:25PM -0700, Tanmay Shah wrote:
>> >> It is possible that remote processor is already running before
>> >> linux boot or remoteproc platform driver probe. Implement required
>> >> remoteproc framework ops to provide resource table address and
>> >> connect or disconnect with remote processor in such case.
>> >> 
>> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> >> ---
>> >> 
>> >> Changes in v2:
>> >>   - Fix following sparse warnings
>> >> 
>> >> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
>> >> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
>> >> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr
>> >> 
>> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 164 +++++++++++++++++++++++-
>> >>  1 file changed, 160 insertions(+), 4 deletions(-)
>> >> 
>> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> index 84243d1dff9f..039370cffa32 100644
>> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> @@ -25,6 +25,10 @@
>> >>  /* RX mailbox client buffer max length */
>> >>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
>> >>  				 sizeof(struct zynqmp_ipi_message))
>> >> +
>> >> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>> >> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
>> >> +
>> >>  /*
>> >>   * settings for RPU cluster mode which
>> >>   * reflects possible values of xlnx,cluster-mode dt-property
>> >> @@ -73,6 +77,15 @@ struct mbox_info {
>> >>  	struct mbox_chan *rx_chan;
>> >>  };
>> >>  
>> >> +/* Xilinx Platform specific data structure */
>> >> +struct rsc_tbl_data {
>> >> +	const int version;
>> >> +	const u32 magic_num;
>> >> +	const u32 comp_magic_num;
>> > 
>> > Why is a complement magic number needed?
>> 
>> Actually magic number is 64-bit. There is good chance that
>> firmware can have 32-bit op-code or data same as magic number, but very less
>> chance of its complement in the next address. So, we can assume magic number
>> is 64-bit. 
>>
> 
> So why not having a magic number that is a u64?
> 
>> > 
>> >> +	const u32 rsc_tbl_size;
>> >> +	const uintptr_t rsc_tbl;
>> >> +} __packed;
>> >> +
>> >>  /*
>> >>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>> >>   * compatibility with device-tree that does not have TCM information.
>> >> @@ -95,20 +108,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>> >>  /**
>> >>   * struct zynqmp_r5_core
>> >>   *
>> >> + * @rsc_tbl_va: resource table virtual address
>> >>   * @dev: device of RPU instance
>> >>   * @np: device node of RPU instance
>> >>   * @tcm_bank_count: number TCM banks accessible to this RPU
>> >>   * @tcm_banks: array of each TCM bank data
>> >>   * @rproc: rproc handle
>> >> + * @rsc_tbl_size: resource table size retrieved from remote
>> >>   * @pm_domain_id: RPU CPU power domain id
>> >>   * @ipi: pointer to mailbox information
>> >>   */
>> >>  struct zynqmp_r5_core {
>> >> +	struct resource_table *rsc_tbl_va;
>> > 
>> > Shouldn't this be of type "void __iomem *"?  Did sparse give you trouble on that
>> > one?
>> 
>> I fixed sparse warnings with typecast below [1].
>> 
> 
> My point is, ioremap_wc() returns a "void__iomem *" so why not using that
> instead of a "struct resource_table *"?

Ack.

> 
> 
>> > 
>> >>  	struct device *dev;
>> >>  	struct device_node *np;
>> >>  	int tcm_bank_count;
>> >>  	struct mem_bank_data **tcm_banks;
>> >>  	struct rproc *rproc;
>> >> +	u32 rsc_tbl_size;
>> >>  	u32 pm_domain_id;
>> >>  	struct mbox_info *ipi;
>> >>  };
>> >> @@ -621,10 +638,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>> >>  {
>> >>  	int ret;
>> >>  
>> >> -	ret = add_tcm_banks(rproc);
>> >> -	if (ret) {
>> >> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> >> -		return ret;
>> >> +	/**
>> > 
>> > Using "/**" is for comments that will endup in the documentation, which I don't
>> > think is needed here.  Please correct throughout the patch.
>> 
>> Thanks. Ack, I will use only /* format.
>> 
>> > 
>> >> +	 * For attach/detach use case, Firmware is already loaded so
>> >> +	 * TCM isn't really needed at all. Also, for security TCM can be
>> >> +	 * locked in such case and linux may not have access at all.
>> >> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
>> >> +	 * callback.
>> >> +	 */
>> >> +	if (rproc->state != RPROC_DETACHED) {
>> >> +		ret = add_tcm_banks(rproc);
>> >> +		if (ret) {
>> >> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> >> +			return ret;
>> >> +		}
>> >>  	}
>> >>  
>> >>  	ret = add_mem_regions_carveout(rproc);
>> >> @@ -662,6 +688,123 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>> >>  	return 0;
>> >>  }
>> >>  
>> >> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
>> >> +							     size_t *size)
>> >> +{
>> >> +	struct zynqmp_r5_core *r5_core;
>> >> +
>> >> +	r5_core = rproc->priv;
>> >> +
>> >> +	*size = r5_core->rsc_tbl_size;
>> >> +
>> >> +	return r5_core->rsc_tbl_va;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>> >> +{
>> >> +	struct device *dev = r5_core->dev;
>> >> +	struct rsc_tbl_data *rsc_data_va;
>> >> +	struct resource_table *rsc_addr;
>> >> +	struct resource res_mem;
>> >> +	struct device_node *np;
>> >> +	int ret;
>> >> +
>> >> +	/**
>> >> +	 * It is expected from remote processor firmware to provide resource
>> >> +	 * table address via struct rsc_tbl_data data structure.
>> >> +	 * Start address of first entry under "memory-region" property list
>> >> +	 * contains that data structure which holds resource table address, size
>> >> +	 * and some magic number to validate correct resource table entry.
>> >> +	 */
>> >> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
>> >> +	if (!np) {
>> >> +		dev_err(dev, "failed to get memory region dev node\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	ret = of_address_to_resource(np, 0, &res_mem);
>> >> +	if (ret) {
>> >> +		dev_err(dev, "failed to get memory-region resource addr\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	rsc_data_va = (struct rsc_tbl_data *)devm_ioremap_wc(dev, res_mem.start,
>> >> +							     sizeof(struct rsc_tbl_data));
>> > 
>> > There is no point in holding memory until the driver is unloaded.  Please use
>> > ioremap_wc() and free at the end of the function.
>> > 
>> 
>> Ack.
>> 
>> >> +	if (!rsc_data_va) {
>> >> +		dev_err(dev, "failed to map resource table data address\n");
>> >> +		return -EIO;
>> >> +	}
>> >> +
>> >> +	/**
>> >> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
>> >> +	 * do not consider resource table address valid and don't attach
>> >> +	 */
>> >> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
>> >> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
>> >> +		dev_dbg(dev, "invalid magic number, won't attach\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	rsc_addr = (struct resource_table *)ioremap_wc(rsc_data_va->rsc_tbl,
>> >> +						       rsc_data_va->rsc_tbl_size);
>> 
>> [1] Here typecast is done.
>> 
>> >> +	if (!rsc_addr) {
>> >> +		dev_err(dev, "failed to get rsc_addr\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	/**
>> >> +	 * As of now resource table version 1 is expected. Don't fail to attach
>> >> +	 * but warn users about it.
>> >> +	 */
>> >> +	if (rsc_addr->ver != 1)
>> >> +		dev_warn(dev, "unexpected resource table version %d\n",
>> >> +			 rsc_addr->ver);
>> >> +
>> >> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
>> >> +	r5_core->rsc_tbl_va = rsc_addr;
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_attach(struct rproc *rproc)
>> >> +{
>> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> >> +	int i, pm_domain_id, ret;
>> >> +
>> >> +	/*
>> >> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
>> >> +	 * platform management controller that TCM is in use. This will be
>> >> +	 * released during unprepare callback.
>> >> +	 */
>> >> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>> >> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>> >> +		ret = zynqmp_pm_request_node(pm_domain_id,
>> >> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>> >> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>> >> +		if (ret < 0)
>> >> +			pr_warn("TCM %d can't be requested\n", i);
>> >> +	}
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_detach(struct rproc *rproc)
>> >> +{
>> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> >> +
>> >> +	/*
>> >> +	 * Generate last notification to remote after clearing virtio flag.
>> >> +	 * Remote can avoid polling on virtio reset flag if kick is generated
>> >> +	 * during detach by host and check virtio reset flag on kick interrupt.
>> >> +	 */
>> >> +	zynqmp_r5_rproc_kick(rproc, 0);
>> >> +
>> >> +	iounmap((void __iomem *)r5_core->rsc_tbl_va);
>> >> +	r5_core->rsc_tbl_va = NULL;
>> > 
>> > This is puzzling...  What happens to ->tsc_tbl_va when the remote processor is
>> > re-attached? 
>> 
>> Actually I don't see re-attach in life cycle. I might be missing something.
>> Following is lifecycle I have tested:
>> 
>> 1) During driver probe, if resource table is found in memory, then state is
>>    moved to detach.
> 
> Right.
> 
>> 2) Then user executes echo start > remoteproc* command, and state moved to attach.
> 
> Right.
> 
>> 3) After work is done with remote, user executes echo stop > remoteproc* command,
>>    and state is moved to offline.
>> 
> 
> Right.  But you have an ops::detach() function, which means you expect users to
> be able to detach() and re-attach() as many times as they want.
> 
>> From here, remote is offline state, and I can't re-attach to it without loading
>> firmware again. which is regular start/stop states. Please let me know if I am missing
>> something.
>> 
>> From here, load firmware, and executing echo start > remoteproc* moves
>> rproc state to running. Load firmware loads resource table from elf.
>> 
>> So, I believe attach is happening only during probe. And then, once r5 stops, user
>> needs to load firmware and start R5. I think this use case is good for now.
>>
> 
> If you don't want people to detach() and re-attach(), remove ops::detach()
> entirely.  But if you go this way it is only a matter of time before
> someone asks for the feature or provide a fix for it.
> 

Does that mean implement whatever is in detach, in ops::stop() ?
I am okay with that. Current use case is expected to attach only during boot time.

>> > 
>> > I will not look at the SRAM part.  Please re-submit when we are done with the
>> > attach/detach feature.
>> > 
>> 
>> Okay sounds good to me.
>> Reviews are still welcomed if anyone in the community decides to review it.
>> 
>> Thanks,
>> Tanmay
>>  > Thanks,
>> > Mathieu
>> > 
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>> >>  	.prepare	= zynqmp_r5_rproc_prepare,
>> >>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> >> @@ -673,6 +816,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>> >>  	.sanity_check	= rproc_elf_sanity_check,
>> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>> >>  	.kick		= zynqmp_r5_rproc_kick,
>> >> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>> >> +	.attach		= zynqmp_r5_attach,
>> >> +	.detach		= zynqmp_r5_detach,
>> >>  };
>> >>  
>> >>  /**
>> >> @@ -723,6 +869,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>> >>  		goto free_rproc;
>> >>  	}
>> >>  
>> >> +	/*
>> >> +	 * Move rproc state to DETACHED to give one time opportunity to attach
>> >> +	 * if firmware is already available in the memory. This can happen if
>> >> +	 * firmware is loaded via debugger or by any other agent in the system.
>> >> +	 * If firmware isn't available in the memory and resource table isn't found,
>> >> +	 * then rproc state stay OFFLINE.
>> >> +	 */
>> >> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
>> >> +		r5_rproc->state = RPROC_DETACHED;
>> >> +
>> >>  	r5_core->rproc = r5_rproc;
>> >>  	return r5_core;
>> >>  
>> >> -- 
>> >> 2.25.1
>> >> 
>> 

