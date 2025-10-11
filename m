Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860E134AC;
	Sat, 11 Oct 2025 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760142394; cv=none; b=Zj8AGqiabtGpD/gLIQlHT8ZsgZt3VA/eYv3z6hZET1KOzOzi/Yb+VVR1o+MkwylJkt3xKYRCXtAADP9glZT2To9LdKx5E1EfNF6J54heuvwlgL7aptVsDGSdMvJSW7rTU+Y0pWhwPHRQWq9DTBMJJFhXMSOKIIEIVMQhnqG2ybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760142394; c=relaxed/simple;
	bh=iNSlIhaRzlk9zJ6qBTWKy3/g9z6Y+BykiDt9//5NypQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KzmjdxSy2FvaXrfo2Xc9SPKdLT4LcAUXvbLIZc8uBRGDcIOB7QPNH3zE4UPDzTOKCgE3Mvn/AbtOIlizLBi1HHDWOkJ9CRk7PzIeGJO5gJtia2MW2j0jl6J2SKh7Ah1OTheg7Y2FzprVFMawzAZ7yq3c+iZwnsz/gR/QZZSn4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hDH8fMnL; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hDH8fMnL"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0Q50l873552;
	Fri, 10 Oct 2025 19:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142366;
	bh=R/p3aeZ2469/VM/d0M9zdk0kPze0+6RFg7wHHi/c7B0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hDH8fMnLgbrB7LY0TQ3tcyNLCT4MT2KL3fZvuefzeNZtAkw8uovEQYun2vfA5zu4w
	 a/SxisuUxhrcbzY2RlpyIuu2/J0vNyvWBDQyMZhwCSSFvbNc0QSZwtT2nR/sigzwUg
	 ijSyUGBEe2Zd69Lg0WzAypRs/Rgs5wioZQFvieyI=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0Q5I02575496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 19:26:05 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:26:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0Q4s02432767;
	Fri, 10 Oct 2025 19:26:04 -0500
Message-ID: <a8a35f8f-e962-4a2d-ac56-46306c0c1658@ti.com>
Date: Fri, 10 Oct 2025 19:26:04 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] remoteproc: core: Removed unused headers
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/10/25 7:24 AM, Peng Fan wrote:
> There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
> so remove from the included headers.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f7d21e99d171667d925de769db003c4e13fe8fe8..8004a480348378abef78ad5641a8c8b5766c20a6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -17,8 +17,6 @@
>   #define pr_fmt(fmt)    "%s: " fmt, __func__
>   
>   #include <asm/byteorder.h>
> -#include <linux/crc32.h>
> -#include <linux/debugfs.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -30,14 +28,12 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of_platform.h>
> -#include <linux/of_reserved_mem.h>
>   #include <linux/panic_notifier.h>
>   #include <linux/platform_device.h>
>   #include <linux/rculist.h>
>   #include <linux/remoteproc.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/virtio_ids.h>
>   #include <linux/virtio_ring.h>
>   
>   #include "remoteproc_internal.h"
> 

