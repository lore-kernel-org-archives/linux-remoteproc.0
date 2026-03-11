Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C559C358375
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217739; cv=none; b=Iq08KcwqiLfKCZUEjJ1UsSPiwJD1DlFfJ/m7DoKXQEx5kAE2iW8wlY6RnIZGL5SZYyT6SihlyS2EbwH0D5lb26K+88GjST2QZSzDH21Lp/oXwcSI7M7tgdjjmzXbDGLJ6If1KnAPo2jTRMg0Tk3Pk0B+88wUUW/T7WI8ZykAs9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217739; c=relaxed/simple;
	bh=eBpv+uJKhLTXdoUvn0kOvaW5xYXHP6HF9h6xB/Z8cZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA5hIn5ZsywB0iQXqVTZ5J5AjD5WdM6OjYQPywgQ3xnjhd4om9pC322CQh20qyhcBwKJ/e9IhwvL7GVXchNRM/zxSj+MkoL97gp88D7haeo9olOBh2koMl52bKjhqP+IY8pYKdYBM5W1lGja18UeGBqy1D9K8Iy9ilS4cOlZ2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ne7W1lko; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ne7W1lko"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so10356456f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773217734; x=1773822534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9oM+DK/RV/qo3ukczy7o4IQTGNLI7O8hgWG97LLkMs=;
        b=Ne7W1lko1b5H8TTSWp+QKGbIiUiSZq+s0INE9MiBPboXJHv2M/WO33ZN1uEdTXxYjh
         L272IEQe4W2IC/CKz4gSZ9vmyfcm9zsHqWCYTSiR20Dcg+z1OQZwppcVKMIdvRnNGp8b
         QzNT+N3mNHF50ktgmKO0yBSDNhL+KZJykKrXXNNbsVFYe9MHRvjUs5AAP40eNU3tZIJO
         0dnS6l/EmvJCo1cOfI3C8flRYfbnai2nP15lrCWs9Ez7a8oyx6d/AWCSpcH89wqyx0tE
         WjmnjJhvC3m16D1Gih2o22nLqPtvzubMWOAnKU7K1/XUeEe73DoczemyjpJOujkR13nx
         H3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217734; x=1773822534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9oM+DK/RV/qo3ukczy7o4IQTGNLI7O8hgWG97LLkMs=;
        b=fh/OZMbFlBgv1qyZ9COysVB3RAcF73wbisFlJz1PS0P84G46AR1s9jLQo6AMc4/2IY
         XAUkKzUalabzavsjCpwYsqPyKNwpxrTC09hSv5b8dhaS2Z6+GmbpGzFjp9pzuSUXE+6E
         JXqSB281fRQH/DL3h4CSs3MQIvT5Gbt+abniPJokjY2IcZpSiMK7EKhj8qlfRlibFnXm
         HQVtUdlF8AF3IDtIHCuAPN8MSaWpYcAYTtdKIrOtCjS0+dm4sfCJdXjsXG+rQiOWI8Nb
         U0cAmCIYuNIPZSatWnDBK3/YZpTS46wQz7ahofhq3f1JZttsA1dbfMTdPv7Kj41S5N0Y
         Oi4w==
X-Forwarded-Encrypted: i=1; AJvYcCVHzy30y84988d2WsnOZonFP3C2JHJ/+sW+wWiqK34Q4p2J+oHb5KoPnfRS6Yqwb23yjAgC37KGb4Ac4jpZSzqW@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVlLzp/u23tCfWi1e+nG0em4Ftcm2nL17zGaXA2DorzQDf+Yl
	pgbMVt/Jge5FAPB6PQNqAX8gjylKkxikrwthYuCLJ09JJcHm38FjFCcubGfU0wULovk=
X-Gm-Gg: ATEYQzyKHcUPsZDyN0GkGMmgYoWxg4cKR+XRnNN5nSGngRsZ+VIJci+1GdHAfuKpL+a
	ldPRJWBTPtuGm1QICgd1YWkUvj7FAZc+w4HzF7rqA4hvc46A/I4dA82PKL7wo7XdXl9+4tF5tvC
	KVhttz6zGOeR45++YErCr8XmgqnRq7JpSvUhsIRQ9GBlg46rrbfp7byso2sE4RGUh0Blk+Wlg2L
	WWi6DNQmDPS+t7m9xbCGPqEVXSsaUno+d1aXMC+h6ZCcxDrBG/97977BFjCycjBtPWzPFWmwWic
	5TrNYFc8zwz2OYXuoobQ1CxfVzzqWWMjpMarMkULTeJWtmosv1zuH/5mmScl/I+FmBLNH5nBfJG
	9sT2jOrmtyMsX/mU2VKH38apd4Godn5GSHY0RWSA8ANpZPqlk+VsQTGUJ1GkZHxe9ibxgZ49208
	gL33FfyNX8wwFdHXUuRkEhPvUF9RBlGxj6IH4=
X-Received: by 2002:a05:6000:22c6:b0:439:d928:d783 with SMTP id ffacd0b85a97d-439f8209999mr3197757f8f.30.1773217733955;
        Wed, 11 Mar 2026 01:28:53 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81a0239sm4977441f8f.10.2026.03.11.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:28:53 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:28:43 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <abEnu_ID-wIMYpMB@linaro.org>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 03:03:22AM -0700, Jingyi Wang wrote:
> From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready either at the first check or within a 5-second timeout
> and the ping is successful, it will be marked as "attached". The ready
> state could be set by either ready interrupt or handover interrupt.
> 
> If "early_boot" is set by kernel but "subsys_booted" is not completed
> within the timeout, It could be the early boot feature is not supported
> by other entities. In this case, the state will be marked as RPROC_OFFLINE
> so that the PAS driver can load the firmware and start the remoteproc. As
> the running state is set once attach function is called, the watchdog or
> fatal interrupt received can be handled correctly.
> 
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      |  88 +++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      |  17 +++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 103 ++++++++++++++++++++++++++++++++++--
>  drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
>  6 files changed, 204 insertions(+), 10 deletions(-)
> 
> [...]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..4700d111e058 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -36,6 +36,8 @@
>  
>  #define MAX_ASSIGN_COUNT 3
>  
> +#define EARLY_ATTACH_TIMEOUT_MS 5000
> +
>  struct qcom_pas_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
> [...]
> @@ -510,6 +521,80 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (!ret && crash_state) {
> +		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	if (!ret)
> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	/*
> +	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,
> +	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
> +	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.
> +	 */
> +	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));

I have asked this back in October for v2 [1] and again in December for
v3 [2], but you still haven't really answered it. Please answer all
of the following questions:

 1. What is the use case for this timeout?
 2. In which situations will the start of the remoteproc be delayed?
 3. Why does the boot firmware not wait until the remoteproc is fully
    started before it continues booting?
 4. If the boot firmware gives up control before the remoteproc is fully
    started, how do you ensure that the handover resources are
    maintained until the remoteproc signals handover?

v4 looks a bit less dangerous now since you don't enable the handover
IRQ anymore. Still, I don't understand how this would work in practice.
Removing this timeout would be preferable because then we could actually
support firmware versions that do not automatically start the remoteproc
without having to delay the boot process for 5s.

Thanks,
Stephan

[1]: https://lore.kernel.org/r/aQHmanEiWmEac7aV@linaro.org/
[2]: https://lore.kernel.org/r/aUsUhX8Km275qonq@linaro.org/
