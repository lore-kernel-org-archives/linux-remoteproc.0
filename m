Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1BC199396
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Apr 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478167; cv=none; b=g1nueMP62e5CKmCviekb3GKQRZou+rouQsvy2ZSQa8zPi23BmJlO3q3ePrdeQzM6iWWQ3xHU444TbAhQKXIqu6Pdw/nn/Vrw2ixNyIQ9a5XV6fa7RVQB8bxH9tETVrJqf0R7upNIk+pedx2z9l6wDVhcP6JhKb+jT3t+vrgJ5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478167; c=relaxed/simple;
	bh=CsVdIY8q46bTxLPbuwJ8cUP2eUiwXdsgC6RMjJcwonY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9NbXVpuYrpqLhhrMCXE0A4QT6V3UWf7ojFf8KcVKwKVHnk64VL7x9Tyn6ISvolmB7wwlKe0N/93xU9T7HuoMaglJnimBi3fV/CAtayLXu/Su4OXofavr+JV/Qqzh3rrZVVXpVKTIIl2CVfrN844VsyKaAfdlL99wyyGnpZQl2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbFclHgN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbFclHgN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so83536666b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Apr 2025 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478164; x=1746082964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=PbFclHgNjB6RXMecnfIP+Z73qquzU3VIwvxcMjTs4FsrIcbOh/LblRF3NUS4LZfc5y
         ZpCZ8iSj72X1+S7rKtKjYOgzEwam5ASSq7FmFQsu6+NEUUwFI3PDrHuua6eXGQ1eENHH
         +gUZzwTVtO4p4o8zLhYjoXOqoCTIZjdwq43dKKMkroVaj5O7OTlYMIiWPClNx9icGA/O
         6M8yEnilRKLdmNngmnbBLtndXiezGTt++7R6Yf9ACl4E41Uq90JqzIU/pNtYPgrLHSUd
         3DH5g+7z9OR2JE8v1AsfAXbLN5xHzWveov22VvaN38zQrDfdX6aZNyzEC6IK+/wLUwPR
         s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478164; x=1746082964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=MsJwDnbVjBRrjvi4NZAUAEjxE6iMRUDdTKNCHch2MyP3yumxxEoHLXLAy6HUjV64rD
         4U7R9o1RAEMWYdPWdrA28B3PmWoaJsDh4/FSMwdud3cfO2imv62e+iVfLYyPNpQGQQpP
         iBXXVvrNiXfnJ7lvz+/OVkUT+vMtPAUcZu3K6qvWxzqHyQVf9VYGgZL8KVGzH+l6PwYY
         43m9rtUt4g7OKtpRCNCbmsd0CcFVbe7EAEcuJQpr9u/4PrgqsSMxk3MP7CQPi9spid/K
         k3fKPoQPNwgO5/iTTEbwLqcepfouxl1EdiD88kfcAZwPhFnXHLxXRwJdQeaU71cH2kkh
         gOmA==
X-Forwarded-Encrypted: i=1; AJvYcCVdEAMLpFwS/Nv9Y+JMsquqrJkGS8YhAKpPe6dy6oEt048vt441+Z+iIMkBYW9jeQ4nShfMsRkBgW0PcaCbtZnQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxs/atpCAprXv+dkWPbBK3KL713nj4ao72FN4BcOv6u2duw0d
	f0etGQ7IEkB1YGj1JMBYJkwrIWTYhSh+mTDvaMkxFYj3FodZVimC1eXCpAM9PsA=
X-Gm-Gg: ASbGncu8Cp7tp2Z+CLnQnouhcF1d0uUnMLzWZOb/f+d78ZPEj7vQz9T+1XRubUh6iMe
	S77nXQNMWtJ6yP+/8oUXF8f+wgaL+Uy/iBmvbOT2gVPgms6j2uJfXBPTHX+uCG+aCpjwajU6nIA
	gpGCskrBHiX3249s6gILSLECyczGE/JLhiMWgkGAgx6RHvr4W97UMRglIdilY4CIwbJ7JtPVjDD
	Wy+0QmmLBjZ0OeEhRY+qiaE9DMVCbeO77QOBxVS//di1kSaH1uuURCJ9dDKGd2J+6g9TD5pjyna
	EG7cZu+1TTkwQxU2OEdQ/9G5zDuI4T8XXs8JEQ==
X-Google-Smtp-Source: AGHT+IHRRXGrXUDu3+rG3nESpdOVayw7JgdtjaocMACREgykhsz0BZozqMiy2x1NiHc65DNK79egqw==
X-Received: by 2002:a17:907:97c1:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-ace57494ecemr146858866b.42.1745478163982;
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace598f6b97sm57765866b.75.2025.04.24.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:02:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAniEGwKKRUieo5G@linaro.org>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

On 25-04-23 20:22:05, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
