Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EB2AF03;
	Wed, 30 Apr 2025 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997177; cv=none; b=YMdLXB1sa1x4wWhwahBJ79YUmWwh8EbBWRPB/6F+j+DURSUDqcJpVOOJGFN1UzMUraydZxYworPo8az75UmlgRBufPRKz/V5DgwbgOJX37C0DQRcdqoqHIYSnHtvBV1EnSkeynThNt+MtR0UMan4vyhfKQS+CO5Cu2GZltuzGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997177; c=relaxed/simple;
	bh=T2w/G8ZOihQQyvRaIVFA/e9hGoqNGccArVCmyYGXc+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mgOhYZVS7GhfRXuJJPatascpd8nc5NRYjtTSBKY8RQQjyfIdqh6B9/j3AxlMQsB7wf8/cnusDawJkHW5HnPcrz5ZO1goUC01lj7i1FEjrc40L3/1PyGShIdVSP+NZyefHteGajB2AAS8q/FjVZRke5e82qOuD6fsgPBJIYhcQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=62brE738; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="62brE738"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLa101005621;
	Wed, 30 Apr 2025 09:12:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dD7+cYHrScNJoMn59i264AJKE2eg9ppPGAtwxqrWMtM=; b=62brE738T5Nko+Ko
	tQB9oqOo5f2Yd6LPwIRqYxWt+n7TEDoDy4DbCThbYw42uQInzmIfcjaoQIkDiQig
	YPCz2spqjRpox3Pnwl2r/gWa4esacBVTNOiAUzVxBLfhtSSI4a4UPnqb6rQVzghL
	rGxmv/uSwssWfv3hR4UuJFBebt+BrKe91JHL7GbXFptL/D+HlVFTTsIQ1Q6OOxc6
	/NxH3d+BVssmoJRpngAgzMDYq5I/rwtroOC6Ax/y5mB1wYQfDuOSGhhjD8ZJTNpM
	p/PLEyA7ZlXiV4gEEZWcSIMUXtgc5RrL7qHMIVbVXv62P9re1ogAOt5uFuAxH5p8
	AtyxqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tphmb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:12:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6E4040097;
	Wed, 30 Apr 2025 09:11:46 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72986A47049;
	Wed, 30 Apr 2025 09:11:46 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:11:46 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:11:45 +0200
Message-ID: <723fd0a2-c1c0-4a3d-8f48-2913c0206729@foss.st.com>
Date: Wed, 30 Apr 2025 09:11:44 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] rpmsg offchannel deadcoding
To: <linux@treblig.org>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <corbet@lwn.net>, <linux-remoteproc@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250429234600.301083-1-linux@treblig.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250429234600.301083-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01



On 4/30/25 01:45, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This removes a couple of unused functions in rpmsg,
> and (v2) after discussions with Arnaud, follows the thread
> and removes code that they would call.

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

> 
> (Build tested only)
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> V3
>   Fixup comment on rpmsg_send_offchannel_raw(),
>   removing the reference to "_offchannel" - as per Mathieu's
>   review
> 
> Dr. David Alan Gilbert (3):
>   rpmsg: core:  Remove deadcode
>   rpmsg: virtio: Remove uncallable offchannel functions
>   rpmsg: Remove unused method pointers *send_offchannel
> 
>  Documentation/staging/rpmsg.rst  | 46 -----------------------
>  drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
>  drivers/rpmsg/rpmsg_internal.h   |  6 ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------
>  include/linux/rpmsg.h            | 22 -----------
>  5 files changed, 1 insertion(+), 160 deletions(-)
> 
