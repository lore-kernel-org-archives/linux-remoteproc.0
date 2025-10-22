Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8830D34A76F
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140148; cv=none; b=nFRtK3Co1dW7w6SA6DVG/73PLWO1109c942m0vxLKp95spJoPNGs1YGuMF6ld+IochQjVMxjdyZ0D9JGKaG/ZgCuq9z9rk8ZhuqTZeaYgF2SaDnmRa40yplcsLYzoRx/yy+ZwFZ6TTIKKzmi/GbU/d1oflozgXoMMQ9XUgZWxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140148; c=relaxed/simple;
	bh=67Y4PI4hPOJBa1g78dYeXZ49HzImYkBhfxSc0zCEZrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJaZNwXu6clgJ++QWnWPf8WsDRYSaeR0l7DVJoxabF6C3eKa7mzXaMM9s18XS+6zNb9JTGKpNl0e/Aqk6sH7J0AhiGvL/G7sYFe8sEaWreOi3AwtpyCAXugQM5fBCB8XiiBOmb1O8210VuxS8BJAiSD15frW2ubSgrg4de1hjQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WT0cHJwb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WT0cHJwb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MALVMM026903
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 13:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJB2+o7SUcY01Dan3VjuFykAURy3trRoRUYLCxJOlK8=; b=WT0cHJwbINKsnOmX
	fHD7fgaxzUUiMrzLMGc2tx5lI8mCDJnH4ztwSncFUNTg0uEPp4vUCfkYaBpUEpSO
	sED44J163DSj7qQNk5XUHYHajZ0+sbWPlDXL4rxIK99L18CpuxSZyLXxWF6/UPeY
	IYv/i/K58ig52EMDJuJDNWX1+KwV2i6Bl79UjTXwqVhRUgyPQX++/+EKLli0Yu6/
	acI3i/GyMfQ7d+rftgMVuad6M78rWkGaLTdtZlvgeX9sqsFA2EKVL2D2L16ijEnE
	VEZ/4dAyBM2eEpOjcABf87UQ6WjDvFVU3t38LzXqjTz6YfXQ6EzhBjEPvckx57A6
	sLC2ng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pn0qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 13:35:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b522037281bso4381656a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 06:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140144; x=1761744944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJB2+o7SUcY01Dan3VjuFykAURy3trRoRUYLCxJOlK8=;
        b=kCVmWRxKLsyJc+qKIMKd/L9y3A9h1lSyf2mHJCRLhbb9oDI0NAwyLNRL/+D7zKRPGD
         sV6sv2a0T2urCo/0w26jsE2AyIOpmCI00FJmKn9BkVObxSEKyo9N9E5mIN8racx2KqDN
         CStdF9vh2LDeXX6O6Tzb5CIAtA16onK6tBcovzbejGgkNiuTNwXyoUEqpYbHVaie/MH/
         +Tgcg+xpcqf4YY2iq0uB1j1y5AQI+LlZ7ZUNRT1MnFCclxwzvpHFCav0BYNMFuNa6fnp
         nSRk33Dx459jpDCtDLuB4sl0r3C5cRea+4hgkQQUV6Ken25/jp452985vXJpBGN1Rmu2
         vNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWTxlfRPMVIWZinS5jkFKwGtXhGRD8Dv1mFzwXxCcwUMFRzSgBijqlOk/T81hAUS7aBTx7RNfxlAfFg8fMhmVbC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bwLSq8Zg9uQ8/wFpbPXMEo2bQSACz9Ip4fIwdKs70ZnZ9lfK
	mzYNAxl9gLfFxEoRP/9zeJrqT1OjNCXodm+qZZa6KHAc/um6xGXVbvaF0ikxmucFWlEICez1kYn
	yGfYeQ7VAMG4MSQt6BD543Xt+SaxU+f0SfncyoUL5mhMcxUkNxt9AFifOMMcKMHDybW5NH1Fi
X-Gm-Gg: ASbGncvFOVhw0SauKjgHLq/7nSIwk0ZGefCqqkzPY2WhmCr9Fl2fXEoC2GcoBTFHioc
	bD9oqL7CHbvgQWS98UAtQseaR5s5A5JSTNePRJBXfOVWzrkaYHFw1W9LQU+UqOhRijfJJ/p4gr1
	Eu8fjKM1s8TZU62w7l4vZPQKNR+P7Cnfsqm+y1R4Lwm3OqeWllr77gLSR/skAIwGJX+sywKpF+D
	sATommWvC+pSVOfS2exDQNB90ZuilqRMyVyXZIYKtk7KU1DwdozQvsdN74EzEvrUDF3vR6roDH8
	50g7KkqmJ6JQ118WYlnqtPo5DjUhdiZk9Gvguja2OPQqn1NB+SMlKWYzdf1iDavT74iN3hK1QfB
	pXNjTUyEBpkAmj8U83MQF6M1KQMNqCPwKtvCZmwOID4QKpjyqqVodXuH2ZUXEWcdF+g==
X-Received: by 2002:a17:902:ce12:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-290ca4f9174mr228894075ad.22.1761140143842;
        Wed, 22 Oct 2025 06:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYdEilQebEwOHJNGNtRIkd+9eIGGc/AcgtRWmMU0dORapqhNpq2ByQ93oRV4ChBuCnNHVa7A==
X-Received: by 2002:a17:902:ce12:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-290ca4f9174mr228893675ad.22.1761140143177;
        Wed, 22 Oct 2025 06:35:43 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247207788sm139000995ad.99.2025.10.22.06.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:35:42 -0700 (PDT)
Message-ID: <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 21:35:36 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
To: patrick.oppenlander@gmail.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, andersson@kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXwrnN480bXcYw
 FlVMFd8LH91BEduPbwvI3MJdxzmJTTAU0ATbc42dLc28r8zfaX0Ww7VwywKFUlRkYgsDQNxi1IE
 UHYWklmyGAb0r74IBiSPDa8uXCKqtbhnjucaFnPVBVHNSa9n0EdGN0vKYMsPEgUSWYCkG6raDiQ
 GXRLwRfcZb4VPBqlleVlMC60T4RBHZlDtwZCzd3U0PWYvQGXroKqdj1kg/qY3hBmBFG7cG8+ZAq
 GirljnnopGcTK20+inDZG8mcNLAOpMfEkkZxiz88OjSfAIXlaL567e/DQi01HyN0EbncsZ67tBt
 s7ylSFT9Dcn9e3sH8DTFaHA68ZIKeZwn+dvalaiXEizXSbpKCmPYDZ3hX5FNl/7XGqCdQFLJG82
 jpdTwByzAfY0t0UoXrYF9zqEJ0gAIA==
X-Proofpoint-GUID: IB4g31DMsaKiPmab5FDMBbpYZbKEZ2W2
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f8ddb1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=MtnY7MoEkkCU4hVK_NUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: IB4g31DMsaKiPmab5FDMBbpYZbKEZ2W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/22/2025 11:28 AM, patrick.oppenlander@gmail.com wrote:
> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> 
> Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> generate EPOLLIN events but no EPOLLOUT events.
> 
> Unfortunately, poll support means that we can no longer disable
> tx-complete interrupts as there is no way to know whether a poller is
> waiting in sendq, so we always need notifications.
> 
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> ---
>   drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
>   1 file changed, 32 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 484890b4a6a74..79d983055b4d6 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -41,13 +41,12 @@
>    * @buf_size:   size of one rx or tx buffer
>    * @last_sbuf:	index of last tx buffer used
>    * @bufs_dma:	dma base addr of the buffers
> - * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> + * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
>    *		sending a message might require waking up a dozing remote
>    *		processor, which involves sleeping, hence the mutex.
>    * @endpoints:	idr of local endpoints, allows fast retrieval
>    * @endpoints_lock: lock of the endpoints set
>    * @sendq:	wait queue of sending contexts waiting for a tx buffers
> - * @sleepers:	number of senders that are waiting for a tx buffer
>    *
>    * This structure stores the rpmsg state of a given virtio remote processor
>    * device (there might be several virtio proc devices for each physical
> @@ -65,7 +64,6 @@ struct virtproc_info {
>   	struct idr endpoints;
>   	struct mutex endpoints_lock;
>   	wait_queue_head_t sendq;
> -	atomic_t sleepers;
>   };
>   
>   /* The feature bitmap for virtio rpmsg */
> @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
>   static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
>   static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>   				  int len, u32 dst);
> +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> +				  poll_table *wait);
>   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>   static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
>   						   struct rpmsg_channel_info *chinfo);
> @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>   	.sendto = virtio_rpmsg_sendto,
>   	.trysend = virtio_rpmsg_trysend,
>   	.trysendto = virtio_rpmsg_trysendto,
> +	.poll = virtio_rpmsg_poll,
>   	.get_mtu = virtio_rpmsg_get_mtu,
>   };
>   
> @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>   	unsigned int len;
>   	void *ret;
>   
> -	/* support multiple concurrent senders */
>   	mutex_lock(&vrp->tx_lock);
>   
>   	/*
> @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>   	return ret;
>   }
>   
> -/**
> - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> - * @vrp: virtual remote processor state
> - *
> - * This function is called before a sender is blocked, waiting for
> - * a tx buffer to become available.
> - *
> - * If we already have blocking senders, this function merely increases
> - * the "sleepers" reference count, and exits.
> - *
> - * Otherwise, if this is the first sender to block, we also enable
> - * virtio's tx callbacks, so we'd be immediately notified when a tx
> - * buffer is consumed (we rely on virtio's tx callback in order
> - * to wake up sleeping senders as soon as a tx buffer is used by the
> - * remote processor).
> - */
> -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> -{
> -	/* support multiple concurrent senders */
> -	mutex_lock(&vrp->tx_lock);
> -
> -	/* are we the first sleeping context waiting for tx buffers ? */
> -	if (atomic_inc_return(&vrp->sleepers) == 1)
> -		/* enable "tx-complete" interrupts before dozing off */
> -		virtqueue_enable_cb(vrp->svq);
> -
> -	mutex_unlock(&vrp->tx_lock);
> -}
> -
> -/**
> - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> - * @vrp: virtual remote processor state
> - *
> - * This function is called after a sender, that waited for a tx buffer
> - * to become available, is unblocked.
> - *
> - * If we still have blocking senders, this function merely decreases
> - * the "sleepers" reference count, and exits.
> - *
> - * Otherwise, if there are no more blocking senders, we also disable
> - * virtio's tx callbacks, to avoid the overhead incurred with handling
> - * those (now redundant) interrupts.
> - */
> -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> -{
> -	/* support multiple concurrent senders */
> -	mutex_lock(&vrp->tx_lock);
> -
> -	/* are we the last sleeping context waiting for tx buffers ? */
> -	if (atomic_dec_and_test(&vrp->sleepers))
> -		/* disable "tx-complete" interrupts */
> -		virtqueue_disable_cb(vrp->svq);
> -
> -	mutex_unlock(&vrp->tx_lock);
> -}
> -

Hi Patrick,

I'd like to go over a few aspects of this patch, please feel free to
correct me if there is any misunderstanding.


>   /**
>    * rpmsg_send_offchannel_raw() - send a message across to the remote processor
>    * @rpdev: the rpmsg channel
> @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>   
>   	/* no free buffer ? wait for one (but bail after 15 seconds) */
>   	while (!msg) {
> -		/* enable "tx-complete" interrupts, if not already enabled */
> -		rpmsg_upref_sleepers(vrp);
> -
>   		/*
>   		 * sleep until a free buffer is available or 15 secs elapse.
>   		 * the timeout period is not configurable because there's
> @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>   					(msg = get_a_tx_buf(vrp)),
>   					msecs_to_jiffies(15000));
>   
> -		/* disable "tx-complete" interrupts if we're the last sleeper */
> -		rpmsg_downref_sleepers(vrp);

1.The original code dynamically disabled tx-complete interrupts during
normal operation and only enabled them when waiting for buffers. This
patch removes all virtqueue_disable_cb() calls, meaning interrupts are
always enabled. For high-frequency messaging, could this significantly
increase interrupt overhead, even irq storm? May I know do you have
performance data showing the interrupt frequency increase?

> -
>   		/* timeout ? */
>   		if (!err) {
>   			dev_err(dev, "timeout waiting for a tx buffer\n");
> @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>   	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>   }
>   
> +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> +				  poll_table *wait)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +	struct virtproc_info *vrp = vch->vrp;
> +	__poll_t mask = 0;
> +
> +	poll_wait(filp, &vrp->sendq, wait);
> +
> +	/* support multiple concurrent senders */
> +	mutex_lock(&vrp->tx_lock);
> +
> +	/*
> +	 * check for a free buffer, either:
> +	 * - we haven't used all of the available transmit buffers (half of the
> +	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> +	 * - we ask the virtqueue if there's a buffer available
> +	 */
> +	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> +	    !virtqueue_enable_cb(vrp->svq))
> +		mask |= EPOLLOUT;
> +

2.The virtio_rpmsg_poll() calls virtqueue_enable_cb() but seems never
disables it. Once any process polls the device, interrupts remain
permanently enabled even after poll completes?


> +	mutex_unlock(&vrp->tx_lock);
> +
> +	return mask;
> +}
> +
>   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>   {
>   	struct rpmsg_device *rpdev = ept->rpdev;
> @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   		WARN_ON(err); /* sanity check; this can't really happen */
>   	}
>   
> -	/* suppress "tx-complete" interrupts */
> -	virtqueue_disable_cb(vrp->svq);
> -
>   	vdev->priv = vrp;
>   
>   	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);


-- 
Thx and BRs,
Zhongqiu Han
