Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A81F78E0;
	Wed, 19 Feb 2025 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739954833; cv=none; b=uVyQwqlngjxFp8yIp6WmSyzRvbya839rhaR8MwydWqRlj4HfO25YFuvFRsmuveDZRzbNTZKLUiDSBbFwyWWxCYoW54Ngg3IhmauFNiLfqQrr/wcPqVgiCmfR1ZgGuAvj7BVr/5nOh0ATaCKyWL0S4x+hCs7GSOE8xXaZz9097PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739954833; c=relaxed/simple;
	bh=AgIkmTOMFIiQ/yYf+qwHjFoT+UCJ7JkbheTv56rMQVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLOezr2MYSdlnmEVKyjVK2wCwk6pfIsxprBoen5AgIpHdWc9YckJj8/EClW97sUJwzVXk4D9xDrNt3ve7laeTEaoTU5/9oqY1mEtOBI+KX7x8hFaoS6N9iiUn/kvu3Ni4Tvpom7lZUlr9m+rXwDYU5vq7RXmEik/esgLSo5WbNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrYyeie8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrYyeie8"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa48404207so12906349a91.1;
        Wed, 19 Feb 2025 00:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739954828; x=1740559628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=FrYyeie8IriuF3s5RaNI58kcDur8t9JVC2mxtKJ9f+WtIprbYOENpzeVKRiT/hNZvQ
         p0qf2sVBGUCyQceY+Z7IRxxz4rpuuegeT2rjtlRPV/ni07lPmmu7qKpUOKPm5MWJp812
         zceL9/qWB3oFRw1xMGLppnYAyC8ZHtJRmaRPTQ5yS7OsNdKUYyEE91jo3rxkGc8bd0a8
         GGkkxvZmrkGFMbGYXZp4laJPzP5M944XISIkmtkDFwQFa5/gYHePWw/2WKhB8BNzT2qV
         KLK87lug2YOyz5P+yMfv+Fi9uCasrFhQ1oXsdsRRlwPYQyQwezo4v6Y9EwsT7+JTwNLX
         tF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954828; x=1740559628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=IeBsSW291hWHMTPDCG5Yo4P8DLiv/6dBRJl1b4yLpcPwJbd0JiHI1QgEuwODdVcDs/
         gxpZSQF8VVbt2W/RutzUx8sNRbePoEnl0HVBYj4NG8g7sCT0IndinIEzO/BWbY0LTpdb
         wl5/UfPJlAPa9/fJf484tis7LThz7eAgEdASiLycBj8Ez+/IahuM/HKuvf24VYI2vJ9c
         IMKiNAb9euQuD0tjS8kTrmQsSNLseBlM061U85MgWvCL//49o3zN6LhMGKUUlGRagOHu
         kbY/21qUyheH5dhMc7l+otY9eQYjIwZnyiSencZ/rY2sOXnmnB27B2cjLnc4ew8e1KYO
         maug==
X-Forwarded-Encrypted: i=1; AJvYcCVDbvlTmn1PjJya2jQC3ZMJ8rc2ayW0xWeWzeegm359fo/lY0KEA3ptdFy/DSquv7GarjxVQP4LvHq24ec=@vger.kernel.org, AJvYcCWfapfIEA4vB4hfsD5GfFdwEqARrXp3Z3ZIgjzxKMB8cGUHs7i0pfYDDoO2bBjxL+l9dvKHwx6n0kJj3JxX2daHIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzvFsWgHCUuMuchEhsM0m4hGiVzboJdh9q9zzblmGGFTVTecCE
	Mm3bpfP66EKHTUImWMYFORserdtlr+w29nAPSde/cT3Vfq+WbBj6LjD99rQkDT0urAu/GLk/BDM
	Zb5mziwzMVAf6x7X63rwNwbs1aw0=
X-Gm-Gg: ASbGnct5rWy5fyjCbgf8a87/bxfvNhDUAvuBo20BhzgKaG0R0rzI4HE3ZJ4uo7gSYDB
	djfq7/ggw3LQnIvq3UGAfg42/Hj/0IJFG+siUw8GUgUENxx1j9Iun044e6EoyaD5EixAMGOEvpM
	IytshmlCMc30HtDCVBFZKZkl1YcYH9EII=
X-Google-Smtp-Source: AGHT+IG+metsRNLMCZZs47flBptl1mN2HTXJMmlH3rhFkejJqD6kI7GKh4odcp79LiYNjAbxr0qV1WFbSYqoQepjiGU=
X-Received: by 2002:a17:90a:ea17:b0:2fa:d95:4501 with SMTP id
 98e67ed59e1d1-2fc40f21c67mr30436208a91.18.1739954827668; Wed, 19 Feb 2025
 00:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-6-daniel.baluta@nxp.com>
 <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
In-Reply-To: <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:46:55 +0200
X-Gm-Features: AWEUYZlhtQ6N4279fN6OqZAxKAvbZZ0SsWRbMIXuyMNnTZ9yjwFgBR8L58MeFwg
Message-ID: <CAEnQRZCSL2ieQQFoHHpRwR5XfErZCm8nDMpr6rBVBWXiFKbm1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, mathieu.poirier@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     case IMX_RPROC_RESET_CONTROLLER:
> > +             priv->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>
> Is this optional on purpose? There is no mention of it in the commit
> message. Where is this resets property documented in the dt-bindings?

For this particular case on imx8mp the reset control shouldn't be optional
because the DSP won't really start without it.

I was thinking for future boards that might have a reset but which is
is not mandatory.

Will document the resets in v2.
