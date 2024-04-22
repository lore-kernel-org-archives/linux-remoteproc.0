Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D0113CA95
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780024; cv=none; b=Ot33ZosynyH9n5xuiD3YoO5kqJkiqLRFpJd18/q1Oasv4lb0uerbgoNK7ocJJPV2Y3NFR2BHbwwdRS03f8xWB+knluxdkTtfAYINml6iEhbfamZCEgatJ29wSnLHd779frXdRrJ3Mwcl7iFVivov3xZdWQOFyoy+rR+mr5gyG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780024; c=relaxed/simple;
	bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7tRCGJe7HSnYh5vmmauslOzJSmGhHpWHzCGYT8fHm2xkIo8PGUTuPhkRLlpfBu9ISzQkBh5AKnnqkZqEuZe+bVMU72DSAWa/ust8fY30JNZwTkvKiW/tinO+tfXj1HVglrVXMAH7PJ4CQTfK/sg248IzWDEpxpzddZHw01n4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfWW2/38; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfWW2/38"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4690426276.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780022; x=1714384822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
        b=LfWW2/38Ykb4CyG7PczDnGOjb9E2LJgR5FzC8b47bV5Mk5N4+sEohphTMdbb4bcC7O
         fgf8eI3w1kx8mKN46vO5mlm0Px3BJ9xkH1iqQ8glo3UZBouwpYU5H/6kBOwIzmAboUrr
         +4S5JcHJVhaUjdJ3OGRWB9zWLdta54aCimwMVoOn2wcw2GWFPvHlL0hNLN0GVCJ7/8iL
         eHmT3n2tXPlwoqqVHeE6q7BLPPX9e726LXc8uZ11DOLZKThG00+LtSqaMGtNfg8qx5kh
         VBf2vonEbDqZms8gJFWWpeh3EZwZMJK6jRbOiDReaX14F/lXjflMVhySPlAm8rCClOyn
         OTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780022; x=1714384822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MYeFddZE6jhnGVLqQLIsG6n52OsJy9BifCmmy7rs2w=;
        b=db4EmmpmOY+KWBcSjewll8KflJHWMW9q+alhBZoJR5wwLKQK4xThVuw9uoOTujDE9l
         HEqXrBI1TkghWpqHPPqI7nOjrAmgnqsCuXZfgmgGBL+wgK8EWPQ2/iabc3L7+ho9Mrs+
         CX8b6Rbw+LJStBJQ3qh0mdODKElFzs8c13DNRJHGjaiKxj5B+RJJCcbh4pMxPc/O0k5m
         KVBmxCbFNmOop11OlL9Cxhykvj7CfL6ZoDfHXXdHPHHwVs2TXNx4nvEwQ9QE3EbUWV+z
         PF9YZy6vnT+dWIg8zc8gxzCTfr3I+zMLHnAQYKjJPuPwPTe2VZKD7rxz5cDCaIxTX4rd
         4IVg==
X-Forwarded-Encrypted: i=1; AJvYcCUw+DHh0EYyOoRXNk91xVO0yPJowuF/kH50arOlRVzbW/YkEydRT9LOODB7n9oViOLblrhfOu5g3BTTCpXG1L+kabzPISp+5Zkm/MBebtwm2A==
X-Gm-Message-State: AOJu0Yxmwyxe5v1jCxNsSQg08mCKgcafHUvW/HEwvW01YzGGxRCajiQK
	u8SXvhfG2vUqY1Y0Q4sQL1YOXH2ez8FIHja8Dpe+SijuSL4y0d2khavqv37c/5jtwKhNmxoYo0u
	YNtRC+sXRaRVYptfemZhC0RCrz6aCAegbOcXLRg==
X-Google-Smtp-Source: AGHT+IHbBAbCSSKh+Ocb9jiNKVh/DB2SxHf3//CLOL1UZnbbdg1GJVfSWTlZKJ2zsSAoTdZErEZaPNUgvBoomS4y2UI=
X-Received: by 2002:a25:acc1:0:b0:dc6:5570:898e with SMTP id
 x1-20020a25acc1000000b00dc65570898emr7558121ybd.17.1713780021745; Mon, 22 Apr
 2024 03:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org> <57a99244-373c-40c0-9e32-9e8272c0c3e1@kernel.org>
In-Reply-To: <57a99244-373c-40c0-9e32-9e8272c0c3e1@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:00:10 +0300
Message-ID: <CAA8EJpqzqfQCLCgj=G910V8Nk6b3adB0CTPPOO+G==+_=q5+oQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] soc: qcom: add in-kernel pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 20 Apr 2024 at 14:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 16:00, Dmitry Baryshkov wrote:
> > Protection domain mapper is a QMI service providing mapping between
> > 'protection domains' and services supported / allowed in these domains.
> > For example such mapping is required for loading of the WiFi firmware o=
r
> > for properly starting up the UCSI / altmode / battery manager support.
> >
> > The existing userspace implementation has several issue. It doesn't pla=
y
> > well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if th=
e
> > firmware location is changed (or if the firmware was not available at
> > the time pd-mapper was started but the corresponding directory is
> > mounted later), etc.
> >
> > However this configuration is largely static and common between
> > different platforms. Provide in-kernel service implementing static
> > per-platform data.
> >
> > Unlike previous revisions of the patchset, this iteration uses static
> > configuration per platform, rather than building it dynamically from th=
e
> > list of DSPs being started.
> >
>
> I applied this patchset and... it does not compile.
>
> drivers/remoteproc/qcom_q6v5_wcss.c:243:15: error: implicit declaration
> of function =E2=80=98qcom_pdm_get=E2=80=99; did you mean =E2=80=98em_pd_g=
et=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>
>
> That's just defconfig, so I have doubts this was tested.

I usually do not care about defconfig. This was tested as the
built-in. I had the WCNSS driver disabled, never needed it. Enabled it
now.

--=20
With best wishes
Dmitry
