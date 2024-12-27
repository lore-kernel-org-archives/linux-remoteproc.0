Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF2320B;
	Fri, 27 Dec 2024 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735310300; cv=none; b=puGvXP7dqZkWV/8fIvKqWH3F8pOhwaXwSVYdSgw5FJmcoe3Ug45mRXst4dMakUDdPqi4HA4dt2bzmTNDkXVGRkFwF+1afS5RRMX8J1ez1PvXXZev0K1v6JAg4G4+v7h/7WDZ97yETyXxngSwWq3uzwRI2sf+R5pD3JPFcvK+KQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735310300; c=relaxed/simple;
	bh=PlNnngtv0vJ0l8yh7MEK+XnZcko01XQXKH+yPhi3Elo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=odeNgL/vFxC4YEBlzUzdmRJ6LodbHxVym+KJ8k2fITpF35CH4b9Vq300Wh4YmE0QNpn9PkUV10UTn9Lzfxk/Xw6q75wrLIve0Xh37I7DgzZnF9XMZL/obNz+gxR7k/acyczDNKmvFPx4u5L3exLm9/OcG70J/fzHdmNsTXYigu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rt+Xtzxj; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rt+Xtzxj"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BREc73c1143360
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Dec 2024 08:38:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735310287;
	bh=sbQbiyo9BWhOyuDkcwm1RxpOT7zhHG3Ke9zQ3T5KPhs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rt+XtzxjlRKVcbvT6BqXs2hhZVRBLmzJPGCpAJd346UnB+LON+tNJrsJJ7D2UfwzB
	 PmyPWlwaLL6xY5RkTmVwGXfjzInOlBikDumE6B4uYJk5MXWFMLgm+aRf4BB95rL3MZ
	 a3YYlhyEWtD3ztNFtJDZh4p9hRu+sXM7VRTJLwVY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BREc7bn001210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Dec 2024 08:38:07 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Dec 2024 08:38:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Dec 2024 08:38:06 -0600
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BREc6i5031998;
	Fri, 27 Dec 2024 08:38:06 -0600
Message-ID: <ecba03f8-db97-24d8-8a10-1b4d98d0e1be@ti.com>
Date: Fri, 27 Dec 2024 08:38:05 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] remoteproc: k3-r5: Fix checks in
 k3_r5_rproc_{mbox_callback/kick}
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <srk@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-2-b-padhi@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20241224091457.1050233-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/24/24 03:14, Beleswar Padhi wrote:
>   /**
> @@ -194,8 +196,11 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
>   	const char *name = kproc->rproc->name;
>   	u32 msg = omap_mbox_message(data);
>   
> -	/* Do not forward message from a detached core */
> -	if (kproc->rproc->state == RPROC_DETACHED)
> +	/*
> +	 * Do not forward messages from a detached core, except when the core
> +	 * is in the process of being attached in IPC-only mode.
> +	 */
> +	if (!kproc->core->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
>   		return;
>   
Instead of introducing a new state variable, is it possible to use 
device virtio status? And i wonder what if you remove this conditional 
check altogether? If the device is detached and with no virtio queues, 
does not the mailbox message gets dropped?
