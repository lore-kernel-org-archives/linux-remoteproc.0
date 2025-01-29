Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C819C561
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138740; cv=none; b=jfmGItdnlRNu36iRm61sy68FoPuMfOj2oqJmimurXzhMAiMBzVdXAW4589ll+VXqH7+Z1cCvtiuQeFINLMr+20dySTIOrgATYJj4LrbFIpsKcy7PdZpPAF0oZIcvFilFh49DtZmcadY3Aryf4rYp5G9WCdkMbb3EH6JRh508pTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138740; c=relaxed/simple;
	bh=q9PcrzMuPfzgLcPzUpwqZmNu5XymU513cnx6sVwWVFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jROQIDHsPaxmFonGbP9pOKAEQU45Gof9Pxwfg28yamyXgJhyI3wJd/KQmIXSt8qvPqiueF6kmw4jWB4z9vIMw4rfMtPanwyHO92881gJgFqLGBGwOOtEwOwuoHxvyoaM/+ptsNvnT4aIWc+/czJZ0MieBJMAsuuNId19dHMfsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVQPQi6s; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVQPQi6s"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so276040f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738138736; x=1738743536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBd/IvDhQt1+2TptVTpiJN0NIdUgTEfHIRo89ZFgCVk=;
        b=LVQPQi6sNCb7mX5kgBxlrNFrqxlYx7PpCL/oZyUHeB0wjRtCv9znVMIJfwREwKQVeL
         DVBPF6Dogv3MexTgLpO1lP0awAjim5pThUbSWLmp6d5FO/z4zFTOEYIjfbINyuWN9c0G
         46gvuDSP9vmyOeA0kNvKqltYjkRj+93wKtYX+gs8ebGIYn/q7mbaDtWXSLlySpevrkGC
         OhMYdfNssrzmuNc1nqIkfzTbYO7f3qB65fZYVctET0phQ8iaLyBA9SgB3ePvXrqzJc6B
         NbBRX5AIU/UCrHXDBHM2Qrcg5vk1OpaXJ38bASdxtKZGOdnwFcTYjbU1YcLoi92kA7Cd
         P/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138736; x=1738743536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBd/IvDhQt1+2TptVTpiJN0NIdUgTEfHIRo89ZFgCVk=;
        b=naSDcJbj13jn3KV2rM8l2pWxIlWo4+h6y0bDcdGa0kG6tMyEhhw2lKv74fnN3HtV7N
         hCHFe08OMniTLwZVIAT5frm6fFSa2k7xZEh/y5XKDDVkmbyUSOV/VGocYfbVSGhfJ/i+
         YAd53ZDdZYFc7yWEtTpkZ1CBeWeIrpIg+ZUVVOf31muTeRxCO6EaAwQOfyEiwOJ9c9r4
         KTI46kDco8R4XvyziF0WoCmXnHAeCPfO05LAAPzGdLFIt0SWzwQwjGwU+kIgsorCpNxx
         eNWj39nq/12Q9LX9I8gNs4dtVi+s9XW0Ox0QM689U0AFGJHhQbypKuy1hSxIN0v0a/dr
         UzqA==
X-Forwarded-Encrypted: i=1; AJvYcCVZHUfCfdrKUcn09JHPE4QSDss8ibKZD9+jwEnROMOGS+eQAMtyya7rzpmxmd4Hw/LL5a/R4TtKreOQ53o3zu/V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59dbHKIC/HwCAa7fHSBDqdd8cGaKECiZhPsDNusVzvEnxrAex
	YJ5phx8O5WZixWsrfMsex0NEM4escoEIjEucTR1uUajO4tUn55DEUHdVxSV0tA8=
X-Gm-Gg: ASbGnctLCDY0vk4laFLgCXWTyZG6GoRqOw1aXsGtXJNiI7ZcbNH0zT1nd6k05CONEv9
	ZFNm1JQ26TEhEmMoj9gg4g0uoL2nPupGDkLwkY6mOaJreQyN7PtugE2FEszsILinCzmBJKWCUxp
	/JBoj2XIEQT1xb3Ejiq7VgwkXtgKS2YQw+NPHYKNJOLkTRHyq14hwvUNgALZNUfkbaP7fHPQIpO
	OEPnkRWr0b5WZpz1gtqBhBpMTEM36trPj6dAFLkbN6Nw1zGkVKP55in9cxGPZ4TDCRcgj+Ff+EO
	DbKMzL98yDMJvQnY1JfolQ==
X-Google-Smtp-Source: AGHT+IGmg5YJ8EYXcU1LFQKEauB6McbRp8WqEK3RkkgOQScrIqPuhUbg3IfCBmWCpqf/pdOzRDnMyA==
X-Received: by 2002:a05:6000:156d:b0:38c:24c6:5bdc with SMTP id ffacd0b85a97d-38c50fdff42mr1517193f8f.4.1738138735865;
        Wed, 29 Jan 2025 00:18:55 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a189283sm16542483f8f.59.2025.01.29.00.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:18:55 -0800 (PST)
Date: Wed, 29 Jan 2025 09:18:51 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Make single-PD handling
 more robust
Message-ID: <Z5nka5pi-e3Jcrbg@linaro.org>
References: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
 <20250128-pas-singlepd-v1-2-85d9ae4b0093@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pas-singlepd-v1-2-85d9ae4b0093@lucaweiss.eu>

On Tue, Jan 28, 2025 at 10:54:00PM +0100, Luca Weiss wrote:
> Only go into the if condition for single-PD handling when there's
> actually just one power domain specified there. Otherwise it'll be an
> issue in the dts and we should fail in the regular code path.
> 
> This also mirrors the latest changes in the qcom_q6v5_mss driver.
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 17ee2fb4e856 ("remoteproc: qcom: pas: Vote for active/proxy power domains")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Not sure if Reviewed-by makes sense if I already did Suggested-by, but
anyway:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for making these fixes!

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index aca44bb6522f00cb525c4b816040445287444434..c1e9bbae61770ccad3e22d132a411bc6ced7180f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -509,16 +509,16 @@ static int adsp_pds_attach(struct device *dev, struct device **devs,
>  	if (!pd_names)
>  		return 0;
>  
> +	while (pd_names[num_pds])
> +		num_pds++;
> +
>  	/* Handle single power domain */
> -	if (dev->pm_domain) {
> +	if (num_pds == 1 && dev->pm_domain) {
>  		devs[0] = dev;
>  		pm_runtime_enable(dev);
>  		return 1;
>  	}
>  
> -	while (pd_names[num_pds])
> -		num_pds++;
> -
>  	for (i = 0; i < num_pds; i++) {
>  		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
>  		if (IS_ERR_OR_NULL(devs[i])) {
> @@ -543,7 +543,7 @@ static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
>  	int i;
>  
>  	/* Handle single power domain */
> -	if (dev->pm_domain && pd_count) {
> +	if (pd_count == 1 && dev->pm_domain) {
>  		pm_runtime_disable(dev);
>  		return;
>  	}
> 
> -- 
> 2.48.1
> 
