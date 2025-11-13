Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93634D38A
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035947; cv=none; b=UVviNSZ+KT5zosToxkn8w4xcoW86prJPt7+v08VN0QR7FxZQ+Bk8sANtKYsL164r4vFXGxmQ2KIlVTE8EdSG95sLnGb5I7JyzLuscO0tFZYdr+cUO+cg0bayYCRCeAkr2M4FzQcW0qQT+D0l2yKQ0wIX0bYh6X8Xk2Ic+g8nSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035947; c=relaxed/simple;
	bh=tIRyBtq6ZgmwZ/RdMREj1gR29I0tL8lowm1gb91/zSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAfVzUMPPu9zuF68oVTx6VR0i07AUCPdTPMiAiFq6EHq9FS/iJ+2+eiI3hiCFMemOUn3Yf+HQkwkgHBKbT6P6Ag+EKQXBzWIzviR6uvJ7xw7tjnqlbyw9nngk6J1pQRSWcjiGwbjmwun0sXhN0KJx3ga5rpfPO4uHwtVLQAe5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYNF0ml1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYNF0ml1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735ce67d1dso20171566b.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 04:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763035943; x=1763640743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmL32TLheuHbN2HDaUa3UG1QnGtlOG9N/Q5N775z6d0=;
        b=CYNF0ml1DpleNUfz+G+2lL9hhJrYQUWslZOJEJWeGWEs6q9d8EhrKwnukmTypyCk5e
         i4oJiVHSZF5EQTq5CLRYHRHr0JctLV6pRJTInSCEO2WrjGW0vTwzBMBooviHxzvuzxRa
         thld1GQu+rf+00Xjt4dEjBuU55mjjMlPj3Ty482vLZ1oUT64CxGKf0t7hCG0h11YOHSC
         COGZYFk5DJMpaepmWN1NjFBEvvCv1BdLXaJJKoWL8cI7AF45m+dgi4z0BlXeEPAw1crt
         YUIZa+v6Wqtt02fy+NoA/fIBp4sR0iyE3ZLdH8kMmKpHzcDcFDOCpL1yuC/fTXyAOqOP
         tJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035943; x=1763640743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmL32TLheuHbN2HDaUa3UG1QnGtlOG9N/Q5N775z6d0=;
        b=vSfX/lmtwtb1TDCRe8esme3fcKKhJ6bXocl4i74gZRtlbkAQUfSnrIcOI4n6UyhOr7
         26Jw5bDJobKxoLewdQcS79hYlQLHi5QzJyvzGZR4C+pcfBkRcTJJcspZuexIxPXA3y4g
         q4AGsDSBPW2+PF1sXYrncNSIzUHrpa5/0dj1i4p4jO5jbyOKGjJwU1D3afsoD5ghnup4
         c67rOTx/O9J/dixqXHPd6XtJCVKGiRDV0Bi77C3G3HN1rr/zCvo1bRzmbGutScjcq9VZ
         afsYM+dMZx/1TJz3r0lNbAQXfeGMDBrZpuoIa2EDj7MVQAsBGjL0Vk0snNh8fU1JyrZn
         o82g==
X-Forwarded-Encrypted: i=1; AJvYcCXJSa75eUBgT2dQbUNL8FCh33kyzxN2jpAiAQaHec6FbkrGvG20P3jl75wWm69y/vGX1+xPLwdM4LTkAMKQBn8/@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOqdUu3o3CLw9DdmGZgnv4cd5jjMZa6CYKXYg2ZTwLDb1Qxzu
	BzsEpXpGo0aODHe3L/znof+zOwupxpCZXnq0gr3qpixy5Q991XsLP8BjFCorkIdE6wU=
X-Gm-Gg: ASbGncvC5c2y4BFxCkiARoLOMRtEl2XkgOi6+N5XShDHuRF9Hbk6fQ4mGuAsh+CXFZU
	ViX0+KiemIbwFEO2J1S/kN0MBZcQwrdY/o9qqMnLOHo6iNisoCUGETJND6yXekEjLLY24BgeSbJ
	Ys+8r+W+NVKqSerwtlUB+fpBduc9mu9KV7YBFy9z/xGKN89xH7kcdv8wgNwNGjHMMCzX1a5PYUF
	EF+TCAgembOpTHl4CCZPB3z3jXN5ea6tcUKo6aVMNreyUBGWay03XPXT/q46cANSoxIyAfZp1FT
	swDBWsWyjh1E+lrg1IzJniSZ0ghPVOxXPHlnUl5m28Va06ZkjphQA9U2gs01PFncl3CBEH7THSF
	6HHsO56f3IJiWPv7ND2RWXESO1OP4ppd90Aij/TzMqEvkkEZzrVqZrAzmQ2Wd3Wo61X/pZyBhtI
	3rsHUTXMVnv/KPdCmWCPjVUVU=
X-Google-Smtp-Source: AGHT+IES54zSRW8sTH8TIe84JLMl9O+9k+g7kEG/EMcHoTIpOAkv6hlmsk6iKOP7BgiRYf1ZJ102EA==
X-Received: by 2002:a17:907:6ea6:b0:b72:c103:88db with SMTP id a640c23a62f3a-b7331960ea3mr649017866b.9.1763035942693;
        Thu, 13 Nov 2025 04:12:22 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e68d:9e37:1627:2b9b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80d27sm151837166b.40.2025.11.13.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:12:22 -0800 (PST)
Date: Thu, 13 Nov 2025 13:12:20 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <aRXLJL632V0ys6rs@linaro.org>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 04:05:59PM +0530, Mukesh Ojha wrote:
> Simplify qcom_scm_pas_init_image() by making the memory allocation,
> copy and free operations done in a separate function than the actual
> SMC call.

Nitpick: This feels more like "refactoring in preparation of the
following patch" rather than a real simplification.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 550707f2b46d..1d8a2c537c44 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -590,6 +590,37 @@ void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t
>  }
>  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>  
> +static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
> +				     size_t size, struct qcom_scm_res *res)

The metadata and size parameters do not seem to be used inside this
function (also not after your follow-up patches), do we need them here?

> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> +		.args[0] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_scm_bw_enable();
> +	if (ret)
> +		goto disable_clk;
> +
> +	desc.args[1] = mdata_phys;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret;
> +}

Thanks,
Stephan
