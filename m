Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC701A239F
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139009; cv=none; b=IEFKTtWAh/ihTvJgvuqchtfR9lNlWUnjC9Ic3zHW9azRu5Q0yvI6rJuY3p10zX/Z29W+oNJ5u/1hyWYlFgAnPu/KZwX+jvmWotPgR2V9GTOslfYIC1Hcft0Gm1rjosc0h1buUdSRPzqCYI4m/xH4224TVim3eBDS32XB5efaqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139009; c=relaxed/simple;
	bh=uejUUST1opmqRaTR5XJy0DFI0pe4QxyBJmqR4mHNSN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5ZYJhKmibPmzoLbc153eFOAXHyxZzgu85Toh2VoccovN6+vKORcNLqq6KLEtj8wJZWdGq9eAc3vxW/WFq5DlBbC7wTSQHRdJgI6qrURBEYOqL/6L0e4Fw5SwKqD0iN/RbZ/a0QzcapDQETtC8mm/mGJumtwGmKllI5wDDo4ryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/7ianeD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/7ianeD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so4620197f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jan 2025 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738139005; x=1738743805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=x/7ianeDpTPoctFVpNkGhR5GGtRIbtERCrDIO7asEbMHW5oo5ZYnprYsa5NfBkRv8r
         SZ+ATQGaQmVchKPDC1OeUKidCtg8sAqHaN4Y1/XZGRlzOxrVJRlwLBQWgYLc938Iieyl
         0S1ADwW5hCTfN4g6J7D8yDjMxbgJ81fKU7fvDdNnqcHsICemTDRYdLc+2mN27/mEetsq
         ejYH0AJ+XOmTSzT6EjXFBKiUAvoQFUYnYUyhhkcxIztoG4t/XwL/ymdZxFpXwty6u2h+
         yjrfWP3ReouA3B267a3Hlu9XgMRatWspFSh+da/60nYlPtoyJ29+q3j/P6xJAVyjuQKr
         KLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139005; x=1738743805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=EmcYdO6EN4aW7n0A4NXeD2FD1JfQa9Iia/Fc6aC1QhlJc0rnBhbE907VbFIwXzgxv+
         yYvJ3020huiFu4cGipE9IkSykEx1PxP60dGa6Ot0IqBdkHh112ZW8//qb1/Ix7XMGE0D
         RI14FQsMcKdPOejyyhjKw/TP84/M2lpgBd6RqLjB8lNMgSgEEcX95t8c+cZ2Yzqxb699
         cvC2uUXnG5yH9/6CzLb295g+akiAYujeEJ44N5I6dOc+/G0D0zzHnwB33scYIWpHnlQ1
         h3BBMjHC7Je21cWMhajwQR1pQBKsNXSgbGSJHqWt7iWpScPwFPSro3Ut955IvmAs5x0T
         ziLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkmF3sAs2Y492WUYMJh4nD5JHt9ETnCabawyZJ39vFtOTkYd5Z0IgKRJ78gcPYNPfZnd31w9yvpiYt6nlupkJL@vger.kernel.org
X-Gm-Message-State: AOJu0YwP64Q0LpmK5k3c5OqKvxZabrd0713oCli+7snPgMDir8tp0w3X
	row6Udybwq2MllsZDf78lXhseiRAkavHPuXxo4m6heCG0IIxqEIQT2vowM0vULI=
X-Gm-Gg: ASbGncug2B4sMLgmeblwskbXIRdLPVA2Um18VUQssKWa1xjMsVuaLCgaYPOcoknYfxL
	FaLYZFlL5C7njaigWo88+d7PR4lrcZMG/ZYJiPit9k9YfNnOTgqD5Du8cHiy8WKwwo/0GHr0wf7
	6pmrkv25WCV8xQ/X59cIq3n153OG3hucphfgGyIgCeS5+casKGkOlPO8tE63Qe7UISS34Un9T4Q
	PDqF7w4g2EUoIxMUOrAPTHzRDYZP+rZAwe/UksXrUUgrrpAyja0TWXukbrtEPux2+/rMXd9y6sF
	svl92IxoWiEaWMoShHL30w==
X-Google-Smtp-Source: AGHT+IFfgVNZLk86gjY7HWPBeAQ2yJ5J2A4B5xehdoWawG9xRKTdLfChNruGhUqnheXhhsiFsS4cJA==
X-Received: by 2002:a5d:588c:0:b0:38a:8f77:4b with SMTP id ffacd0b85a97d-38c5193206dmr1538571f8f.5.1738139004561;
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188673sm15954574f8f.46.2025.01.29.00.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Date: Wed, 29 Jan 2025 09:23:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/13] Modem support for MSM8226
Message-ID: <Z5nld1JiaqWgmlZ0@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>

On Wed, Jan 29, 2025 at 12:35:32AM +0100, Luca Weiss wrote:
> This series adds support for modem remoteproc found on MSM8226.
> It also adds needed device tree nodes and enables modem used for
> location service on matisse-wifi.
> 
> Also bam-dmux node is added for mobile data which is used on
> 3G/4G-enabled devices.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v4:
> - Drop mx from .proxy_pd_names for msm8974 as it's always a regulator
>   @Stephan: Please check that one also since I still picked up your R-b

Sneaky! But yeah, since you drop mx from fallback_proxy_supply, you
should also drop it from proxy_pd_names, that makes sense. I didn't see
that.

Thanks,
Stephan
