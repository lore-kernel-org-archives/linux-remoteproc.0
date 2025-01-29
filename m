Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E7166F1A
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138636; cv=none; b=npyDl8UaViHz5Uy4rlLt0hCZqDgtklZni3k2E3RY/7Dz+onI1dy8AcT2vIjYneLHEQHAhR/GJ79daWShbfVQ4faewc0svEkJmREkujnr09J4MCr30VQrvcUB1ZfGrQNr4tVrgUmsZO9YwkyKC37DldEoWL927JIDuZHeOxo3yvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138636; c=relaxed/simple;
	bh=pr1H+qOgtFwlwxokFPKqAcNjsp+sUyK9zu3FmkZcpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGl18d7ssnS3onfgYD2qLovMIDW/H1veU38X6MsAaVrWwY3SwiuOHJUf5kBZpbVtw07Z3EcJVjah2mNA8lqKGuVweAArnGkNJg6b8VRNkBMb3G1nglFPy1/KtaTEfdyh4o7hbg2GjwD7DHBhmYCDomboI6NLdi5KPClnPar7NTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBkaxvLB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBkaxvLB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d6d5765so3873917f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738138633; x=1738743433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/+D0OekWy0GxppkPj3fPY5hpDHIrRe8OroWwhzjF34=;
        b=HBkaxvLBJhMmCK3yUgCz3m/QDVXTid8Uy2V8IfwlzGeweJWVgITLHkQONXC6IsGcp1
         2BwOrb0ECzoqkZoAtcspSuNrDvSMZn/WvE4Kf0K5wXwr52hMdtZnzuIcSfwKa1+F3ywQ
         a8mgtoW3mrs0mXywpeWVNxnwFV+w0KB9liW6wNXusDw7gqxvY7CZ7fr6rhFw4d0i/5Z1
         Vo33bz1TVX7FcBBLb95Dd0HUky6tzy6eUU3CDPnmO8Boju/LBrVtO1Z0yilyxSrO7yfx
         uo8o1NlExBLObaOV6SWt0zRbnDYcehD+UgaWdEwXVm4zzf30GZIpJouYpkp7vIef8Xen
         iP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138633; x=1738743433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/+D0OekWy0GxppkPj3fPY5hpDHIrRe8OroWwhzjF34=;
        b=heHT7ECR0RlhUsydSBJSHvAJI43ZKvRQH6WcFANDzdN6qAM8Dapnio+P/hj6RARxtM
         iynDk4Iq+LEglL2Kg+7LKiEncpNM5R740fE9CZjqJFPkir4VeYpICNqzlHuRgEuzzUtr
         MMyBeKy27qp6obs6+Bv8PUYccSLOjwRQloEebMCSXX+PkIL0or8KJqJ5JtdzboHkRrjW
         d4ZVhnOfnA6HjSl7TQ7oOIGUEGJKGrEnElvN2nWkr3jdOLeaogw6mtfJL9xnd+Eh5ZW7
         CPIM3FUPqylNN3HGqn9vprzGHO/EubMKJEIqZK5rZkWTxDx4rUR0hJY+bvYuNDfhZ8OM
         iZkA==
X-Forwarded-Encrypted: i=1; AJvYcCWeUWadl1wbh34H2qTVETv68hP8nVvfmMLKhsWJngaqUMVpfT/T+2oZGfY1LHbBQ33xtOV98epgagA+bKgl7IET@vger.kernel.org
X-Gm-Message-State: AOJu0YztZFR7sAYWmlyq0FY3DxSwAHntTsymrShhqEIHd/pv7wM6/lxD
	QXW1FAivY39s5QzwVgdz72rOqJtdpO+hIZs9/OopltN/5LD4Frh9cRMWqOFXQD8=
X-Gm-Gg: ASbGncsuGUh3xpb7Yh/JI8pd3P+oc6S22CLx371Y9ySpg9EzRrwpJejDRiMNbQHJb9T
	1TEiqClzGvugiKiYC8pzfQrsmHpjxLt4RpK1ikHg9lfMTNoxdyDkdgnscPFH3tI5lQJYvbf2lYU
	1u8JWsyc5TfaSLuqLryX3i8FFPPL+D9jstcUJa6T4fVlU1uqSy4++oSw1Rm57i5772p0kNfGUYx
	fKjqcyldGyEWFtsVj1/yywNFZmI0dyDDpa/eqFHjAv8HgKoIkHqM+93Knr7HyElDd8x/xLdene5
	IuTp+5ifs9WWagyp8lqmuQ==
X-Google-Smtp-Source: AGHT+IHpJGqcr8Tk2T0wQuKtYNeP2wWRWN3r3xQi/6+WJha95RSeRs0NLgQ4Lr414eJF3CjQLmMLnw==
X-Received: by 2002:adf:fa8a:0:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38c520be00dmr1356231f8f.48.1738138632801;
        Wed, 29 Jan 2025 00:17:12 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc24d51sm13637275e9.14.2025.01.29.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:17:12 -0800 (PST)
Date: Wed, 29 Jan 2025 09:17:05 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8226
Message-ID: <Z5nkARIwmd3tBypA@linaro.org>
References: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
 <20250128-pas-singlepd-v1-1-85d9ae4b0093@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pas-singlepd-v1-1-85d9ae4b0093@lucaweiss.eu>

On Tue, Jan 28, 2025 at 10:53:59PM +0100, Luca Weiss wrote:
> MSM8226 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: fb4f07cc9399 ("remoteproc: qcom: pas: Add MSM8226 ADSP support")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Not sure if Reviewed-by makes sense if I already did Suggested-by, but
anyway:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 88e7b84f223c0222a01e2a246a848f2889ac00b3..aca44bb6522f00cb525c4b816040445287444434 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1319,7 +1319,7 @@ static const struct adsp_data sm8650_mpss_resource = {
>  };
>  
>  static const struct of_device_id adsp_of_match[] = {
> -	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
>  	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
> 
> -- 
> 2.48.1
> 
