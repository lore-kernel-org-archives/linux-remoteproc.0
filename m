Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B01C862A;
	Wed, 19 Mar 2025 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742388254; cv=none; b=q3vvDJvhGC5i0LuihT/GMAkxsX3oGMC5XBz6JzKUErI0tjL96TNRE0axQGAUDuM/KDFj0lDiOTt1OiseA6A+9pX8QZynG7oAulUFcs+K4kifQ9PPHsFQghK8FAhkP3N3fHR/zsiufuPByEj7zui0Gk2bDRlVvlaUHld7+7D1lZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742388254; c=relaxed/simple;
	bh=1kWB5fq001V/KaqQZY+FH9ign0/3Tensqh+3o5Vjhi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hkZ3YQtgyuFgz7mFhL2d/qVgIwzTPf4WGmeza3PTkXMPTQVFarYhbsm/oS0vokmbHVdHPaH4SrReUDwArMH3LpcKSvrozxxL5v3M+LjcRu7kS+silhuUGk/HTG/boSJ5f6McIsThLD5ier4T3ixqyiBnC6tgSs8ReR3E9cU7szA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6nzifC5a; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6nzifC5a"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9SPAI032517;
	Wed, 19 Mar 2025 13:44:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sOjFPbQ5zVqpuAx1SW4609SW73aMEvixS4SM3D5EQlA=; b=6nzifC5aMAQV5k93
	XYVirVNw8xuT2NBBMX/m70KLWJxcnrObZzlvoEHnzQd8npB4bRiyCE1GG+hvIBkY
	Xq7QjwYmiuHp8TnDdjSwAMFNiiiai02h137mvXV+oRzCITb5g8A038RZhQDDH2qS
	sF15hK6G5dieXcJuTrFbPRkg2CKDiLIB58Mi8ZNHuSFdqR3MBxdZC9qGnHThOOVI
	wnCiBpkwNzxxMaoYUpD6lCxki6u0AescJJsYv69gzMblhAlwhG30wrcB74RbnXuD
	rgP9jgg0qz/Z+Vc/NumefhLEF0KS2izFcQCwHSpXPAHadeTihyCFcTpLUedTQOZr
	GCtxEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuaw0xa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 13:44:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4A61040065;
	Wed, 19 Mar 2025 13:43:02 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 330DC7CAD96;
	Wed, 19 Mar 2025 13:42:16 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 13:42:16 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 13:42:15 +0100
Message-ID: <f64d13b1-60ad-4871-a59c-bc768f092091@foss.st.com>
Date: Wed, 19 Mar 2025 13:42:14 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: core: Clear table_sz when rproc_shutdown
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Arnaud
 Pouliquen" <arnaud.pouliquen@st.com>,
        "open list:REMOTE PROCESSOR
 (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
CC: <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
References: <20250319100106.3622619-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250319100106.3622619-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01

Hello Peng,


On 3/19/25 11:01, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is case as below could trigger kernel dump:
> Use U-Boot to start remote processor(rproc) with resource table
> published to a fixed address by rproc. After Kernel boots up,
> stop the rproc, load a new firmware which doesn't have resource table
> ,and start rproc.
> 
> When starting rproc with a firmware not have resource table,
> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
> trigger dump, because rproc->cache_table is set to NULL during the last
> stop operation, but rproc->table_sz is still valid.
> 
> This issue is found on i.MX8MP and i.MX9.
> 
> Dump as below:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
>   ESR = 0x0000000096000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x04: level 0 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __pi_memcpy_generic+0x110/0x22c
> lr : rproc_start+0x88/0x1e0
> Call trace:
>  __pi_memcpy_generic+0x110/0x22c (P)
>  rproc_boot+0x198/0x57c
>  state_store+0x40/0x104
>  dev_attr_store+0x18/0x2c
>  sysfs_kf_write+0x7c/0x94
>  kernfs_fop_write_iter+0x120/0x1cc
>  vfs_write+0x240/0x378
>  ksys_write+0x70/0x108
>  __arm64_sys_write+0x1c/0x28
>  invoke_syscall+0x48/0x10c
>  el0_svc_common.constprop.0+0xc0/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x30/0xcc
>  el0t_64_sync_handler+0x10c/0x138
>  el0t_64_sync+0x198/0x19c
> 
> Clear rproc->table_sz to address the issue.
> 
> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V1:
>  There is the other fix that I could do is to clear rproc->table_sz
>  in imx_rproc_parse_fw, but I think this issue should be common to others.
>  So do this change in rproc_shutdown. Since it is in rproc_shutdown,
>  clearing table_sz should not incur new issues.
> 
>  The kernel dump is found by Jacky Bai in NXP internal test, so not add
>  tag in public list here. Jacky, feel free to send a Reported-by in community.
> 
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2cf0d277729..b21eedefff87 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2025,6 +2025,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc->table_sz = 0;


Your fix makes sense from my point of view.

It seems that you should also apply this fix in rproc_detach() and rproc_fw_boot().
Regards,
Arnaud


>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
