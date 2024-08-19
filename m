Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8215A865
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 23:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110826; cv=none; b=gBOqN9ZPNeg3jXJyjJ+wsVZ08mErnYIvUzPDQel8nNGvcOK0sWKSGNMzoMEcKfCJ05HSkFYAO215Stw/BUbZZGyqI4wRFwzHAkgEnMn2svii1JZao4V3+l+5rN+CEQARVe5D1wjcKXmPRnS90nz6J807QDsciy2r9/g6ZB6KYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110826; c=relaxed/simple;
	bh=YPvzOFnH4gwgca48Ur3A8Ax1NuMLReALK95xcXHVHYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lt1VwD46PlGmTcj/Zpqfl4KWv44ZEPIETesor5zH+HrlnIhxwrYG6pKMJflOAVwyZjYE23mlJY+/cakpPWXqafH2LzB3PP2YAZ7pR7Co0VWuD+mEY9lG7atSaffr3oeDKvrMHI0qM7O8jJYEfMImTU9A0OJRl/hKe/z/tz5UB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ThB3gtsx; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ThB3gtsx"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5d5b850d969so3073491eaf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 16:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724110823; x=1724715623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKnu/Iez1+mbjTx9dSE6EvXmZdzm/o7bv0RI9fycVok=;
        b=ThB3gtsxYPH9cvOUxdIm2gXbkLF6iq5SzmKGFFt6Xl9isS8SvtHQgsCLnDkWAxvL6h
         iLaZLobYyG1+Bml2iZF6Loqlp4pX5RhvcakbP9jaSKSQ0qguN3ghzGjY/Zm/5sFTTTOH
         FPctM7vX1lOVRnJ7TUU2inBpHIqGTSSIFjV3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110823; x=1724715623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKnu/Iez1+mbjTx9dSE6EvXmZdzm/o7bv0RI9fycVok=;
        b=uAylVNYjXp0mvzYfBGgk0fRXQD9EVGf6K2aGKuNV1Ffa2k//Qi9MJnZy72r4v+cgCz
         biV8oc7HSUSGIuMKlIDPttOsvtu+wojRbXfJOTbhm0XaJbP6fy7tD/weuuU3/WMyETtf
         JiSX8CQOR/YZeXm9QDLM/ZGML8iFpqjxLkiJDK07BrwWWcTZZv1/vLGz/qF1bEjSobbk
         Bug2ew9H380gWh225wl9D8Rsz18Y8qziCXWKNdRImGKeAgFO38wfeHgadleAEO621YFs
         9/JSxbWWVKqVQLHWrkns/kaWEzZkasQUgGMYkHE1LOIl+eHIabgayDDDcJ9VyUcXjG3r
         Y7kw==
X-Forwarded-Encrypted: i=1; AJvYcCUhfXARtAnhfs3xKSN/DQzhrKeJUENNbEhfpULVaLO1NT2267ehlgAdtBC2ZsEPbuan+E2bqSww7jHW0dcDAW94HrmSOkEPoVkiYm4R4eubJA==
X-Gm-Message-State: AOJu0YwaJ361UCMXjwAp7fLH9hXYWBiexpQq3CDbwzTq63/S6et7B4Lb
	eZtkeCYOuXaLoSGIrM8ZV4hqLghVWfDenx/cu0h+grmQnAL9rkInZqWEexLXwMqi0Oie22QlXGe
	LwfQr
X-Google-Smtp-Source: AGHT+IERu6IAhwWx6es5khszoD3YSC1WP9M6PSVwUzoVaTI+8bPpzekDTFMvH75GXLVnN86G44KhsA==
X-Received: by 2002:a05:6820:602:b0:5c4:7b18:b8eb with SMTP id 006d021491bc7-5da97f5a8f7mr15050072eaf.2.1724110823464;
        Mon, 19 Aug 2024 16:40:23 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5dc93b032desm91826eaf.27.2024.08.19.16.40.22
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 16:40:22 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5d5e97b8a22so2935615eaf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 16:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVee1T0GqzqNSfPyANbMkITA5WVpWkO7J1u23xFDbclYRdizdRx6c6elTPY0tVzm3iV8YfLKROzlCbfmtkwJNGqUP3WpYETc0+L2DY9v8QVw==
X-Received: by 2002:a05:6358:2923:b0:19f:4967:4e8f with SMTP id
 e5c5f4694b2df-1b39329f298mr1693684755d.22.1724110821953; Mon, 19 Aug 2024
 16:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819073020.3291287-1-quic_sibis@quicinc.com>
In-Reply-To: <20240819073020.3291287-1-quic_sibis@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Aug 2024 16:40:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
Message-ID: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 19, 2024 at 12:30=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.co=
m> wrote:
>
> Any write access to the IMEM region when the Q6 is setting up XPU
> protection on it will result in a XPU violation. Fix this by ensuring
> IMEM writes related to the MBA post-mortem logs happen before the Q6
> is brought out of reset.
>
> Fixes: 318130cc9362 ("remoteproc: qcom_q6v5_mss: Add MBA log extraction s=
upport")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

As discussed offlist, this isn't a perfect fix since writes to this
IMEM could happen by other drivers and those could still cause things
to go boom if they run in parallel with this driver. That being said:
* It seems like a more proper fix needs a coordinated effort between a
device's built-in firmware and the modem firmware. This is difficult /
near impossible to get done properly.
* Even if we do a more proper fix, making this change won't hurt.
* This change will immediately improve things by avoiding the XPU
violation in the most common case.

I've confirmed that the test case I had where things were going boom
is fixed. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
