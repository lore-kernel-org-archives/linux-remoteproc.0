Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369E13A407
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 May 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005600; cv=none; b=Tu2U+IxNN0G7SqNgymFXKdp7y8TnneNvOuSrC7JSTM3jf7NgYa4FTkckeBAvKPwtKTH6PvsrjZbP/sf8fmqa5Z9MTOKyNnKm+ygpikYAn/an9uQ06xeadr/HwXmO+2gbxItIM/3IO8NYdBnExZvDgWmnQ+5AUfFPFyQ8tmjeU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005600; c=relaxed/simple;
	bh=NBYBHqpLwS45WOk1iK0IQfkQmOSTawZ3ppayBnV1Qjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nx/O55sUL00Q/OvwfGtYwtUIcWMtUBd7GpTV34RbNB8FVHm+j8cb7LLrNnh7TSw0neXWVz5e4uyW+e5ltdvUIngoWEz5e+rHfMtklZd8zvCvHAH1/QKeCVqnBBWveG6jJsdXnozNYe2Ry6hOTh8qGEx96sImiHs7Zpe57CgU1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xhgRl47r; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xhgRl47r"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446EQbqn019128;
	Mon, 6 May 2024 09:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715005597;
	bh=8jPu5+l3o636pbDzrflRrgcKIpRZajA1yjf0E7j4xjQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xhgRl47rdIfXzxwH01immnJ4X7/P09NHFABhbhhwkJxYv5DR+xMPCcz650LLJ8NG6
	 Qp+V3j1IhFrEca8ab2wwOUDj5M5WOV1zIxAZUGKQKYJL4UQXx45Rvh2ACi4IOymMFY
	 tqdfWiN8gp6SgsoAwtduRFTzKivIgFehqG6GAL6Y=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446EQbaZ013364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 09:26:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 09:26:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 09:26:37 -0500
Received: from [10.24.69.66] (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446EQZ9w094259;
	Mon, 6 May 2024 09:26:36 -0500
Message-ID: <a9f75b4f-a5ce-4c0c-8406-f0646ad36144@ti.com>
Date: Mon, 6 May 2024 19:56:35 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] remoteproc: k3-r5: Do not allow core1 to power up
 before core0 via sysfs
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>
References: <acc4f7a0-3bb5-4842-95a5-fb3c3fc8554b@moroto.mountain>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <acc4f7a0-3bb5-4842-95a5-fb3c3fc8554b@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello Dan,

On 03/05/24 20:54, Dan Carpenter wrote:
> Hello Beleswar Padhi,
>
> Commit 3c8a9066d584 ("remoteproc: k3-r5: Do not allow core1 to power
> up before core0 via sysfs") from Apr 30, 2024 (linux-next), leads to
> the following Smatch static checker warning:
>
> drivers/remoteproc/ti_k3_r5_remoteproc.c:583 k3_r5_rproc_start()
> warn: missing unwind goto?
>
> drivers/remoteproc/ti_k3_r5_remoteproc.c:651 k3_r5_rproc_stop()
> warn: missing unwind goto?
>
> drivers/remoteproc/ti_k3_r5_remoteproc.c
>       546 static int k3_r5_rproc_start(struct rproc *rproc)
>       547 {
>       548         struct k3_r5_rproc *kproc = rproc->priv;
>       549         struct k3_r5_cluster *cluster = kproc->cluster;
>       550         struct device *dev = kproc->dev;
>       551         struct k3_r5_core *core0, *core;
>       552         u32 boot_addr;
>       553         int ret;
>       554
>       555         ret = k3_r5_rproc_request_mbox(rproc);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>       556         if (ret)
>       557                 return ret;
>       558
>       559         boot_addr = rproc->bootaddr;
>       560         /* TODO: add boot_addr sanity checking */
>       561         dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
>       562
>       563         /* boot vector need not be programmed for Core1 in LockStep mode */
>       564         core = kproc->core;
>       565         ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
>       566         if (ret)
>       567                 goto put_mbox;
>       568
>       569         /* unhalt/run all applicable cores */
>       570         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>       571                 list_for_each_entry_reverse(core, &cluster->cores, elem) {
>       572                         ret = k3_r5_core_run(core);
>       573                         if (ret)
>       574                                 goto unroll_core_run;
>       575                 }
>       576         } else {
>       577                 /* do not allow core 1 to start before core 0 */
>       578                 core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
>       579                                          elem);
>       580                 if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
>       581                         dev_err(dev, "%s: can not start core 1 before core 0\n",
>       582                                 __func__);
> --> 583                         return -EPERM;
>
> Is there no clean up on this error path?  I think we need to do a
> goto put_mbox at least.

Thank you for pointing out. Apologies for the oversight. I have sent a 
PATCH addressing this bug.

Link to PATCH:

https://lore.kernel.org/all/20240506141849.1735679-1-b-padhi@ti.com/

Regards,
Beleswar

>
>       584                 }
>       585
>       586                 ret = k3_r5_core_run(core);
>       587                 if (ret)
>       588                         goto put_mbox;
>       589         }
>       590
>       591         return 0;
>       592
>       593 unroll_core_run:
>       594         list_for_each_entry_continue(core, &cluster->cores, elem) {
>       595                 if (k3_r5_core_halt(core))
>       596                         dev_warn(core->dev, "core halt back failed\n");
>       597         }
>       598 put_mbox:
>       599         mbox_free_channel(kproc->mbox);
>       600         return ret;
>       601 }
>
> regards,
> dan carpenter
>
