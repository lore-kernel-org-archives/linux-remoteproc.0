Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22313D893
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713974735; cv=fail; b=C2DpCnrsbKgKQBAqUHphHKtYJEKQLv6MZa3dwmX4XgzLEzknzlmDqy7NykF1E5dUyouTt/4bW0J01WiYaJd6jd53R2toiRqgjibWGPqdfBK3KAgimsR0O+OsWGdCyboEc4GHNl13pz2rOFGWywOgoFcsFKuBGUwXpxvxJPJyrLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713974735; c=relaxed/simple;
	bh=4cP3iMOJKN4Ff2DrPVebdRXLtFCsSKl2XhNtvzaF518=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=taxTwnHnepNgyIRVQ62Q/2JwTghE8nuC47Zn7CYktrhbTPD9Ji9AvYWTuH+4vF2QDhGgmUc2obHBe52qk0CnGgE+wv0iPk1or8xUx+3rqZ/pwgRV7D0wsSTMrRHUyaycPbGBWdaO0DpTNEfzoKHG+yHiCxKzOQHMOwCDdLRXUbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=casVup18; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="casVup18"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0PgR7VnWmlPoPPYnEenkYTdIdvC6xOkAxIiASBaNnLM3u45qITaW9gxeByGSPzo4U+slFmOQedd3bwuWw+vNou77uiRyU3Bj5IokaL/sseXZNJBuU8FdNjH/dJvq8cTVALs9xhpdcVXi/fzGw7dZPe4EDJ5Y3RJmvyLD68dNmbLCDltgvl3k3U0eUFhKtWBhMJNuiQj+BaAeYtXiZ91QeVELkN/QeafDGrzkynR/pu6q2J/4imZlk5f+uqUSNfZhSnLghThSk40TMjHOqe4JyAyEQT4MpYAtWQrZhWYu1sylG8cARGJvqIuqAWje9ioVNbZks8GpyoAJTPX+b848w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdDzwo77b6gE2t8YkT6Lyta1s8w6gXJNW7FErQjZVqk=;
 b=eNAH+0R5r7JdCEK4G4pf+KucAZfDu5LpWL2nHXGMK7yZ+Q4QO4/XF16B9gGGuulzH7NFUuKdv6t2Rp5sRAITGJcm8RUD9SiScN5EGepIg3VUlYpPdBgMK23EYKyb6hnkD4TzeyL8eXR+BH5XzjMO4L8IxSppnuNZWZZTdA/qQ83tGoigecBjKmvxxbxlo6oHO/LGRPdc0k/Ydupal2JoBPnO8cc43SMj3pKLelM332XTiM4TpjfMh9N7TLAfIjN6VnjeBomQ2aGja2zZ6zj0utakFHHG7bYzS5FGAv4LyvWOJy5pQvvU04F2mVxTlEfZFUdmMeLw8fkQnRl7tUM7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdDzwo77b6gE2t8YkT6Lyta1s8w6gXJNW7FErQjZVqk=;
 b=casVup18PvgtONLNKdWXXeke4ixqVOQE1Yot2LP5YeV00Dsc1T224GV9o3h+MCChZy8Xf2ID0H0EddViB4esJE7BJIrJssjHSnCqXVTIA/+i1VeJTSjF2GNSurJ79/fbOYXL/PEIe16SOM8YA72+yq30Yt9ZSFid+Jtvjdnz3/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 16:05:29 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 16:05:29 +0000
Message-ID: <eebc79fa-7fcd-4417-80a9-eb5004e4d2e6@amd.com>
Date: Wed, 24 Apr 2024 11:05:26 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [bug report] drivers: remoteproc: Add Xilinx r5 remoteproc driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <77483e55-d015-4444-b6ee-95fbfb226fde@moroto.mountain>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <77483e55-d015-4444-b6ee-95fbfb226fde@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 8899bb4b-11e3-4875-f6eb-08dc64785cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?empYdk1VMTEyL2dGZ3UvUnVyT1ZOR3RDbGp6QWNoOFZ4SVp3YlhhN0U1Sytu?=
 =?utf-8?B?RHpqU3pxRDNwRzc1TXpIalpReE9sS210cnBQa3pTc0p4UTM3Qjc2Q3VuV2Fv?=
 =?utf-8?B?d21jN2FSWURwaXZEaTQwQ2Q0ejF5Tzg2Mm5zVDRrem5UUitjMEJpVzJFb1Bt?=
 =?utf-8?B?YmlxTHBsaXpaYkVtc3puRThnUVVJN09Bb3RRWE1lK1RxelJTcGxDZG1TNHM1?=
 =?utf-8?B?cDBGK09UbHQvUEtUcXdSL3A1U1Q0ZzBNVFR0UzQrYWRFQTBJbmdGRFBMVVdY?=
 =?utf-8?B?QVN6T0JkbE4rbzVMK3FUK0FmL3pZNUh0Y2tBakFSeGF2N0NqZkU0VnN5RkdG?=
 =?utf-8?B?Q29Hc2tyMnQ3RE5rL29IRURuMlIrKzcrOTFTc1FwT1g5VXlBQUJYbmRTZXMx?=
 =?utf-8?B?ZVEwblR3ZUJ2N00yVWlSRUpzTTZ0WDhoTTVXRVJuMU9NcGgyMExwNnpRNjZ4?=
 =?utf-8?B?ZFVaVTY4YW1tRzZkVExhZ0djOEJLekJmaGFIM2FjTmRGZy9OSUtzT0NJRzha?=
 =?utf-8?B?SHRJdnFpQUFIVXJGYkZFQ1RsYWxtWEMwSEVZbmRhVFVXbmFqUWJNQWVjbnB6?=
 =?utf-8?B?d1J2VWhxM1JMb3V1Y0FUM2tLKzc3c3QrWTN1SlVGSFhGK1Rua050RlR5NGV4?=
 =?utf-8?B?QS9PenNDNjljdHFscytwVlM2VUtXUU1ZRlVYN1RTZGx1bG1Nem1NTUNxcjNY?=
 =?utf-8?B?RzN1SFVGNmxLendTMG1HWXpieWtKR3lDUS8rMEJhVEUxQmhzVmh2N21hVldE?=
 =?utf-8?B?cTJBTU55MTlBZGpaeDRGekd0bEVkZUcwZm1wdHJWbGc2ODkvMHZxM3ZkNmNp?=
 =?utf-8?B?TmVXTjFaRFNWMHFUM1M2Q0MrT3ZMNGlrVjMvVCtpbDBDN056RmJBVnlZbjc2?=
 =?utf-8?B?cFJUY29pSFJqd0xOSzBENDd3d1U3eHJFNVNmeWp1dm14U1NtVitoMEQ1WDU2?=
 =?utf-8?B?cEFoWWx6ZlNmQTBEQ3RNd0hLaFRpOC90VXlTV1prNy9hc0U0MW1JVFRBcmQ0?=
 =?utf-8?B?K09veldCaU03YWRYT21SMFdNeGh6WEp3emxQUmhMdXk2RWR5YSt5azRRYldI?=
 =?utf-8?B?U2trOEVhaHRSOUQxcDd6QnNwbExqcUN3UG8ySmYyQkFPMzJWM3ZLVWplNElx?=
 =?utf-8?B?aTBIYlNRV0cvUExIbWU1alVUdFh4bjBhMlNZckREbUtVZjd6d3JLcVpDdGVq?=
 =?utf-8?B?QjFUeTkzeUdSMWd4T0NQdityaUs3OGFCaXFTeS9YVW9FOS9VOFEvaDBLUDN1?=
 =?utf-8?B?ZFRhbEx6U3ZPbWxScTRtbE5vTzhVRTAwNjQ3UUxJaEZZY3o4YWlKejhqemJz?=
 =?utf-8?B?WU1lSHZKRk5pVXg2OVMzTXAxN0ZLNE53WVRuaE03bWpsL21JeHZ3WWtoblVU?=
 =?utf-8?B?Y0tOYVQ1WjBGbFVDL2hoWkRJZWZERzdUenZiSWZyc015SDgxUHBCWUdiRzlX?=
 =?utf-8?B?NFdqVnNvN2tPR2FsWGpST29uK2UvZFVxVGVGamx1VXVVRVNzZ24xNlNFTXNU?=
 =?utf-8?B?QkFLQk1ZeW15eXlMNmlIL3IyWk4wU0hYaHVyVXRrOGxaSXQ3di8wMWpxaDla?=
 =?utf-8?B?ekxzdW5CY29nak5Qem1vdDY2WUVVYmxmWlhPS3BWS2dOQ1FJV0M3UWxDdVVI?=
 =?utf-8?Q?U1yF8ON2bbhFgLGpYiaSLnbg1NtQeYSt9Qbxe+mtGn2Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1JERXQ3ZHhDR3pXNEhKWjRyRmpvdDY5TnlEZk1rVmZycjdqd25UVTdGd2pY?=
 =?utf-8?B?MVNqK3BIaERoVURhU1RRVnZLTDlBN2hjTkQ0YkF6Z01VSHNUY3JSTysrVmpY?=
 =?utf-8?B?bFJ2VkE5MWd1NTdHYWczT0Z4d0xoWm92aXBKZFgrK3RSdGdQWVZmbHVKczNM?=
 =?utf-8?B?cEFzMklTeDVtTjFWVzF2eFBxVmwyZ3I0REdIV3Z2V3E0SEJPU1FTU3VjWFF5?=
 =?utf-8?B?NjkzdlkxeTNwUVZaTXoyY1phNmZ6RW1FL3dGQmdQRk5TNm5SYzBva1lHTjRO?=
 =?utf-8?B?UHJHZWlpNEhESHc2Y3g3eGxJUGNSK2UzQi8zUjJETUNtNFVvNzNOR3FwbEV1?=
 =?utf-8?B?M1Y5Zjh2VlBRb29FNXgvSlRiUCsrakxLdTl1cHhhYUdEaHQvdUhLUjlSc0hR?=
 =?utf-8?B?eHRnOGwvWFRsNE1mRk1rN1pNcDMxVURGSkQrcWt6QjdlM01tYk81VTFwVURv?=
 =?utf-8?B?NWdkaHdwSWtFb2tOSmdhVjRnZnEybGMwOGhUbUJYMlZMdXlEd25vTFBpN1Zs?=
 =?utf-8?B?NjFvUGJCQnoya1I2WEcrT2pLWUxIa0NpQ05HbzVYNWwxTk50ZWd6S1g4b2Q2?=
 =?utf-8?B?R05pbzlVVk1VMzg4aHpxMTd6N1ZTUnZ0RVliVzE1QTkwOENVeE9KMEkvQzMw?=
 =?utf-8?B?SFJDSHVmdGwxTmM5ZW4xSGJOekovUUlYWWdjTVQ4bEQrTlJxSW92SEFQT28v?=
 =?utf-8?B?b0lvMGRVV0hkZHU0dTJSazBiY2VpNkVodVpDRE1mbDdBelpxeGdvbDFTQjNt?=
 =?utf-8?B?dDR0MTYxYkdIZzhZQktJTSttOFFvazVhR284UnpmYm9EaWhkc1kvb2tldjcx?=
 =?utf-8?B?enF5TmJIYVlUYlB4MkRLTElScDVuRWo2Y3psa1RpMVRIMEFud2c3RVlyMnkx?=
 =?utf-8?B?M1k0U2ZKSEd1aGt2Q3pMT3dkSkpiMElwRTFHSGswRWw3WnE4R1FYY004aFow?=
 =?utf-8?B?NVdyYjRXeDlsQzNWck40SlozVjl3VldBc3crQzNEMmRsZGM1REQ2eGF1ME14?=
 =?utf-8?B?YkVBdW1tUE14WTF6SzB3VnB1WW5PQzJEVkFwQ05HM3d3YU83RldSaEhLdFZF?=
 =?utf-8?B?aUlhaDJjNEFaMSs1ZHNjWm8zZEhkbU1EL1lDRnpRY2pJTVhmZEI1VUc5dkVR?=
 =?utf-8?B?ek9oalpZQjBuZlViZFZYdE8yV1hEcWtRUUttajMxMndjWlcwNExkUEdiZ3Ri?=
 =?utf-8?B?MGprc0lLcnpMZjV6TzQ1N0xJbnJLYjlUSU56YmFwSkhXek9KYTdsRHBTWlFn?=
 =?utf-8?B?M0ZVem54RkZRS0ZkKzVRdnlDU2xyR3hDVEUydk5pamFlV3d6SFEyRlNnaUlv?=
 =?utf-8?B?VG03TU1hR1BVVVZtYTI0ZXNkT2lnOUgrbWV1TWZreWRWc2dEeW9OR3F5TVBN?=
 =?utf-8?B?N3RqMlJaZmtGMnJLVjNGYVJ6Sy9BTHlpSFZnanNKeExvTnc0MFdscEdjZHpm?=
 =?utf-8?B?THNIZi82N0pjZHFtaU9PekNoMWJ5dXFVeEZZYWVtSzZ3ZklLbkNEZDNxTW5R?=
 =?utf-8?B?OWZwTDdVRGx3VGhld3F1Q2ZVY1J0OFd2NTVGUHNtMUpoSHdJSm51Q3hycTUw?=
 =?utf-8?B?eFdvSkkybXNqL09lOHhQNDdHS0YyN1lpMERiVVdFNFJqeTJhVG51Y0hzQUt4?=
 =?utf-8?B?Vks1aVNESUZ2bDhQSExlS2J0bW4vM3VKUk5lUC9ZREdFZXBNNlMwZnFvc1FH?=
 =?utf-8?B?QTBNc3h6M1dXc0VBLzB5OVdPeTREL2piUzVwYVdnMlpENnlibGJseG0xNkVI?=
 =?utf-8?B?UlY5bjBmd214RExJaVZVa1J0elo4dWNRVkxzZjdRbnU0cEM0YnJpSktWc3Fm?=
 =?utf-8?B?THAxQXJWVUFEUzgwM2EvTDN1Q2UrV0tKZUJZWnV5NHdJL0c4eGllUUwzdUgz?=
 =?utf-8?B?T0pqaEhlbmhJRVlEeUxKUzdodXVMMTZldFJCRnZ1NmliWDZ3eGlmWnROZUlz?=
 =?utf-8?B?ajMwMXdrc2VNaGF4c2xMSEFmWitmMHJ2STgvOUQvNWxlYkl1eEFqS0lyY1FB?=
 =?utf-8?B?WUY2U1ZaK28yT085WEJwVmRpbW9zNHE0U3BDSk1jOERLQ29kd1VHcld4ZC9k?=
 =?utf-8?B?VTNTOFVUOThROEZiMVRDcmFwRGtqVm1XdldlZjZjanRnN3VwUm51NHA4Zklp?=
 =?utf-8?Q?da0QTEczUtEGZNMKhb2WRThgz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8899bb4b-11e3-4875-f6eb-08dc64785cb2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:05:29.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVeMt0zbyTJdD8ms4Bv50gsyklgJWMVthejLfjZliQ7LdMf5eo9FNYajvX8Cd+Or
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963



On 4/24/24 6:43 AM, Dan Carpenter wrote:
> Hello Tanmay Shah,
> 
> Commit 6b291e8020a8 ("drivers: remoteproc: Add Xilinx r5 remoteproc
> driver") from Nov 14, 2022 (linux-next), leads to the following
> Smatch static checker warning:
> 
>     drivers/remoteproc/xlnx_r5_remoteproc.c:1088 zynqmp_r5_cluster_init()
>     error: uninitialized symbol 'tcm_mode'.
> 
>     drivers/remoteproc/xlnx_r5_remoteproc.c:917 zynqmp_r5_core_init()
>     error: uninitialized symbol 'ret'.

Hello,

Second warning was fixed with this patch:
https://lore.kernel.org/all/20240423170210.1035957-1-tanmay.shah@amd.com/


> 
> drivers/remoteproc/xlnx_r5_remoteproc.c
>     961 static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>     962 {
>     963         enum zynqmp_r5_cluster_mode cluster_mode = LOCKSTEP_MODE;
>     964         struct device *dev = cluster->dev;
>     965         struct device_node *dev_node = dev_of_node(dev);
>     966         struct platform_device *child_pdev;
>     967         struct zynqmp_r5_core **r5_cores;
>     968         enum rpu_oper_mode fw_reg_val;
>     969         struct device **child_devs;
>     970         struct device_node *child;
>     971         enum rpu_tcm_comb tcm_mode;
>     972         int core_count, ret, i;
>     973         struct mbox_info *ipi;
>     974 
>     975         ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
>     976 
>     977         /*
>     978          * on success returns 0, if not defined then returns -EINVAL,
>     979          * In that case, default is LOCKSTEP mode. Other than that
>     980          * returns relative error code < 0.
>     981          */
>     982         if (ret != -EINVAL && ret != 0) {
>     983                 dev_err(dev, "Invalid xlnx,cluster-mode property\n");
>     984                 return ret;
>     985         }
>     986 
>     987         /*
>     988          * For now driver only supports split mode and lockstep mode.
>     989          * fail driver probe if either of that is not set in dts.
>     990          */
>     991         if (cluster_mode == LOCKSTEP_MODE) {
>     992                 fw_reg_val = PM_RPU_MODE_LOCKSTEP;
>     993         } else if (cluster_mode == SPLIT_MODE) {
>     994                 fw_reg_val = PM_RPU_MODE_SPLIT;
>     995         } else {
>     996                 dev_err(dev, "driver does not support cluster mode %d\n", cluster_mode);
>     997                 return -EINVAL;
>     998         }
>     999 
>     1000         if (of_find_property(dev_node, "xlnx,tcm-mode", NULL)) {
>     1001                 ret = of_property_read_u32(dev_node, "xlnx,tcm-mode", (u32 *)&tcm_mode);
>     1002                 if (ret)
>     1003                         return ret;
>     1004         } else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
>     1005                 if (cluster_mode == LOCKSTEP_MODE)
>     1006                         tcm_mode = PM_RPU_TCM_COMB;
>     1007                 else
>     1008                         tcm_mode = PM_RPU_TCM_SPLIT;
>     1009         }
> 
> tcm_mode not initialized if device_is_compatible() is false.

Thanks,

I will fix this with else case.


> 
>     1010 
>     1011         /*
>     1012          * Number of cores is decided by number of child nodes of
>     1013          * r5f subsystem node in dts. If Split mode is used in dts
>     1014          * 2 child nodes are expected.
>     1015          * In lockstep mode if two child nodes are available,
>     1016          * only use first child node and consider it as core0
>     1017          * and ignore core1 dt node.
>     1018          */
>     1019         core_count = of_get_available_child_count(dev_node);
>     1020         if (core_count == 0) {
>     1021                 dev_err(dev, "Invalid number of r5 cores %d", core_count);
>     1022                 return -EINVAL;
>     1023         } else if (cluster_mode == SPLIT_MODE && core_count != 2) {
>     1024                 dev_err(dev, "Invalid number of r5 cores for split mode\n");
>     1025                 return -EINVAL;
>     1026         } else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
>     1027                 dev_warn(dev, "Only r5 core0 will be used\n");
>     1028                 core_count = 1;
>     1029         }
>     1030 
>     1031         child_devs = kcalloc(core_count, sizeof(struct device *), GFP_KERNEL);
>     1032         if (!child_devs)
>     1033                 return -ENOMEM;
>     1034 
>     1035         r5_cores = kcalloc(core_count,
>     1036                            sizeof(struct zynqmp_r5_core *), GFP_KERNEL);
>     1037         if (!r5_cores) {
>     1038                 kfree(child_devs);
>     1039                 return -ENOMEM;
>     1040         }
>     1041 
>     1042         i = 0;
>     1043         for_each_available_child_of_node(dev_node, child) {
>     1044                 child_pdev = of_find_device_by_node(child);
>     1045                 if (!child_pdev) {
>     1046                         of_node_put(child);
>     1047                         ret = -ENODEV;
>     1048                         goto release_r5_cores;
>     1049                 }
>     1050 
>     1051                 child_devs[i] = &child_pdev->dev;
>     1052 
>     1053                 /* create and add remoteproc instance of type struct rproc */
>     1054                 r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
>     1055                 if (IS_ERR(r5_cores[i])) {
>     1056                         of_node_put(child);
>     1057                         ret = PTR_ERR(r5_cores[i]);
>     1058                         r5_cores[i] = NULL;
>     1059                         goto release_r5_cores;
>     1060                 }
>     1061 
>     1062                 /*
>     1063                  * If mailbox nodes are disabled using "status" property then
>     1064                  * setting up mailbox channels will fail.
>     1065                  */
>     1066                 ipi = zynqmp_r5_setup_mbox(&child_pdev->dev);
>     1067                 if (ipi) {
>     1068                         r5_cores[i]->ipi = ipi;
>     1069                         ipi->r5_core = r5_cores[i];
>     1070                 }
>     1071 
>     1072                 /*
>     1073                  * If two child nodes are available in dts in lockstep mode,
>     1074                  * then ignore second child node.
>     1075                  */
>     1076                 if (cluster_mode == LOCKSTEP_MODE) {
>     1077                         of_node_put(child);
>     1078                         break;
>     1079                 }
>     1080 
>     1081                 i++;
>     1082         }
>     1083 
>     1084         cluster->mode = cluster_mode;
>     1085         cluster->core_count = core_count;
>     1086         cluster->r5_cores = r5_cores;
>     1087 
> --> 1088         ret = zynqmp_r5_core_init(cluster, fw_reg_val, tcm_mode);
>     1089         if (ret < 0) {
>     1090                 dev_err(dev, "failed to init r5 core err %d\n", ret);
>     1091                 cluster->core_count = 0;
>     1092                 cluster->r5_cores = NULL;
>     1093 
>     1094                 /*
>     1095                  * at this point rproc resources for each core are allocated.
>     1096                  * adjust index to free resources in reverse order
>     1097                  */
>     1098                 i = core_count - 1;
>     1099                 goto release_r5_cores;
>     1100         }
>     1101 
>     1102         kfree(child_devs);
>     1103         return 0;
>     1104 
>     1105 release_r5_cores:
>     1106         while (i >= 0) {
>     1107                 put_device(child_devs[i]);
>     1108                 if (r5_cores[i]) {
>     1109                         zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>     1110                         of_reserved_mem_device_release(r5_cores[i]->dev);
>     1111                         rproc_del(r5_cores[i]->rproc);
>     1112                         rproc_free(r5_cores[i]->rproc);
>     1113                 }
>     1114                 i--;
>     1115         }
>     1116         kfree(r5_cores);
>     1117         kfree(child_devs);
>     1118         return ret;
>     1119 }
> 
> regards,
> dan carpenter

