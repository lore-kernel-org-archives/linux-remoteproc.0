Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993FD4E1C8
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Feb 2024 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709053713; cv=none; b=c9j4rM47CDsbG/FBvV/HcZOK08xIevkbLqoU21UX5KmIKT9WN0LHPOjrQKqrbGeGIyeoTamM/YC3Kacu1DhNoEMRHfhWVHV4rIXfGFcc8q2FC0ZUeXo5EkWiUSKpiAUcKXvouvymiUdbJFHfKp2iUwop5s7cCV7t/ydz//RnzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709053713; c=relaxed/simple;
	bh=PGntO9HZ7nB0drpm+YsqMGgrsQ12kaan0DEUm5AB9oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI8c8u4ZA4giaKPfAVkZZ6CX9+Cqmfet1cKNJmuyfCXnK9ln0l6ml89F6gUziP9UlM/tFS1ctttu9iwaOowHpEuL8Lbx2I72wG6TpCzS1vIFKT9gSPk83IwhEYnuR5U+YnvhB9tRZ/sLblCustJe7VhYEGIO8gTd8T1AF789I30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZVjHAAr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZVjHAAr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29ae4c7da02so607733a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Feb 2024 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709053711; x=1709658511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4T8k/GzPwrI1R62VQXBd8xMeTbbVe30Wb070cxDcDU=;
        b=gZVjHAArdA1qHhB5tPwJNuEElRgcuFXxI3u79W0AyDEzRagA1YMjeSYMV4650yCiHp
         koKQYjLCkbBTdZoCqvOhDpCK0py6n65bzF2MZMa2vG0JBxuoMQRFtUVXfzmbwmA5+gPX
         b8ab/l48e9VyujtsZwxODNvK1IuT70I5julGqt61lHJKRvveuBNIgnE6IoVrVTh/v1is
         ua1ZLg8CEZgubVnaavnQQMezPyL6N69pDOZqtB0FfJ3nxiKRigBeQgJDSHw7JwJ1lIYr
         ymywXd9oPWR/Hrf7yCrVewge/FzWsC4h12F+MhraxhChKpyf1DjInqOzVRwM03C1DI5Y
         tzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709053711; x=1709658511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4T8k/GzPwrI1R62VQXBd8xMeTbbVe30Wb070cxDcDU=;
        b=VE94b6PRtciTdcesJXC4J6dTZSKMCTh5xQnYw9LsdRXeveAoqqHqAjYH99uNfU93AR
         9fEYhkns+GDdhv9RYdgdB70WXsqObRooARukhLLsqHlkw9AU5JVcOZqwZ0MQ/cuN6Xlp
         +BgPpXVR8hZwnKr7zpUO3XGbbAV2Mk/ouuvDRF/+hBZ22+Dx4j/l2dJ3pN9YEDDLM0rP
         e996Qbf3W1hky160ISOUoWK83UfNs+JlTml/0g9Gzn631RfdlV5JrCIsvGbhgI0QxYuz
         G5PyHHo/CVazpOtoaBIKCII7K9iuHvzlpS9EcQ6tJ80frYE0V7JB9y5c7YEtutV1D4Mf
         lzbw==
X-Gm-Message-State: AOJu0YxXDp2CVctX7pZZdkLDRpDQM7V4P3QsuHvI35v/wjiHWR0/egox
	G9cCXKaZpGqA8bGy9CyHMu4OoMCDNlbO/n8RKLqx/OfD6W0j+vNnzFjBInmoh3I=
X-Google-Smtp-Source: AGHT+IHGOOOwOx6ckcP28mlDFlcimec/bT0+8kqrte9hVw72AiMZ3sj24eHALgOXdlaTtDeDW9juig==
X-Received: by 2002:a17:90a:b014:b0:299:5d2c:9aa1 with SMTP id x20-20020a17090ab01400b002995d2c9aa1mr7690525pjq.5.1709053710806;
        Tue, 27 Feb 2024 09:08:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:77b:bbfe:c3af:16dc])
        by smtp.gmail.com with ESMTPSA id nb12-20020a17090b35cc00b00296fd5e0de1sm8797823pjb.34.2024.02.27.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:08:30 -0800 (PST)
Date: Tue, 27 Feb 2024 10:08:27 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: noman pouigt <variksla@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: Audio dsp recovery using remoteproc
Message-ID: <Zd4XCwOeJ+exUjN0@p14s>
References: <CAES_P+_0tWVtn+tyUi1TvkWi4rA-ZBj8e7_pnJd1h_J3S3Cn8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAES_P+_0tWVtn+tyUi1TvkWi4rA-ZBj8e7_pnJd1h_J3S3Cn8Q@mail.gmail.com>

Good day,

On Fri, Feb 16, 2024 at 03:29:56PM -0800, noman pouigt wrote:
> mailbox to dsp_1 is currently modeling platform pcm driver.
> mailbox to dsp_2 is also doing the same.
> 
> Platform driver callbacks cause IPC to be sent to dsp's.
> Lifecycle of two dsp's are managed by separate remoteproc
> drivers. Single sound card is exposed.
> 
> Separate watchdog interrupts from the corresponding dsp's
> are connected to remoteproc to manage crashing of the
> individual dsp's. How can I restart both the dsp when either
> of them crashes using the kernel device model? Remoteproc
> driver currently only restarts the crashed dsp instead of restarting
> both the dsp. It is needed to bring up the hardware in a consistent
> state as both the dsp's are connected to a common hardware.
>

Ok

> I thought of making a virtual parent remoteproc device
> and then managing individual dsp as a subdevice of that parent device
> but remoteproc device node is associated with the individual elf file i.e.
> it can manage only a single dsp.

You are on the right track but perhaps not fully aware of what is already done
for multi core remote processors.  I suggest you have a thorough look at TI's
K3R5 driver[1] and one of it's DTB[2].  In the DTB each remote processor loads a
different firmware file, which seems to be what you are looking for.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.8-rc6/source/drivers/remoteproc/ti_k3_r5_remoteproc.c
[2]. https://elixir.bootlin.com/linux/v6.8-rc6/source/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi#L397 


> 
> How can I model remoteproc drivers using linux device model so that when either
> of them crashes both the dsp's get reloaded by the remoteproc framework.
> 
>            MailBox ---- DSP_1 ---
>          |                                    |
> Linux                                      ------ common_hw -> speaker/mic
>           |                                    |
>             MailBox ---- DSP_2 ---
> 
