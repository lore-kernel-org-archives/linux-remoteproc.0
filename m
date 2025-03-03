Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2D237185
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Mar 2025 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045058; cv=fail; b=QxbcD60Tner1B6fw3kD5cQNC0cwM7YTu8HabWhi7QjQp14PrEVbiI/NfkazKWgvqzVlmt8uaazSrlCIRHogUCtiYFx2yCfZBIYN9XVdBZ6nrb2ZyINmK4WnVw6mjAd7JXHEeBC158eZl0nWWiqfWcfF22/sUSGxnrpgch/JC2Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045058; c=relaxed/simple;
	bh=Um6yVPFDUb67OXiPGI5I3/gU/UpsOrgS0tWTRgVbGOg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WEZ/O61obqUBSS4dAk9q+M1leRqjLVgsUu2pJgzlxDbWB5n4PCxwGka1GmVni4L6qZK8F2Xb+a/azI928lOpYUSYCQYt88oDWb/ifQ9S4H7Y2tDZJC94BEIsq3UkWDbcZwj8MKELeVsoDAJpj9tYoiCpY67j6vwij7QRWGsTYNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IRbW0i47; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IRbW0i47"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZuEnWw2q1l0jRtzODjazxySIUamxe1LhNsimbLuTB8DiIp2pBe7Ge0m/WUfmzkhV92TjS5PurXGGowzALb7NZ8IMmyy0Jw66Es5SLv/kvH1nkpJucJ2aRR3uVwRhsMECeB54QNNtV+0l9dcegAb/rEqVH4w4HJeJC/hzgHbVFDIGep9vYcbMACI1SRxrxUdb8bnBcq4Au1o36fDNuvpmuS9z++uzn2Q3j/nG/6DQIGmdmECybkjPYiRVX5sQEYjzbI7jBEvsNJxs325lIB9W7C4PdIiY9GzHh5UG9WX/jHQMmVR7dr2XHMqzM/4hgD0bwZaNjLMFJHevwxXw/HOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIKhCjxBpp4q/mFVLAF4neIxnPjjhPJuo9bO8QtCxL8=;
 b=IaufhH4vODA07B18iMfqZ2hksiYLmFtrGvcf0ZesDwhGeoDrTYrTfAr236WD8JHIqqN+z9Xvl8XQjUWBrxtWjKGfCRQim2uzNXQxptLzbanb8NwX0sCBYtLgK1PUqjf0PbVKhLOSnOkCHgOEDz9zibPWjlkrKOKWeOHBBUfLdEKfp+qQ24ScvdI37K4zWLCst+DTs2luL+XjTw8OS/2/V99WQMZ/+76HfOirJT5IRQZHYJTev2GqGvlBPae0qWHh67MojNLOJBulatGoMm+rrqbhXmS6Jyc7xsXRFgCocFpI2lsGBo9s5/zApRRA/RtH0nz16LYD56S3fflSAZ6Qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIKhCjxBpp4q/mFVLAF4neIxnPjjhPJuo9bO8QtCxL8=;
 b=IRbW0i47QuhkVeDuLAJQLUJBVfsqNGVS/raBBfGudVMFHk/ibCLMnzlEp1h7MS2MqqXVsDAgKrvpdUfUnXFCqksaMtpDWHIBPazeXM0bRhl5l94SFkz7teyvB3uEECCZjCBevzkLXw1P7JX3+nG6YY/DM7JJgC/CliP1xQKbn2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 23:37:33 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%5]) with mapi id 15.20.8489.028; Mon, 3 Mar 2025
 23:37:32 +0000
Message-ID: <8c1dddfd-022a-4ab1-8d07-de46e1309b2d@amd.com>
Date: Mon, 3 Mar 2025 17:37:30 -0600
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: Question regarding AMD Xilinx dt changes
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Felix Kuhlmann <felix-kuhlmann@gmx.de>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org
References: <Z8LKKXJ1DUwGow-E@fedora>
 <CANLsYkyS1Uwaj4i5qe65C-DEh-avAqrvC_uYxu1bV70iTjsY+Q@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CANLsYkyS1Uwaj4i5qe65C-DEh-avAqrvC_uYxu1bV70iTjsY+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:806:120::28) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 876d04ff-3137-4375-7b47-08dd5aac5eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3dyNkFqN3Q3SklXRklVa3BuQnJGb1ZEZjNUa25tMXpxSkZtK2hpcTJsY1Iy?=
 =?utf-8?B?dE1rR2tLTTFXVC9zcXdDZTg0c1BRRVkyT2k5b0ZxblhUTXVpNktHS21uZzRL?=
 =?utf-8?B?enlTalFPZElvSkJFeUZZVU9uWW5tQmtGOW82eFEzc0pzUGt2ZEZUWm9TcktS?=
 =?utf-8?B?azBsc01WeEJIUWw4L3A0V2o5aXNLSm1uaHVLREtrWThVbWZhOFFkcDgrVGVJ?=
 =?utf-8?B?WUhZdlhoMVRmVzl6bzdCRGFNTnc0aEhzbDhoVXZXTmZvaEdYMC9VSVNEWlVq?=
 =?utf-8?B?RkNXTjg1eUpTN3crUTd4NUNGczdTMWk3bU5KSm5TSjhHOTFsamtxUXRjMktU?=
 =?utf-8?B?UG5KR3dEZGZLVGdqaXdRd0FPMGhGL1FxNHZieGNxSTdWaXNGeG1rbzFrdXJE?=
 =?utf-8?B?Yk1YVHI0ajBQMXRZQ1NBYkhiQ3lMZGdsQWtrdjR4TnhkKzg1OGtwVnpZZ1hw?=
 =?utf-8?B?czNhaG1UaWo4SmJSTk1WeE9TelJnYTF3VGpmc3NDUnYyelZ0bVpzbGZYSTJK?=
 =?utf-8?B?OXRPcFNUUkRXV01ydU1mTWQ3ajZib21oeDJSMDZBcFpQY1N2YUNNT0FDY3ZP?=
 =?utf-8?B?cEsweGkrcGdXMm1KZlFZNHIzV3ZobmpZNWdVR1dnNERlODZ6UTFITW9NekpE?=
 =?utf-8?B?M1FuMjdDVmx3Y05BdzFqMFFUczJlcjgwclpoL2RkVUxlUHRhUUM5TWJ6djRl?=
 =?utf-8?B?RDFkOWNYdnJ6U0RIVFU1MEpXdERiR3BRcm9hejlPcTFQeTM0aHQwdVoyN3Bt?=
 =?utf-8?B?cnFoc1Budm91VTlUZFVpdU1vZ0I3UGEycXF0SFdrMTNPeTZHc0NIcFJVa3Yx?=
 =?utf-8?B?d3FVZkdUekYzdHVIOUJqbmhTWHVJckpEQ3BRTjZ5c2lUK2pENW1nS0pLWFBw?=
 =?utf-8?B?a3VOaVJ6NGRDYkhsdVNqWHA5R1Q0NW5ieHJqMVhJL3V1TG44dFJGSVN0ZENL?=
 =?utf-8?B?ait5dngwejUyVXJReVlSTUFlL0dQZE5WYjFTNTN4UEQwOEtJRStiZFk0VHhx?=
 =?utf-8?B?OUNFT3k3QkNkWUdhQ2lmSlVHMUZZVU9JMkV2Ty9ZVzBJSUdPU0NOcHZkV3Vi?=
 =?utf-8?B?aFEvQXMrWlpsQ0VHOWMwc09oRTMwZjVPQ0hRZWd1cHFJRG0vcll6NjJtd2NM?=
 =?utf-8?B?blI5bGJMMVA0VytiVlVYY3MyVm9rWFNlQlpwc202MXRmVlJaeHgvbms5UXM4?=
 =?utf-8?B?K1BIUElTRzF3VjV3dHFORHhoZmkyQ2hmNEY4RTd2cmNsWjlROWVkUW1vNFov?=
 =?utf-8?B?ZnZmUGJZNjFLY204a0RjY3lmbWk0VzJXT2xoZ1B5RXZrUFJ1QndDbFo1eHo3?=
 =?utf-8?B?djlzQ3BmVmZ1Qkg4L1d3RUpaVVFaeHJxU2ZVT0tKdWVMMy9abVp6Y2ZJQnlL?=
 =?utf-8?B?TWJNRFNuRVZaU0tGN2ZuYTlQeW9SQ2tKN0FzZDkyVkU2TDZmT2MwaGtUTHMx?=
 =?utf-8?B?dFQxdFVsOGM0NUFac2xXUEVaaFFKdXlGTGpNTmZrc2xsK3RmK3NWUEFLUmk4?=
 =?utf-8?B?emgraHhvbXFReGwybzRxRmt6ck5tWVVqSDV0cURRQ0dDTFRyR1NObDZJOG9q?=
 =?utf-8?B?SVdnVkg2T1dtcnZMSzkwQ09YYTQ2bXhvU1VWN051Mk14Ny9SOXhpZHpDTE1z?=
 =?utf-8?B?NGVETlF0QXBNSlI2RFdyL0NNSWNvb01LeGpOc1QwTnN2RWNhREZYV0tKVjdD?=
 =?utf-8?B?c1JRRzRFNlJxeDduUXhNRlZxTnRzM3EvYnpmT0c3YjNPbk8ydjh1Y0wzQjVp?=
 =?utf-8?B?YTJma3BzaE9EU0Qwd1VkZFlucndFc2dzT1FMUEdUYzRkZnNyL3dFRGRpWHEw?=
 =?utf-8?B?SWlmejZrckFHTTJ6QTlHdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjNONlk3RjlMM05XMVE4MEJQcHdGWGFJcVRraDZVT0RlY1ZqTy9KMGNabGhO?=
 =?utf-8?B?ckxNV0FZd0UySkZ1N21aOVZpVlJacm00SmlNMkpGZ0c1MlU2bTd4ZEUxc082?=
 =?utf-8?B?dmVkQkVnV2hKNlJaZFViUE5KbEZ1MTB2TkxscnQ2ZDlUdzBlZTQxWksweTRp?=
 =?utf-8?B?MXJhaUpMbnYvZmMyMUNuWW5sV3dlcExXYTdRdlNNKzZXcnRMWWZ2RlBpYVV2?=
 =?utf-8?B?SXI0ZnErdXNkMVAwdnlSREI1NVVPRkNyNCtIQXN6VUdIZGpTMGpmaDVLVk12?=
 =?utf-8?B?a1RlYXYwbCtBU2dLblB1ZmRGa1d6dXptSmU1R1FHL0FDY3NuT2FwbVVNMlF6?=
 =?utf-8?B?MUpuZDRScGdoUEJGUGR0MkFBVS93R2tZbHhJajBETDB5TG85Z2dhUHh1TDVs?=
 =?utf-8?B?MWRJTUQyb0k5NVZxVlVOd0JRZDRJRkx1V3ZVNHltanhlQm1uUVAyYTNRN0VB?=
 =?utf-8?B?Slpmbnh4NzNoK21VRXJIT2Jmd2Y2bTlFaEI2ZElmOUwzMDMwc21UTXBreFhI?=
 =?utf-8?B?VTlPMGNaS1RmbGNCQVFvNEJFdkhQU20vdkVJQkUxTWVkQkUxeGwyZWlaNzJn?=
 =?utf-8?B?TERxL1I2Z1Y5OHkxaVJkaWRCYW5DNDdTeXpVcVhXNll4SHlpZ0VuemQ5VUdQ?=
 =?utf-8?B?OXVLZzV6ZnJOWXJaWXVKY1FLRDA3NzZXUlNxMU0yMmlDb0RUQWtDSnA1R3Uz?=
 =?utf-8?B?UWY2dXVuMHZPdnpLWWpWL2lBQWlaeXdwQjhxYTI4ZlBlQ3MzUldBejBNWDcy?=
 =?utf-8?B?TUI1VFc0RXJsT1pyNmhvcFYxelhVcG5MS0Z3dlY4cTV4RXVVWjZrU3ZQVzlH?=
 =?utf-8?B?YzdvR0haVnBnazVsbWtsZitVdHUvZ3RBVS9MN1NMa0FxTG51YkNTNldmQjRX?=
 =?utf-8?B?cGpmdVlWL3FUWTBXdXNFb3kwNGx0QmxwcWptV29DTWVYQzgvNm5NdVlvaDRn?=
 =?utf-8?B?L1E1T2d0NWFzV1ZRUmg1YkZBQkhuZnE5WllNVEhtZEdqQ0U5alZDNkhWd2Zv?=
 =?utf-8?B?aXNhUXkvYlpiQi9TRTR4c24wbFZSc1NhaWs0WE9nbXloRmxZUCtwZUg4bDVt?=
 =?utf-8?B?dyt2MloyVE5LUEhTVm9ITTZOTitEL0tCaEJIUUYvYWdxeGFIWk5WRjJ5dGFB?=
 =?utf-8?B?Z0lGbFRxQ042eE5jVUlVK2VicGkwZFJHWWdsNTNnTXYxWnpMam9UNXBGZjBk?=
 =?utf-8?B?cTc3QUEzci82bXZraFBnTXJvdXNzTjh5WnEvY093WmJIbjlwdFlodGpSZkdC?=
 =?utf-8?B?K2VabVp6enRYWFA1c0xEakczZjllRklUemJNTWh1Y3FVR1poOUpkOXFQMHA5?=
 =?utf-8?B?anRrSnkvVnlYR3ZjRVNSekFoakVGQ1RIbXBYK0VGcUxDUmR4akJ2T3kybTJ3?=
 =?utf-8?B?MEdWRGswMjMycjYrVDc0ekRTU2hHb05mSFFJeUNHcjN2cmU3TmRNTk9hSHhr?=
 =?utf-8?B?UHJTNGZlTDNZZlEwbU9tbys0cjVtbHFtQjZtanpQMmxPU05GUTVtZDN6QlZk?=
 =?utf-8?B?VWFTdlNWbnI5ZWhla1pkSWlnTTgwZU1ySWY2WmtnY0hINjZJVjhEVE41cFlz?=
 =?utf-8?B?cEhJdGNPRzlNTnhaK3BpeDl1SHFwdTVGOXh0WEFCLzBTZGpvdm5GQlhWd3d6?=
 =?utf-8?B?UGVoVzl1TWwxN3JzRklGWWxEcFVUQloycnpJOEh2Vkk0RVU2TXF0NTBDRFZU?=
 =?utf-8?B?VkltZ0JTRHpwd2dMdUR5Q3BUOFZrT01odlJxanpHWXR0M3NGVWIwajNVVEIw?=
 =?utf-8?B?cnZiQ3QxbVBzdGt5Y0tzbThSMUR3SzZDYUtGVXp2cEZLSEhEQ0w5NFBtVTdt?=
 =?utf-8?B?czhTbHkvcldYWGdDbnYyYjlsQW83MWljYWc4S01NNkxvZ0pKeHJkZkV6MzE5?=
 =?utf-8?B?R25oejB6NUx3ZFJwQW15VExkRGU1b2k0ajRJaklqd1VXVThPTndOODVlWXpL?=
 =?utf-8?B?ZkgxR0RocmVzVnhEODZjQkd3S0lSd0J1dnZ0Ti9Sc2JRd1ZjZ21DMFdha3Qr?=
 =?utf-8?B?dFZGY2RjK3hhYTFHMGlTRU9udnFyK1ExVFoxTUNsK0hBc0ovRUs5OGtLZ0Vj?=
 =?utf-8?B?ZEhML29aNkxucndwU3EzTU94c1JSa3o4aGtUek1Kb1Q3aXpqeDIwbldKQXhp?=
 =?utf-8?Q?amLVywzbQOcG3gep0MHZEIYwa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876d04ff-3137-4375-7b47-08dd5aac5eac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 23:37:32.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYc+Bes5dtjCAK0Le7QukDfEYSldRK4aSuOW6rfSe2paAAGUE+NN2u2G/qfMGCO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488



On 3/3/25 10:06 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Sat, 1 Mar 2025 at 01:49, Felix Kuhlmann <felix-kuhlmann@gmx.de> wrote:
>>
>> Hello everybody,
>>
>> I have a question about the AMD Xilinx remoteproc driver.
>> In the past, the remoteproc driver for Xilinx products weren't part of
>> mainline. To use them, Xilinx required users to use their own fork,
>> linux-xlnx.
>>
>> This tree contained the driver necessary for using remoteproc with the
>> R5 cores on the Zynq-family of devices. I have managed to configure the
>> device tree of my ZynqMP board so that the driver functions correctly.
>>
>> This is where the problem lies: I have recently updated the kernel
>> version to 6.14, using mainline since Xilinx now follows a
>> "mainline-only" approach. There, I have discovered that the interfaces
>> inside the driver that get information from the device-tree have changed
>> significantly. So much in fact, that I have to rewrite the remoteproc
>> section of my device-tree.
>>
> 
> That is expected.
> 

Thanks Mathieu.

Yes New driver was re-designed. The device-tree interface is much more 
stable and designed in a way that removes some hard-codings from the 
driver. From mailine perspective nothing new there, because related 
bindings were never available in mainline kernel. SO if update is 
happening from vendor-kernel to mainline kernel, this is expected 
one-time. From now on, this interface will be stable for upcoming 
platforms as well.

>> However, there is no updated documentation provided by Xilinx, and with
>> their most recent documentation, it works on linux-xlnx 5.15, but not on
>> 6.14 with the driver in its current form.
>>
> 

Next releases will contain this new driver in future releases and with 
that new documentation will be provided. So far only downstream driver 
was used in BSP release and so documentation was provided accordingly.

Thanks,
Tanmay

> The driver itself is fairly simple and aligned with the other
> remoteproc drivers.  Even without documentation, it should be
> relatively easy to see what is expected from the DT.  The bindings [1]
> are up to date and should also provide some guidance.
> 
> Mathieu
> 
> [1]. https://elixir.bootlin.com/linux/v6.13.5/source/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> 
>> Asking in the AMD help forum rarely yields any usable answer, that's why
>> wanted to ask you if there is any information present that I have
>> overlooked thus far.
>>
>> Looking at the entry under the "Documentation" folder also hasn't
>> provided me with a satisfying answer, since the driver stopped at random
>> parts during initialization.
>>
>> Thank you in advance and kind regards,
>>
>> Felix
>>

