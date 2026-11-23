Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472739;
	b=u49aXOLD1VAu6D5ZShMq3lmqDaMEK2uakXYFrrCcwaLWX+xdDK799U12t3qwEukimJ2a
	 jvzdbsNX0TyRiLaO5n3lGpLmmhMohfLdKbYbUzDa9eVkroWnR1pW7N9MB064IUmFH+AV4
	 5aaknA2EnLicv+X/1am+eTb65QYXHydUWZw8DiPn0FXrp2ZUkFuB0YuCCpNveZhCtygMO
	 yDbVXO8cVH12vdXv1veYvm4PwYfBOFWuSnNmcyIstZihAQWpk1WOjWWzkUpViUobkxKzS
	 tdWJUYhObVigWk74EosCiaD3ZXi1k3nTEXbgEGi6q8HBK8ffCOu7Rb9YZGBXkY6TD1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
	b=5c7a6fJS1xcEXfiSLCBxxXKQEx6YrtiAnBMssVoJydQvU2H6awsWA1n1zInopQN90hAs
	 c63B7C1JXcJ2SsrpTxBg2aefVM1sbWL8XVCpER2ZXQmw7OlM0ErjiAzHnxdwzsWMqUPOI
	 ETaFCaLkcWb5wYUINl8Yb6aa5VbDiPLxHbCDomPMghCI90dtlRFReYggbP1X//Gu5QkrB
	 bPYWBns84R0NQxoY1YBKnxHZZpQMBKVghbx4xcQnySiPKTk1brnIySBsb0Gr/wB9rOTGy
	 gL/FuLqCjFp3cqQz54/GUyggonNlld+5ay26CM9LOk5Obg/hqaZtISir4YBvX6SW59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AFA606A327
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AFA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-702fd86d674so2536298eaf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795472737; x=1796077537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=6LEkh1WzWlOSIoIIHWHHvGGe8ls6F5uMHZ1h/oA0Mfj/yUszyLlz328XQa9sRllh0p
         tVUeWXGJcqXx9ToqGSMoiqIXv1E7puZXYIJTrpse7wiOimDRxg1VWeA9864K5z7DuTPa
         iDKLedXwVP1geqUl+GNOhRu11khMsxrj3SrIfw0k2lxgSTTsR5qEBPlQsbzZzVqnOoyp
         64/NqX3sCgdpxbp7WX7Cx1QzlVVorxFLiiLf2bE72H+3UlP6o4AQCaJn0Ru4kBM/y6Iz
         /V/6jfXFmv49jLvEo9diYhTSYIrK3tnOyQodcRn6CIPXedblij46nG12w6shkcsVS0g1
         UZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472737; x=1796077537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=IQt9elG6pc2ZTjX/T+7Tq2c4MObmWkhLNnf/oR/ijgrg92fS/bPyev1uiE9pgNM3my
         eAIi99cv0G01oz/HFFDoYQr0qu0luKwP4En7UUd8IvTYh1lOp8NstMLFgruHQz0kTZAj
         HDkmuP5+VgAXGJzXmRg4wyjOnbGNuX9iJdW8VKPdwZRjOIlj8JqZsUT8T7Y74dOk1KjT
         xyCUBZhBi9Zhd8RTovYnX4SbxrmXp8dLp4eo2z5qaAVvcmVemFucQm9FGadoDQzx7Ncr
         TKzToSTKeeU+tlv+yI4wQg01/cKyLVpKIXXAeVe/T7AG+SDi9/TiTPpXOFT4YiLx+TGj
         p2MA==
X-Forwarded-Encrypted: i=1; AL+hErGhfcnQP5rPXn6VGkYRtgUDtC1rCjT06rk77bsUmcTzjx+ML2ldET7PT4ItLSM9NoZemc2HBAnUfMmSG6SxMvMT@vger.kernel.org
X-Gm-Message-State: APuU4Z/IouGUc5ugxtlMFtmYbc5BFKTwKgfchGEzqqG58mCVHhL4MVje
	04Hk/fq2EKMDNsx8GqMM7nYr5wAH5RBYi4OVyI8k+vLqk4t0lT3tueNwUndoF1Rwt7HAwcp8r7L
	8MXhteSyDrA==
X-Gm-Gg: AZFdTZfoi9jmHx2RtbLyUViWd9P+10ZzFbMW+Vr0z9w3O3qGFp063OgS6nDMl5L2cV6
	UL4cj83XTb0psx0OdLJC70j1U9KRvfyZBCT+IChXkJZlOkAIXXC2MWwSNj+6O1bEEBMgil4ZRsO
	QfQEehohUUuNLVduJMSAdsBH2KXImauzBrlR1bvocR5VXEaVv/SDG6CPMIgHTEtmWL9786QhLT8
	rKnre4e4xDrFowDxbgp4hoPwM6onY2B7iAmyKRYqVe7kBH/bNVUj95NsacLZuzGAe4gUumyhyF1
	vw8bBdYc48U6qdqETrcE9B7gFtgbDuh7z3y96VTJScIVz5zIWfqH41cM6QXjH1ktyPUJkwgtFHo
	FyGRDR4uO7ek5SnpTquqUq5dEVpjj6ddPz/7G/NnxqecqY27u8isu4dP4raVJj68pf/GhFyEjuG
	JeJ2C//FNal9O5rjxxaga3XL+IlhnNMJ2eOWtRwWA5T2jRw8yftv1DpQBC87FX3vdeSGS38d3dA
	nsKEoYsq7ANqNsGN+wlu7UcL9Kt5JHaSVJpPkdLlTQh8zWkKFunPg3HxOIBL6TsFzQaN+LJkTqh
	BJFk2MnbtxfBGE0yMs90rNkzsolvQV4F
X-Received: by 2002:a05:6820:1391:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71b39039602mr10599042eaf.0.1795472737591;
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm8511306eaf.13.2026.11.23.14.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Message-ID: <ca6115bb-1c45-408a-be55-68b74977a380@riscstar.com>
Date: Mon, 23 Nov 2026 16:25:36 -0600
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] remoteproc: qcom: Skip unregistering uninitialised
 SSR subdevice
To: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>,
 Siddharth Gupta <sidgup@codeaurora.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261123172140.3547896-1-lee@kernel.org>
 <20261123172140.3547896-9-lee@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261123172140.3547896-9-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 11:20 AM, Lee Jones wrote:
> If qcom_ssr_get_subsys() fails in qcom_add_ssr_subdev(), the function
> logs an error and returns early without calling rproc_add_subdev(),
> leaving ssr->info NULL and ssr->subdev.node uninitialised.  When driver
> probe unwinds or the device is later removed, qcom_remove_ssr_subdev()
> unconditionally calls rproc_remove_subdev(), dereferencing a NULL list
> pointer in list_del().

At first I thought a failure seen in qcom_add_ssr_subdev() should
mean that qcom_remove_ssr_subdev() never gets called.  But now
I see that doesn't return any error, hence the check for a null
ssr->info pointer is necessary here.

So... this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Guard qcom_remove_ssr_subdev() on ssr->info being non-NULL, matching the
> GLINK and SMD subdevice teardown helpers.
> 
> Fixes: 5abfe5cf0b83 ("remoteproc: qcom: Add per subsystem SSR notification")
> Closes: https://sashiko.dev/#/bug/linux-5594c348-0c41-4482-b001-481878256d30
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/remoteproc/qcom_common.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index c53190f0c537..6fd92c33392b 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -537,6 +537,9 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>    */
>   void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>   {
> +	if (!ssr->info)
> +		return;
> +
>   	rproc_remove_subdev(rproc, &ssr->subdev);
>   	ssr->info = NULL;
>   }

