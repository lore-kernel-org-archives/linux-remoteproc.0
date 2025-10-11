Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B71B808;
	Sat, 11 Oct 2025 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760148201; cv=none; b=lcVUdg6KR+55e4cLNkrjrNHhl6ZY0EnaziOYC5Yx5dJHcpIDEJf/9SA+iJD4z5s7LrKjs1l1oUDe840jMzu1ZRpKKBtHrfWjyytIDIdVCforDQAY/y/eyvOO+V8F+MDIHirNcaySddQVfm8eVIgpL55JmhlBHJUskFGKyr20DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760148201; c=relaxed/simple;
	bh=GrPho5mpv+WG9xhQRayz6jHKJ2NNy1c82XO+RaTRQeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k2aAlcZ3wN416O9twzmG3n11hmLE4iLcgm8MBB4XBV0Kn5FoJT7naZ062dc+KOUN66J4ODfkDGFoZj5LuGCgQ/vRlinmhK0/0rUYrULTWaW8G0pb4P60iy+8UKFh2QtPUC6J2np1Jk731CvaW6fHzhlxwlHLvd4NgaKjbfa8PxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Prfsbbn1; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Prfsbbn1"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0MFRB424348;
	Fri, 10 Oct 2025 19:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142135;
	bh=eKb9jUwwbVlUbudwbqKG+Yy11LCDL3Kf+uy2j4nmRg8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Prfsbbn1eKgqMa1qzk0SRZswF7vxW3iXYPk6YV+XjWjzIEVx9WZKdVoX+V5BRBiUX
	 xRC7GjSDv8/EZGFmpxUqMe8UzfPbIlHY83R1TxW0gRvm+ZYxqhfdgDZX+CoNQ7XHZO
	 1PZYT//uru6IQTTexfY/HW5AZuUsATQVry2zbrTU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0MFro2042203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 10 Oct 2025 19:22:15 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 19:22:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:22:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0MFVE2428990;
	Fri, 10 Oct 2025 19:22:15 -0500
Message-ID: <d02fb70a-205a-48c8-a972-0d8a43b61d64@ti.com>
Date: Fri, 10 Oct 2025 19:22:14 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] remoteproc: core: Drop redundant initialization of
 'ret' in rproc_shutdown()
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-1-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-1-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/10/25 7:24 AM, Peng Fan wrote:
> The variable ret is immediately assigned the return value of
> mutex_lock_interruptible(), making its prior initialization to zero
> unnecessary. Remove the redundant assignment
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 82567210052893a501e7591204af1feb07befb22..29bbaa349e340eedd122fb553004f7e6a5c46e55 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1989,7 +1989,7 @@ EXPORT_SYMBOL(rproc_boot);
>   int rproc_shutdown(struct rproc *rproc)
>   {
>   	struct device *dev = &rproc->dev;
> -	int ret = 0;
> +	int ret;
>   
>   	ret = mutex_lock_interruptible(&rproc->lock);
>   	if (ret) {
> 

