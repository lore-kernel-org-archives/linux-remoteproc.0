Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2122.outbound.protection.outlook.com [40.107.93.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21579367
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Apr 2024 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261696; cv=fail; b=gqxTkWgpNa3KptnGPjAPy/pokFGoBlnf1kBwUWZct+OJhn7zFYLDHgwYvHs4XekNvoztKIzz8bkppO2+24cFi6zRcNex8YtoKeA6qYYWY5BB5BIgX4dIzwiW9m7om9yTkaH7HbcjNxWANNcTbXww5DHQelsC/6DCFYgqbHacJf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261696; c=relaxed/simple;
	bh=+/boa5MIVKl3dE9bkBFaakSt/73p65XzAdiEhaszC4E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P7LcMNRDhmeB8gc9T6020PGOCa1TMvubxZu0468eSj8W5DYgocsFauzL9C7UHqhdG4LBloW8oQYtnVeetviz2ahUpxPWYdh4sEH/q3hkNzNB7K6vriCzjiMyRgiRbqST64sjabdLwmOaMdp9Swy0JsfiLmYVORt318FptXQosxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RDQ7TZSe; arc=fail smtp.client-ip=40.107.93.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RDQ7TZSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/aqLcqKnuD6CnyUadcRJjdiWtd7fKzQqL1pUxZujA3ZxCCe0QFhcf8984AhyiOyicUlDCkyLVBDQ+DCGD5i3VMgmLUR+3Hl3VKMqNu78JETcYoVmPkE9HeU+XYiL8TDUN/CtfH/PGrfG23mT1HUJNFV7BeFj3XK10ApsXsADTqw+8qanRLXuiUNLup2VE1UXq00bimF5E+AzmQ89jupZAwNmy+AFbeyyvQ7i8vnSQxJO7IU80FAh4iKTCIuULNXruOzoaeRYu60sfJVqJnpYOOaurmfWyVpFxB9qiMJyjB6bu604xrwtZgWZQ2WtCWvzqPFLhQfbM8wEZ0ZTVaY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IY3Z2MuQFp1NqCXdXX+PjHtf8OF26rOxLJDgA4DcYU=;
 b=Lo6sW8KMVnM0w60zpxOgTHss92nycRC/1nmjpzcrkIvcDKLg28lEefgCcZ/ha2VwBvrxfjE06vMpq2Ymbww3uN2URm2nJ2tI0QdHM5DmSIyYmY/fSfm8pnm6dykF3p4RPFEF1bB2O6TB8SnHOgOdcd3Q23kUrMXxY835ZfIUNcPs1C1JEy0xCxYMXQoptLnixTt9ho+xjOZvL874ttvmxZUJg7rQWecMfZvyBcjo6cn8TstmjdDIxdtLM8nsDpd34UxNJFQU7HH06izQ4hoSbDcaiS6S+dyhX9zrGAiaYTF9LiUc5+zyWazkodbTtaaVtlFIjfyNCeuC2357HkoBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IY3Z2MuQFp1NqCXdXX+PjHtf8OF26rOxLJDgA4DcYU=;
 b=RDQ7TZSeWh/Kc0ezUBytzlSrRzT/hD6ILsVYfxgbCy7ElsjehFCF2QvWF5kxE8OUrT7JrOpJ6ifKhgsX1e4nYw0H/9O6JGmgiKxQerlm6Z0T1DJ5BxBFwlFqRH10bT92TrAx7yN1yip+xZAyrZUZguX8bTsuZtdIECL4OhEXn/U=
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 20:14:52 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a%4]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 20:14:51 +0000
Message-ID: <6adf7a7c-c9ad-40ae-9e11-cc722c8049dd@amd.com>
Date: Thu, 4 Apr 2024 15:14:48 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
To: Leonard Crestez <cdleonard@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Sarangdhar Joshi <spjoshi@codeaurora.org>,
 Siddharth Gupta <sidgup@codeaurora.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:806:6e::33) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|PH7PR12MB5950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Pwwp/AsCO3C9048eiDQWO6axUYiU82lLNSfNzygN4L7lIVN7grct0RYfTzVoxvdTS3pL5t9yM+6bMHbBJ0Hf65Ep+C3HUF9T3Xql4VxeQjuSVUho7OEzBztrPEZpypfWz7rTHjI924dxc3wW2T9tUChuAV9A30LQTAHeMyUWSE4O7jvSAkH2l2SrWkkR2ThkG6iXk5a/ayINe48WEM3YcArUtAudUPviJVevbP+/CHH1CZ2BuE/A6FXAFGMMRe/Xg1FJ3bDuLUPxR1U9Eg0PnASuRQGcDFJNMIvr+XuK73fnnY2emJea5lQqoXl+jBwyNxOzgTjD1Ab10u8LAHyGdKXLENwm1Hr4NSEu2yeH4SgTknVG2N8HiUPqJhfZsbwaBg3Xy4fDqpSe9v/1L6IMNJPqPMYPzU/hxdOUXmDjnyudo7gf3xY9r0yXALYtp2Dsqop8lnc32IvyXVvrq1fsjYqEvlqA5941O9b/uTGXFiNpVW3/MfQAz4GhOQ/LkC/IkidUctwdyAEFqtb1Rq/tD9pkUfdaMW5sqXcQCV1d+EDHkvx0Z6SvHRVQdWNQH4ouIYiakfEpRxX6AdaJXdkxN+w5WLnofV3JBMloR7XHGStEyJNiJAbeAf40TUDu5GZBrHreP6FtfxboQxuaxr5hKsHlZRdC6gHt2CtjJd9f1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEtyUTlmdnFCaDcxb2hjK3g5dEs3UW5TM2h3RkJoSnhJT3lJOERqTXhkWGhi?=
 =?utf-8?B?ZnpOa2sxUEJGWDZPRVZOSzFVVDE5cUtpV1duTXJQdmtUSzhINFc3R1RaTWRO?=
 =?utf-8?B?YTVJVTBvc1BFVmZ2eFdGSlFlYkZYVXpoVFRRcFU3cmlQTEVaendCQUhqay90?=
 =?utf-8?B?MVQ4Z09keFRSRStuT2R2Q0pleEdWcEV1VGhITXFNQ3Q2SGZYV2JZaHR0RG9C?=
 =?utf-8?B?U252YXlUTFdoNTNmK1J6VlB6WlBQRy9xMkE4UzVpekJsL25pTlRSZ3NJNE9q?=
 =?utf-8?B?K2s2eS9IRTdhV2RkQmFmYXBEeVpNcUJ0S003VDdvK0cvbEJ6dms1WjVJdWsw?=
 =?utf-8?B?QUdPTE5palQ0cmZCaVlQajhGRk5oempCemJ4NmJlV2UxR3FRUTdXNENuWDZX?=
 =?utf-8?B?dHdEQkZ0enhYMWYzU0t4YmlEUXhSbFBMNk9IZi9tRjhpV05QeVpTUkIzeFlU?=
 =?utf-8?B?dm9vczJWSkZLV3poUWJkRmhiOG5PTUxZSDhaUEpqenU2NHJrbFQ1MytWR01C?=
 =?utf-8?B?T1JTaFhpS0dEeUNaNG5aQm13amJ5VmcwZFdNenlLV0xnQ2dodmdXcHEyLzRR?=
 =?utf-8?B?dHVpTlBDN2FzQzBUTkRQczVvMWF1WDBZelRDdnc5aGtKLzNiY3NGRG5BeXRh?=
 =?utf-8?B?RVQzZ3RsTGhFK0IrOGxPakZVRWFMZENldE9JLzM2Y3pUejlVaGRKQWpBRVNU?=
 =?utf-8?B?Um9DK1d4RWZabi9ETXVyQ2JGZ2lob2N6NHFXUFJGRk5WZTVFckQ1cUw1cmVB?=
 =?utf-8?B?eTZHNEdpNS9nOFZEejR4bTdlNVUrZDF1UGNFTGp0a0RMdVFReU5WSzRDaXky?=
 =?utf-8?B?MmJURC9YMjg1L3BBVzN4NWJMR2VFcXpqUTA2M0hpeHo1VUQ4VWZlOUQrWEU1?=
 =?utf-8?B?Und2ZDdEUEdmY0xLZHNrbUcrWGNzY1FiaVdqTHZRM3ZyUDNFdWpTL09QWGpW?=
 =?utf-8?B?a1YzQkFWNm4zQmFuaWIxRW9Eb0JhRUg5clhVdklIQkliWGNyL1lhb1FCbmR0?=
 =?utf-8?B?cUNZZWw0bE1wSlR1Q1RrcXVWSmhDUnUxajlQK3pFRUR3Tno0RnZGbGJkd1lC?=
 =?utf-8?B?cFNsdHJObC9XODFNK0ZQc3R5MFBnekU2b2hHaStFSzZDaHpocVFaK3lielZT?=
 =?utf-8?B?RFdnTlY2NFFXR2ZsSkN2Z3RaV2pFaGVzRVlRMWd2YVVxd3BZVmd5NEtNc1VS?=
 =?utf-8?B?TS9nYU8xOExRdU9kRE1YcGw1azNzc0pWbThPTGd1VGY1cVpBSFhsaTNYWjlt?=
 =?utf-8?B?WGlQY21JVXl5aEZKblpCMGZPekJ4MkxGZ01qdEIzZnJETUNVM1FiN3Z6RnJy?=
 =?utf-8?B?d2p6QklMSVBMSU5ORG5mS21OVmlZenoxTGVmRjg2ZTFmNGRxWW1uREVZcHJ4?=
 =?utf-8?B?TGF2QkdHNUM4d2ppTUhkb1ZOcDFMMjlCbksxSmtJQ2E1a1gxTGFSYm1jUFY4?=
 =?utf-8?B?OG1rR3grSFRCekluTE5sQVJuWG12cXdiejAzVjlKaWpOTmVKcXY4VzA4dHBh?=
 =?utf-8?B?Q2ZkZU5kVFhUYWZyYktTUEpvK1drTHlHcXFLYXdBa3pLTkxlemJOZmhDbi9p?=
 =?utf-8?B?SXJPMWZsYlVxemRvdzRhQktmR3g1dStzUHFtMjVXNnJMNDQxT21KVEVHSTd4?=
 =?utf-8?B?d3BxVDhPdkMxUjdzQTkwQnkvUENDZDFyaTlqa3VQTkJKK0Q1S1hiZXFSc01E?=
 =?utf-8?B?V0ZEKzdOSjNmY2p0TWRRRk9VWWZKcnJiL3V3Ym1DYm5vYW5jVFFQcFlvNDdD?=
 =?utf-8?B?dU8rQ2lneHhRRU5oTndtdGROQlJuOHlZaGhmem1pa3Y5Mm1Ra2F0Umx3azZU?=
 =?utf-8?B?RGNDS0I4LzdiK3RSSkg1UXBVV2RoYjZPZEI2czBORlpLNTdQYlhZZXp0aElI?=
 =?utf-8?B?TWNhZzVTMzlXcmtxZDhvcHg1TnU5OHZrUUNWRTMyck9ZdWk2aXd6eWd0cG9v?=
 =?utf-8?B?MVA0ejFoOW1heXVMZkVmZThLVFF2VkFxV2dxODZReThnMXRGVHg3SWNoN0J2?=
 =?utf-8?B?Q2hDZS9BeXJoZk1HMDhiSEkvT1ozT054a0N5dklYMHl5cHk5akQrUUJ5V2x0?=
 =?utf-8?B?cTFaQkxFQjVtVjEva3V4OE56Rjd6Zk1wQnY5amhRK0pFUDljUnVwMmhwNUUz?=
 =?utf-8?Q?xHBLRqebpwB+1VAZSvzokzNwS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fdfb2f-921f-4f21-c4dd-08dc54e3e2a1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 20:14:51.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oia5XQKvDsurZ8pcq4PxAlzuwLpy20FZsXt2e2H40qNT9Lj39MZlGq+avT+HqOAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950

Hello,

Thanks for your patch. Patch looks good to me.
Please find some comments below.

On 3/16/24 1:16 PM, Leonard Crestez wrote:
> Supporting remoteproc coredump requires the platform-specific driver to
> register coredump segments to be dumped. Do this by calling
> rproc_coredump_add_segment for every carveout.
> 
> Also call rproc_coredump_set_elf_info when then rproc is created. If the
> ELFCLASS parameter is not provided then coredump fails with an error.
> Other drivers seem to pass EM_NONE for the machine argument but for me
> this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
> 
> Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
> ---
> 
> Tests were done by triggering an deliberate crash using remoteproc
> debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> 
> This was tested using RPU apps which use RAM for everything so TCM dump
> was not verified. The freertos-gdb script package showed credible data:
> 
> https://github.com/espressif/freertos-gdb

Thanks for this testing.

> 
> The R5 cache is not flushed so RAM might be out of date which is
> actually very bad because information most relevant to determining the
> cause of a crash is lost. Possible workaround would be to flush caches
> in some sort of R5 crash handler? I don't think Linux can do anything
> about this limitation.
> 

Correct Linux can't. One workaround is that R5 firmware can mark
required memory regions as non-cachable in MPU setting. This way information
loss can be avoided.

> The generated coredump doesn't contain registers, this seems to be a
> limitation shared with other rproc coredumps. It's not clear how the apu
> could access rpu registers on zynqmp, my only idea would be to use the
> coresight dap but that sounds difficult.

Linux doesn't really have access to R5 control registers due to security.
Instead EEMI calls to platform management controller are used to control R5.
So R5 control register dump shouldn't needed.

Mathieu,
I am okay to merge this patch.

> 
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 4395edea9a64..cfbd97b89c26 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -484,10 +484,11 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			of_node_put(it.node);
>  			return -ENOMEM;
>  		}
>  
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
>  
>  		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
>  			it.node->name, rmem->base, rmem->size);
>  		i++;
>  	}
> @@ -595,10 +596,11 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
>  			zynqmp_pm_release_node(pm_domain_id);
>  			goto release_tcm_split;
>  		}
>  
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, bank_size);
>  	}
>  
>  	return 0;
>  
>  release_tcm_split:
> @@ -674,10 +676,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  			goto release_tcm_lockstep;
>  		}
>  
>  		/* If registration is success, add carveouts */
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, bank_size);
>  
>  		dev_dbg(dev, "TCM carveout lockstep mode %s addr=0x%llx, da=0x%x, size=0x%lx",
>  			bank_name, bank_addr, da, bank_size);
>  	}
>  
> @@ -851,10 +854,12 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	if (!r5_rproc) {
>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> +	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> +
>  	r5_rproc->auto_boot = false;
>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
>  	if (!r5_core->np) {

