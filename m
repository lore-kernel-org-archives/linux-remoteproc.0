Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0234E744
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035040; cv=none; b=aFVWru31lfanB4nphq5di+VP+PhJsKKPrTJsYacXedHWUsGqRwstekLOYm14dLIX8+fQULi/UBiciJ8HkLWxN3uCUPMMIyR+CPRNGuuWKaqM7Eq1jOpdLdmwj8lVucHRd+qECLUpE+FI/4M3nTGoQOMsvx3Nez25O6bRnHSrtp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035040; c=relaxed/simple;
	bh=3C29Q45QiYOyNH9+Uzgm2x1iE6Ss30RmLieomkQXEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFGZ1Ra5jaRrmptfscMMnlbJ13HOj0s3IeRT1iq2tOnUKPovcG0po2A9LFxoZdzH6oQG9RIEjDwyolfzFwu1ZpVGlqKhAij70ytV4xJGqqExgfM0Qm4Kxv9U+SrlBCcgR6a0Ct2IKo5kswr+2xYPSvtrWI3E+33HMaXlxvL6COc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSh0r3cp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSh0r3cp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so1231944a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763035036; x=1763639836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pfe1V+epjpy6bgW6SoCEKzjepepuLRA0eHE/Lz4yqY=;
        b=sSh0r3cpu4mIwIgz5fFj0OyIhcgJDzVqNz1/2VE8rHJ/icz2YdsAuJeZxPUnZkBulq
         XLIlEyE7/wnq2mDYjhLr824ibMXNS+HxKqqoELboAqCO2minCU+lf7MA8SKdN0DCXtn8
         jATMyZnpX6slPbVL6oxWn2g4tbSIWmy0m4vq2c+/Zs3rBA34/W7HDDckyURGYpvxhpP6
         iVK/CuyshLcEz1amTQ59udUoACRZvOsazrf2FrHVn6vl7U/rU7NrgajMrLH1ym7f1zef
         2IAKXkiRgjK7qngopNfWe8wTUQBiUQsmM+R7l8Dbu337D65zbKVeCyVQ1YHSj7qyFmLz
         EHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035036; x=1763639836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pfe1V+epjpy6bgW6SoCEKzjepepuLRA0eHE/Lz4yqY=;
        b=dcCZo5UzrUoC2zaH6ZYDX72LfYxVzyXvaDlknB7GDfYIg7e8FxcBnzD8/3sgziWBV1
         8EgSbCg9oWKmMLbr2WjA7nUNW1dUxjM0ZEVsFS257edWvO0SCAmWPLyx7UYcaGm3vMMR
         XMBb/A1r1Tqb3o3j81Wv4gsC+HWF1hnvWSOBrw3Vp9vH2nqIQgsCgrsgk3Zq07kh3/H3
         RHva7hcxrIevNTvndPzI5FytcZrurGtj4Lgol44avlcdo11oMKl0BsZCy2BfvVM9Ixv+
         k6CQmyCOC3UpqnH5w1JyYUgRi8NqBD2H51KfaOSucduCpTNEmvWHkZNQPVQ4UCibs0Xg
         ZIig==
X-Forwarded-Encrypted: i=1; AJvYcCU+gr+eR5XuoTh+e817Qt+OtsrXIW/stHFPff5TYzI96mRWly9oCiSn6++F/2Lr0PKWHQVa41zqwSltEAFSEKCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFfoJIWhjnn5J9/wktLeFRafiPEJFgM1y6S4W/R1NNoSwV/Qp
	KL2X73YgN0vZakUMhkR97ZSKKPoSJX/x0q5YSYbITIDkRFn1z1fsuMy7AkCceVQyRZI=
X-Gm-Gg: ASbGncvOubGLpNKIAFEoDTdqpruIopts5hgcw58Xb7RrBMUtq4vgEIZPNWVtDplJRsp
	QbX/UwE7kS2viJF7ag/WRTJeSmVRspSsb1uduQpPAlGRkxTJ0y3Nxd+D3chAkgeMk5nNA24QgJF
	J9UurgQx9wMI0abK/aDfRkRmwl5azK2BlNilWNbGOW2AbxBQPdMpoJAh3t3gKFMGk3ZeD0r7Qk5
	Fawx3ZFfouddGwMTms92GAINGYxkwAmq3iBs6TqU3g+p3ENpS3ye3jMeGtC44p/dcyWTnVJ+2Uo
	obWPp6QdtWQroKyZI9dT+juh+egRNuhgdmObpZTezqt1DIMvvFNb1gnjh9a3PDpwZUjw3CAsNsS
	CNZ/ISuKk+hPL4oZysqbNAyNCleyIiBaRIJyQVmKF0tv6hPim1a+YvxClcyMi2W3HJMldOi6glg
	mhMSOhB0cr21C1
X-Google-Smtp-Source: AGHT+IGgiSF1zetGk7scP6UPOWU5rKLto8aKAOIhNy5s1Fw9vFiOgcRh6HS62kk2VZBRDEGdVcPCCg==
X-Received: by 2002:a05:6402:3585:b0:641:66cc:9d91 with SMTP id 4fb4d7f45d1cf-6431a56b3d7mr5951684a12.27.1763035035749;
        Thu, 13 Nov 2025 03:57:15 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e68d:9e37:1627:2b9b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm1309174a12.34.2025.11.13.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:57:15 -0800 (PST)
Date: Thu, 13 Nov 2025 12:57:08 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Message-ID: <aRXHlL49sSGML__G@linaro.org>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 04:05:54PM +0530, Mukesh Ojha wrote:
> When the Peripheral Authentication Service (PAS) method runs on a SoC
> where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
> reset sequences are handled by TrustZone. In such cases, Linux must
> perform additional steps before invoking PAS SMC calls, such as creating
> a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
> these additional steps when Linux runs at EL2.
> 
> To support this, there is a need for a data structure that can be
> initialized prior to invoking any SMC or MDT functions. This structure
> allows those functions to determine whether they are operating in the
> presence or absence of the Gunyah hypervisor and behave accordingly.
> 
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to differences in
> metadata context handling. Remoteproc subsystems retain the metadata
> context until authentication and reset are completed, while
> non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
> retain the metadata context and can free it within the
> qcom_scm_pas_init() call by passing a NULL context parameter and due to
> these differences, it is not possible to extend metadata context
> handling to support remoteproc and non remoteproc subsystem use PAS
> operations, when Linux operates at EL2.
> 
> Add PAS context data structure and initialization helper function.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 12 ++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 0a0c48fca7cf..e4eb7f3ab7a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,38 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +/**
> + * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
> + *				      context for a given peripheral
> + *
> + * PAS context is device-resource managed, so the caller does not need
> + * to worry about freeing the context memory.
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> + */
> +void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,

Why does this return void* rather than struct qcom_scm_pas_context *?

> +				     size_t mem_size)
> +{
> +	struct qcom_scm_pas_context *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);

Thanks,
Stephan
