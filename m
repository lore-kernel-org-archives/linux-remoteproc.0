Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B0216A3B
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653744; cv=none; b=jItw9SQuG2YmqQUSIyl4WeA3f0q5i6KwpkUINASQ8S2+A898atHW8K4WX5UEDJ3sa8ZGTIcGwXIqot2c5CHvcvkHPlBt7g8KA2ufffSt6lGjSyiF40upw8QEPpXT1syHPAr19H7l+QxdE3b8WLTRz9WNR0AI0qGcY9zGAO6MJO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653744; c=relaxed/simple;
	bh=y583lHNmEbb4W3ps4BMPaHQpubte5hAb5QNlptwTOvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRoGUD8OFi0V/0VGW9T2b5Av6exnFTXaa4ADFR1BMKir/1KAxdndt8U44uV7/QoRnTcwjWL6wZ2GnxonTaZL3fB83NNHtCc8BpfpIlUjwMaaBpVONzpX64esIKgjSO4aLvSYw/51Wf2b1K3YfNIqCn3O1b2GviVzZcYeV6ES78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IxidC66D; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxidC66D"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5389917ef34so2469524e87.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653741; x=1729258541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNkFxIiVDl7PLS5v96RofiMAjJySrJbza+kK4tHaN2c=;
        b=IxidC66DR8FvO4LdQEfrXDGHAXUPBTqGFMnNjR1uzjTIAzq8YK9HQn+V9O2h0d9CCt
         Gj5cJ47t0JSreVBShArE00C7hsSGtgfuSOVG06foIqqn9sMwD3jPD1nNQeZt+ZePwEnc
         EoMkX6HbZXGqV9yEhc85P3AuQiRHwowcNv75DYEG0I3r3YdZauOp2tG9UP3/zlZ1Psne
         Gavg/R7eIbVFLaa+j6060cHijJSJ8wgtdnyoF1mRDXOQ8C970hWtF3dKxuCcyI3eKZN0
         silM3g9RmPXp6qlwJ9XqKeK9RtD6bQTfG49O2aRPVoLpJAphLDu0wL75mS4dRsGIZBZi
         ZnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653741; x=1729258541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkFxIiVDl7PLS5v96RofiMAjJySrJbza+kK4tHaN2c=;
        b=iBm3FRER/LUQ60m6+Ph6xYQJVFBmdu0lNU6fVletvXjQ9uQGQ/Tiiz9Eix5JuZowTJ
         quNUpHD3I2se0qny3wGwUFnEgtz5NeHbOnxWBT4DAsQLS0swncYt3gU97tg5AL3ULWJb
         F2QQU54enGpPPuJBoK+E6JfnuARFUaDgf4FFhYPs7icYgZrDwWmuPBPnWvGzdsYeWA7E
         8k/Do0vNIDdhlSs2ybU1rb7BgWZUx38L/7fWG1hht+Q0oymb6ROzvSXBdi8gbgx2lv43
         BTIX7BAQ4WVMCJ4S6af5p6QIbLd3+27U+JBR92n1CFLRZMNG+9Bo1s0F6naMWzWMDHFn
         9E/A==
X-Forwarded-Encrypted: i=1; AJvYcCXksaUdLUZurqlWod9JtpXI7IuNv//sksQJfuvWp7n48P/yrEKoug0S0qrNberr9yhlt/+DVl8ju87S4cpsAoWt@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQx7W6qOnXUOe0+yq30VZERVWGcoLPoioM44q85Jf29IZaogq
	YNHZzkopjnQ2x2FjQFqUmlnzJQ/PZggdwfqd7AnoL4QlxbYef0lNtQPcmsWefuXnnfz+YcXqc4c
	fJwE=
X-Google-Smtp-Source: AGHT+IHnxNPVynVcrMck81D3auhtBQv0A6Io3oarT+knKEkNf7MmsUwWO3aUapPtGtAon09fEqgPLA==
X-Received: by 2002:a05:6512:acf:b0:539:94e2:a0ce with SMTP id 2adb3069b0e04-539da5aa8c3mr1616172e87.59.1728653741180;
        Fri, 11 Oct 2024 06:35:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2de7995sm82101e87.122.2024.10.11.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:35:40 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:35:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/10] remoteproc: qcom_q6v5_mss: Drop redundant error
 printks in probe
Message-ID: <3le7xb2v7y6u3zzini33nj7netwcmhi4ged4ymzpnwkfbourxt@anlri4uawc7e>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-7-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-7-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:15PM +0200, Krzysztof Kozlowski wrote:
> Do not print errors of getting clocks and regulators in probe twice:
> once in q6v5_init_clocks() or q6v5_regulator_init() and then again in the
> probe function.  This also avoids dmesg flood on deferred probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
