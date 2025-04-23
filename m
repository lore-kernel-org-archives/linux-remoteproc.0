Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C71E1E1B;
	Wed, 23 Apr 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392923; cv=none; b=t9t+N2/Hi1JaGb+UQq3vwiu3ypJMYaamSSd/ZJUb3fz9zME6RJRFEWym4kUlzT7LvS0PPU+f3oBfxpoimbTMiQ8j+lEB1xpcOKJ4XzpoCfO4BWvzdSV74yesgsoyui23ITX63WQoCXqJd8TV0uNwNYyHJm1rY1fShsCNp/J5do4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392923; c=relaxed/simple;
	bh=mCHNrJx2OXmmlNCO1RdGINSUwa/TdSOBqAY8r9vs+eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m7A86CU5ankgcmIxpCRBtQTxgypAbnd1TfWalwwKGiDvad29/JF2XcblYP+3motvV+vp7FF0O7aruF0zm9HCXJHzH7FIDT/pcjW32xnr0pzph9/qJIYRkb8qyqhCOka/VvNVPm2tPTXrIep0ZWOxBTJDWUZKh1k7xBQi/619JaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yi/izMcI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yi/izMcI"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6iMai016682;
	Wed, 23 Apr 2025 09:21:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oz186CoW0SK4vdktfWzxbngjxDVHLIW2MQ5lAkHyRTo=; b=yi/izMcIM8bA++XQ
	qCxgQYc7IR9w6QJz8/5kbWJN9ZvXvsAJGHu0B6o3CiixBggQL3c0d2WtErXdg7Fb
	A0KCbgW7C4/B/i0eQ97HTLw7XB08OXyZonT2xxH77mJAFLYttZHsIIL1QYDbt3rK
	YvDPM3TovVtUDOuLsXZN3oYl03y0DCBybt3UBjxWo4ynR36+WsknbH2kpr9TRZMF
	UgD05x7QnWZbvJsfx3TNMXdavSgpVrk7w4LTtYhyJF8Gbssgso7XhvZZC0wqhRRY
	CjZ7GxaTKp3goIClEpp31/Z9FAfSwzmOBR+kJTyj73bTqam1DMoRV56sexw0VfSN
	KCSIdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjx9rnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:21:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8690540078;
	Wed, 23 Apr 2025 09:20:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1547932A52;
	Wed, 23 Apr 2025 09:15:16 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 09:15:16 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 09:15:15 +0200
Message-ID: <60e77932-9be7-443d-aed9-2b54945fdce6@foss.st.com>
Date: Wed, 23 Apr 2025 09:15:15 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: core: Remove deadcode
To: <linux@treblig.org>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <corbet@lwn.net>, <linux-remoteproc@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250420204146.154807-1-linux@treblig.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250420204146.154807-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01

Hello,

On 4/20/25 22:41, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> rpmsg_send_offchannel() and rpmsg_trysend_offchannel() have been
> unused since they were added in 2011's
> commit bcabbccabffe ("rpmsg: add virtio-based remote processor messaging
> bus")
> 
> Remove them and associated docs.
> 
> I suspect this means the trysend_offchannel and send_offchannel
> member function pointers and the virtio implementation of them can be
> removed as well, but haven't yet gone that far.

It seems to me that this API is not safe as it allows an endpoint to usurp the
identity of another one thanks to the source address.

So, +1 to remove it.

That said, to complete the remove it would be nice to also remove associated ops
declared in rpmsg_endpoint_ops and implemented in virtio_rpmsg_bus.c.

Regards,
Arnaud


> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  Documentation/staging/rpmsg.rst | 46 ------------------------
>  drivers/rpmsg/rpmsg_core.c      | 63 ---------------------------------
>  include/linux/rpmsg.h           | 22 ------------
>  3 files changed, 131 deletions(-)
> 
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 3713adaa1608..40282cca86ca 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -110,31 +110,6 @@ or a timeout of 15 seconds elapses. When the latter happens,
>  The function can only be called from a process context (for now).
>  Returns 0 on success and an appropriate error value on failure.
>  
> -::
> -
> -  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -							void *data, int len);
> -
> -
> -sends a message across to the remote processor, using the src and dst
> -addresses provided by the user.
> -
> -The caller should specify the endpoint, the data it wants to send,
> -its length (in bytes), and explicit source and destination addresses.
> -The message will then be sent to the remote processor to which the
> -endpoint's channel belongs, but the endpoint's src and channel dst
> -addresses will be ignored (and the user-provided addresses will
> -be used instead).
> -
> -In case there are no TX buffers available, the function will block until
> -one becomes available (i.e. until the remote processor consumes
> -a tx buffer and puts it back on virtio's used descriptor ring),
> -or a timeout of 15 seconds elapses. When the latter happens,
> --ERESTARTSYS is returned.
> -
> -The function can only be called from a process context (for now).
> -Returns 0 on success and an appropriate error value on failure.
> -
>  ::
>  
>    int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> @@ -173,27 +148,6 @@ return -ENOMEM without waiting until one becomes available.
>  The function can only be called from a process context (for now).
>  Returns 0 on success and an appropriate error value on failure.
>  
> -::
> -
> -  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -							void *data, int len);
> -
> -
> -sends a message across to the remote processor, using source and
> -destination addresses provided by the user.
> -
> -The user should specify the channel, the data it wants to send,
> -its length (in bytes), and explicit source and destination addresses.
> -The message will then be sent to the remote processor to which the
> -channel belongs, but the channel's src and dst addresses will be
> -ignored (and the user-provided addresses will be used instead).
> -
> -In case there are no TX buffers available, the function will immediately
> -return -ENOMEM without waiting until one becomes available.
> -
> -The function can only be called from a process context (for now).
> -Returns 0 on success and an appropriate error value on failure.
> -
>  ::
>  
>    struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 207b64c0a2fe..6ee36adcbdba 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -193,38 +193,6 @@ int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  }
>  EXPORT_SYMBOL(rpmsg_sendto);
>  
> -/**
> - * rpmsg_send_offchannel() - send a message using explicit src/dst addresses
> - * @ept: the rpmsg endpoint
> - * @src: source address
> - * @dst: destination address
> - * @data: payload of message
> - * @len: length of payload
> - *
> - * This function sends @data of length @len to the remote @dst address,
> - * and uses @src as the source address.
> - * The message will be sent to the remote processor which the @ept
> - * endpoint belongs to.
> - * In case there are no TX buffers available, the function will block until
> - * one becomes available, or a timeout of 15 seconds elapses. When the latter
> - * happens, -ERESTARTSYS is returned.
> - *
> - * Can only be called from process context (for now).
> - *
> - * Return: 0 on success and an appropriate error value on failure.
> - */
> -int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			  void *data, int len)
> -{
> -	if (WARN_ON(!ept))
> -		return -EINVAL;
> -	if (!ept->ops->send_offchannel)
> -		return -ENXIO;
> -
> -	return ept->ops->send_offchannel(ept, src, dst, data, len);
> -}
> -EXPORT_SYMBOL(rpmsg_send_offchannel);
> -
>  /**
>   * rpmsg_trysend() - send a message across to the remote processor
>   * @ept: the rpmsg endpoint
> @@ -301,37 +269,6 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  }
>  EXPORT_SYMBOL(rpmsg_poll);
>  
> -/**
> - * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
> - * @ept: the rpmsg endpoint
> - * @src: source address
> - * @dst: destination address
> - * @data: payload of message
> - * @len: length of payload
> - *
> - * This function sends @data of length @len to the remote @dst address,
> - * and uses @src as the source address.
> - * The message will be sent to the remote processor which the @ept
> - * endpoint belongs to.
> - * In case there are no TX buffers available, the function will immediately
> - * return -ENOMEM without waiting until one becomes available.
> - *
> - * Can only be called from process context (for now).
> - *
> - * Return: 0 on success and an appropriate error value on failure.
> - */
> -int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			     void *data, int len)
> -{
> -	if (WARN_ON(!ept))
> -		return -EINVAL;
> -	if (!ept->ops->trysend_offchannel)
> -		return -ENXIO;
> -
> -	return ept->ops->trysend_offchannel(ept, src, dst, data, len);
> -}
> -EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> -
>  /**
>   * rpmsg_set_flow_control() - request remote to pause/resume transmission
>   * @ept:	the rpmsg endpoint
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 90d8e4475f80..fb7ab9165645 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -184,13 +184,9 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>  
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			  void *data, int len);
>  
>  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			     void *data, int len);
>  
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
> @@ -271,15 +267,6 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
>  
>  }
>  
> -static inline int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
> -					u32 dst, void *data, int len)
> -{
> -	/* This shouldn't be possible */
> -	WARN_ON(1);
> -
> -	return -ENXIO;
> -}
> -
>  static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  {
>  	/* This shouldn't be possible */
> @@ -297,15 +284,6 @@ static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>  	return -ENXIO;
>  }
>  
> -static inline int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
> -					   u32 dst, void *data, int len)
> -{
> -	/* This shouldn't be possible */
> -	WARN_ON(1);
> -
> -	return -ENXIO;
> -}
> -
>  static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  				      struct file *filp, poll_table *wait)
>  {
