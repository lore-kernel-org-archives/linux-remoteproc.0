Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED3188CAD
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Jun 2024 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761216; cv=none; b=eTy5+oKWzhnJZ4sQE0HuMffphSn6vPG1641BddI4Wtuhs5E7oFMHypSnT9/KFom9jbcqaDyf/yKYW+ytlkutn015lPrsESfUtZwGjKAhlYIBdSngeXl9+OXYqA9wgClORCPmvN663+TSBxwsBAMvFmWzrb2istHbioMy7j9lMbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761216; c=relaxed/simple;
	bh=9iWcHW5vlkJ5mXYvRR7eZBIJzhAQwZWdXaz1ky3WgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICQtOsEa6U5yZHl7IVuJ30mYyX/rpX14ctGvI/98+qr/MGduoBVQEOxuABZ8mjHdP5VSMODum+pABIVD9H1WxuUAlkmR/NPbtBqUtSsq+qNQE0I1c69RUjguh+iRoPgAVPS8qQddZPjFy94JlJG+4KV46egUo1uK8UyM4WCeV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhdKvNpu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhdKvNpu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295e488248so2502298e87.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Jun 2024 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717761213; x=1718366013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvegxPSdfl9xxna39T+re8E72S+AP4Tc+93oJJjNX3k=;
        b=ZhdKvNpuD/7lpXzDIbOMNd4dlY6JCadu1itwTRTEnv0hQBZFYqHzKNDxBtqXdyzeV+
         4P+DoNHmlYQJW16zEa+vyBhMhBYMnCEObZzF/Un0Gf0h1hcKH1+ugwybvj12P2bw3AzY
         flXCzqP7767QyvWyNfh7dGOywLiffpbOmF1Rq8bQOvoZUs79twQpo/q9+BmkBBFgK/G+
         6bYWmF2/VVJDXyQwT0p5v6gHBE8LaBoMtygivvSl436mJVjg+DyOR4je7V1z7ZLw/gMa
         hbyhV9a/IxDgo1hn1CZfGPCTM5gz2O/Q++5hKwSklQLAkCci77B0bMSybhP9VkiG0xDE
         ofZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717761213; x=1718366013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvegxPSdfl9xxna39T+re8E72S+AP4Tc+93oJJjNX3k=;
        b=JQC2wpf1UdYw3uUOELhZ9uR6nT7o35ZtSIDTsZF7WB4QEInoVzjktX/rM+def5Zyub
         QNJograBTNnYwYLpZizr1RgqPyiSVZMqzbAxwMOqeYNCSqaKJGCGrYdpXrNs4Wnq0V0J
         d8v1JiV/qecSQyO7gnnCRzbb3+mEoHOqmrlYiUMaLcLmLjY7z6Haje/jkjtVpuW/l0Q5
         O6R7AlO8yJJ93rjglgniyLT3Wrgh7ODud/2D7j4RBF0AK5ZMBZ0cipBfjlEcgP9zRwal
         kCJ1mOIEMnzk4/MLC7IJIAZiBlZtPYcRvbMvGkz7shwtfqvw2q+Z0kR81ztWtGazxScz
         0Zhg==
X-Forwarded-Encrypted: i=1; AJvYcCWHxs6uP2YI5goz2313QpDcIoum6a8PtAvvxoWhmWy1FLBgk3HOzoSbCVfGg2vvIrkIBwhZsILEfjWNW0sV4elKmiXl/caLO2zVhi3y+YSpyA==
X-Gm-Message-State: AOJu0YyVY6GrsgmvRuwL2Teu1RfCVrdAXswf3Am2amSP/ZmzidijBwYW
	EOxt33vBeCGB0/U64KRvVBSZGAoQ0jPwNShF/eSFwYlUS3wubcswFO9n4+g+J4s=
X-Google-Smtp-Source: AGHT+IEzo8rK5dnmaVmRy4s9tP7EFqxXB75a/nXj6f+m+NI3PDqGtQPp5mZoiYyn4SmlJ1NXZyHyTA==
X-Received: by 2002:a19:2d59:0:b0:52b:af52:d0d1 with SMTP id 2adb3069b0e04-52bb9fe2fc8mr1353269e87.64.1717761213322;
        Fri, 07 Jun 2024 04:53:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee260sm512079e87.68.2024.06.07.04.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:53:33 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:53:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
Message-ID: <2r44vuuhmucgkjwdb4ji73dtkskffigie67cgj5422b23wyg7n@jfp5xs5nizwn>
References: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>

On Thu, Jun 06, 2024 at 09:01:36PM +0200, Luca Weiss wrote:
> When the mailbox driver has not probed yet, the error message "failed to
> parse smd edge" is just going to confuse users, so improve the error
> prints a bit.
> 
> Cover the last remaining exits from qcom_smd_parse_edge with proper
> error prints, especially the one for the mbox_chan deserved
> dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
> also to be complete.
> 
> With this done, we can remove the outer print completely.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> - Rebase on qcom for-next, drop dts patches which have been applied
> - Improve error printing situation (Bjorn)
> - Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
> ---
>  drivers/rpmsg/qcom_smd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
