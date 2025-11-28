Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0163101B0
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330307; cv=none; b=nUabkAm5qJibHTcuWzbGka7/W450PR6Vt5zCpXcN4R3htDMVNtiWNSugWJZGGcrbZVhezTjXg8njccbvcqWmDQVhbAxPvGXxI/zOpdjW5nFQMfCO/ly2W+JgWwxkDSVZlV6H0ET6unLlA9EKnWTfIrzfTMjXK6G/T/lrRPN9EPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330307; c=relaxed/simple;
	bh=y7YyltfOK1HZGQNfYmeYMZW+cIIEcUH/VJlODSP/tH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4/eDXPET1HK9e8SMvpU8LxRnGggRG83tlq4yuHNEgPKJc6TpTset4cEqNyYNL/vuHxTQUVlLt3JtEszg5OPmyw74ayUTpYhUjGFDYGagriXcwDjR1rvfle4UGFRfkj3wi8Onap4nTH7SxO1wqBKbgZB9Gw2svqOetE0B/zp+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiUqHjyQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiUqHjyQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1454271f8f.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330304; x=1764935104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxu8fFmXPVRbVoD/fx+XvNyXn/v3XeJrOou1JkmNFWg=;
        b=XiUqHjyQckKou1Gph+vo3XKYjiLdCGSVZ1ajcP4aMZc63rHxGX4TlwwZfjIj4OAAeC
         t20G8hL/tSrWBFgWMtd38fn3bDCVH0gjeL3ua6oJLK5TKq45QWe3OWdcj8KCar2Pc/B1
         oQ9P0PGm/7U3tJP3EZUppS9kXn2cGbAffef6M7Vd/ZDcbySeLYJHEciwZftqP21TQoKb
         +y+6MM3Px3QR7cdokNK9Qm6koGHDGxI/wbcRJSXFaZAM2mCD/ISK/cXXOiSqxVcX3yE8
         w4kT4QTsM7XbSJe2pIz164XFaP9+RlRrHwrvwfjmBij6NWIOF0r7s48bqwy/H9w/cmVG
         MZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330304; x=1764935104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxu8fFmXPVRbVoD/fx+XvNyXn/v3XeJrOou1JkmNFWg=;
        b=CAEY8bs3VS9SCXFENB4xfJWcDq/Izempo1RM/BH8fP2hCfiJBQ01JHTDpf6xRbQ++g
         76c8Iz+pHrIVwMbfbRyw0vF9xs+DRwvKusBv2bwdiolXpnw3g008mfHbNeWaREge/AYn
         4LzgB6gAZb7wtjBYSi5zjqPtXoEcyuc4cerQQEKam5uRXMctHspb/IIQ9VctxJBHN3N3
         4ZAdgmx+KbtYTnYMVV5SJFn1HrzCRKGnQoFlqdRD5GDJ3ajnzkjPcJgOwQZpqzlwcwYO
         lPOyhCoTM7Ol9EqpkkTuIyPySbBHtZgo2EBMZb91CtUAepw7JxrbfjgudaxVcBUrUGOO
         4r/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxAmjqSnsahwwIBDQ4z6XReqTURq4dJtVa1VeSVRi2gkF6FyyPTEI/3h7aB5I69YjpQbjXgt1ARAfp8l7MaK2b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QV6o6vAJXyv8v13SUmeLDs80FdIio/SUTseit8ASKSqKpeft
	oO/mBUgU8PeG9gwaCxJXEkDXWO+0h00AEg0S58EIGom2jFkufRG+X8i8XQjZSLWveEk=
X-Gm-Gg: ASbGncsdNPtkc6VVBrkw98MtrgajH6RLf/9KtXH7RX2aktOYRME8SfiY9F4BnZ5uLCB
	1a7fgz2HYI2/1mM9ETeNt+RWWCpd+jXxsGOagDA32skHVhynVtk+1W68i1Ot1DLrCnqa98UB/dm
	lpLEBVrMlyDhL1E5AsOa9wD81k6PHUcU2ZjrRxn1b6g1VApImpKAAKR9DbP0S9owowhR7kOoe1P
	ERZOfPIpVFVS1Ryt+aBpYl+RhFg4w0UAa42BXhvfrfQr+mRW7cj1zxGvSJ3a855U+l8XPV6lW7q
	jM0ofCePBFFWUHL78tYm53XMAcYCZXsxNDfnlCfQI6zxdgZHJhMGlizaOxB/0E5D6jVYgR+wxyF
	FINzVkpZMnpZAHZ2FO2e6eBfW4dz/YKl5xezPbe9uPzbf8pp6+1YBcDL0TpjPJoIoxAUNTa4NAB
	AxoMTA9zzbSLcCpkPI55+zvhYQ3Yav2JFJYnZrIMjHhZprQ4QLdlFd
X-Google-Smtp-Source: AGHT+IHPuIp0koy7rBjnMMzDC2ZSCV1Eo0XBFQRwVw2doZoqHo22+cOgbDjiDAVCWmUog8kHEm5g6g==
X-Received: by 2002:a5d:584b:0:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-42cc12f1d70mr32107657f8f.5.1764330303740;
        Fri, 28 Nov 2025 03:45:03 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c302esm9166695f8f.5.2025.11.28.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:45:03 -0800 (PST)
Message-ID: <8dd9291e-d960-4b3f-b7ea-d8181170f023@linaro.org>
Date: Fri, 28 Nov 2025 11:45:01 +0000
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <TwmK-uURupP5hBnnezZHzRLz5w4IrchF_aST91tZBiqdh8cEJLG2lLnRi5EWP8IHJ6vvA2gpHVuYmQDQoOyX1w==@protonmail.internalid>
 <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2025 10:32, Mukesh Ojha wrote:
> There is a scenario, when fatal interrupt triggers rproc crash handling
> while a user-space recovery is initiated in parallel. The overlapping
> recovery/stop sequences race on rproc state and subdevice teardown,
> resulting in a NULL pointer dereference in the GLINK SMEM unregister
> path.
> 
> 	Process-A                			Process-B
> 
>    fatal error interrupt happens
> 
>    rproc_crash_handler_work()
>      mutex_lock_interruptible(&rproc->lock);
>      ...
> 
>         rproc->state = RPROC_CRASHED;
>      ...
>      mutex_unlock(&rproc->lock);
> 
>      rproc_trigger_recovery()
>       mutex_lock_interruptible(&rproc->lock);
> 
>        qcom_pas_stop()
>        qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>        remoteproc remoteproc3: can't stop rproc: -22
>       mutex_unlock(&rproc->lock);
> 
> 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> 						recovery_store()
> 						 rproc_trigger_recovery()
> 						  mutex_lock_interruptible(&rproc->lock);
> 						   rproc_stop()
> 						    glink_subdev_stop()
> 						      qcom_glink_smem_unregister() ==|
>                                                                                       |
>                                                                                       V
> 						      Unable to handle kernel NULL pointer dereference
>                                                                  at virtual address 0000000000000358
> 
> It is tempting to introduce a remoteproc state that could be set from
> the ->ops->stop() callback, which would have avoided the second attempt
> and prevented the crash. However, making remoteproc recovery dependent
> on manual intervention or a system reboot is not ideal. We should always
> try to recover the remote processor if possible. A failure in the
> ->ops->stop() callback might be temporary or caused by a timeout, and a
> recovery attempt could still succeed, as seen in similar scenarios.
> Therefore, instead of adding a restrictive state, let’s add a NULL check
> at the appropriate places to avoid a kernel crash and allow the system
> to move forward gracefully.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v4: https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
>   - Brought the same change from v2.
>   - Added smd->edge NULL check.
>   - Rephrased the commit text.
> 
> Changes in v3:
>   - Fix kernel test reported error.
> 
> Changes in v2: https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
>   - Removed NULL pointer check instead added a new state to signify
>     non-recoverable state of remoteproc.
> 
>   drivers/remoteproc/qcom_common.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..6480293d2f61 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>   {
>   	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> 
> +	if (!glink->edge)
> +		return;
> +
>   	qcom_glink_smem_unregister(glink->edge);
>   	glink->edge = NULL;
>   }
> @@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>   {
>   	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
> 
> +	if (!smd->edge)
> +		return;
> +
>   	qcom_smd_unregister_edge(smd->edge);
>   	smd->edge = NULL;
>   }
> --
> 2.50.1
> 
> 

Since this fixes a real bug, you need a Fixes tag.

Once added.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
